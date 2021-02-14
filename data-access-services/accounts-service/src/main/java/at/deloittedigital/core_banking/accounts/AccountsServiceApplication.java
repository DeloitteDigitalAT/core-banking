package at.deloittedigital.core_banking.accounts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "at.deloittedigital.core_banking")
public class AccountsServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(AccountsServiceApplication.class, args);
    }

}
