package at.deloittedigital.core_banking.accounts.repository;

import at.deloittedigital.core_banking.accounts.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClientRepository extends JpaRepository<Client, Long> {

    Client getClientById(String id);
}
