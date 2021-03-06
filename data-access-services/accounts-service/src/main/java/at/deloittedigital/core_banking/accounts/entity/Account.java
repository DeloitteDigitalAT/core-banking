package at.deloittedigital.core_banking.accounts.entity;

import at.deloittedigital.core_banking.lib.entity.BaseEntity;
import java.time.LocalDate;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Account extends BaseEntity {

    /**
     * Primary key.
     */
    @Id
    @Column(name = "account_id")
    private String id;

    /**
     * Customer to which the account belongs.
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "clientId", referencedColumnName = "clientId")
    private Client client;

    /**
     * Frequency at which statements are sent to the customer, e.g. monthly, weekly or per
     * transaction.
     */
    private String frequency;

    /**
     * Date account was created.
     */
    private LocalDate accountDate;


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Account)) {
            return false;
        }
        Account account = (Account) o;
        return Objects.equals(getId(), account.getId());
    }

    @Override
    public int hashCode() {
        return 0;
    }
}
