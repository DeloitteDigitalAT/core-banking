package at.deloittedigital.core_banking.transactions.service;

import at.deloittedigital.core_banking.transactions.entity.Transaction;
import at.deloittedigital.core_banking.transactions.repository.TransactionRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TransactionService {

    private final TransactionRepository transactionRepository;

    /**
     * Retrieves transactions by account ID. Returns all transactions if no account ID is specified.
     *
     * @return transactions by account ID or all transactions
     */
    public List<Transaction> getTransactions(@Nullable String accountId) {
        if (accountId == null) {
            return transactionRepository.findAll();
        }
        return transactionRepository.findByAccountId(accountId);
    }
}
