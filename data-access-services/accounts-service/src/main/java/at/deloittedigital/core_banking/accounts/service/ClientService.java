package at.deloittedigital.core_banking.accounts.service;

import at.deloittedigital.core_banking.accounts.entity.Client;
import at.deloittedigital.core_banking.accounts.repository.ClientRepository;
import java.util.List;
import javax.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ClientService {

    private final ClientRepository clientRepository;

    /**
     * Retrieves all clients.
     *
     * @return all clients
     */
    public List<Client> getAllClients() {
        return clientRepository.findAll();
    }

    /**
     * Retrieves a client by its ID.
     *
     * @param id of the client that should be retrieved
     * @return the client if it exists, otherwise an exception is thrown
     */
    public Client getClientById(String id) {
        Client client = clientRepository.getClientById(id);

        if (client == null) {
            throw new EntityNotFoundException("Client with ID " + id + " not found");
        }

        return client;
    }

    /**
     * Creates a client.
     *
     * @param client that should be created
     * @return created client
     */
    public Client createClient(Client client) {
        return clientRepository.save(client);
    }
}
