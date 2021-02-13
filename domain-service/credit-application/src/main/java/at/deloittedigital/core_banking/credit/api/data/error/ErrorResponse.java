package at.deloittedigital.core_banking.credit.api.data.error;

import static java.util.Collections.singletonList;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ErrorResponse {

    private List<ApiError> errors;

    public static ErrorResponse of(String value, String message) {
        return new ErrorResponse(singletonList(new ApiError(value, message)));
    }

    public static ErrorResponse of(String message) {
        return new ErrorResponse(singletonList(new ApiError("", message)));
    }

    public static ErrorResponse of(List<ApiError> errors) {
        return new ErrorResponse(errors);
    }
}
