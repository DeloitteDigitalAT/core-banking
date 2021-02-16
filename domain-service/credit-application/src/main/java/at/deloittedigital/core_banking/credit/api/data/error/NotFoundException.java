package at.deloittedigital.core_banking.credit.api.data.error;

public class NotFoundException extends RuntimeException {

    private final String entity;

    public NotFoundException(String entity, String message) {
        super(message);
        this.entity = entity;
    }

    public String getEntity() {
        return entity;
    }
}
