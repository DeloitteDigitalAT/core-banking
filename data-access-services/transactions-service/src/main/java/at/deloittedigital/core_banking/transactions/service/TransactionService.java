package at.deloittedigital.core_banking.transactions.service;

import at.deloittedigital.core_banking.transactions.entity.Transaction;
import at.deloittedigital.core_banking.transactions.repository.TransactionRepository;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TransactionService {

    private final TransactionRepository transactionRepository;

    /**
     * Retrieves all transactions.
     *
     * @return all transactions
     */
    public List<Transaction> getAllTransactions() {
        return transactionRepository.findAll();
    }
}
