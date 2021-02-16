package at.deloittedigital.core_banking.transactions.controller;

import at.deloittedigital.core_banking.transactions.dto.TransactionDto;
import at.deloittedigital.core_banking.transactions.entity.Transaction;
import at.deloittedigital.core_banking.transactions.mapper.TransactionMapper;
import at.deloittedigital.core_banking.transactions.repository.TransactionRepository;
import at.deloittedigital.core_banking.transactions.service.TransactionService;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequiredArgsConstructor
public class TransactionController {

    private final TransactionService transactionService;

    private final TransactionMapper transactionMapper;

    @GetMapping("/transactions")
    public List<TransactionDto> getTransactions(@RequestParam(required = false) Long accountId) {
        log.info("Getting transactions");
        return transactionMapper.map(transactionService.getTransactions(accountId));
    }
}
