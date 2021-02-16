package at.deloittedigital.core_banking.credit.api.data;

import static java.util.Collections.singletonList;

import at.deloittedigital.core_banking.credit.api.data.error.ApiError;
import at.deloittedigital.core_banking.credit.domain.data.ClientInfo;
import java.math.BigDecimal;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TestClientResponse {

    private String clientId;
    private String firstName;
    private String lastName;
    private BigDecimal sumTransactions;
    private List<ApiError> errors;

    public TestClientResponse(ClientInfo clientInfo) {
        this.clientId = clientInfo.getClientId();
        this.firstName = clientInfo.getFirstName();
        this.lastName = clientInfo.getLastName();
        this.sumTransactions = clientInfo.getSumTransactions();
    }

    public static TestClientResponse error(ApiError error) {
        return TestClientResponse.builder()
                .errors(singletonList(error))
                .build();
    }

}

