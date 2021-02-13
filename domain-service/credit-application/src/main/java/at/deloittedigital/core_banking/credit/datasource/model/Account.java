package at.deloittedigital.core_banking.credit.datasource.model;

import java.time.LocalDate;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Account {
    private String accountId;
    private LocalDate createdDate;
    private List<Transaction> transactions;
}
