package at.deloittedigital.core_banking.accounts.entity;

import at.deloittedigital.core_banking.lib.entity.BaseEntity;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
     * Customer to which the account belongs.
     */
    @ManyToOne(fetch = FetchType.LAZY)
    private Client client;

    /**
     * Frequency at which statements are sent to the customer, e.g. monthly, weekly or per
     * transaction.
     */
    private String frequency;
    /**
     * Date account was created
     */
    private LocalDate accountDate;

    /**
     * Created date of the record
     */
    private LocalDate createdDate;

    /**
     * Most recent modified date
     */
    private LocalDate modifiedDate;


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
