package at.deloittedigital.core_banking.credit.domain;

import at.deloittedigital.core_banking.credit.datasource.CreditDataService;
import at.deloittedigital.core_banking.credit.datasource.model.Client;
import at.deloittedigital.core_banking.credit.datasource.model.CreditData;
import at.deloittedigital.core_banking.credit.domain.data.ClientInfo;
import at.deloittedigital.core_banking.credit.domain.data.ClientInfoMapper;
import java.util.Optional;
import org.springframework.stereotype.Service;

@Service
public class CreditApplicationService {

    private final CreditDataService creditDataService;
    private final ClientInfoMapper clientInfoMapper;

    public CreditApplicationService(CreditDataService creditDataService, ClientInfoMapper clientInfoMapper) {
        this.creditDataService = creditDataService;
        this.clientInfoMapper = clientInfoMapper;
    }

    public Optional<ClientInfo> clientInfo(String clientId) {
        CreditData data = creditDataService.query(clientId);
        if (data.isEmpty()) {
            return Optional.empty();
        } else {
            Client c = data.getClients().get(0);
            return Optional.of(clientInfoMapper.map(c));
        }
    }

}
