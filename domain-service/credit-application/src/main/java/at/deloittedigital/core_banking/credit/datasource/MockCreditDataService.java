package at.deloittedigital.core_banking.credit.datasource;

import at.deloittedigital.core_banking.credit.datasource.model.CreditData;
import at.deloittedigital.core_banking.credit.datasource.model.QueryResult;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.IOException;
import java.io.InputStream;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Service;

/**
 * Mock implementation of {@link CreditDataService} until API integration is done.
 */
@Service
@ConditionalOnProperty(name = "core-banking.credit.datasource.mode", havingValue = "mock")
public class MockCreditDataService implements CreditDataService {

    private final ObjectMapper objectMapper;

    public MockCreditDataService(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Override
    public CreditData query(String clientId) {
        try (InputStream is = readMockData()) {
            // In mock version we return either hardcoded data for the test client,
            // or empty data for any other clients (=not found)
            QueryResult result = objectMapper.readValue(is, QueryResult.class);
            if (result.getCreditData().contains(clientId)) {
                return result.getCreditData();
            } else {
                return CreditData.EMPTY;
            }
        } catch (IOException e) {
            throw new RuntimeException("Error while loading mock response", e);
        }
    }

    private InputStream readMockData() {
        return Thread.currentThread().getContextClassLoader().getResourceAsStream("mock-credit-data.json");
    }
}
