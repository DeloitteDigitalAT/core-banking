package at.deloittedigital.core_banking.credit.api;

import static org.springframework.http.HttpStatus.BAD_REQUEST;
import static org.springframework.http.HttpStatus.INTERNAL_SERVER_ERROR;

import at.deloittedigital.core_banking.credit.api.data.error.ApiError;
import at.deloittedigital.core_banking.credit.api.data.error.ErrorResponse;
import at.deloittedigital.core_banking.credit.api.data.error.NotFoundException;
import java.util.List;
import java.util.stream.Collectors;
import javax.validation.ConstraintViolationException;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
@Log4j2
public class ApiExceptionHandler {

    @ExceptionHandler(MissingServletRequestParameterException.class)
    protected ResponseEntity<ErrorResponse> missingParamException(MissingServletRequestParameterException exception) {
        log.warn("Missing param: {}", exception.getMessage());
        ErrorResponse response = ErrorResponse.of(exception.getParameterName(), exception.getMessage());
        return ResponseEntity.status(BAD_REQUEST).body(response);
    }

    @ExceptionHandler(ConstraintViolationException.class)
    protected ResponseEntity<ErrorResponse> validationException(ConstraintViolationException exception) {
        log.warn("Invalid param: {}", exception.getMessage());
        List<ApiError> errors = exception
                .getConstraintViolations()
                .stream()
                .map(violation -> new ApiError(violation.getPropertyPath().toString(), violation.getMessage()))
                .collect(Collectors.toList());
        ErrorResponse response = ErrorResponse.of(errors);
        return ResponseEntity.status(BAD_REQUEST).body(response);
    }

    @ExceptionHandler(NotFoundException.class)
    protected ResponseEntity<ErrorResponse> notFoundException(NotFoundException exception) {
        log.warn("Not found: {}", exception.getMessage());
        ErrorResponse response = ErrorResponse.of(exception.getEntity(), exception.getMessage());
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
    }

    @ExceptionHandler(Exception.class)
    protected ResponseEntity<ErrorResponse> exception(Exception exception) {
        log.error("Unhandled exception", exception);
        return ResponseEntity.status(INTERNAL_SERVER_ERROR).body(ErrorResponse.of("Error while processing request"));
    }
}