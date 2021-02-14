package at.deloittedigital.core_banking.transactions.mapper;

import at.deloittedigital.core_banking.transactions.dto.TransactionDto;
import at.deloittedigital.core_banking.transactions.entity.Transaction;
import java.util.List;
import org.mapstruct.Mapper;

@Mapper
public interface TransactionMapper {

    TransactionDto map(Transaction transaction);

    List<TransactionDto> map(List<Transaction> transactions);
}
