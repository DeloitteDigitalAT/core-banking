package at.deloittedigital.core_banking.accounts.entity;

import at.deloittedigital.core_banking.lib.entity.BaseEntity;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Client extends BaseEntity {

    /**
     * Accounts which belong to the customer.
     */
    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Account> accounts = new ArrayList<>();

    /**
     * First name of the customer.
     */
    private String firstName;

    /**
     * Last name of the customer.
     */
    private String lastName;

    /**
     * Social security number of the customer.
     */
    private Long socialSecurityNumber;

    /**
     * Gender of the customer.
     */
    private String sex;

    /**
     * Date of birth of the customer.
     */
    private LocalDate dateOfBirth;



    public void addAccount(Account account) {
        accounts.add(account);
        account.setClient(this);
    }

    public void removeAccount(Account account) {
        accounts.remove(account);
        account.setClient(null);
    }
}
