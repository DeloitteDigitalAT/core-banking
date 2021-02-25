package at.deloittedigital.core_banking.credit.datasource;

import at.deloittedigital.core_banking.credit.datasource.model.CreditData;
import at.deloittedigital.core_banking.credit.datasource.model.QueryResult;
import java.net.URI;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
@Log4j2
@ConditionalOnProperty(name = "core-banking.credit.datasource.mode", havingValue = "remote")
public class RemoteCreditDataService implements CreditDataService {

    // todo hardcoded graphql request for testing
    private static final String TEST_QUERY =
            "{ client(id:\\\"%s\\\"){clientId,firstName,lastName,accounts{transactions{amount}}} }";
    private static final String TEST_REQUEST =
            "{ \"query\": \"%s\" }";

    private final RestTemplate restTemplate;
    private final URI dataServiceUrl;

    public RemoteCreditDataService(
            RestTemplate restTemplate,
            @Value("${core-banking.credit.datasource.url}") URI dataServiceUrl) {
        this.restTemplate = restTemplate;
        this.dataServiceUrl = dataServiceUrl;
    }

    @Override
    public CreditData query(String clientId) {
        // for testing basic service integration
        // todo graphql client
        // todo error handling, non-blocking req, response validity check
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        String query = String.format(TEST_QUERY, clientId);
        String body = String.format(TEST_REQUEST, query);
        HttpEntity<String> request = new HttpEntity<>(body, headers);

        log.info("POST {}, '{}'", dataServiceUrl, body);
        ResponseEntity<QueryResult>
                response = restTemplate.exchange(dataServiceUrl, HttpMethod.POST, request, QueryResult.class);

        if (response.getStatusCode() == HttpStatus.NOT_FOUND) {
            return CreditData.EMPTY;
        } else {
            QueryResult result = response.getBody();
            if (validResponse(result)) {
                return result.getCreditData();
            } else {
                log.error("Invalid response from data-service {}", result);
                throw new RestClientException("Invalid response from data-service");
            }
        }
    }

    private boolean validResponse(QueryResult result) {
        // todo validation api
        return result != null
                && result.getCreditData() != null
                && CollectionUtils.isEmpty(result.getErrors());
    }

}
