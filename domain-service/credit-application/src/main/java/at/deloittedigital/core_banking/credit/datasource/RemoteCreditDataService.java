package at.deloittedigital.core_banking.credit.datasource;

import at.deloittedigital.core_banking.credit.datasource.model.CreditData;
import at.deloittedigital.core_banking.credit.datasource.model.QueryResult;
import java.net.URI;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Service
@Log4j2
@ConditionalOnProperty(name = "core-banking.credit.datasource.mode", havingValue = "remote")
public class RemoteCreditDataService implements CreditDataService {

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
        // todo error handling, non-blocking req, response validity check
        URI endpoint = UriComponentsBuilder
                .fromUri(dataServiceUrl)
                .path("/query")
                .build().toUri();
        HttpEntity<String> request = new HttpEntity<>("{}");
        log.info("POST {}", endpoint);
        QueryResult result = restTemplate.exchange(endpoint, HttpMethod.POST, request, QueryResult.class).getBody();
        if (result == null) {
            throw new RestClientException("Data service null response");
        }
        log.info("Received data {}", result.getCreditData());
        return result.getCreditData().filter(clientId);
    }

}
