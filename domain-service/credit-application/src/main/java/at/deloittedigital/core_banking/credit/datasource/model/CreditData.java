package at.deloittedigital.core_banking.credit.datasource.model;

import static java.util.stream.Collectors.toList;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreditData {
    private List<Client> clients;

    public boolean isEmpty() {
        return clients == null || clients.isEmpty();
    }

    public CreditData filter(String clientId) {
        List<Client> clients = this.clients.stream().filter(c -> clientId.equals(c.getClientId())).collect(toList());
        return new CreditData(clients);
    }
}
