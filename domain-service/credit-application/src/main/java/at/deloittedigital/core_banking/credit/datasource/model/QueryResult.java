package at.deloittedigital.core_banking.credit.datasource.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QueryResult {

    @JsonProperty("data")
    private CreditData creditData;

    private List<QueryError> errors;

}
