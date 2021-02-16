package at.deloittedigital.core_banking.credit.api.data.error;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApiError {

    private String value;
    private String message;

}
