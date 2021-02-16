package at.deloittedigital.core_banking.transactions.controller;

import at.deloittedigital.core_banking.transactions.dto.TransactionDto;
import at.deloittedigital.core_banking.transactions.entity.Transaction;
import at.deloittedigital.core_banking.transactions.mapper.TransactionMapper;
import at.deloittedigital.core_banking.transactions.repository.TransactionRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

@SpringBootTest
@AutoConfigureMockMvc
class TransactionControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private TransactionMapper transactionMapper;

    @AfterEach
    void tearDown() {
        transactionRepository.deleteAll();
    }

    @Test
    void getTransactions_accountIdNull_return200AndAllTransactions() throws Exception {
        List<Transaction> transactions = transactionRepository.saveAll(getTestTransactions());

        String response = this.mockMvc
                .perform(MockMvcRequestBuilders.get("/transactions"))
                .andExpect(MockMvcResultMatchers.status().is(200))
                .andReturn().getResponse().getContentAsString();

        List<TransactionDto> transactionDtos = Arrays.asList(objectMapper.readValue(response, TransactionDto[].class));

        Assertions.assertThat(transactionDtos)
                .hasSize(2)
                .containsAll(transactionMapper.map(transactions));
    }

    @Test
    void getTransactions_accountIdNotNull_return200AndTransactionsByAccountId() throws Exception {
        List<Transaction> transactions = transactionRepository.saveAll(getTestTransactions());

        String response = this.mockMvc
                .perform(MockMvcRequestBuilders.get("/transactions?accountId=1"))
                .andExpect(MockMvcResultMatchers.status().is(200))
                .andReturn().getResponse().getContentAsString();

        List<TransactionDto> transactionDtos = Arrays.asList(objectMapper.readValue(response, TransactionDto[].class));

        Assertions.assertThat(transactionDtos)
                .hasSize(1)
                .containsAll(Collections.singletonList(transactionMapper.map(transactions.get(0))));
    }

    @Test
    void getTransactions_accountIdDoesNotExist_return200AndEmptyTransactions() throws Exception {
        transactionRepository.saveAll(getTestTransactions());

        String response = this.mockMvc
                .perform(MockMvcRequestBuilders.get("/transactions?accountId=3"))
                .andExpect(MockMvcResultMatchers.status().is(200))
                .andReturn().getResponse().getContentAsString();

        List<TransactionDto> transactionDtos = Arrays.asList(objectMapper.readValue(response, TransactionDto[].class));

        Assertions.assertThat(transactionDtos)
                .isEmpty();
    }

    private List<Transaction> getTestTransactions() {
        Transaction transaction1 = new Transaction(
                1L,
                "IBAN",
                "Type",
                "100",
                "1000");

        Transaction transaction2 = new Transaction(
                2L,
                "IBAN",
                "Type",
                "100",
                "1000");

        return Arrays.asList(transaction1, transaction2);
    }
}