package at.deloittedigital.core_banking.credit.datasource.model;

import java.time.LocalDate;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Client {
    private String clientId;
    private String firstName;
    private String lastName;
    private String socialSN;
    private String sex;
    private LocalDate dateOfBirth;
    private List<Account> accounts;
}
