package at.deloittedigital.core_banking.transactions.controller;

import at.deloittedigital.core_banking.transactions.dto.TransactionDto;
import at.deloittedigital.core_banking.transactions.mapper.TransactionMapper;
import at.deloittedigital.core_banking.transactions.service.TransactionService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
public class TransactionController {

    private final TransactionService transactionService;

    private final TransactionMapper transactionMapper;

    @GetMapping("/transactions")
    public List<TransactionDto> getAllTransactions() {
        log.info("Getting all transactions");
        return transactionMapper.map(transactionService.getAllTransactions());
    }
}
