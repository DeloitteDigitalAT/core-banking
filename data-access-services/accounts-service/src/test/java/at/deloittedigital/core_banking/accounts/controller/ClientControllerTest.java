package at.deloittedigital.core_banking.accounts.controller;

import static java.util.Collections.singletonList;

import at.deloittedigital.core_banking.accounts.dto.AccountDto;
import at.deloittedigital.core_banking.accounts.dto.ClientDto;
import at.deloittedigital.core_banking.accounts.entity.Account;
import at.deloittedigital.core_banking.accounts.entity.Client;
import at.deloittedigital.core_banking.accounts.mapper.ClientMapper;
import at.deloittedigital.core_banking.accounts.repository.ClientRepository;
import at.deloittedigital.core_banking.lib.controller.ControllerErrorHandler;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@SpringBootTest
@ActiveProfiles("dev")
@AutoConfigureMockMvc
class ClientControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private ClientMapper clientMapper;

    @AfterEach
    void tearDown() {
        clientRepository.deleteAll();
    }

    @Test
    void getAllClients_return200AndClients() throws Exception {
        Client client = clientRepository.save(getTestClient());

        String response = this.mockMvc
                .perform(MockMvcRequestBuilders.get("/clients"))
                .andExpect(MockMvcResultMatchers.status().is(200))
                .andReturn().getResponse().getContentAsString();

        List<ClientDto> clientDtos = Arrays.asList(objectMapper.readValue(response, ClientDto[].class));

        Assertions.assertThat(clientDtos)
                .hasSize(1)
                .containsAll(singletonList(clientMapper.map(client)));
    }

    @Test
    void getClientById_clientWithIdExists_return200AndClient() throws Exception {
        Client client = clientRepository.save(getTestClient());

        String response = this.mockMvc
                .perform(MockMvcRequestBuilders.get("/clients/" + client.getId()))
                .andExpect(MockMvcResultMatchers.status().is(200))
                .andReturn().getResponse().getContentAsString();

        ClientDto clientDto = objectMapper.readValue(response, ClientDto.class);

        Assertions.assertThat(clientDto)
                .isEqualTo(clientMapper.map(client));
    }

    @Test
    void getClientById_clientWithIdDoesNotExist_return404AndErrorMessage() throws Exception {
        String response = this.mockMvc
                .perform(MockMvcRequestBuilders.get("/clients/1"))
                .andExpect(MockMvcResultMatchers.status().is(404))
                .andReturn().getResponse().getContentAsString();

        ControllerErrorHandler.ErrorResponse errorResponse =
                objectMapper.readValue(response, ControllerErrorHandler.ErrorResponse.class);

        Assertions.assertThat(errorResponse.getMessage())
                .isEqualTo("Client with ID 1 not found");
    }

    @Test
    void createClient_clientValid_return200AndClient() throws Exception {
        ClientDto testClientDto = getTestClientDto();

        String response = this.mockMvc
                .perform(MockMvcRequestBuilders
                        .post("/clients")
                        .content(objectMapper.writeValueAsString(testClientDto))
                        .contentType("application/json"))
                .andExpect(MockMvcResultMatchers.status().is(200))
                .andReturn().getResponse().getContentAsString();

        ClientDto clientDto = objectMapper.readValue(response, ClientDto.class);

        Assertions.assertThat(clientDto.getId())
                .isNotNull();
        Assertions.assertThat(clientDto.getAccountDtos())
                .hasSize(1);
        Assertions.assertThat(clientDto.getAccountDtos().get(0).getId())
                .isNotNull();
        Assertions.assertThat(clientDto.getAccountDtos().get(0).getFrequency())
                .isEqualTo(testClientDto.getAccountDtos().get(0).getFrequency());
        Assertions.assertThat(clientDto.getFirstName())
                .isEqualTo(testClientDto.getFirstName());
        Assertions.assertThat(clientDto.getLastName())
                .isEqualTo(testClientDto.getLastName());
        Assertions.assertThat(clientDto.getSocialSecurityNumber())
                .isEqualTo(testClientDto.getSocialSecurityNumber());
        Assertions.assertThat(clientDto.getSex())
                .isEqualTo(testClientDto.getSex());
        Assertions.assertThat(clientDto.getDateOfBirth())
                .isEqualTo(testClientDto.getDateOfBirth());
    }

    private Client getTestClient() {
        Client client = new Client();
        client.setId("KL123");
        client.setAccounts(singletonList(new Account("a1", client, "Weekly", LocalDate.of(2020, 1, 1))));
        client.setFirstName("John");
        client.setLastName("Doe");
        client.setSocialSecurityNumber(1L);
        client.setSex("Male");
        client.setDateOfBirth(LocalDate.of(2020, 1, 1));
        return client;
    }

    private ClientDto getTestClientDto() {
        ClientDto clientDto = new ClientDto();
        clientDto.setId("KL123");
        clientDto.setAccountDtos(singletonList(new AccountDto("a1", "Monthly", LocalDate.of(2021, 1, 1))));
        clientDto.setFirstName("Jane");
        clientDto.setLastName("Doe");
        clientDto.setSocialSecurityNumber(2L);
        clientDto.setSex("Female");
        clientDto.setDateOfBirth(LocalDate.of(2020, 2, 1));
        return clientDto;
    }
}