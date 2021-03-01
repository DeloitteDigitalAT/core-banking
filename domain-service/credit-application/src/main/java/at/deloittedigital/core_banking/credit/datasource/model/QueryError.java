package at.deloittedigital.core_banking.credit.datasource.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QueryError {

    private String message;
    // todo graphql api error cause
}
