package at.deloittedigital.core_banking.lib.controller;

import javax.persistence.EntityNotFoundException;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class ControllerErrorHandler {

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<ErrorResponse> handle(EntityNotFoundException ex) {
        log.error("Error handler caught EntityNotFoundException", ex);
        return ResponseEntity
                .status(HttpStatus.NOT_FOUND)
                .body(new ErrorResponse(ex.getMessage()));
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponse> handleDefault(Exception ex) {
        log.error("Error handler caught Exception", ex);
        return ResponseEntity
                .status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(new ErrorResponse("Unexpected server error"));
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    public static class ErrorResponse {

        private String message;
    }
}
