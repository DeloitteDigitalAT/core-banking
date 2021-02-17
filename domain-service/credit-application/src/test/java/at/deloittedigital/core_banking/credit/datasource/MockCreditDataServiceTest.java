package at.deloittedigital.core_banking.credit.datasource;

import static org.assertj.core.api.Assertions.assertThat;

import at.deloittedigital.core_banking.credit.datasource.model.Client;
import at.deloittedigital.core_banking.credit.datasource.model.CreditData;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;

public class MockCreditDataServiceTest {

    @Test
    public void whenQueryForExistingUser_dataReturned() {

        // GIVEN
        String clientId = "1234";
        ObjectMapper objectMapper = new ObjectMapper();

        // WHEN
        CreditData result = new MockCreditDataService(objectMapper).query(clientId);

        // THEN
        // todo not checking all fields, only added this test for verifying project setup
        assertThat(result.getClients()).hasSize(1);
        Client client = result.getClients().get(0);
        assertThat(client.getClientId()).isEqualTo(clientId);

    }
}
