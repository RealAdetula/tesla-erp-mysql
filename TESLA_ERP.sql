CREATE DATABASE Tesla; 
USE Tesla;

#product
CREATE TABLE Tesla_product(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
categories VARCHAR(50),
status_pr VARCHAR(50),
unit_pr DECIMAL(12,2),
Description_pr TEXT
);

ALTER TABLE Tesla_product 
MODIFY product_id INT AUTO_INCREMENT;

INSERT INTO Tesla_product (product_id, product_name, categories, status_pr, unit_pr, Description_pr)
VALUES
(1, 'Model 3', 'vehicle', 'active', 36990, 'Entry-level electric sedan'),
(2, 'Model Y', 'vehicle', 'active', 39990, 'Midsize electric SUV'),
(3, 'Model S', 'vehicle', 'active', 79990, 'Luxury electric sedan'),
(4, 'Model X', 'vehicle', 'active', 84990, 'Luxury electric SUV'),
(5, 'Cybertruck', 'vehicle', 'active', 69990, 'Electric pickup truck'),
(6, 'Powerwall 3', 'energy_storage', 'active', 14000, 'Home battery energy storage'),
(7, 'Solar Panels', 'solar', 'active', 22000, 'Residential solar panel system'),
(8, 'Solar Roof', 'solar', 'active', 30000, 'Solar roof tiles system'),
(9, 'Wall Connector', 'charging', 'active', 500, 'Home EV charging unit');

CREATE TABLE Tesla_non_product(
Tesla_np_iD INT AUTO_INCREMENT PRIMARY KEY,
non_product_name VARCHAR(50),
categories_np VARCHAR(50),
status_np VARCHAR(50),
Description_np TEXT
);

INSERT INTO Tesla_non_product(non_product_name, categories_np, status_np, Description_np)
VALUES
('Tesla App', 'software', 'active', 'Mobile control and monitoring app'),
('Autopilot', 'software', 'active', 'Driver assistance system'),
('Full Self Driving', 'software', 'active', 'Advanced autonomous driving feature'),
('Tesla Insurance', 'service', 'active', 'Vehicle insurance service'),
('Supercharger Network', 'infrastructure', 'active', 'Fast EV charging network'),
('Tesla Service', 'service', 'active', 'Vehicle maintenance and repair'),
('Firmware Updates', 'software', 'active', 'Over-the-air software updates'),
('Energy Monitoring App', 'software', 'active', 'Tracks energy usage'),
('Tesla Website', 'platform', 'active', 'Official Tesla web platform'),
('Tesla AI', 'technology', 'active', 'Artificial intelligence development'),
('Dojo Supercomputer', 'technology', 'active', 'AI training system'),
('Tesla Bot', 'robotics', 'active', 'Humanoid robot project'),
('Customer Support', 'service', 'active', 'User assistance services'),
('Charging Subscription', 'service', 'active', 'Subscription-based charging plan'),
('Fleet Management', 'software', 'active', 'Manage multiple Tesla vehicles'),
('Tesla API', 'developer_tools', 'active', 'Integration tools for developers'),
('Energy Services', 'service', 'active', 'Energy solutions and support');


CREATE TABLE Tesla_department(
Department_iD INT AUTO_INCREMENT PRIMARY KEY,
Department_name VARCHAR(50) NOT NULL,
Department_head VARCHAR(50) NOT NULL,
Department_location VARCHAR(50) NOT NULL,
Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Tesla_department(Department_name, Department_head, Department_location)
VALUES
('Engineering', 'Elon Musk', 'USA'),
('Energy', 'Drew Baglino', 'USA'),
('Sales', 'Troy Jones', 'Global'),
('Human Resources', 'Jane Doe', 'USA'),
('Customer Support', 'John Smith', 'Global'),
('AI & Autopilot', 'Ashok Elluswamy', 'USA'),
('Manufacturing', 'Tom Zhu', 'China'),
('Finance', 'Zach Kirkhorn', 'USA'),
('Legal', 'Todd Maron', 'USA'),
('IT', 'Mike Johnson', 'Global');


CREATE TABLE Tesla_department_product(
Tdp_iD  INT AUTO_INCREMENT PRIMARY KEY,
Department_iD INT NOT NULL,
product_id INT NOT NULL,
FOREIGN KEY (Department_iD) REFERENCES Tesla_department(Department_iD),
FOREIGN KEY (product_id) REFERENCES Tesla_product(product_id)
);

INSERT INTO Tesla_department_product(Department_iD, product_id)
VALUES
(1, 1), -- Engineering → Model 3
(1, 2), -- Engineering → Model Y
(1, 3), -- Engineering → Model S
(1, 4), -- Engineering → Model X
(1, 5), -- Engineering → Cybertruck

(2, 6), -- Energy → Powerwall
(2, 7), -- Energy → Solar Panels
(2, 8), -- Energy → Solar Roof

(3, 1), -- Sales → Model 3
(3, 2), -- Sales → Model Y
(3, 3), -- Sales → Model S
(3, 4), -- Sales → Model X
(3, 5), -- Sales → Cybertruck

(3, 9); -- Sales → Wall Connector

CREATE TABLE Tesla_department_non_product(
Tdnp_id INT AUTO_INCREMENT PRIMARY KEY,
Tesla_np_iD INT,
Department_iD INT NOT NULL,
FOREIGN KEY (Department_iD) REFERENCES Tesla_department(Department_iD),
FOREIGN KEY (Tesla_np_iD) REFERENCES Tesla_non_product(Tesla_np_iD)
);

INSERT INTO Tesla_department_non_product(Tesla_np_iD, Department_iD)
VALUES
(1, 1), -- Tesla App → Engineering
(2, 1), -- Autopilot → Engineering
(3, 6), -- Full Self Driving → AI & Autopilot
(4, 8), -- Tesla Insurance → Finance
(5, 3), -- Supercharger Network → Sales
(6, 4), -- Tesla Service → Customer Support
(7, 9), -- Firmware Updates → IT
(8, 2), -- Energy Monitoring App → Energy
(9, 3), -- Tesla Website → Sales
(10, 6), -- Tesla AI → AI & Autopilot
(11, 6), -- Dojo → AI & Autopilot
(12, 7), -- Tesla Bot → Manufacturing
(13, 4), -- Customer Support → Customer Support
(14, 3), -- Charging Subscription → Sales
(15, 9), -- Fleet Management → IT
(16, 9), -- Tesla API → IT
(17, 2); -- Energy Services → Energy

CREATE TABLE Tesla_Employee(
Tesla_Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
Employee_first_name VARCHAR(50) NOT NULL,
Employee_Middlename VARCHAR(50) NULL,
Employee_last_name VARCHAR(50) NOT NULL,
Employee_Email VARCHAR(100) UNIQUE NOT NULL,
Employee_phone_number VARCHAR(50),
Hire_date DATE,
Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Tesla_Employee(
Employee_first_name, Employee_Middlename, Employee_last_name, Employee_Email, Hire_date
)
VALUES
('John', NULL, 'Doe', 'john.doe@tesla.com', '2022-01-15'),
('Jane', 'A', 'Smith', 'jane.smith@tesla.com', '2023-03-10'),
('Michael', NULL, 'Brown', 'michael.brown@tesla.com', '2021-07-22'),
('Emily', 'R', 'Davis', 'emily.davis@tesla.com', '2024-02-01'),
('David', NULL, 'Wilson', 'david.wilson@tesla.com', '2020-11-30'),
('Sarah', 'L', 'Johnson', 'sarah.johnson@tesla.com', '2022-06-18'),
('Daniel', NULL, 'Martins', 'daniel.martins@tesla.com', '2023-08-09'),
('Olivia', 'K', 'Taylor', 'olivia.taylor@tesla.com', '2021-03-27');

CREATE TABLE Employee_Department(
Employee_Department_iD INT AUTO_INCREMENT PRIMARY KEY,
Tesla_Employee_ID INT,
Department_iD INT,
Employee_role VARCHAR(50),

FOREIGN KEY (Tesla_Employee_ID) REFERENCES Tesla_Employee(Tesla_Employee_ID),
FOREIGN KEY (Department_iD) REFERENCES Tesla_department(Department_iD)
);

INSERT INTO Employee_Department(Tesla_Employee_ID, Department_iD, Employee_role)
VALUES
(1, 1, 'Engineer'),
(2, 3, 'Sales Manager'),
(3, 1, 'Senior Engineer'),
(4, 4, 'HR Specialist'),
(5, 2, 'Energy Analyst'),
(6, 3, 'Sales Executive'),
(7, 9, 'IT Support'),
(8, 8, 'Finance Officer');


CREATE TABLE CUSTOMERS(
Customer_id INT AUTO_INCREMENT PRIMARY KEY,
Customer_firstname VARCHAR(50) NOT NULL,
Customer_lastname VARCHAR(50) NOT NULL,
Customer_email VARCHAR(100) UNIQUE NOT NULL,
Customer_phone VARCHAR(20) UNIQUE NOT NULL,
Customer_address VARCHAR(100),
Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE CUSTOMERS_LOCATION(
CUSTOMER_LOCATION_ID INT AUTO_INCREMENT PRIMARY KEY,
Customer_id INT,
CUSTOMER_LOCATION VARCHAR(100) NOT NULL,
CUSTOMER_LOCATION_LANDMARK VARCHAR(100) NOT NULL,
CUSTOMER_POSTALCODE VARCHAR(50) NOT NULL,
FOREIGN KEY (Customer_id) REFERENCES CUSTOMERS(Customer_id)
);

CREATE TABLE CUSTOMERS_WORK_WITH_DEP(
CWWD_ID INT AUTO_INCREMENT PRIMARY KEY,
Customer_id INT,
Department_iD INT,
FOREIGN KEY (Customer_id) REFERENCES CUSTOMERS(Customer_id),
FOREIGN KEY (Department_iD) REFERENCES Tesla_department(Department_iD)
);

CREATE TABLE CUSTOMER_Product(
CUSTOMER_Product_id INT AUTO_INCREMENT PRIMARY KEY,
Customer_id INT,
product_id INT,
purchase_date DATE,
FOREIGN KEY (Customer_id) REFERENCES CUSTOMERS(Customer_id),
FOREIGN KEY (product_id) REFERENCES Tesla_product(product_id)
);

CREATE TABLE CUSTOMER_Non_Product(
CUSTOMER_Non_Product INT AUTO_INCREMENT PRIMARY KEY,
Customer_id INT,
Tesla_np_iD  INT,
purchase_date DATE,
FOREIGN KEY (Customer_id) REFERENCES CUSTOMERS(Customer_id),
FOREIGN KEY (Tesla_np_iD) REFERENCES Tesla_non_product(Tesla_np_iD)
);

CREATE TABLE INVENTORY(
Tesla_inventory_id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
Quality_available INT DEFAULT 0,
Reorder_level INT  DEFAULT 5,
Last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (product_id) REFERENCES Tesla_product(product_id)
);

CREATE TABLE Supplier(
Supplier_id INT AUTO_INCREMENT PRIMARY KEY,
Supplier_name VARCHAR(100),
Supplier_contact_name VARCHAR(100),
Supplier_phone VARCHAR(20),
Supplier_address VARCHAR(150),
Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Supplier_product(
Supplier_product INT AUTO_INCREMENT PRIMARY KEY,
Supplier_id INT,
product_id INT,
Supplier_price DECIMAL(10,2),
Supplier_date DATE,
FOREIGN KEY (Supplier_id) REFERENCES Supplier(Supplier_id),
FOREIGN KEY (product_id) REFERENCES Tesla_product(product_id)
);

CREATE TABLE Tesla_production_order(
production_id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
Quantity INT,
Start_date DATE,
End_date DATE,
Current_Status VARCHAR(50),  -- in_progress, completed, planned
FOREIGN KEY (product_id) REFERENCES Tesla_product(product_id)
);

CREATE TABLE Tesla_Assembly_line(
Tesla_Assembly_line INT AUTO_INCREMENT PRIMARY KEY,
production_id INT,
stage_name VARCHAR(50),
Assembly_Status VARCHAR(50), -- in_progress, completed, planned
Last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (production_id) REFERENCES Tesla_production_order(production_id)
);

CREATE TABLE Tesla_sales_order(
Order_ID INT AUTO_INCREMENT PRIMARY KEY,
Customer_id INT, 
order_date DATE,
status VARCHAR(50), -- pending, paid, shipped
FOREIGN KEY (Customer_id) REFERENCES CUSTOMERS(Customer_id)
);

CREATE TABLE Tesla_sales_order_item(
Item_ID INT AUTO_INCREMENT PRIMARY KEY,
Order_ID INT,
product_id INT,
quantity INT,
price DECIMAL(12,2),
FOREIGN KEY (Order_ID) REFERENCES Tesla_sales_order(Order_ID),
FOREIGN KEY (product_id) REFERENCES Tesla_product(product_id)
);

CREATE TABLE Tesla_delivery(
Delivery_ID INT AUTO_INCREMENT PRIMARY KEY,
Order_ID INT,
delivery_date DATE,
delivery_status VARCHAR(50), -- pending, shipped, delivered
delivery_address VARCHAR(150),
FOREIGN KEY (Order_ID) REFERENCES Tesla_sales_order(Order_ID)
);

CREATE TABLE Tesla_service_record(
Service_ID INT AUTO_INCREMENT PRIMARY KEY,
Customer_id INT,
product_id INT,
service_date DATE,
issue_description TEXT,
service_status VARCHAR(50), -- open, in_progress, resolved
FOREIGN KEY (Customer_id) REFERENCES CUSTOMERS(Customer_id),
FOREIGN KEY (product_id) REFERENCES Tesla_product(product_id)
);

CREATE TABLE Tesla_quality_check(
QC_ID INT AUTO_INCREMENT PRIMARY KEY,
Production_ID INT,
check_date DATE,
status VARCHAR(50), -- passed, failed
remarks TEXT,
FOREIGN KEY (Production_ID) REFERENCES Tesla_production_order(Production_ID)
);

CREATE TABLE Tesla_defect_report(
Defect_ID INT AUTO_INCREMENT PRIMARY KEY,
QC_ID INT,
defect_description TEXT,
severity VARCHAR(50), -- low, medium, high
reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (QC_ID) REFERENCES Tesla_quality_check(QC_ID)
);




INSERT INTO CUSTOMERS(
Customer_firstname, Customer_lastname, Customer_email, Customer_phone, Customer_address
)
VALUES
('David', 'Ade', 'david.ade@email.com', '08012345678', 'Lagos, Nigeria'),
('Mary', 'Okafor', 'mary.okafor@email.com', '08087654321', 'Abuja, Nigeria'),
('John', 'Bello', 'john.bello@email.com', '08123456789', 'Port Harcourt, Nigeria'),
('Sarah', 'Ibrahim', 'sarah.ibrahim@email.com', '08198765432', 'Kano, Nigeria'),
('Daniel', 'Eze', 'daniel.eze@email.com', '07012345678', 'Enugu, Nigeria');

INSERT INTO CUSTOMERS_LOCATION(Customer_id, CUSTOMER_LOCATION, CUSTOMER_LOCATION_LANDMARK, CUSTOMER_POSTALCODE)
VALUES
(1, 'Lagos', 'Ikeja City Mall', '100001'),
(2, 'Abuja', 'Wuse Market', '900001'),
(3, 'Port Harcourt', 'GRA Junction', '500001'),
(4, 'Kano', 'Sabon Gari Market', '700001'),
(5, 'Enugu', 'Independence Layout', '400001');

INSERT INTO CUSTOMERS_WORK_WITH_DEP(Customer_id, Department_iD)
VALUES
(1, 3),
(2, 3),
(3, 5),
(4, 4),
(5, 2);

INSERT INTO CUSTOMER_Product(Customer_id, product_id, purchase_date)
VALUES
(1, 1, '2025-05-01'),
(1, 9, '2025-05-02'),
(2, 2, '2025-05-03'),
(3, 5, '2025-05-04'),
(4, 3, '2025-05-05'),
(5, 6, '2025-05-06');

INSERT INTO CUSTOMER_Non_Product(Customer_id, Tesla_np_iD, purchase_date)
VALUES
(1, 1, '2025-05-01'),
(2, 4, '2025-05-02'),
(3, 2, '2025-05-03'),
(4, 6, '2025-05-04'),
(5, 14, '2025-05-05');

INSERT INTO INVENTORY(product_id, Quality_available, Reorder_level)
VALUES
(1, 50, 10),
(2, 40, 10),
(3, 20, 5),
(4, 15, 5),
(5, 10, 3),
(6, 30, 8),
(7, 25, 7),
(8, 12, 4),
(9, 100, 20);

INSERT INTO Supplier(Supplier_name, Supplier_contact_name, Supplier_phone, Supplier_address)
VALUES
('Panasonic Energy', 'Kenji Sato', '+81312345678', 'Japan'),
('LG Energy Solution', 'Min Lee', '+82212345678', 'South Korea'),
('CATL', 'Li Wei', '+8659112345678', 'China'),
('SolarTech Ltd', 'James Carter', '+14081234567', 'USA'),
('ChargePoint Inc', 'Emily Stone', '+14151234567', 'USA');

INSERT INTO Supplier_product(Supplier_id, product_id, Supplier_price, Supplier_date)
VALUES
(1, 6, 12000, '2025-01-10'),
(2, 1, 30000, '2025-02-01'),
(3, 2, 32000, '2025-02-05'),
(4, 7, 18000, '2025-03-12'),
(4, 8, 25000, '2025-03-15'),
(5, 9, 400, '2025-04-01');

INSERT INTO Tesla_production_order(product_id, Quantity, Start_date, Current_Status)
VALUES
(1, 100, '2025-05-01', 'in_progress'),
(2, 80, '2025-05-03', 'planned'),
(3, 50, '2025-05-05', 'completed');

INSERT INTO Tesla_Assembly_line(production_id, stage_name, Assembly_Status)
VALUES
(1, 'Chassis Assembly', 'completed'),
(1, 'Battery Installation', 'in_progress'),
(2, 'Frame Build', 'planned'),
(3, 'Final Inspection', 'completed');

INSERT INTO Tesla_sales_order(Customer_id, order_date, status)
VALUES
(1, '2025-05-10', 'paid'),
(2, '2025-05-11', 'pending'),
(3, '2025-05-12', 'shipped');

INSERT INTO Tesla_sales_order_item(Order_ID, product_id, quantity, price)
VALUES
(1, 1, 1, 36990),
(1, 9, 1, 500),
(2, 2, 1, 39990),
(3, 5, 1, 69990);

INSERT INTO Tesla_delivery(Order_ID, delivery_date, delivery_status, delivery_address)
VALUES
(1, '2025-05-15', 'delivered', 'Lagos, Nigeria'),
(2, NULL, 'pending', 'Abuja, Nigeria'),
(3, '2025-05-18', 'shipped', 'Port Harcourt, Nigeria');

INSERT INTO Tesla_service_record(Customer_id, product_id, service_date, issue_description, service_status)
VALUES
(1, 1, '2025-06-01', 'Battery issue', 'resolved'),
(2, 2, '2025-06-05', 'Software update needed', 'in_progress'),
(3, 5, '2025-06-10', 'Charging problem', 'open');

INSERT INTO Tesla_quality_check(Production_ID, check_date, status, remarks)
VALUES
(1, '2025-05-06', 'passed', 'All good'),
(2, '2025-05-07', 'failed', 'Minor defects found'),
(3, '2025-05-08', 'passed', 'Meets standards');

INSERT INTO Tesla_defect_report(QC_ID, defect_description, severity)
VALUES
(2, 'Paint scratch', 'low'),
(2, 'Battery alignment issue', 'high');

