package at.deloittedigital.core_banking.credit.api;

import at.deloittedigital.core_banking.credit.api.data.TestClientResponse;
import at.deloittedigital.core_banking.credit.api.data.error.NotFoundException;
import at.deloittedigital.core_banking.credit.domain.CreditApplicationService;
import at.deloittedigital.core_banking.credit.domain.data.ClientInfo;
import java.util.Optional;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Validated
@RequiredArgsConstructor
public class TestController {

    private final CreditApplicationService creditApplicationService;

    @GetMapping("/test")
    public TestClientResponse test(@Valid @NotBlank @RequestParam("clientId") String clientId) {
        Optional<ClientInfo> clientInfo = creditApplicationService.clientInfo(clientId);
        if (clientInfo.isEmpty()) {
            throw new NotFoundException(clientId, "Client not found");
        }
        return new TestClientResponse(clientInfo.get());
    }
}

