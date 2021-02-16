package at.deloittedigital.core_banking.credit.domain.data;

import java.math.BigDecimal;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ClientInfo {

    private String clientId;
    private String firstName;
    private String lastName;
    private BigDecimal sumTransactions;
}
