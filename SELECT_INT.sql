-- Employees + Departments
SELECT 
e.Employee_first_name,
e.Employee_last_name,
d.Department_name,
ed.Employee_role
FROM Employee_Department ed
JOIN Tesla_Employee e ON ed.Tesla_Employee_ID = e.Tesla_Employee_ID
JOIN Tesla_department d ON ed.Department_iD = d.Department_iD;

-- Departments + Products
SELECT 
d.Department_name,
p.product_name
FROM Tesla_department_product tdp
JOIN Tesla_department d ON tdp.Department_iD = d.Department_iD
JOIN Tesla_product p ON tdp.product_id = p.product_id;

-- Departments + Non-Products
SELECT 
d.Department_name,
np.non_product_name
FROM Tesla_department_non_product tdnp
JOIN Tesla_department d ON tdnp.Department_iD = d.Department_iD
JOIN Tesla_non_product np ON tdnp.Tesla_np_iD = np.Tesla_np_iD;

-- Customers + Products Purchased
SELECT 
c.Customer_firstname,
c.Customer_lastname,
p.product_name,
cp.purchase_date
FROM CUSTOMER_Product cp
JOIN CUSTOMERS c ON cp.Customer_id = c.Customer_id
JOIN Tesla_product p ON cp.product_id = p.product_id;

-- Customers + Non-Products
SELECT 
c.Customer_firstname,
c.Customer_lastname,
np.non_product_name,
cnp.purchase_date
FROM CUSTOMER_Non_Product cnp
JOIN CUSTOMERS c ON cnp.Customer_id = c.Customer_id
JOIN Tesla_non_product np ON cnp.Tesla_np_iD = np.Tesla_np_iD;

-- Inventory Status
SELECT 
p.product_name,
i.Quality_available,
i.Reorder_level
FROM INVENTORY i
JOIN Tesla_product p ON i.product_id = p.product_id;

-- Supplier + Products
SELECT 
s.Supplier_name,
p.product_name,
sp.Supplier_price
FROM Supplier_product sp
JOIN Supplier s ON sp.Supplier_id = s.Supplier_id
JOIN Tesla_product p ON sp.product_id = p.product_id;

-- Production + Product
SELECT 
p.product_name,
po.Quantity,
po.Current_Status
FROM Tesla_production_order po
JOIN Tesla_product p ON po.product_id = p.product_id;

-- Assembly Line Status
SELECT 
p.product_name,
al.stage_name,
al.Assembly_Status
FROM Tesla_Assembly_line al
JOIN Tesla_production_order po ON al.production_id = po.production_id
JOIN Tesla_product p ON po.product_id = p.product_id;

-- Sales Order + Customer + Product
SELECT 
c.Customer_firstname,
p.product_name,
so.status,
soi.quantity
FROM Tesla_sales_order so
JOIN CUSTOMERS c ON so.Customer_id = c.Customer_id
JOIN Tesla_sales_order_item soi ON so.Order_ID = soi.Order_ID
JOIN Tesla_product p ON soi.product_id = p.product_id;

-- Delivery Status
SELECT 
c.Customer_firstname,
so.Order_ID,
d.delivery_status,
d.delivery_address
FROM Tesla_delivery d
JOIN Tesla_sales_order so ON d.Order_ID = so.Order_ID
JOIN CUSTOMERS c ON so.Customer_id = c.Customer_id;

-- Service Records
SELECT 
c.Customer_firstname,
p.product_name,
sr.issue_description,
sr.service_status
FROM Tesla_service_record sr
JOIN CUSTOMERS c ON sr.Customer_id = c.Customer_id
JOIN Tesla_product p ON sr.product_id = p.product_id;

-- Quality Check + Product
SELECT 
p.product_name,
qc.status,
qc.remarks
FROM Tesla_quality_check qc
JOIN Tesla_production_order po ON qc.Production_ID = po.production_id
JOIN Tesla_product p ON po.product_id = p.product_id;

-- Defect Reports
SELECT 
p.product_name,
dr.defect_description,
dr.severity
FROM Tesla_defect_report dr
JOIN Tesla_quality_check qc ON dr.QC_ID = qc.QC_ID
JOIN Tesla_production_order po ON qc.Production_ID = po.production_id
JOIN Tesla_product p ON po.product_id = p.product_id;




SELECT Employee_Email FROM Tesla_Employee WHERE Employee_first_name = 'Daniel';