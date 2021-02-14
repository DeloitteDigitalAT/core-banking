package at.deloittedigital.core_banking.transactions.repository;

import at.deloittedigital.core_banking.transactions.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {

}
