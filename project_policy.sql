create database project_policy;
use project_policy;

-- Country

CREATE TABLE mst_country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL,
    status ENUM('Active','Inactive') NOT NULL,
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50)
);


-- State

CREATE TABLE mst_state (
    state_id INT PRIMARY KEY AUTO_INCREMENT,
    state_name VARCHAR(100) NOT NULL,
    country_id INT,
    status ENUM('Active','Inactive') NOT NULL,
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50),
    FOREIGN KEY (country_id) REFERENCES mst_country(country_id)
);


-- City

CREATE TABLE mst_city (
    city_id INT PRIMARY KEY AUTO_INCREMENT,
    city_name VARCHAR(100) NOT NULL,
    state_id INT,
    status ENUM('Active','Inactive') NOT NULL,
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50),
    FOREIGN KEY (state_id) REFERENCES mst_state(state_id)
);
INSERT INTO mst_country (country_name, status, added_by) VALUES
('India','Active','Admin'),
('USA','Active','Admin'),
('UK','Active','Admin'),
('Australia','Active','Admin'),
('Canada','Active','Admin');

INSERT INTO mst_state (state_name, country_id, status, added_by) VALUES
('Maharashtra',1,'Active','Admin'),
('Karnataka',1,'Active','Admin'),
('Tamil Nadu',1,'Active','Admin'),
('Gujarat',1,'Active','Admin'),
('California',2,'Active','Admin'),
('Texas',2,'Active','Admin'),
('New South Wales',4,'Active','Admin'),
('Victoria',4,'Active','Admin');

INSERT INTO mst_city (city_name, state_id, status, added_by) VALUES
('Mumbai',1,'Active','Admin'),
('Pune',1,'Active','Admin'),
('Bangalore',2,'Active','Admin'),
('Chennai',3,'Active','Admin'),
('Ahmedabad',4,'Active','Admin'),
('Los Angeles',5,'Active','Admin'),
('Houston',6,'Active','Admin'),
('Sydney',7,'Active','Admin'),
('Melbourne',8,'Active','Admin'),
('San Francisco',5,'Active','Admin');



-- Vehicle Make
CREATE TABLE mst_vehicle_make (
    make_id INT PRIMARY KEY AUTO_INCREMENT,
    make_desc VARCHAR(100) NOT NULL,
    status ENUM('Active','Inactive') NOT NULL,
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50)
);
select*from mst_vehicle_make;
INSERT INTO mst_vehicle_make (make_desc, status, added_by) VALUES
('Royal Enfield','Active','Admin'),
('Honda','Active','Admin'),
('Yamaha','Active','Admin'),
('KTM','Active','Admin'),
('Bajaj','Active','Admin'),
('Suzuki','Active','Admin'),
('TVS','Active','Admin'),
('Hero','Active','Admin'),
('Kawasaki','Active','Admin'),
('Harley Davidson','Active','Admin'),
('Triumph','Active','Admin'),
('Ducati','Active','Admin'),
('BMW Motorrad','Active','Admin'),
('Aprilia','Active','Admin'),
('Moto Guzzi','Active','Admin'),
('Benelli','Active','Admin'),
('CFMoto','Active','Admin'),
('Victory','Active','Admin'),
('Husqvarna','Active','Admin'),
('Italjet','Active','Admin'),
('Indian Motorcycle','Active','Admin'),
('Polaris','Active','Admin'),
('Keeway','Active','Admin'),
('Rieju','Active','Admin'),
('SYM','Active','Admin');



-- Vehicle Model

CREATE TABLE mst_vehicle_model (
    model_id INT PRIMARY KEY AUTO_INCREMENT,
    model_desc VARCHAR(100) NOT NULL,
    make_id INT,
    status ENUM('Active','Inactive') NOT NULL,
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50),
    FOREIGN KEY (make_id) REFERENCES mst_vehicle_make(make_id)
);
select*from mst_vehicle_model;
INSERT INTO mst_vehicle_model (model_desc, make_id, status, added_by) VALUES
('Classic 350', 1, 'Active', 'Admin'),
('Interceptor 650', 1, 'Active', 'Admin'),
('CBR 250R', 2, 'Active', 'Admin'),
('CBR 500R', 2, 'Active', 'Admin'),
('R15 V4', 3, 'Active', 'Admin'),
('FZ-S V3', 3, 'Active', 'Admin'),
('KTM Duke 200', 4, 'Active', 'Admin'),
('KTM RC 390', 4, 'Active', 'Admin'),
('Pulsar 150', 5, 'Active', 'Admin'),
('Pulsar 220F', 5, 'Active', 'Admin'),
('Gixxer SF', 6, 'Active', 'Admin'),
('Gixxer 250', 6, 'Active', 'Admin'),
('Apache RTR 160', 7, 'Active', 'Admin'),
('Apache RTR 200', 7, 'Active', 'Admin'),
('Splendor Plus', 8, 'Active', 'Admin'),
('Hero Xtreme 160R', 8, 'Active', 'Admin'),
('Ninja 400', 9, 'Active', 'Admin'),
('Z650', 9, 'Active', 'Admin'),
('Street 750', 10, 'Active', 'Admin'),
('Iron 883', 10, 'Active', 'Admin'),
('Street Triple', 11, 'Active', 'Admin'),
('Bonneville T100', 11, 'Active', 'Admin'),
('Monster 821', 12, 'Active', 'Admin'),
('Panigale V2', 12, 'Active', 'Admin'),
('R1250 GS', 13, 'Active', 'Admin');

-- USER PERSONAL INFO

CREATE TABLE txn_user_personal_info (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    usertype ENUM('Broker','SalesAgent','Customer') NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender ENUM('Male','Female','Other'),
    dob DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    marital_status INT,
    education INT,
    phone VARCHAR(20),
    mobile VARCHAR(20),
    addr1 VARCHAR(100),
    addr2 VARCHAR(100),
    addr3 VARCHAR(100),
    street VARCHAR(100),
    city INT,
    state INT,
    country INT,
    national_id VARCHAR(50) NOT NULL UNIQUE,
    nationality INT NOT NULL,
    status ENUM('Active','Inactive') NOT NULL,
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50),
    FOREIGN KEY (city) REFERENCES mst_city(city_id),
    FOREIGN KEY (state) REFERENCES mst_state(state_id),
    FOREIGN KEY (country) REFERENCES mst_country(country_id)
);
select*from txn_user_personal_info;
INSERT INTO txn_user_personal_info
(usertype, first_name, last_name, gender, dob, email, marital_status, education, phone, mobile, addr1, addr2, addr3, street, city, state, country, national_id, nationality, status, added_by) VALUES
('Customer','Vinith','S','Male','1995-08-10','vinith1@example.com',1,2,'05115123401','919876540001','Street 1','Area A','Block X','Lane 1',1,1,1,'A123450001',1,'Active','Admin'),
('Customer','Ramesh','K','Male','1988-04-21','ramesh2@example.com',2,3,'05115234502','919812340002','Street 2','Area B','Block Y','Lane 2',2,1,1,'B987650002',1,'Active','Admin'),
('SalesAgent','Anita','P','Female','1990-12-05','anita3@example.com',1,3,'05115345603','919823450003','Street 3','Area C','Block Z','Lane 3',3,1,1,'C123498003',1,'Active','Admin'),
('Broker','Sunil','S','Male','1985-07-15','sunil4@example.com',2,4,'05115456704','919834560004','Street 4','Area D','Block W','Lane 4',4,1,1,'D987651004',1,'Active','Admin'),
('Customer','Priya','V','Female','1992-03-25','priya5@example.com',1,3,'05115567805','919845670005','Street 5','Area E','Block V','Lane 5',5,1,1,'E123459005',1,'Active','Admin'),
('Customer','Amit','R','Male','1991-01-12','amit6@example.com',1,2,'05115678906','919856780006','Street 6','Area F','Block U','Lane 6',1,1,1,'F987652006',1,'Active','Admin'),
('SalesAgent','Neha','T','Female','1993-05-18','neha7@example.com',2,3,'05115789007','919867890007','Street 7','Area G','Block T','Lane 7',2,1,1,'G123453007',1,'Active','Admin'),
('Broker','Rohit','M','Male','1987-09-30','rohit8@example.com',2,4,'05115890108','919878901008','Street 8','Area H','Block S','Lane 8',3,1,1,'H987654008',1,'Active','Admin'),
('Customer','Sonal','K','Female','1994-02-14','sonal9@example.com',1,3,'05115901209','919889012009','Street 9','Area I','Block R','Lane 9',4,1,1,'I123459009',1,'Active','Admin'),
('Customer','Rahul','P','Male','1990-07-07','rahul10@example.com',1,2,'05115012310','919890123010','Street 10','Area J','Block Q','Lane 10',5,1,1,'J987650010',1,'Active','Admin'),
('SalesAgent','Pooja','S','Female','1992-10-21','pooja11@example.com',1,3,'05115123411','919891234011','Street 11','Area K','Block P','Lane 11',1,1,1,'K123451011',1,'Active','Admin'),
('Broker','Manish','G','Male','1986-03-11','manish12@example.com',2,4,'05115234512','919892345012','Street 12','Area L','Block O','Lane 12',2,1,1,'L987652012',1,'Active','Admin'),
('Customer','Divya','N','Female','1991-12-08','divya13@example.com',1,3,'05115345613','919893456013','Street 13','Area M','Block N','Lane 13',3,1,1,'M123458013',1,'Active','Admin'),
('Customer','Karan','R','Male','1993-06-23','karan14@example.com',1,2,'05115456714','919894567014','Street 14','Area N','Block M','Lane 14',4,1,1,'N987654014',1,'Active','Admin'),
('SalesAgent','Shreya','V','Female','1990-11-02','shreya15@example.com',1,3,'05115567815','919895678015','Street 15','Area O','Block L','Lane 15',5,1,1,'O123459015',1,'Active','Admin'),
('Broker','Aakash','T','Male','1989-08-16','aakash16@example.com',2,4,'05115678916','919896789016','Street 16','Area P','Block K','Lane 16',1,1,1,'P987651016',1,'Active','Admin'),
('Customer','Ritika','M','Female','1995-09-29','ritika17@example.com',1,3,'05115789017','919897890017','Street 17','Area Q','Block J','Lane 17',2,1,1,'Q123457017',1,'Active','Admin'),
('Customer','Vikram','S','Male','1992-04-05','vikram18@example.com',1,2,'05115890118','919898901018','Street 18','Area R','Block I','Lane 18',3,1,1,'R987652018',1,'Active','Admin'),
('SalesAgent','Neelam','P','Female','1993-07-12','neelam19@example.com',1,3,'05115901219','919899012019','Street 19','Area S','Block H','Lane 19',4,1,1,'S123456019',1,'Active','Admin'),
('Broker','Sandeep','K','Male','1985-05-20','sandeep20@example.com',2,4,'05115012320','919890123020','Street 20','Area T','Block G','Lane 20',5,1,1,'T987654020',1,'Active','Admin'),
('Customer','Megha','R','Female','1994-01-18','megha21@example.com',1,3,'05115123421','919891234021','Street 21','Area U','Block F','Lane 21',1,1,1,'U123450021',1,'Active','Admin'),
('Customer','Ankit','S','Male','1991-10-30','ankit22@example.com',1,2,'05115234522','919892345022','Street 22','Area V','Block E','Lane 22',2,1,1,'V987652022',1,'Active','Admin'),
('SalesAgent','Radhika','T','Female','1990-03-14','radhika23@example.com',1,3,'05115345623','919893456023','Street 23','Area W','Block D','Lane 23',3,1,1,'W123458023',1,'Active','Admin'),
('Broker','Deepak','M','Male','1987-12-09','deepak24@example.com',2,4,'05115456724','919894567024','Street 24','Area X','Block C','Lane 24',4,1,1,'X987654024',1,'Active','Admin'),
('Customer','Sneha','P','Female','1995-06-02','sneha25@example.com',1,3,'05115567825','919895678025','Street 25','Area Y','Block B','Lane 25',5,1,1,'Y123459025',1,'Active','Admin');


-- Broker
CREATE TABLE txn_broker (
    broker_id INT PRIMARY KEY AUTO_INCREMENT,
    broker_name VARCHAR(100),
    broker_org_name VARCHAR(100),
    contact_info VARCHAR(200),
    status ENUM('Active','Inactive') NOT NULL,
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50)
);
select*from txn_broker;
INSERT INTO txn_broker (broker_name, broker_org_name, contact_info, status, added_by) VALUES
('Ramesh Kumar', 'Kumar Brokers', 'ramesh@broker.com, 05115234567', 'Active', 'Admin'),
('Sunil Sharma', 'Sharma Insurance', 'sunil@broker.com, 05115678901', 'Active', 'Admin'),
('Priya Verma', 'Verma Brokers', 'priya@broker.com, 05115987654', 'Active', 'Admin'),
('Amit Gupta', 'Gupta Insurance', 'amit@broker.com, 05115123456', 'Active', 'Admin'),
('Anita Joshi', 'Joshi Brokers', 'anita@broker.com, 05115234567', 'Active', 'Admin'),
('Manish Singh', 'Singh Insurance', 'manish@broker.com, 05115345678', 'Active', 'Admin'),
('Rohit Mehra', 'Mehra Brokers', 'rohit@broker.com, 05115456789', 'Active', 'Admin'),
('Neha Sharma', 'Neha Insurance', 'neha@broker.com, 05115567890', 'Active', 'Admin'),
('Sandeep Rao', 'Rao Brokers', 'sandeep@broker.com, 05115678901', 'Active', 'Admin'),
('Priyanka Gupta', 'Gupta Brokers', 'priyanka@broker.com, 05115789012', 'Active', 'Admin'),
('Vikram Singh', 'Singh Brokers', 'vikram@broker.com, 05115890123', 'Active', 'Admin'),
('Ritika Sharma', 'Sharma Brokers', 'ritika@broker.com, 05115901234', 'Active', 'Admin'),
('Karan Verma', 'Verma Insurance', 'karan@broker.com, 05115012345', 'Active', 'Admin'),
('Megha Reddy', 'Reddy Brokers', 'megha@broker.com, 05115123456', 'Active', 'Admin'),
('Deepak Kumar', 'Kumar Insurance', 'deepak@broker.com, 05115234567', 'Active', 'Admin');



-- Login User
CREATE TABLE txn_login_user (
    login_id INT PRIMARY KEY AUTO_INCREMENT,
    password VARCHAR(255) NOT NULL,  -- encrypted
    user_id INT,
    lead_id INT,
    usertype ENUM('Admin','Broker','SalesAgent','Customer') NOT NULL,
    status ENUM('Active','Inactive') NOT NULL,
    added_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    added_by VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES txn_user_personal_info(user_id)
);

select*from txn_login_user;
INSERT INTO txn_login_user (password, user_id, lead_id, usertype, status, added_by) VALUES
('pass123', 1, NULL, 'Customer', 'Active','Admin'),
('pass123', 2, NULL, 'Customer', 'Active','Admin'),
('pass123', 3, NULL, 'SalesAgent', 'Active','Admin'),
('pass123', 4, NULL, 'Broker', 'Active','Admin'),
('pass123', 5, NULL, 'Customer', 'Active','Admin'),
('pass123', 6, NULL, 'Customer', 'Active','Admin'),
('pass123', 7, 4, 'SalesAgent', 'Active','Admin'),
('pass123', 8, NULL, 'Broker', 'Active','Admin'),
('pass123', 9, 8, 'Customer', 'Active','Admin'),
('pass123', 10, NULL, 'Customer', 'Active','Admin'),
('pass123', 11, 4, 'SalesAgent', 'Active','Admin'),
('pass123', 12, NULL, 'Broker', 'Active','Admin'),
('pass123', 13, 12, 'Customer', 'Active','Admin'),
('pass123', 14, NULL, 'Customer', 'Active','Admin'),
('pass123', 15, 12, 'SalesAgent', 'Active','Admin'),
('pass123', 16, NULL, 'Broker', 'Active','Admin'),
('pass123', 17, 16, 'Customer', 'Active','Admin'),
('pass123', 18, NULL, 'Customer', 'Active','Admin'),
('pass123', 19, 16, 'SalesAgent', 'Active','Admin'),
('pass123', 20, NULL, 'Broker', 'Active','Admin'),
('pass123', 21, 20, 'Customer', 'Active','Admin'),
('pass123', 22, NULL, 'Customer', 'Active','Admin'),
('pass123', 23, 20, 'SalesAgent', 'Active','Admin'),
('pass123', 24, NULL, 'Broker', 'Active','Admin'),
('pass123', 25, 24, 'Customer', 'Active','Admin');





-- Quote
CREATE TABLE txn_quote (
    quote_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    vehicle_id INT,
    coverage_type ENUM('Comprehensive','TPL','Both') NOT NULL,
    premium_amount DECIMAL(12,2),
    status ENUM('Open','Converted','Expired') DEFAULT 'Open',
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES txn_user_personal_info(user_id)
);
INSERT INTO txn_quote (user_id, vehicle_id, coverage_type, premium_amount, status, created_by) VALUES
(1, 1, 'Comprehensive', 12000.00, 'Open', 'Admin'),
(2, 2, 'TPL', 5000.00, 'Open', 'Admin'),
(3, 3, 'Both', 15000.00, 'Open', 'Admin'),
(4, 4, 'Comprehensive', 11000.00, 'Open', 'Admin'),
(5, 5, 'TPL', 6000.00, 'Open', 'Admin'),
(6, 6, 'Both', 13000.00, 'Open', 'Admin'),
(7, 7, 'Comprehensive', 12500.00, 'Open', 'Admin'),
(8, 8, 'TPL', 5500.00, 'Open', 'Admin'),
(9, 9, 'Both', 14000.00, 'Open', 'Admin'),
(10, 10, 'Comprehensive', 11500.00, 'Open', 'Admin'),
(11, 11, 'TPL', 5800.00, 'Open', 'Admin'),
(12, 12, 'Both', 16000.00, 'Open', 'Admin'),
(13, 13, 'Comprehensive', 13500.00, 'Open', 'Admin'),
(14, 14, 'TPL', 6200.00, 'Open', 'Admin'),
(15, 15, 'Both', 14500.00, 'Open', 'Admin'),
(16, 16, 'Comprehensive', 12500.00, 'Open', 'Admin'),
(17, 17, 'TPL', 5400.00, 'Open', 'Admin'),
(18, 18, 'Both', 15500.00, 'Open', 'Admin'),
(19, 19, 'Comprehensive', 13000.00, 'Open', 'Admin'),
(20, 20, 'TPL', 5600.00, 'Open', 'Admin'),
(21, 21, 'Both', 15000.00, 'Open', 'Admin'),
(22, 22, 'Comprehensive', 12000.00, 'Open', 'Admin'),
(23, 23, 'TPL', 5000.00, 'Open', 'Admin'),
(24, 24, 'Both', 14000.00, 'Open', 'Admin'),
(25, 25, 'Comprehensive', 13000.00, 'Open', 'Admin');

-- Premium Calculation
CREATE TABLE txn_premium_calculation (
    calc_id INT PRIMARY KEY AUTO_INCREMENT,
    quote_id INT,
    base_premium DECIMAL(12,2),
    addon_premium DECIMAL(12,2),
    tax_amount DECIMAL(12,2),
    total_premium DECIMAL(12,2),
    currency VARCHAR(10) DEFAULT 'INR',
    FOREIGN KEY (quote_id) REFERENCES txn_quote(quote_id)
);

INSERT INTO txn_premium_calculation 
(quote_id, base_premium, addon_premium, tax_amount, total_premium, currency) VALUES
(1, 10000.00, 1500.00, 500.00, 12000.00, 'INR'),
(2, 4500.00, 400.00, 100.00, 5000.00, 'INR'),
(3, 13000.00, 1800.00, 200.00, 15000.00, 'INR'),
(4, 9500.00, 1200.00, 300.00, 11000.00, 'INR'),
(5, 5200.00, 600.00, 200.00, 6000.00, 'INR'),
(6, 11000.00, 1800.00, 200.00, 13000.00, 'INR'),
(7, 10500.00, 1800.00, 200.00, 12500.00, 'INR'),
(8, 4800.00, 500.00, 200.00, 5500.00, 'INR'),
(9, 12000.00, 1800.00, 200.00, 14000.00, 'INR'),
(10, 10000.00, 1300.00, 200.00, 11500.00, 'INR'),
(11, 5000.00, 600.00, 200.00, 5800.00, 'INR'),
(12, 14000.00, 1800.00, 200.00, 16000.00, 'INR'),
(13, 12000.00, 1300.00, 200.00, 13500.00, 'INR'),
(14, 5400.00, 600.00, 200.00, 6200.00, 'INR'),
(15, 12500.00, 1800.00, 200.00, 14500.00, 'INR'),
(16, 10500.00, 1800.00, 200.00, 12500.00, 'INR'),
(17, 4800.00, 400.00, 200.00, 5400.00, 'INR'),
(18, 13000.00, 2400.00, 100.00, 15500.00, 'INR'),
(19, 11000.00, 1800.00, 200.00, 13000.00, 'INR'),
(20, 4800.00, 500.00, 300.00, 5600.00, 'INR'),
(21, 12000.00, 2800.00, 200.00, 15000.00, 'INR'),
(22, 10000.00, 1800.00, 200.00, 12000.00, 'INR'),
(23, 4500.00, 400.00, 100.00, 5000.00, 'INR'),
(24, 12000.00, 1800.00, 200.00, 14000.00, 'INR'),
(25, 11000.00, 1800.00, 200.00, 13000.00, 'INR');

-- policy

CREATE TABLE txn_policy (
    policy_id INT PRIMARY KEY AUTO_INCREMENT,
    policy_no VARCHAR(50) UNIQUE NOT NULL,
    quote_id INT,
    issue_date DATE,  -- set manually or with a trigger
    expiry_date DATE,
    status ENUM('Active','Expired','Cancelled') DEFAULT 'Active',
    FOREIGN KEY (quote_id) REFERENCES txn_quote(quote_id)
);

INSERT INTO txn_policy (policy_no, quote_id, issue_date, expiry_date, status) VALUES
('POL001', 1, '2025-01-01', '2026-01-01', 'Active'),
('POL002', 2, '2025-01-05', '2026-01-05', 'Active'),
('POL003', 3, '2025-01-10', '2026-01-10', 'Active'),
('POL004', 4, '2025-01-15', '2026-01-15', 'Active'),
('POL005', 5, '2025-01-20', '2026-01-20', 'Active'),
('POL006', 6, '2025-01-25', '2026-01-25', 'Active'),
('POL007', 7, '2025-02-01', '2026-02-01', 'Active'),
('POL008', 8, '2025-02-05', '2026-02-05', 'Active'),
('POL009', 9, '2025-02-10', '2026-02-10', 'Active'),
('POL010', 10, '2025-02-15', '2026-02-15', 'Active'),
('POL011', 11, '2025-02-20', '2026-02-20', 'Active'),
('POL012', 12, '2025-02-25', '2026-02-25', 'Active'),
('POL013', 13, '2025-03-01', '2026-03-01', 'Active'),
('POL014', 14, '2025-03-05', '2026-03-05', 'Active'),
('POL015', 15, '2025-03-10', '2026-03-10', 'Active'),
('POL016', 16, '2025-03-15', '2026-03-15', 'Active'),
('POL017', 17, '2025-03-20', '2026-03-20', 'Active'),
('POL018', 18, '2025-03-25', '2026-03-25', 'Active'),
('POL019', 19, '2025-04-01', '2026-04-01', 'Active'),
('POL020', 20, '2025-04-05', '2026-04-05', 'Active'),
('POL021', 21, '2025-04-10', '2026-04-10', 'Active'),
('POL022', 22, '2025-04-15', '2026-04-15', 'Active'),
('POL023', 23, '2025-04-20', '2026-04-20', 'Active'),
('POL024', 24, '2025-04-25', '2026-04-25', 'Active'),
('POL025', 25, '2025-05-01', '2026-05-01', 'Active');

-- Payment
CREATE TABLE txn_payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    quote_id INT,
    amount DECIMAL(12,2),
    currency VARCHAR(10) DEFAULT 'INR',
    payment_mode ENUM('CreditCard','DebitCard','NetBanking','BrokerBalance','ForeignCurrency'),
    payment_status ENUM('Pending','Success','Failed') DEFAULT 'Pending',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (quote_id) REFERENCES txn_quote(quote_id)
);
INSERT INTO txn_payment (quote_id, amount, currency, payment_mode, payment_status) VALUES
(1, 12000.00, 'INR', 'CreditCard', 'Success'),
(2, 5000.00, 'INR', 'DebitCard', 'Success'),
(3, 15000.00, 'INR', 'NetBanking', 'Success'),
(4, 11000.00, 'INR', 'BrokerBalance', 'Success'),
(5, 6000.00, 'INR', 'CreditCard', 'Success'),
(6, 13000.00, 'INR', 'DebitCard', 'Success'),
(7, 12500.00, 'INR', 'NetBanking', 'Success'),
(8, 5500.00, 'INR', 'BrokerBalance', 'Success'),
(9, 14000.00, 'INR', 'CreditCard', 'Success'),
(10, 11500.00, 'INR', 'DebitCard', 'Success'),
(11, 5800.00, 'INR', 'NetBanking', 'Success'),
(12, 16000.00, 'INR', 'BrokerBalance', 'Success'),
(13, 13500.00, 'INR', 'CreditCard', 'Success'),
(14, 6200.00, 'INR', 'DebitCard', 'Success'),
(15, 14500.00, 'INR', 'NetBanking', 'Success'),
(16, 12500.00, 'INR', 'BrokerBalance', 'Success'),
(17, 5400.00, 'INR', 'CreditCard', 'Success'),
(18, 15500.00, 'INR', 'DebitCard', 'Success'),
(19, 13000.00, 'INR', 'NetBanking', 'Success'),
(20, 5600.00, 'INR', 'BrokerBalance', 'Success'),
(21, 15000.00, 'INR', 'CreditCard', 'Success'),
(22, 12000.00, 'INR', 'DebitCard', 'Success'),
(23, 5000.00, 'INR', 'NetBanking', 'Success'),
(24, 14000.00, 'INR', 'BrokerBalance', 'Success'),
(25, 13000.00, 'INR', 'ForeignCurrency', 'Success');




select*from information_schema.tables where table_schema ='project_policy';


DELIMITER $$

CREATE TRIGGER trg_policy_issue_date
BEFORE INSERT ON txn_policy
FOR EACH ROW
BEGIN
    IF NEW.issue_date IS NULL THEN
        SET NEW.issue_date = CURDATE();
    END IF;
END$$

DELIMITER ;

SELECT COUNT(*) AS total_customers
FROM txn_user_personal_info
WHERE usertype='Customer';

SELECT SUM(total_premium) AS total_premiums
FROM txn_premium_calculation;


SELECT AVG(total_premium) AS avg_premium
FROM txn_premium_calculation;

SELECT MIN(total_premium) AS min_premium, MAX(total_premium) AS max_premium
FROM txn_premium_calculation;


SELECT status, COUNT(*) AS count
FROM txn_policy
GROUP BY status;


-- Number of quotes per user
SELECT user_id, COUNT(*) AS num_quotes
FROM txn_quote
GROUP BY user_id
HAVING COUNT(*) > 1;

-- Total premium per coverage type
SELECT q.coverage_type, SUM(p.total_premium) AS total
FROM txn_quote q
JOIN txn_premium_calculation p ON q.quote_id = p.quote_id
GROUP BY q.coverage_type
HAVING SUM(p.total_premium) > 20000;

-- Inner Join: Quote with User Info
SELECT q.quote_id, u.first_name, u.last_name, q.coverage_type, q.premium_amount
FROM txn_quote q
INNER JOIN txn_user_personal_info u ON q.user_id = u.user_id;

-- Left Join: Policies with Payments
SELECT p.policy_no, pay.amount, pay.payment_status
FROM txn_policy p
LEFT JOIN txn_payment pay ON p.quote_id = pay.quote_id;

-- One-to-Many: Vehicle make & models
SELECT m.make_desc, v.model_desc
FROM mst_vehicle_make m
right JOIN mst_vehicle_model v ON m.make_id = v.make_id;


-- Users who have quotes above average premium
SELECT first_name, last_name
FROM txn_user_personal_info
WHERE user_id IN (
    SELECT user_id
    FROM txn_quote
    WHERE premium_amount > (SELECT AVG(total_premium) FROM txn_premium_calculation)
);

-- Quotes for vehicles with highest premium
SELECT *
FROM txn_quote
WHERE premium_amount = (SELECT MAX(total_premium) FROM txn_premium_calculation);

-- Distinct coverage types
SELECT DISTINCT coverage_type
FROM txn_quote;

-- Quotes in a range
SELECT * FROM txn_quote
WHERE premium_amount BETWEEN 5000 AND 15000;

-- Users in certain cities
SELECT first_name, last_name FROM txn_user_personal_info
WHERE city IN (1,2,3);

-- Customers with name pattern
SELECT first_name, last_name FROM txn_user_personal_info
WHERE first_name LIKE 'V%';

-- Top 5 highest premiums
SELECT * FROM txn_premium_calculation
ORDER BY total_premium DESC
LIMIT 5 OFFSET 0;

START TRANSACTION;

UPDATE txn_payment
SET payment_status='Success'
WHERE payment_id=5;

UPDATE txn_policy
SET status='Active'
WHERE policy_id=5;

-- Rollback example
-- ROLLBACK;

COMMIT;


DELIMITER $$

CREATE PROCEDURE sp_get_policy_by_user(IN uid INT)
BEGIN
    SELECT p.policy_no, p.status, q.coverage_type
    FROM txn_policy p
    JOIN txn_quote q ON p.quote_id = q.quote_id
    WHERE q.user_id = uid;
END$$

DELIMITER ;

-- Call procedure
CALL sp_get_policy_by_user(15);




-- ------------------------------------------------------------------------------


-- ADD COLUMN
ALTER TABLE mst_state ADD COLUMN head_office_location VARCHAR(100);
ALTER TABLE mst_state RENAME COLUMN head_office_location TO head_office;
SELECT * FROM mst_state;


SELECT * FROM txn_user_personal_info;
INSERT INTO txn_user_personal_info 
(usertype, first_name, last_name, gender, dob, email, city, state, country, national_id, nationality, status, added_by)
VALUES 
('Customer', 'Rahul', 'Verma', 'Male', '1990-07-07', 'rahul.verma@example.com', 1, 1, 1, 'Z123456789', 1, 'Active', 'Admin');

SET SQL_SAFE_UPDATES=0;

-- Update Customer Details
UPDATE txn_user_personal_info
SET 
    phone = '9998887776',
    state = 2,
    status = 'Inactive'
WHERE email = 'rahul.verma@example.com';

-- DQL (SELECT Queries)
--  SELECT
SELECT user_id, first_name, state, phone
FROM txn_user_personal_info;

-- Aliases
SELECT 
    user_id AS USER_ID,
    first_name AS NAME,
    state AS STATE_ID,
    phone AS PHONE_NO
FROM txn_user_personal_info;

-- WHERE , IN Condition  , ORDER BY
SELECT *
FROM txn_broker
WHERE broker_id in (1,5,10) order by broker_id  ;



-- AND , OR Condition
SELECT *
FROM txn_quote
WHERE vehicle_id = 5 AND (coverage_type = 'Comprehensive' OR premium_amount > 1200);

-- Backup Table

CREATE TABLE copy_user_personal_info AS
SELECT * FROM txn_user_personal_info;
SELECT * FROM copy_user_personal_info;

-- LIMIT and OFFSET

-- Limit With Offset
SELECT policy_id, policy_no, quote_id, status
FROM txn_policy
WHERE status = 'Active'
LIMIT 3 OFFSET 1;


-- GROUP BY and HAVING WITH ORDER BY
SELECT 
    state,
    status,
    COUNT(*) AS total_users
FROM 
    txn_user_personal_info
GROUP BY 
    state, status
HAVING 
    COUNT(*) > 5
ORDER BY 
    total_users DESC;

-- Join User with City
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    c.city_name,
    u.status
FROM txn_user_personal_info u
INNER JOIN mst_city c
    ON u.city = c.city_id
ORDER BY u.user_id;

-- Multiple Joins: User → Vehicle → Make → Model → Quote
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    q.quote_id,
    vm.model_desc AS model_name,
    vm.make_id,
    q.premium_amount
FROM txn_user_personal_info u
JOIN txn_quote q ON u.user_id = q.user_id
JOIN mst_vehicle_model vm ON vm.model_id = q.vehicle_id
ORDER BY u.user_id;

-- Aggregate Functions
-- User Vehicles Summary

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(q.quote_id) AS total_quotes,
    MAX(q.premium_amount) AS max_premium,
    MIN(q.premium_amount) AS min_premium,
    SUM(q.premium_amount) AS total_premium,
    AVG(q.premium_amount) AS avg_premium
FROM txn_user_personal_info u
JOIN txn_quote q ON u.user_id = q.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

-- Subqueries

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    (SELECT COUNT(*) 
     FROM txn_quote q 
     WHERE q.user_id = u.user_id) AS total_quotes,
    (SELECT SUM(q.premium_amount) 
     FROM txn_quote q 
     WHERE q.user_id = u.user_id) AS total_premium
FROM txn_user_personal_info u;

-- Stored Procedures

-- IN parameter
DELIMITER $$
CREATE PROCEDURE GetTotalPremium(IN uid INT)
BEGIN
    SELECT u.user_id, u.first_name, u.last_name,
           SUM(q.premium_amount) AS total_premium
    FROM txn_user_personal_info u
    JOIN txn_quote q ON u.user_id = q.user_id
    WHERE u.user_id = uid
    GROUP BY u.user_id, u.first_name, u.last_name;
END $$
DELIMITER ;

CALL GetTotalPremium(5);

-- IN and OUT parameter
DELIMITER $$
CREATE PROCEDURE GetQuoteCountOUT(IN uid INT, OUT quote_count INT)
BEGIN
    SELECT COUNT(*) INTO quote_count
    FROM txn_quote
    WHERE user_id = uid;
END $$
DELIMITER ;

CALL GetQuoteCountOUT(5, @count);
SELECT @count AS total_quotes;

-- Functions

DELIMITER $$
CREATE FUNCTION GetQuoteCount(uid INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE quote_count INT;
    SELECT COUNT(*) INTO quote_count
    FROM txn_quote
    WHERE user_id = uid;
    RETURN quote_count;
END $$
DELIMITER ;

SELECT GetQuoteCount(6) AS total_quotes;

-- Views

CREATE VIEW UserQuoteSummary AS
SELECT u.user_id, u.first_name, u.last_name,
       COUNT(q.quote_id) AS total_quotes,
       SUM(q.premium_amount) AS total_premium
FROM txn_user_personal_info u
LEFT JOIN txn_quote q ON u.user_id = q.user_id
GROUP BY u.user_id, u.first_name, u.last_name;

SELECT * FROM UserQuoteSummary;

-- Triggers

DELIMITER $$
CREATE TRIGGER UpdatePremiumOnQuoteChange
AFTER UPDATE ON txn_quote
FOR EACH ROW
BEGIN
    IF NEW.premium_amount < 5000 THEN
        UPDATE txn_quote
        SET premium_amount = 5000
        WHERE quote_id = NEW.quote_id;
    END IF;
END $$
DELIMITER ;

-- Test Trigger
UPDATE txn_quote
SET premium_amount = 3000
WHERE quote_id = 2;

SELECT * FROM txn_quote;

-- Shedule Event

DELIMITER $$
CREATE EVENT ev_update_expired_policies
ON SCHEDULE EVERY 10 MINUTE
STARTS '2025-09-26 00:00:00'
DO
BEGIN
    -- Update policy status to 'Expired' if expiry_date is less than today
    UPDATE txn_policy
    SET status = 'Expired'
    WHERE expiry_date < CURDATE() AND status = 'Active';
END $$
DELIMITER ;

-- Remember we needs to on the shedule
SET GLOBAL event_scheduler = ON;

-- index creation 
CREATE INDEX idx_policy_status ON txn_policy(status);

-- This will speed up queries 

SELECT *FROM txn_policy WHERE status = 'Active';

-- Creation of new user

create user 'vinith_s'@'local_host'identified by 'vinith@123';

-- whether user created or not 

select user,host from mysql.user;

-- Permission ( Grant , Revoke )

grant all privileges on *.* to 'vinith_s'@'local_host';

