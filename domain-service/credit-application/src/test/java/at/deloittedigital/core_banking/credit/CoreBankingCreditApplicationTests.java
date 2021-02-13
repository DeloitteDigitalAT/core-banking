package at.deloittedigital.core_banking.credit;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import at.deloittedigital.core_banking.credit.api.data.TestClientResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.math.BigDecimal;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

@SpringBootTest(properties = {"core-banking.credit.datasource.mode=mock"})
@AutoConfigureMockMvc
class CoreBankingCreditApplicationTests {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private ObjectMapper objectMapper;

    @Test
    void contextLoads() {
    }

    @Test
    void whenCallingTestEndpoint_returnsSumOfTransactions() throws Exception {

        String responseBody = mockMvc
                .perform(MockMvcRequestBuilders.get("/test?clientId=1234"))
                .andExpect(status().is(200))
                .andReturn().getResponse().getContentAsString();

        TestClientResponse response = objectMapper.readValue(responseBody, TestClientResponse.class);

        assertNull(response.getErrors());
        assertEquals(new BigDecimal("1.00"), response.getSumTransactions());

    }

    @Test
    void whenQueryInvalidId_statusIsNotFound() throws Exception {

        String responseBody = mockMvc
                .perform(MockMvcRequestBuilders.get("/test?clientId=ABC321"))
                .andExpect(status().is(404))
                .andReturn().getResponse().getContentAsString();

        TestClientResponse response = objectMapper.readValue(responseBody, TestClientResponse.class);

        assertNotNull(response.getErrors());
        assertEquals(1, response.getErrors().size());
        assertEquals("ABC321", response.getErrors().get(0).getValue());

    }
}
