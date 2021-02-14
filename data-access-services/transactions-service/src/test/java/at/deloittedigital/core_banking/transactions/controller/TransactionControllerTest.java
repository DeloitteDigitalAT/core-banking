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
    void getAllTransactions_return200AndTransactions() throws Exception {
        Transaction transaction = transactionRepository.save(getTestTransaction());

        String response = this.mockMvc
                .perform(MockMvcRequestBuilders.get("/transactions"))
                .andExpect(MockMvcResultMatchers.status().is(200))
                .andReturn().getResponse().getContentAsString();

        List<TransactionDto> transactionDtos = Arrays.asList(objectMapper.readValue(response, TransactionDto[].class));

        Assertions.assertThat(transactionDtos)
                .hasSize(1)
                .containsAll(Collections.singletonList(transactionMapper.map(transaction)));
    }

    private Transaction getTestTransaction() {
        return new Transaction(
                1L,
                "IBAN",
                "Type",
                "100",
                "1000");
    }
}