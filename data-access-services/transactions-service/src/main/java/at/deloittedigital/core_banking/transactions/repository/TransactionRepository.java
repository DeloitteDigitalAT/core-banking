package at.deloittedigital.core_banking.transactions.repository;

import at.deloittedigital.core_banking.transactions.entity.Transaction;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {

    List<Transaction> findByAccountId(Long accountId);
}
