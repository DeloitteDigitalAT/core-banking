package at.deloittedigital.core_banking.accounts.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.time.LocalDate;
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
public class AccountDto {

    @JsonProperty("accountId")
    private String id;

    private String frequency;

    @JsonProperty("createDate")
    private LocalDate accountDate;
}
