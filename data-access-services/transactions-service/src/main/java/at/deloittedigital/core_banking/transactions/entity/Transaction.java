package at.deloittedigital.core_banking.transactions.entity;

import at.deloittedigital.core_banking.lib.entity.BaseEntity;
import javax.persistence.Entity;
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
     * Account ID of the customer issuing the transaction.
     */
    private Long accountId;

    /**
     * Account IBAN of the customer issuing the transaction.
     */
    private String accountIban;

    /**
     * Type of the transaction, e.g. debit or credit
     */
    private String type;

    /**
     * Transaction amount.
     */
    private String amount;

    /**
     * Account balance after the transaction.
     */
    private String balance;
}
