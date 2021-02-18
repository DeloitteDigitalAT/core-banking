package at.deloittedigital.core_banking.transactions.dto;

import java.math.BigDecimal;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
public class TransactionDto {

    private Long id;

    private String accountId;

    private String accountIban;

    private String type;

    private BigDecimal amount;

    private BigDecimal balance;
}
