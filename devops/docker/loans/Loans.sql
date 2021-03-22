connect to Loans USER db2inst1 USING db2pwd;

set schema LOAN;

CREATE TABLE loan_contracts
(
Loan_id VARCHAR(20),
Accountid varchar(20),
loan_amount decimal(19,2),
tenure_in_months BIGINT,
interest_rate decimal(19,2),
risk_rating decimal(19,2),
contract_date Date,
created_date Date,
modified_date Date

);

CREATE TABLE loan_fulfillment
(
Loan_id VARCHAR(20),
Payment_id varchar(20),
pre_emi_amount decimal(19,2),
emi_amount decimal(19,2),
release_date_from_investor date,
disburse_Date_to_borrower date,
pre_emi_due_date date,
emi_start_date date,
emi_end_date date,
num_of_total_emi BIGINT,
pre_closure_flag Boolean,
pre_closure_date Date,
last_update_date Date,
created_date Date,
modified_date Date
);


CREATE TABLE repayment_schedule
(
Loan_id VARCHAR(20),
Repayment_id varchar(20),
due_interest_amount decimal(19,2),
due_principal_amount decimal(19,2),
due_emi_amount decimal(19,2),
penalty_amount decimal(19,2),
total_due_amount decimal(19,2),
emi_amount_recieved decimal(19,2),
penalty_amount_recieved decimal(19,2),
emi_due_date date,
receive_date date,
is_emi_payment_defaulted boolean,
is_emi_payment_advanced boolean,
created_date Date,
modified_date Date
);
