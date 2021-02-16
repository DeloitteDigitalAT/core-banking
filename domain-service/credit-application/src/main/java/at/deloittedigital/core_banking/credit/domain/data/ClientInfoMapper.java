package at.deloittedigital.core_banking.credit.domain.data;

import at.deloittedigital.core_banking.credit.datasource.model.Account;
import at.deloittedigital.core_banking.credit.datasource.model.Client;
import at.deloittedigital.core_banking.credit.datasource.model.Transaction;
import java.math.BigDecimal;
import java.util.List;
import org.springframework.stereotype.Component;

@Component
public class ClientInfoMapper {

    public ClientInfo map(Client client) {
        return ClientInfo.builder()
                .clientId(client.getClientId())
                .firstName(client.getFirstName())
                .lastName(client.getLastName())
                .sumTransactions(sumTransactions(client.getAccounts()))
                .build();
    }

    private BigDecimal sumTransactions(List<Account> accounts) {
        return accounts.stream()
                .flatMap(a -> a.getTransactions().stream())
                .map(Transaction::getAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }

}
