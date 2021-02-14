package at.deloittedigital.core_banking.accounts.mapper;

import at.deloittedigital.core_banking.accounts.dto.ClientDto;
import at.deloittedigital.core_banking.accounts.entity.Client;
import java.util.List;
import org.mapstruct.CollectionMappingStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(collectionMappingStrategy = CollectionMappingStrategy.ADDER_PREFERRED)
public interface ClientMapper {

    @Mapping(source = "accountDtos", target = "accounts")
    Client map(ClientDto clientDto);

    @Mapping(source = "accounts", target = "accountDtos")
    ClientDto map(Client client);

    List<ClientDto> map(List<Client> clients);
}
