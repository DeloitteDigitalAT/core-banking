package at.deloittedigital.core_banking.credit.datasource.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CreditData {

    public static final CreditData EMPTY = new CreditData();

    private Client client;

    public boolean isEmpty() {
        return client == null;
    }

    public boolean contains(String clientId) {
        return client != null && clientId.equals(client.getClientId());
    }
}
