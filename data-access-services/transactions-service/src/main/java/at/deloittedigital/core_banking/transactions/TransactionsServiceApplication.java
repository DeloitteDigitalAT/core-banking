package at.deloittedigital.core_banking.transactions;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "at.deloittedigital.core_banking")
public class TransactionsServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(TransactionsServiceApplication.class, args);
    }

}
