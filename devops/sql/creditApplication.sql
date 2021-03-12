
CREATE TABLE client
(
    client_id BIGSERIAL CONSTRAINT PK_CLIENT_ID PRIMARY KEY,
    first_name Varchar(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    social_security_number VARCHAR(15) NOT NULL,
    gender VARCHAR(1) NOT NULL,
    citizenship VARCHAR(50) NOT NULL,
    existing_client_id VARCHAR(20),
    created_date DATE,
    modified_date DATE,
    is_deleted BOOLEAN

);

CREATE TABLE document_list
(
    document_list_id BIGSERIAL CONSTRAINT  PK_DOCUMENT_LIST_ID PRIMARY KEY,
    client_id BIGINT NOT NULL,
    name VARCHAR(40),
    description VARCHAR(60),
    location_url varchar(90),
    category varchar (20),
    created_date DATE,
    modified_date DATE,
    is_deleted BOOLEAN,
    CONSTRAINT FK_CLIENT_DOCUMENT
        FOREIGN KEY(client_id)
            REFERENCES CLIENT(client_id)
);


CREATE TABLE contact_details
(
    contact_details_id BIGSERIAL CONSTRAINT  PK_CONTACT_DETAILS_ID PRIMARY KEY,
    client_id BIGINT NOT NULL,
    phone_number VARCHAR(30) NOT NULL,
    mobile_number VARCHAR(15),
    email_id varchar(50) NOT NULL,
    created_date DATE,
    modified_date DATE,
    is_deleted BOOLEAN,
    CONSTRAINT FK_CLIENT_CONTACT
        FOREIGN KEY(client_id)
            REFERENCES CLIENT(client_id)
);

CREATE TABLE family_details
(
    family_details_id BIGSERIAL CONSTRAINT  PK_FAMILY_DETAILS_ID PRIMARY KEY,
    client_id BIGINT NOT NULL,
    marital_status VARCHAR(20) NOT NULL,
    residential_status VARCHAR(20),
    no_of_dependents BIGINT,
    created_date DATE,
    modified_date DATE,
    is_deleted BOOLEAN,
    CONSTRAINT FK_CLIENT_FAMILY
        FOREIGN KEY(client_id)
            REFERENCES CLIENT(client_id)
);

CREATE TABLE credit_application_status
(
    credit_application_status_id BIGSERIAL CONSTRAINT  PK_CREDIT_APPLICATION_STATUS_ID PRIMARY KEY,
    client_id BIGINT NOT NULL,
    status_date DATE,
    is_rejected_before BOOLEAN,
    status VARCHAR(20) NOT NULL,
    status_comments VARCHAR(120),
    created_date DATE,
    modified_date DATE,
    is_deleted BOOLEAN,
    CONSTRAINT FK_CLIENT_CREDIT_STATUS
        FOREIGN KEY(client_id)
            REFERENCES CLIENT(client_id)
);


CREATE TABLE credit_information
(
    credit_information_id BIGSERIAL CONSTRAINT  PK_CREDIT_INFORMATION_ID PRIMARY KEY,
    client_id BIGINT NOT NULL,
    credit_amount DECIMAL(19,2),
    interest_rate DECIMAL(19,2),
    planned_emi DECIMAL(19,2),
    duration_in_months BIGINT NOT NULL,
    created_date DATE,
    modified_date DATE,
    is_deleted BOOLEAN,
    CONSTRAINT FK_CLIENT_CREDIT_INFORMATION
        FOREIGN KEY(client_id)
            REFERENCES CLIENT(client_id)
);


CREATE TABLE address_details
(
    address_details_id BIGSERIAL CONSTRAINT  PK_ADDRESS_DETAILS_ID PRIMARY KEY,
    client_id BIGINT NOT NULL,
    house_no BIGINT NOT NULL,
    street_name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postal_code BIGINT NOT NULL,
    created_date DATE,
    modified_date DATE,
    is_deleted BOOLEAN,
    CONSTRAINT FK_CLIENT_ADDRESS
        FOREIGN KEY(client_id)
            REFERENCES CLIENT(client_id)
);


CREATE TABLE financial_information
(
    financial_information_id BIGSERIAL CONSTRAINT  PK_FINANCIAL_INFORMATION_ID PRIMARY KEY,
    client_id BIGINT NOT NULL,
    employment_status VARCHAR(20) NOT NULL,
    annual_income DECIMAL(19,2) NOT NULL,
    employed_years BIGINT,
    position VARCHAR(20),
    company_employed VARCHAR(20),
    created_date DATE,
    modified_date DATE,
    is_deleted BOOLEAN,
    CONSTRAINT FK_CLIENT_FINANCIAL_INFORMATION
        FOREIGN KEY(client_id)
            REFERENCES CLIENT(client_id)
);

--Client
INSERT INTO client (client_id, first_name, last_name, date_of_birth, social_security_number, gender, citizenship, existing_client_id, created_date, modified_date, is_deleted) VALUES
(1, 'Judy', 'Green', '1970-11-03', '377-82-5154', 'M', '2021-03-08 15:50:16.111321', null, '2021-03-08', null, false),
(2, 'Brian', 'Mathis', '1975-09-01', '489-82-4940', 'F', '2021-03-08 15:50:16.11153', null, '2021-03-08', null, false),
(3, 'Walter', 'Nelson', '1977-03-28', '645-36-0411', 'F', '2021-03-08 15:50:16.111711', null, '2021-03-08', null, false),
(4, 'Leslie', 'Gilmore', '1999-08-17', '575-42-0367', 'M', '2021-03-08 15:50:16.111882', null, '2021-03-08', null, false),
(5, 'Jeanne', 'Perez', '1975-05-12', '052-04-8874', 'F', '2021-03-08 15:50:16.11205', null, '2021-03-08', null, false),
(6, 'Stephanie', 'Johnson', '1991-04-11', '087-74-5067', 'M', '2021-03-08 15:50:16.112217', null, '2021-03-08', null, false),
(7, 'Paul', 'Jackson', '2005-11-08', '627-58-4517', 'F', '2021-03-08 15:50:16.112383', null, '2021-03-08', null, false),
(8, 'Gabrielle', 'Garcia', '2011-03-08', '047-68-5983', 'M', '2021-03-08 15:50:16.112547', null, '2021-03-08', null, false),
(9, 'Christopher', 'Nixon', '2019-02-06', '603-41-0018', 'F', '2021-03-08 15:50:16.112712', null, '2021-03-08', null, false),
(10, 'Michael', 'Johnson', '2018-10-28', '087-46-8465', 'M', '2021-03-08 15:50:16.112876', null, '2021-03-08', null, false),
(11, 'Patrick', 'Scott', '1993-09-04', '435-56-8791', 'F', '2021-03-08 15:50:16.11304', null, '2021-03-08', null, false),
(12, 'Tracy', 'Garza', '1976-04-14', '382-93-6761', 'M', '2021-03-08 15:50:16.113206', null, '2021-03-08', null, false),
(13, 'Amy', 'Bradley', '2010-06-29', '582-59-1091', 'M', '2021-03-08 15:50:16.11337', null, '2021-03-08', null, false),
(14, 'Heather', 'Hernandez', '1992-11-15', '380-17-3306', 'M', '2021-03-08 15:50:16.113547', null, '2021-03-08', null, false),
(15, 'Joshua', 'Callahan', '1976-11-21', '012-31-9962', 'M', '2021-03-08 15:50:16.113705', null, '2021-03-08', null, false),
(16, 'Nancy', 'Murray', '1980-05-17', '092-50-6512', 'F', '2021-03-08 15:50:16.113863', null, '2021-03-08', null, false),
(17, 'Laura', 'Douglas', '2013-05-29', '642-77-5294', 'M', '2021-03-08 15:50:16.114027', null, '2021-03-08', null, false),
(18, 'John', 'Harmon', '2004-11-04', '593-55-2823', 'F', '2021-03-08 15:50:16.114187', null, '2021-03-08', null, false),
(19, 'Lisa', 'Watson', '2009-06-12', '628-31-3668', 'F', '2021-03-08 15:50:16.114344', null, '2021-03-08', null, false),
(20, 'Scott', 'Russell', '1988-06-05', '652-51-0716', 'M', '2021-03-08 15:50:16.114508', null, '2021-03-08', null, false);

--Address Details
INSERT INTO address_details (address_details_id, client_id, house_no, street_name, city, postal_code, created_date, modified_date, is_deleted) VALUES
(1, 1, 8128, '835 Samuel Lakes Suite 819', 'Linz', 1200, '2021-03-08', null, false),
(2, 2, 3800, '2232 Brown Stream Apt. 558', 'St. Polten', 1010, '2021-03-08', null, false),
(3, 3, 98507, '10424 Veronica Center', 'Innsbruck', 1010, '2021-03-08', null, false),
(4, 4, 9747, '5149 Eric Knoll Apt. 504', 'Linz', 4010, '2021-03-08', null, false),
(5, 5, 119, '851 Jody Parkway', 'Salzburg', 1200, '2021-03-08', null, false),
(6, 6, 172, '4472 Ricardo Light', 'Linz', 1010, '2021-03-08', null, false),
(7, 7, 5996, '74384 Lance Curve Apt. 393', 'Salzburg', 3010, '2021-03-08', null, false),
(8, 8, 701, '898 Cynthia Inlet', 'Graz', 1200, '2021-03-08', null, false),
(9, 9, 70762, '93006 Stuart Pass Apt. 954', 'Linz', 2020, '2021-03-08', null, false),
(10, 10, 71575, '0337 Mcmahon Drive Apt. 590', 'St. Polten', 1200, '2021-03-08', null, false),
(11, 11, 189, '8903 Cooke Mountains Apt. 029', 'St. Polten', 1200, '2021-03-08', null, false),
(12, 12, 18786, '090 Tyler Harbor', 'Innsbruck', 4010, '2021-03-08', null, false),
(13, 13, 153, '07005 Gerald Alley', 'St. Polten', 2010, '2021-03-08', null, false),
(14, 14, 814, '045 Hughes Causeway Apt. 122', 'Vienna', 2020, '2021-03-08', null, false),
(15, 15, 2647, '999 Aaron Ranch Apt. 774', 'St. Polten', 4010, '2021-03-08', null, false),
(16, 16, 6517, '477 Hernandez Parkways', 'Graz', 2010, '2021-03-08', null, false),
(17, 17, 765, '895 Gina Underpass Suite 029', 'Graz', 1200, '2021-03-08', null, false),
(18, 18, 257, '10175 David Roads', 'Innsbruck', 1010, '2021-03-08', null, false),
(19, 19, 719, '9450 Stephens Trail Suite 615', 'Graz', 2010, '2021-03-08', null, false),
(20, 20, 41226, '37933 Anthony Forest', 'Graz', 4010, '2021-03-08', null, false);

--Contact Details
INSERT INTO contact_details (contact_details_id, client_id, phone_number, mobile_number, email_id, created_date, modified_date, is_deleted) VALUES
(1, 1, '(930)544-3449x587', null, 'judy.green@gmail.com', '2021-03-08', null, false),
(2, 2, '001-414-902-2073', null, 'brian.mathis@gmail.com', '2021-03-08', null, false),
(3, 3, '001-841-529-3015x0156', null, 'walter.nelson@gmail.com', '2021-03-08', null, false),
(4, 4, '6811615885', null, 'leslie.gilmore@gmail.com', '2021-03-08', null, false),
(5, 5, '+1-894-733-8836', null, 'jeanne.perez@gmail.com', '2021-03-08', null, false),
(6, 6, '423.892.4000', null, 'stephanie.johnson@gmail.com', '2021-03-08', null, false),
(7, 7, '001-751-858-2518x63196', null, 'paul.jackson@gmail.com', '2021-03-08', null, false),
(8, 8, '(170)133-3433', null, 'gabrielle.garcia@gmail.com', '2021-03-08', null, false),
(9, 9, '3686772370', null, 'christopher.nixon@gmail.com', '2021-03-08', null, false),
(10, 10, '955.050.3253x289', null, 'michael.johnson@gmail.com', '2021-03-08', null, false),
(11, 11, '+1-308-023-7891x67073', null, 'patrick.scott@gmail.com', '2021-03-08', null, false),
(12, 12, '001-589-339-9874x98842', null, 'tracy.garza@gmail.com', '2021-03-08', null, false),
(13, 13, '218-467-1590x1699', null, 'amy.bradley@gmail.com', '2021-03-08', null, false),
(14, 14, '+1-197-614-5269x90010', null, 'heather.hernandez@gmail.com', '2021-03-08', null, false),
(15, 15, '+1-278-661-2821x973', null, 'joshua.callahan@gmail.com', '2021-03-08', null, false),
(16, 16, '500-598-7723', null, 'nancy.murray@gmail.com', '2021-03-08', null, false),
(17, 17, '765.951.4593', null, 'laura.douglas@gmail.com', '2021-03-08', null, false),
(18, 18, '749.741.8641', null, 'john.harmon@gmail.com', '2021-03-08', null, false),
(19, 19, '451.517.1567x3408', null, 'lisa.watson@gmail.com', '2021-03-08', null, false),
(20, 20, '001-436-956-1357x322', null, 'scott.russell@gmail.com', '2021-03-08', null, false);


--Credit Application Status
INSERT INTO credit_application_status (credit_application_status_id, client_id, status_date, is_rejected_before, status, status_comments, created_date, modified_date, is_deleted) VALUES
(1, 1, '2018-07-04', true, 'Approved', 'American main then program statement involve provide.', '2021-03-08', null, false),
(2, 2, '2019-07-11', false, 'New', 'Huge serve note.', '2021-03-08', null, false),
(3, 3, '2020-03-20', false, 'In-progress', 'Kitchen feel worry do plan indicate capital.', '2021-03-08', null, false),
(4, 4, '2019-10-03', false, 'In-progress', 'What hospital technology glass even modern.', '2021-03-08', null, false),
(5, 5, '2018-12-01', true, 'On-hold', 'Reality deep son relationship hand somebody interview.', '2021-03-08', null, false),
(6, 6, '2020-04-09', false, 'In-progress', 'Good exist spend action economic suggest discover.', '2021-03-08', null, false),
(7, 7, '2019-04-24', false, 'New', 'Question lot understand report late.', '2021-03-08', null, false),
(8, 8, '2019-04-21', false, 'New', 'Everybody contain anything.', '2021-03-08', null, false),
(9, 9, '2020-06-28', false, 'On-hold', 'Trial for create move who certain record.', '2021-03-08', null, false),
(10, 10, '2019-04-07', false, 'In-progress', 'Positive add off face bit.', '2021-03-08', null, false),
(11, 11, '2018-07-16', false, 'Approved', 'Probably debate firm range paper ago.', '2021-03-08', null, false),
(12, 12, '2019-09-10', true, 'Approved', 'Bar seem region truth great important dinner.', '2021-03-08', null, false),
(13, 13, '2020-04-13', true, 'On-hold', 'Else science everyone should garden.', '2021-03-08', null, false),
(14, 14, '2019-06-18', false, 'In-progress', 'Kitchen cup contain site through television some usually.', '2021-03-08', null, false),
(15, 15, '2018-07-02', false, 'In-progress', 'Carry town image authority.', '2021-03-08', null, false),
(16, 16, '2019-12-12', true, 'Rejected', 'Heavy seven choice red agreement but.', '2021-03-08', null, false),
(17, 17, '2018-09-15', false, 'On-hold', 'Just entire stand bit.', '2021-03-08', null, false),
(18, 18, '2020-04-19', true, 'On-hold', 'Catch great drop every.', '2021-03-08', null, false),
(19, 19, '2020-12-27', true, 'Approved', 'What during force eye financial mouth star.', '2021-03-08', null, false),
(20, 20, '2018-07-30', false, 'Approved', 'Control measure magazine reach guy leave.', '2021-03-08', null, false);


--Credit Information
INSERT INTO credit_information (credit_information_id, client_id, credit_amount, interest_rate, planned_emi, duration_in_months, created_date, modified_date, is_deleted) VALUES
(1, 1, 76000.00, 0.68, 3209.73, 24, '2021-03-08', null, false),
(2, 2, 86500.00, 0.68, 3653.18, 24, '2021-03-08', null, false),
(3, 3, 33000.00, 1.30, 1410.75, 24, '2021-03-08', null, false),
(4, 4, 76500.00, 0.68, 3230.85, 24, '2021-03-08', null, false),
(5, 5, 62000.00, 0.68, 2618.47, 24, '2021-03-08', null, false),
(6, 6, 7000.00, 1.60, 592.67, 12, '2021-03-08', null, false),
(7, 7, 98000.00, 0.68, 4138.87, 24, '2021-03-08', null, false),
(8, 8, 39500.00, 1.30, 1688.63, 24, '2021-03-08', null, false),
(9, 9, 12000.00, 1.30, 1013.00, 12, '2021-03-08', null, false),
(10, 10, 57500.00, 0.68, 2428.42, 24, '2021-03-08', null, false),
(11, 11, 51000.00, 0.68, 2153.90, 24, '2021-03-08', null, false),
(12, 12, 71000.00, 0.68, 2998.57, 24, '2021-03-08', null, false),
(13, 13, 51500.00, 0.68, 2175.02, 24, '2021-03-08', null, false),
(14, 14, 96000.00, 0.68, 4054.40, 24, '2021-03-08', null, false),
(15, 15, 44500.00, 1.30, 1902.38, 24, '2021-03-08', null, false),
(16, 16, 88000.00, 0.68, 3716.53, 24, '2021-03-08', null, false),
(17, 17, 35000.00, 1.30, 1496.25, 24, '2021-03-08', null, false),
(18, 18, 67500.00, 0.68, 2850.75, 24, '2021-03-08', null, false),
(19, 19, 10000.00, 1.60, 846.67, 12, '2021-03-08', null, false),
(20, 20, 25000.00, 1.30, 2110.42, 12, '2021-03-08', null, false);


--Family Details
INSERT INTO family_details (family_details_id, client_id, marital_status, residential_status, no_of_dependents, created_date, modified_date, is_deleted) VALUES
(1, 1, 'Engaged', 'Alone', 2, '2021-03-08', null, false),
(2, 2, 'Engaged', 'With Family', 1, '2021-03-08', null, false),
(3, 3, 'Married', 'Alone', 1, '2021-03-08', null, false),
(4, 4, 'Engaged', 'With Family', 2, '2021-03-08', null, false),
(5, 5, 'Married', 'Shared Flat', 3, '2021-03-08', null, false),
(6, 6, 'Divorced', 'Alone', 3, '2021-03-08', null, false),
(7, 7, 'Engaged', 'With Family', 1, '2021-03-08', null, false),
(8, 8, 'Divorced', 'Alone', 1, '2021-03-08', null, false),
(9, 9, 'Divorced', 'With Family', 3, '2021-03-08', null, false),
(10, 10, 'Married', 'Shared Flat', 2, '2021-03-08', null, false),
(11, 11, 'Engaged', 'With Family', 0, '2021-03-08', null, false),
(12, 12, 'Engaged', 'With Family', 0, '2021-03-08', null, false),
(13, 13, 'Divorced', 'Alone', 3, '2021-03-08', null, false),
(14, 14, 'Single', 'Shared Flat', 1, '2021-03-08', null, false),
(15, 15, 'Married', 'Shared Flat', 1, '2021-03-08', null, false),
(16, 16, 'Engaged', 'Shared Flat', 2, '2021-03-08', null, false),
(17, 17, 'Divorced', 'With Family', 1, '2021-03-08', null, false),
(18, 18, 'In Civil Union', 'Shared Flat', 3, '2021-03-08', null, false),
(19, 19, 'Single', 'Shared Flat', 1, '2021-03-08', null, false),
(20, 20, 'Single', 'Shared Flat', 2, '2021-03-08', null, false);


--Financial Information
INSERT INTO financial_information (financial_information_id, client_id, employment_status, annual_income, employed_years, position, company_employed, created_date, modified_date, is_deleted) VALUES
(1, 1, 'Selfemployed', 84000.00, 17, 'Selfemployed', 'N/A', '2021-03-08', null, false),
(2, 2, 'Unemployed', 0.00, 0, 'N/A', 'N/A', '2021-03-08', null, false),
(3, 3, 'Employed-Fulltime', 48000.00, 17, 'Owner', 'Private', '2021-03-08', null, false),
(4, 4, 'Employed-Parttime', 22000.00, 2, 'Internship', 'Private', '2021-03-08', null, false),
(5, 5, 'Employed-Fulltime', 48000.00, 17, 'Owner', 'Private', '2021-03-08', null, false),
(6, 6, 'Selfemployed', 84000.00, 17, 'Selfemployed', 'N/A', '2021-03-08', null, false),
(7, 7, 'Unemployed', 0.00, 0, 'N/A', 'N/A', '2021-03-08', null, false),
(8, 8, 'Selfemployed', 84000.00, 17, 'Selfemployed', 'N/A', '2021-03-08', null, false),
(9, 9, 'Employed-Fulltime', 48000.00, 17, 'Owner', 'Private', '2021-03-08', null, false),
(10, 10, 'Employed-Fulltime', 48000.00, 17, 'Owner', 'Private', '2021-03-08', null, false),
(11, 11, 'Student', 20000.00, 0, 'Internship', 'N/A', '2021-03-08', null, false),
(12, 12, 'Student', 20000.00, 0, 'Internship', 'N/A', '2021-03-08', null, false),
(13, 13, 'Selfemployed', 84000.00, 17, 'Selfemployed', 'N/A', '2021-03-08', null, false),
(14, 14, 'Unemployed', 0.00, 0, 'N/A', 'N/A', '2021-03-08', null, false),
(15, 15, 'Unemployed', 0.00, 0, 'N/A', 'N/A', '2021-03-08', null, false),
(16, 16, 'Employed-Fulltime', 48000.00, 17, 'Owner', 'Private', '2021-03-08', null, false),
(17, 17, 'Unemployed', 0.00, 0, 'N/A', 'N/A', '2021-03-08', null, false),
(18, 18, 'Unemployed', 0.00, 0, 'N/A', 'N/A', '2021-03-08', null, false),
(19, 19, 'Student', 20000.00, 0, 'Internship', 'N/A', '2021-03-08', null, false),
(20, 20, 'Student', 20000.00, 0, 'Internship', 'N/A', '2021-03-08', null, false);

--Document List
INSERT INTO document_list (document_list_id, client_id, name, description, location_url, category, created_date, modified_date, is_deleted) VALUES
(1, 1, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(2, 2, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(3, 3, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(4, 4, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(5, 5, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(6, 6, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(7, 7, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(8, 8, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(9, 9, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(10, 10, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(11, 11, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(12, 12, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(13, 13, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(14, 14, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(15, 15, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(16, 16, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(17, 17, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(18, 18, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(19, 19, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(20, 20, 'ID', 'Identity Card', 's3://core-banking-sample-data/Document samples/Id.jpg', 'ID', '2021-03-08', null, false),
(21, 1, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(22, 2, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(23, 3, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(24, 4, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(25, 5, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(26, 6, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(27, 7, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(28, 8, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(29, 9, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(30, 10, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(31, 11, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(32, 12, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(33, 13, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(34, 14, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(35, 15, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(36, 16, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(37, 17, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(38, 18, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(39, 19, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(40, 20, 'Payslip1', 'Payslip for month 1', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(41, 1, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(42, 2, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(43, 3, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(44, 4, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(45, 5, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(46, 6, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(47, 7, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(48, 8, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(49, 9, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(50, 10, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(51, 11, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(52, 12, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(53, 13, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(54, 14, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(55, 15, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(56, 16, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(57, 17, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(58, 18, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(59, 19, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(60, 20, 'Payslip2', 'Payslip for month 2', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(61, 1, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(62, 2, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(63, 3, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(64, 4, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(65, 5, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(66, 6, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(67, 7, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(68, 8, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(69, 9, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(70, 10, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(71, 11, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(72, 12, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(73, 13, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(74, 14, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(75, 15, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(76, 16, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(77, 17, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(78, 18, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(79, 19, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(80, 20, 'Payslip3', 'Payslip for month 3', 's3://core-banking-sample-data/Document samples/Payslip.png', 'Payslip', '2021-03-08', null, false),
(81, 1, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(82, 2, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(83, 3, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(84, 4, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(85, 5, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(86, 6, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(87, 7, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(88, 8, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(89, 9, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(90, 10, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(91, 11, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(92, 12, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(93, 13, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(94, 14, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(95, 15, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(96, 16, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(97, 17, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(98, 18, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(99, 19, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false),
(100, 20, 'Meldezettel', 'Address proof', 's3://core-banking-sample-data/Document samples/Meldezettel.png', 'Meldezettel', '2021-03-08', null, false);