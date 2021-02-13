package at.deloittedigital.core_banking.credit.datasource.model;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Transaction {
    private String transactionId;
    private String accountId;
    private String accountIban;
    private String types;
    private String operation;
    private BigDecimal amount;
    private BigDecimal balance;
}
