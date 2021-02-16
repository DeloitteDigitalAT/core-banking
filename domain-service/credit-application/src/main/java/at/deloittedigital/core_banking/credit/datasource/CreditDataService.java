package at.deloittedigital.core_banking.credit.datasource;

import at.deloittedigital.core_banking.credit.datasource.model.CreditData;

public interface CreditDataService {
    CreditData query(String clientId);
}
