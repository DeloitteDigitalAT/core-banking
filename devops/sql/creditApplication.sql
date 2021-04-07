
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
    date_of_submission DATE,
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
INSERT INTO client (client_id, first_name, last_name, date_of_birth, social_security_number, gender, existing_client_id, created_date, modified_date, is_deleted, citizenship) VALUES
(1, 'Sara', 'Stokes', '2013-06-07', '759-32-1956', 'M', null, '2021-03-08', null, false, 'Tonga'),
(2, 'Monica', 'Johnson', '1970-12-22', '343-45-7638', 'M', null, '2021-03-08', null, false, 'United Kingdom'),
(3, 'Walter', 'Ewing', '1993-09-19', '497-02-3400', 'M', null, '2021-03-08', null, false, 'Spain'),
(4, 'Jimmy', 'Chen', '1994-10-01', '691-19-1625', 'M', null, '2021-03-08', null, false, 'Gibraltar'),
(5, 'Alyssa', 'Perez', '2014-08-03', '181-98-8987', 'F', null, '2021-03-08', null, false, 'Lao People''s Democratic Republic'),
(6, 'Justin', 'Gonzales', '1994-04-25', '781-11-8058', 'F', null, '2021-03-08', null, false, 'Armenia'),
(7, 'Wyatt', 'Prince', '2019-01-03', '011-07-8200', 'M', null, '2021-03-08', null, false, 'Belize'),
(8, 'Kimberly', 'Dixon', '1988-01-07', '193-03-9295', 'M', null, '2021-03-08', null, false, 'Ireland'),
(9, 'Jeffrey', 'Reed', '1997-08-21', '860-32-0527', 'M', null, '2021-03-08', null, false, 'Zimbabwe'),
(10, 'Christopher', 'Barrett', '1979-09-18', '257-91-1514', 'M', null, '2021-03-08', null, false, 'Korea'),
(11, 'Anthony', 'Ponce', '2009-01-17', '857-44-0394', 'M', null, '2021-03-08', null, false, 'Bouvet Island (Bouvetoya)'),
(12, 'Edward', 'Chang', '2014-03-18', '384-66-2695', 'F', null, '2021-03-08', null, false, 'Mali'),
(13, 'Curtis', 'Carpenter', '2013-06-10', '628-17-5247', 'F', null, '2021-03-08', null, false, 'Slovenia'),
(14, 'Kevin', 'Sullivan', '2016-05-23', '317-27-6270', 'M', null, '2021-03-08', null, false, 'French Guiana'),
(15, 'Johnathan', 'Howell', '1998-11-04', '276-57-6786', 'F', null, '2021-03-08', null, false, 'Germany'),
(16, 'Lawrence', 'Carter', '2014-02-13', '290-21-5412', 'M', null, '2021-03-08', null, false, 'Jamaica'),
(17, 'Matthew', 'Rowland', '1981-12-24', '098-37-5314', 'M', null, '2021-03-08', null, false, 'Saint Pierre and Miquelon'),
(18, 'David', 'Jenkins', '2006-04-06', '707-94-2435', 'F', null, '2021-03-08', null, false, 'Sao Tome and Principe'),
(19, 'Megan', 'Soto', '2006-09-16', '326-56-7890', 'M', null, '2021-03-08', null, false, 'Ukraine'),
(20, 'Sean', 'Wilkinson', '1984-12-06', '034-90-6214', 'F', null, '2021-03-08', null, false, 'Yemen');

--Address Details
INSERT INTO address_details (address_details_id, client_id, house_no, street_name, city, postal_code, created_date, modified_date, is_deleted) VALUES
(1, 1, 475, '23917 Paul Summit', 'Salzburg', 1010, '2021-03-08', null, false),
(2, 2, 461, '1638 Victoria Ports Apt. 239', 'Innsbruck', 2020, '2021-03-08', null, false),
(3, 3, 427, '239 Parks Crossroad', 'Graz', 3010, '2021-03-08', null, false),
(4, 4, 1121, '2669 Michael Bridge', 'Vienna', 1200, '2021-03-08', null, false),
(5, 5, 17444, '827 Edwards Extension Apt. 425', 'Linz', 1200, '2021-03-08', null, false),
(6, 6, 93458, '427 Samuel Inlet', 'Salzburg', 1200, '2021-03-08', null, false),
(7, 7, 15016, '2193 Bishop Lakes', 'Innsbruck', 1010, '2021-03-08', null, false),
(8, 8, 41121, '1206 Bond Turnpike', 'Salzburg', 2020, '2021-03-08', null, false),
(9, 9, 90475, '98771 Holly Avenue Suite 121', 'St. Polten', 2010, '2021-03-08', null, false),
(10, 10, 45348, '880 Rice Square Apt. 965', 'Innsbruck', 1200, '2021-03-08', null, false),
(11, 11, 587, '635 Bradley View Suite 466', 'Innsbruck', 2010, '2021-03-08', null, false),
(12, 12, 609, '016 Johnson Fords', 'Innsbruck', 4010, '2021-03-08', null, false),
(13, 13, 610, '3311 David Circle', 'Linz', 1200, '2021-03-08', null, false),
(14, 14, 37575, '28270 Doris Meadows Apt. 403', 'Graz', 1010, '2021-03-08', null, false),
(15, 15, 70, '242 Wendy Junctions Apt. 988', 'Innsbruck', 2020, '2021-03-08', null, false),
(16, 16, 64427, '2808 Newton Branch', 'Salzburg', 4010, '2021-03-08', null, false),
(17, 17, 584, '3979 John Street', 'Graz', 1200, '2021-03-08', null, false),
(18, 18, 16304, '178 Thomas Freeway', 'Salzburg', 4010, '2021-03-08', null, false),
(19, 19, 303, '3934 Davis Curve', 'Salzburg', 4010, '2021-03-08', null, false),
(20, 20, 39353, '7163 Cook Forest Suite 436', 'Innsbruck', 1200, '2021-03-08', null, false);

--Contact Details
INSERT INTO contact_details (contact_details_id, client_id, phone_number, mobile_number, email_id, created_date, modified_date, is_deleted) VALUES
(1, 1, '093.265.0874', null, 'sara.stokes@gmail.com', '2021-03-08', null, false),
(2, 2, '858-054-3731', null, 'monica.johnson@gmail.com', '2021-03-08', null, false),
(3, 3, '473-481-6799x19829', null, 'walter.ewing@gmail.com', '2021-03-08', null, false),
(4, 4, '813.978.7320x80520', null, 'jimmy.chen@gmail.com', '2021-03-08', null, false),
(5, 5, '878-579-6095x456', null, 'alyssa.perez@gmail.com', '2021-03-08', null, false),
(6, 6, '876-923-5367', null, 'justin.gonzales@gmail.com', '2021-03-08', null, false),
(7, 7, '476.503.6246', null, 'wyatt.prince@gmail.com', '2021-03-08', null, false),
(8, 8, '144.908.9324', null, 'kimberly.dixon@gmail.com', '2021-03-08', null, false),
(9, 9, '+1-004-993-7740x0574', null, 'jeffrey.reed@gmail.com', '2021-03-08', null, false),
(10, 10, '+1-863-988-4896x6461', null, 'christopher.barrett@gmail.com', '2021-03-08', null, false),
(11, 11, '4137246036', null, 'anthony.ponce@gmail.com', '2021-03-08', null, false),
(12, 12, '001-601-144-4722x6190', null, 'edward.chang@gmail.com', '2021-03-08', null, false),
(13, 13, '+1-839-303-0863x674', null, 'curtis.carpenter@gmail.com', '2021-03-08', null, false),
(14, 14, '001-639-365-2795x544', null, 'kevin.sullivan@gmail.com', '2021-03-08', null, false),
(15, 15, '(396)255-2886x859', null, 'johnathan.howell@gmail.com', '2021-03-08', null, false),
(16, 16, '+1-397-524-7793', null, 'lawrence.carter@gmail.com', '2021-03-08', null, false),
(17, 17, '853-265-6218', null, 'matthew.rowland@gmail.com', '2021-03-08', null, false),
(18, 18, '(187)891-9190', null, 'david.jenkins@gmail.com', '2021-03-08', null, false),
(19, 19, '143.352.9187', null, 'megan.soto@gmail.com', '2021-03-08', null, false),
(20, 20, '850.119.5012x0398', null, 'sean.wilkinson@gmail.com', '2021-03-08', null, false);


--Credit Application Status
INSERT INTO public.credit_application_status (credit_application_status_id, client_id, status_date, is_rejected_before, status, status_comments, created_date, modified_date, is_deleted, date_of_submission) VALUES
(1001, 1, '2018-08-31', false, 'Approved', 'Writer arm teach key why lot.', '2021-04-06', null, false, '2020-08-26'),
(1002, 2, '2018-08-10', false, 'Approved', 'Measure fire begin trouble industry.', '2021-04-06', null, false, '2021-03-27'),
(1003, 3, '2019-03-28', true, 'Rejected', 'Will home receive news.', '2021-04-06', null, false, '2020-12-26'),
(1004, 4, '2020-09-14', true, 'Approved', 'Agree environment final score draw.', '2021-04-06', null, false, '2021-03-11'),
(1005, 5, '2019-03-05', false, 'Rejected', 'Happen risk rich when statement total water.', '2021-04-06', null, false, '2020-01-21'),
(1006, 6, '2018-08-20', false, 'Rejected', 'Room already nothing scientist discuss dog.', '2021-04-06', null, false, '2020-06-30'),
(1007, 7, '2018-05-12', false, 'Approved', 'Standard west artist property.', '2021-04-06', null, false, '2020-08-14'),
(1008, 8, '2019-04-16', true, 'Approved', 'Mind have stage star amount contain control seem.', '2021-04-06', null, false, '2021-02-17'),
(1009, 9, '2019-11-27', false, 'Approved', 'Discover white move trip without.', '2021-04-06', null, false, '2020-05-13'),
(1010, 10, '2019-01-24', true, 'On-hold', 'Gun some push soon staff likely mouth.', '2021-04-06', null, false, '2020-08-21'),
(1011, 11, '2018-07-07', false, 'Rejected', 'Right water manager pull top item east in.', '2021-04-06', null, false, '2020-04-26'),
(1012, 12, '2019-01-17', true, 'New', 'Under than store chance.', '2021-04-06', null, false, '2020-12-01'),
(1013, 13, '2018-04-20', false, 'On-hold', 'Into in discover sometimes.', '2021-04-06', null, false, '2021-03-16'),
(1014, 14, '2020-06-09', true, 'New', 'Big by public still their environment actually.', '2021-04-06', null, false, '2020-06-05'),
(1015, 15, '2019-09-23', true, 'Approved', 'Reason rich relate interesting.', '2021-04-06', null, false, '2020-11-05'),
(1016, 16, '2020-08-05', false, 'In-progress', 'Mouth listen argue issue glass season at image.', '2021-04-06', null, false, '2021-04-01'),
(1017, 17, '2018-06-24', false, 'Rejected', 'Nice interest development.', '2021-04-06', null, false, '2020-12-22'),
(1018, 18, '2020-02-02', false, 'Approved', 'Southern eat value risk.', '2021-04-06', null, false, '2021-02-05'),
(1019, 19, '2019-05-01', false, 'Rejected', 'Next picture opportunity impact traditional.', '2021-04-06', null, false, '2020-11-09'),
(1020, 20, '2020-01-11', true, 'New', 'Hotel worry because particular artist.', '2021-04-06', null, false, '2020-08-14');


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
(1001, 1, 'Employed-Fulltime', 42000.00, 14, 'Selfemployed', 'Public', '2021-04-06', null, false),
(1002, 2, 'Employed-Fulltime', 69000.00, 16, 'Management', 'Private', '2021-04-06', null, false),
(1003, 3, 'Selfemployed', 19000.00, 13, 'Selfemployed', 'N/A', '2021-04-06', null, false),
(1004, 4, 'Student', 20000.00, 0, 'Parttime', 'N/A', '2021-04-06', null, false),
(1005, 5, 'Student', 22000.00, 0, 'Parttime', 'N/A', '2021-04-06', null, false),
(1006, 6, 'Selfemployed', 50000.00, 16, 'Selfemployed', 'N/A', '2021-04-06', null, false),
(1007, 7, 'Employed-Fulltime', 61000.00, 12, 'Staff', 'Public', '2021-04-06', null, false),
(1008, 8, 'Employed-Fulltime', 72000.00, 15, 'Management', 'Public', '2021-04-06', null, false),
(1009, 9, 'Employed-Fulltime', 59000.00, 19, 'Owner', 'Public', '2021-04-06', null, false),
(1010, 10, 'Selfemployed', 28000.00, 11, 'Selfemployed', 'N/A', '2021-04-06', null, false),
(1011, 11, 'Employed-Parttime', 29000.00, 5, 'Parttime', 'Private', '2021-04-06', null, false),
(1012, 12, 'Employed-Fulltime', 50000.00, 12, 'Staff', 'Private', '2021-04-06', null, false),
(1013, 13, 'Employed-Parttime', 18000.00, 5, 'Parttime', 'Private', '2021-04-06', null, false),
(1014, 14, 'Employed-Fulltime', 33000.00, 11, 'Selfemployed', 'Public', '2021-04-06', null, false),
(1015, 15, 'Employed-Fulltime', 75000.00, 18, 'Selfemployed', 'Public', '2021-04-06', null, false),
(1016, 16, 'Selfemployed', 44000.00, 7, 'Selfemployed', 'N/A', '2021-04-06', null, false),
(1017, 17, 'Employed-Parttime', 38000.00, 1, 'Internship', 'Public', '2021-04-06', null, false),
(1018, 18, 'Selfemployed', 59000.00, 5, 'Selfemployed', 'N/A', '2021-04-06', null, false),
(1019, 19, 'Employed-Parttime', 12000.00, 4, 'Internship', 'Public', '2021-04-06', null, false),
(1020, 20, 'Employed-Fulltime', 54000.00, 1, 'Selfemployed', 'Public', '2021-04-06', null, false);

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



CREATE SCHEMA DOCUMENTS;


CREATE TABLE DOCUMENTS.MELDEZETTLE
(
MZ_ID VARCHAR(10),
DOCUMENT_ID VARCHAR(10),
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
DATE_OF_BIRTH DATE,
GENDER VARCHAR(1),
CITIZENSHIP VARCHAR(50),
ZAHL VARCHAR(20),
RESIDENCE_SITUATION VARCHAR(50),
A_STREET_NAME VARCHAR(60),
A_HOUSE_NO VARCHAR(60),
A_CITY VARCHAR(50),
POSTAL_CODE BIGINT,
REGISTRATION_DATE DATE,
CREATED_DATE DATE,
MODIFIED_DATE DATE,
IS_DELETED BOOLEAN

);

CREATE TABLE DOCUMENTS.PAYSLIP (

    P_ID BIGINT,
    DOCUMENT_ID BIGINT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    DATE_OF_ISSUE DATE,
    MONTH VARCHAR(15),
    SALARY DECIMAL(19,2),
    INCOME_TAX DECIMAL(19,2),
    SOCIAL_TAX DECIMAL(19,2),
    COMPANY_EMPLOYEED VARCHAR(30),
    CREATED_DATE DATE,
    MODIFIED_DATE DATE,
    IS_DELETED BOOLEAN
);

CREATE TABLE DOCUMENTS.IDENTITY_CARD (

    IC_ID BIGINT,
    DOCUMENT_ID BIGINT,
    DOCUMENT_TYPE VARCHAR(50),
    PLACE_OF_ISSUE VARCHAR(50),
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    NATIONALITY VARCHAR(90),
    DATE_OF_ISSUE DATE,
    ID_NUMBER varchar(50),
    GENDER VARCHAR(1),
    EXPIRATION_DATE DATE,
    CREATED_DATE DATE,
    MODIFIED_DATE DATE,
    IS_DELETED BOOLEAN
);


INSERT INTO documents.meldezettle (mz_id, document_id, first_name, last_name, date_of_birth, gender, citizenship, zahl, residence_situation, a_street_name, a_house_no, a_city, postal_code, registration_date, created_date, modified_date, is_deleted) VALUES
('1', 81, 'Sara', 'Stokes', '2013-06-07', 'M', 'Tonga', '104431207', 'Nebenwohnsitz', '23917 Paul Summit', '475', 'Salzburg', 1010, '2006-06-05', '2021-04-07', null, false),
('2', 82, 'Monica', 'Johnson', '1970-12-22', 'M', 'United Kingdom', '156393206', 'Nebenwohnsitz', '1638 Victoria Ports Apt. 239', '461', 'Innsbruck', 2020, '2011-04-21', '2021-04-07', null, false),
('3', 83, 'Walter', 'Ewing', '1993-09-19', 'M', 'Spain', '106308214', 'Hauptwohnsitz', '239 Parks Crossroad', '427', 'Graz', 3010, '2002-05-08', '2021-04-07', null, false),
('4', 84, 'Jimmy', 'Chen', '1994-10-01', 'M', 'Gibraltar', '110288955', 'Nebenwohnsitz', '2669 Michael Bridge', '1121', 'Vienna', 1200, '2008-12-24', '2021-04-07', null, false);
('5', 85, 'Alyssa', 'Perez', '2014-08-03', 'F', 'Lao People''s Democratic Republic', '171109833', 'Nebenwohnsitz', '827 Edwards Extension Apt. 425', '17444', 'Linz', 1200, '2015-09-24', '2021-04-07', null, false),
('6', 86, 'Justin', 'Gonzales', '1994-04-25', 'F', 'Armenia', '105428068', 'Nebenwohnsitz', '427 Samuel Inlet', '93458', 'Salzburg', 1200, '2013-11-24', '2021-04-07', null, false),
('7', 87, 'Wyatt', 'Prince', '2019-01-03', 'M', 'Belize', '164924199', 'Nebenwohnsitz', '2193 Bishop Lakes', '15016', 'Innsbruck', 1010, '2006-02-13', '2021-04-07', null, false),
('8', 88, 'Kimberly', 'Dixon', '1988-01-07', 'M', 'Ireland', '108898826', 'Hauptwohnsitz', '1206 Bond Turnpike', '41121', 'Salzburg', 2020, '2010-07-27', '2021-04-07', null, false),
('9', 89, 'Jeffrey', 'Reed', '1997-08-21', 'M', 'Zimbabwe', '175712727', 'Nebenwohnsitz', '98771 Holly Avenue Suite 121', '90475', 'St. Polten', 2010, '2012-10-11', '2021-04-07', null, false),
('10', 90, 'Christopher', 'Barrett', '1979-09-18', 'M', 'Korea', '181515879', 'Hauptwohnsitz', '880 Rice Square Apt. 965', '45348', 'Innsbruck', 1200, '2017-03-11', '2021-04-07', null, false),
('11', 91, 'Anthony', 'Ponce', '2009-01-17', 'M', 'Bouvet Island (Bouvetoya)', '166187000', 'Hauptwohnsitz', '635 Bradley View Suite 466', '587', 'Innsbruck', 2010, '2012-11-09', '2021-04-07', null, false),
('12', 92, 'Edward', 'Chang', '2014-03-18', 'F', 'Mali', '135926508', 'Nebenwohnsitz', '016 Johnson Fords', '609', 'Innsbruck', 4010, '2000-04-24', '2021-04-07', null, false),
('13', 93, 'Curtis', 'Carpenter', '2013-06-10', 'F', 'Slovenia', '197457234', 'Hauptwohnsitz', '3311 David Circle', '610', 'Linz', 1200, '2009-03-17', '2021-04-07', null, false),
('14', 94, 'Kevin', 'Sullivan', '2016-05-23', 'M', 'French Guiana', '123979693', 'Hauptwohnsitz', '28270 Doris Meadows Apt. 403', '37575', 'Graz', 1010, '2019-06-09', '2021-04-07', null, false),
('15', 95, 'Johnathan', 'Howell', '1998-11-04', 'F', 'Germany', '180765777', 'Nebenwohnsitz', '242 Wendy Junctions Apt. 988', '70', 'Innsbruck', 2020, '2020-04-18', '2021-04-07', null, false),
('16', 96, 'Lawrence', 'Carter', '2014-02-13', 'M', 'Jamaica', '182529425', 'Hauptwohnsitz', '2808 Newton Branch', '64427', 'Salzburg', 4010, '2012-02-04', '2021-04-07', null, false),
('17', 97, 'Matthew', 'Rowland', '1981-12-24', 'M', 'Saint Pierre and Miquelon', '157291630', 'Hauptwohnsitz', '3979 John Street', '584', 'Graz', 1200, '2013-04-28', '2021-04-07', null, false),
('18', 98, 'David', 'Jenkins', '2006-04-06', 'F', 'Sao Tome and Principe', '161499157', 'Nebenwohnsitz', '178 Thomas Freeway', '16304', 'Salzburg', 4010, '2002-08-08', '2021-04-07', null, false),
('19', 99, 'Megan', 'Soto', '2006-09-16', 'M', 'Ukraine', '175954796', 'Nebenwohnsitz', '3934 Davis Curve', '303', 'Salzburg', 4010, '2016-07-19', '2021-04-07', null, false),
('20', 100, 'Sean', 'Wilkinson', '1984-12-06', 'F', 'Yemen', '123168363', 'Hauptwohnsitz', '7163 Cook Forest Suite 436', '39353', 'Innsbruck', 1200, '2013-04-19', '2021-04-07', null, false);



INSERT INTO documents.identity_card (ic_id, document_id, document_type, place_of_issue, first_name, last_name, nationality, date_of_issue, id_number, gender, expiration_date, created_date, modified_date, is_deleted) VALUES
(1, 1, 'Driving License', 'Nuku?alofa', 'Sara', 'Stokes', 'Tonga', '2018-04-13', '10412748368', 'M', '2023-02-11', '2021-04-07', null, false),
(2, 2, 'IDCard', 'London', 'Monica', 'Johnson', 'United Kingdom', '2010-02-04', '19359251447', 'M', '2023-09-27', '2021-04-07', null, false),
(3, 3, 'Passport', 'Madrid', 'Walter', 'Ewing', 'Spain', '2005-01-26', '19073558075', 'M', '2023-12-04', '2021-04-07', null, false),
(4, 4, 'IDCard', 'Gibraltar', 'Jimmy', 'Chen', 'Gibraltar', '2001-08-03', '18647750966', 'M', '2034-12-24', '2021-04-07', null, false),
(5, 5, 'IDCard', 'Vienna', 'Alyssa', 'Perez', 'Lao People''s Democratic Republic', '2015-06-07', '19131810902', 'F', '2034-04-30', '2021-04-07', null, false),
(6, 6, 'Driving License', 'Yerevan', 'Justin', 'Gonzales', 'Armenia', '2011-12-23', '12236620940', 'F', '2026-01-15', '2021-04-07', null, false),
(7, 7, 'Passport', 'Belmopan', 'Wyatt', 'Prince', 'Belize', '2014-10-04', '15783057178', 'M', '2024-08-09', '2021-04-07', null, false),
(8, 8, 'IDCard', 'Dublin', 'Kimberly', 'Dixon', 'Ireland', '2019-10-28', '11016146283', 'M', '2031-12-19', '2021-04-07', null, false),
(9, 9, 'Passport', 'Harare', 'Jeffrey', 'Reed', 'Zimbabwe', '2012-08-09', '13305812247', 'M', '2033-07-25', '2021-04-07', null, false),
(10, 10, 'Driving License', 'Vienna', 'Christopher', 'Barrett', 'Korea', '2001-09-15', '15245167544', 'M', '2029-03-04', '2021-04-07', null, false),
(11, 11, 'Passport', 'Vienna', 'Anthony', 'Ponce', 'Bouvet Island (Bouvetoya)', '2002-11-11', '18777864493', 'M', '2023-10-11', '2021-04-07', null, false),
(12, 12, 'Driving License', 'Bamako', 'Edward', 'Chang', 'Mali', '2015-10-26', '11226321065', 'F', '2027-12-27', '2021-04-07', null, false),
(13, 13, 'Driving License', 'Ljubljana', 'Curtis', 'Carpenter', 'Slovenia', '2000-05-10', '14582292774', 'F', '2026-07-15', '2021-04-07', null, false),
(14, 14, 'IDCard', 'Cayenne', 'Kevin', 'Sullivan', 'French Guiana', '2006-03-26', '15787586221', 'M', '2022-05-15', '2021-04-07', null, false),
(15, 15, 'Driving License', 'Berlin', 'Johnathan', 'Howell', 'Germany', '2004-05-28', '17173492776', 'F', '2029-09-01', '2021-04-07', null, false),
(16, 16, 'IDCard', 'Kingston', 'Lawrence', 'Carter', 'Jamaica', '2016-04-23', '18200180913', 'M', '2030-11-24', '2021-04-07', null, false),
(17, 17, 'Passport', 'St. Pierre', 'Matthew', 'Rowland', 'Saint Pierre and Miquelon', '2020-12-28', '12261564666', 'M', '2024-02-12', '2021-04-07', null, false),
(18, 18, 'Passport', 'Vienna', 'David', 'Jenkins', 'Sao Tome and Principe', '2013-09-15', '18995661497', 'F', '2026-07-17', '2021-04-07', null, false),
(19, 19, 'Driving License', 'Kiev', 'Megan', 'Soto', 'Ukraine', '2017-01-15', '10703690717', 'M', '2021-10-24', '2021-04-07', null, false),
(20, 20, 'Driving License', 'Sana''a', 'Sean', 'Wilkinson', 'Yemen', '2013-11-07', '12930950149', 'F', '2034-09-01', '2021-04-07', null, false);

INSERT INTO documents.payslip (p_id, document_id, first_name, last_name, date_of_issue, month, salary, income_tax, social_tax, company_employeed, created_date, modified_date, is_deleted) VALUES
(1,21, 'Sara', 'Stokes', '2020-08-03', 'August', 3000.00, 1200.00, 540.00, null, '2021-03-08', null, false),
(2,22, 'Monica', 'Johnson', '2021-03-01', 'March', 4928.57, 2365.71, 887.14, null, '2021-03-08', null, false),
(3,23, 'Walter', 'Ewing', '2020-12-01', 'December', 1357.14, 407.14, 244.29, null, '2021-03-08', null, false),
(4,24, 'Jimmy', 'Chen', '2021-03-01', 'March', 1428.57, 428.57, 257.14, null, '2021-03-08', null, false),
(5,25, 'Alyssa', 'Perez', '2020-01-01', 'January', 1571.43, 471.43, 282.86, null, '2021-03-08', null, false),
(6,26, 'Justin', 'Gonzales', '2020-06-01', 'June', 3571.43, 1428.57, 642.86, null, '2021-03-08', null, false),
(7,27, 'Wyatt', 'Prince', '2020-08-03', 'August', 4357.14, 2091.43, 784.29, null, '2021-03-08', null, false),
(8,28, 'Kimberly', 'Dixon', '2021-02-01', 'February', 5142.86, 2468.57, 925.71, null, '2021-03-08', null, false),
(9,29, 'Jeffrey', 'Reed', '2020-05-01', 'May', 4214.29, 1685.71, 758.57, null, '2021-03-08', null, false),
(10,30, 'Christopher', 'Barrett', '2020-08-03', 'August', 2000.00, 600.00, 360.00, null, '2021-03-08', null, false),
(11,31, 'Anthony', 'Ponce', '2020-04-01', 'April', 2071.43, 621.43, 372.86, null, '2021-03-08', null, false),
(12,32, 'Edward', 'Chang', '2020-12-01', 'December', 3571.43, 1428.57, 642.86, null, '2021-03-08', null, false),
(13,33, 'Curtis', 'Carpenter', '2021-03-01', 'March', 1285.71, 385.71, 231.43, null, '2021-03-08', null, false),
(14,34, 'Kevin', 'Sullivan', '2020-06-01', 'June', 2357.14, 942.86, 424.29, null, '2021-03-08', null, false),
(15,35, 'Johnathan', 'Howell', '2020-11-02', 'November', 5357.14, 2571.43, 964.29, null, '2021-03-08', null, false),
(16,36, 'Lawrence', 'Carter', '2021-04-01', 'April', 3142.86, 1257.14, 565.71, null, '2021-03-08', null, false),
(17,37, 'Matthew', 'Rowland', '2020-12-01', 'December', 2714.29, 1085.71, 488.57, null, '2021-03-08', null, false),
(18,38, 'David', 'Jenkins', '2021-02-01', 'February', 4214.29, 1685.71, 758.57, null, '2021-03-08', null, false),
(19,39, 'Megan', 'Soto', '2020-11-02', 'November', 857.14, 171.43, 154.29, null, '2021-03-08', null, false),
(20,40, 'Sean', 'Wilkinson', '2020-08-03', 'August', 3857.14, 1542.86, 694.29, null, '2021-03-08', null, false),
(21,41, 'Sara', 'Stokes', '2020-10-01', 'October', 3000.00, 1200.00, 540.00, null, '2021-03-08', null, false),
(22,42, 'Monica', 'Johnson', '2021-05-03', 'May', 4928.57, 2365.71, 887.14, null, '2021-03-08', null, false),
(23,43, 'Walter', 'Ewing', '2021-02-01', 'February', 1357.14, 407.14, 244.29, null, '2021-03-08', null, false),
(24,44, 'Jimmy', 'Chen', '2021-05-03', 'May', 1428.57, 428.57, 257.14, null, '2021-03-08', null, false),
(25,45, 'Alyssa', 'Perez', '2020-03-02', 'March', 1571.43, 471.43, 282.86, null, '2021-03-08', null, false),
(26,46, 'Justin', 'Gonzales', '2020-08-03', 'August', 3571.43, 1428.57, 642.86, null, '2021-03-08', null, false),
(27,47, 'Wyatt', 'Prince', '2020-10-01', 'October', 4357.14, 2091.43, 784.29, null, '2021-03-08', null, false),
(28,48, 'Kimberly', 'Dixon', '2021-04-01', 'April', 5142.86, 2468.57, 925.71, null, '2021-03-08', null, false),
(29,49, 'Jeffrey', 'Reed', '2020-07-01', 'July', 4214.29, 1685.71, 758.57, null, '2021-03-08', null, false),
(30,50, 'Christopher', 'Barrett', '2020-10-01', 'October', 2000.00, 600.00, 360.00, null, '2021-03-08', null, false),
(31,51, 'Anthony', 'Ponce', '2020-06-01', 'June', 2071.43, 621.43, 372.86, null, '2021-03-08', null, false),
(32,52, 'Edward', 'Chang', '2021-01-01', 'January', 3571.43, 1428.57, 642.86, null, '2021-03-08', null, false),
(33,53, 'Curtis', 'Carpenter', '2021-05-03', 'May', 1285.71, 385.71, 231.43, null, '2021-03-08', null, false),
(34,54, 'Kevin', 'Sullivan', '2020-08-03', 'August', 2357.14, 942.86, 424.29, null, '2021-03-08', null, false),
(35,55, 'Johnathan', 'Howell', '2021-01-01', 'January', 5357.14, 2571.43, 964.29, null, '2021-03-08', null, false),
(36,56, 'Lawrence', 'Carter', '2021-05-03', 'May', 3142.86, 1257.14, 565.71, null, '2021-03-08', null, false),
(37,57, 'Matthew', 'Rowland', '2021-02-01', 'February', 2714.29, 1085.71, 488.57, null, '2021-03-08', null, false),
(38,58, 'David', 'Jenkins', '2021-04-01', 'April', 4214.29, 1685.71, 758.57, null, '2021-03-08', null, false),
(39,59, 'Megan', 'Soto', '2021-01-01', 'January', 857.14, 171.43, 154.29, null, '2021-03-08', null, false),
(40,60, 'Sean', 'Wilkinson', '2020-10-01', 'October', 3857.14, 1542.86, 694.29, null, '2021-03-08', null, false),
(41,61, 'Sara', 'Stokes', '2020-12-01', 'December', 3000.00, 1200.00, 540.00, null, '2021-03-08', null, false),
(42,62, 'Monica', 'Johnson', '2021-07-01', 'July', 4928.57, 2365.71, 887.14, null, '2021-03-08', null, false),
(43,63, 'Walter', 'Ewing', '2021-04-01', 'April', 1357.14, 407.14, 244.29, null, '2021-03-08', null, false),
(44,64, 'Jimmy', 'Chen', '2021-07-01', 'July', 1428.57, 428.57, 257.14, null, '2021-03-08', null, false),
(45,65, 'Alyssa', 'Perez', '2020-05-01', 'May', 1571.43, 471.43, 282.86, null, '2021-03-08', null, false),
(46,66, 'Justin', 'Gonzales', '2020-10-01', 'October', 3571.43, 1428.57, 642.86, null, '2021-03-08', null, false),
(47,67, 'Wyatt', 'Prince', '2020-12-01', 'December', 4357.14, 2091.43, 784.29, null, '2021-03-08', null, false),
(48,68, 'Kimberly', 'Dixon', '2021-06-01', 'June', 5142.86, 2468.57, 925.71, null, '2021-03-08', null, false),
(49,69, 'Jeffrey', 'Reed', '2020-09-01', 'September', 4214.29, 1685.71, 758.57, null, '2021-03-08', null, false),
(50,70, 'Christopher', 'Barrett', '2020-12-01', 'December', 2000.00, 600.00, 360.00, null, '2021-03-08', null, false),
(51,71, 'Anthony', 'Ponce', '2020-08-03', 'August', 2071.43, 621.43, 372.86, null, '2021-03-08', null, false),
(52,72, 'Edward', 'Chang', '2021-03-01', 'March', 3571.43, 1428.57, 642.86, null, '2021-03-08', null, false),
(53,73, 'Curtis', 'Carpenter', '2021-07-01', 'July', 1285.71, 385.71, 231.43, null, '2021-03-08', null, false),
(54,74, 'Kevin', 'Sullivan', '2020-10-01', 'October', 2357.14, 942.86, 424.29, null, '2021-03-08', null, false),
(55,75, 'Johnathan', 'Howell', '2021-03-01', 'March', 5357.14, 2571.43, 964.29, null, '2021-03-08', null, false),
(56,76, 'Lawrence', 'Carter', '2021-07-01', 'July', 3142.86, 1257.14, 565.71, null, '2021-03-08', null, false),
(57,77, 'Matthew', 'Rowland', '2021-04-01', 'April', 2714.29, 1085.71, 488.57, null, '2021-03-08', null, false),
(58,78, 'David', 'Jenkins', '2021-06-01', 'June', 4214.29, 1685.71, 758.57, null, '2021-03-08', null, false),
(59,79, 'Megan', 'Soto', '2021-03-01', 'March', 857.14, 171.43, 154.29, null, '2021-03-08', null, false),
(60,80, 'Sean', 'Wilkinson', '2020-12-01', 'December', 3857.14, 1542.86, 694.29, null, '2021-03-08', null, false);