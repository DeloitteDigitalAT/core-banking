package at.deloittedigital.core_banking.accounts.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
public class ClientDto {

    private Long id;

    @JsonProperty("accounts")
    private List<AccountDto> accountDtos = new ArrayList<>();

    private String firstName;

    private String lastName;

    private Long socialSecurityNumber;

    private String sex;

    private LocalDate dateOfBirth;
}
