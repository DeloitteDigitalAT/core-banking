package at.deloittedigital.core_banking.transactions.entity;

import at.deloittedigital.core_banking.lib.entity.BaseEntity;
import java.math.BigDecimal;
import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Transaction extends BaseEntity {

    /**
     * Primary key.
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trans_id")
    private Long id;

    /**
     * Account ID of the customer issuing the transaction.
     */
    private String accountId;

    /**
     * Account IBAN of the customer issuing the transaction.
     */
    private String accountIban;

    /**
     * Type of the transaction, e.g. debit or credit.
     */
    private String type;

    /**
     * Transaction amount.
     */
    private BigDecimal amount;

    /**
     * Account balance after the transaction.
     */
    private BigDecimal balance;

    /**
     * Date of transaction.
     */
    @Column(columnDefinition = "DATE")
    private LocalDate transactionDate;

}
