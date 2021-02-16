package at.deloittedigital.core_banking.accounts.controller;

import at.deloittedigital.core_banking.accounts.dto.ClientDto;
import at.deloittedigital.core_banking.accounts.entity.Client;
import at.deloittedigital.core_banking.accounts.mapper.ClientMapper;
import at.deloittedigital.core_banking.accounts.service.ClientService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
public class ClientController {

    private final ClientService clientService;

    private final ClientMapper clientMapper;

    @GetMapping("/clients")
    public List<ClientDto> getAllClients() {
        log.info("Getting all clients");
        return clientMapper.map(clientService.getAllClients());
    }

    @GetMapping("/clients/{id}")
    public ClientDto getClientById(@PathVariable Long id) {
        log.info("Getting client with ID {}", id);
        return clientMapper.map(clientService.getClientById(id));
    }

    @PostMapping("/clients")
    public ClientDto createClient(@RequestBody ClientDto clientDto) {
        log.info("Creating client");
        Client client = clientMapper.map(clientDto);
        Client createdClient = clientService.createClient(client);
        return clientMapper.map(createdClient);
    }
}
