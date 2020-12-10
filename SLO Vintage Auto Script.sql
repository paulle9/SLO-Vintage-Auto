--PAUL LE, COLIN MCCLOSKEY, CAITLIN NGUYEN
--BUS 393-02
--SLO AUTO VINTAGE FINAL PROJECT



-- Drop tables
DROP TABLE CUSTOMER CASCADE CONSTRAINTS PURGE;
DROP TABLE PREFERENCES CASCADE CONSTRAINTS PURGE;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS PURGE;
DROP TABLE SERVICE CASCADE CONSTRAINTS PURGE;
DROP TABLE PART CASCADE CONSTRAINTS PURGE;
DROP TABLE SALES_VEHICLE CASCADE CONSTRAINTS PURGE;
DROP TABLE SERVICE_VEHICLE CASCADE CONSTRAINTS PURGE;
DROP TABLE SALES_INVOICE CASCADE CONSTRAINTS PURGE;
DROP TABLE PURCHASE_INVOICE CASCADE CONSTRAINTS PURGE;
DROP TABLE SERVICE_INVOICE CASCADE CONSTRAINTS PURGE;
DROP TABLE SELLER CASCADE CONSTRAINTS PURGE;



--MEMO 1


CREATE TABLE CUSTOMER
(
    Customer_ID     NUMBER(9)       CONSTRAINT cus_cid_pk PRIMARY KEY,
    First_Name      VARCHAR2(25)    NOT NULL,
    Last_Name       VARCHAR2(25)    NOT NULL,
    Street          VARCHAR2(25)    NOT NULL,
    City            VARCHAR2(25)    NOT NULL,
    CState          VARCHAR2(25)    DEFAULT ('California'),
    Zip             VARCHAR2(9)     NOT NULL,
    Phone           VARCHAR2(11)    NOT NULL
                                    CONSTRAINT cus_ph_uk UNIQUE,
    Email           VARCHAR2(30)    NOT NULL
                                    CONSTRAINT cus_em_uk UNIQUE
);
 
 


CREATE TABLE PREFERENCES
(
    Preference_ID       NUMBER(9)       CONSTRAINT pre_pid_pk PRIMARY KEY,
    Make                VARCHAR2(25)    NOT NULL,
    PModel              VARCHAR2(25)    NOT NULL,
    PYear               NUMBER(4),
    PDescription        VARCHAR2(393),
    Start_Date          DATE            DEFAULT SYSDATE,
    End_Date            DATE,
    Customer_ID         NUMBER(9)       NOT NULL
                                        CONSTRAINT pre_cid_fk REFERENCES CUSTOMER(Customer_ID),
    CONSTRAINT pre_sd_ed_ck CHECK(Start_Date<End_Date)
);
 
 


INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, Zip, Phone, Email)
VALUES(694201337, 'John', 'Smith', '1 Santa Rosa', 'San Luis Obispo', '93469', '8003333333', 'jsmith@hotmail.com');
 

INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, Zip, Phone, Email)
VALUES(694201338, 'Ethan', 'Rapp', '1 Food Science Way', 'Granite Bay', '93469', '4152098884', 'erapp@calpoly.edu');


INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, Zip, Phone, Email)
VALUES(694201339, 'Juan', 'Toskana', '1 Golden State Dr', 'San Francisco', '2933023', '95959595959', 'joskanabball@nba.com');

INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, Zip, Phone, Email)
VALUES(694201340, 'Monta', 'Ellis', '1 Non All Star Ave', 'San Francisco', '8472937', '88493746432', 'whypass@nba.com');

INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, Zip, Phone, Email)
VALUES(694201341, 'Derek', 'Fisher', '1 Paul Jersey Pl', 'Los Angeles', '4729465', '46742684325', 'bestlakerever@nba.com');


INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, CState, Zip, Phone, Email)
VALUES(694204364, 'Shareef', 'Abdur-Rahim', '1 Zuhayr Dr', 'Memphis', 'Tennessee','8374252', '93859328423', 'gritandgrind@grizz.com');

INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, CState, Zip, Phone, Email)
VALUES(352264875, 'Anderson', 'Varejao', '1 Bleacher Report Dr', 'Cleaveland', 'Ohio','8374232', '65459328425', 'wadefouledme@cavs.com');



INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, CState, Zip, Phone, Email)
VALUES(352263275, 'Michaek', 'Kidd-Gilchrist', '1 Jump Shot Dr', 'Charlotte', 'North Carolina','6327232', '36439328425', 'imbetterthanad@bcats');

INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, CState, Zip, Phone, Email)
VALUES(352232275, 'Marreese', 'Speights', '1 Lump Head Dr', 'Orlando', 'Florida','6327342', '33429328425', 'randomlycanshoot@china.com');

INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, CState, Zip, Phone, Email)
VALUES(352223275, 'Lance', 'Stephenson', '1 Ear Blow Dr', 'Indiana City', 'Indiana','3252342', '34235328425', 'makeemdance@pacers.com');

INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, Zip, Phone, Email)
VALUES(123456790, 'Grace', 'Ryan', '1 Santa Rosa', 'San Luis Obispo', '93469', '8001234568', 'gryan@gmail.com');

INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, Zip, Phone, Email)
VALUES(123456789, 'Greg', 'Kim', '1 Santa Rosa', 'San Luis Obispo', '93469', '8001234567', 'gkim@gmail.com');

INSERT INTO CUSTOMER(Customer_ID, First_Name, Last_Name, Street, City, Zip, Phone, Email)
VALUES(123456791, 'Abel', 'Le', '1 Santa Rosa', 'San Luis Obispo', '93469', '8001234569', 'ale@gmail.com');



INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription, End_Date, Customer_ID)
VALUES(352224215, 'Toyota', 'Camry', 'Silver. Used.', '09/17/2021',694201338);

INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription, End_Date,Customer_ID)
VALUES(352224525, 'Ford', 'Food', 'Yummy.', '08/27/2021',694201338);

INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription, End_Date, Customer_ID)
VALUES(352224547, 'Honda', 'Mother', 'Cant cook.','02/27/2021' ,694201338);

INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription, Start_Date, End_Date, Customer_ID)
VALUES(352222347, 'Ford', 'Tank', 'Packs a punch.', '09/07/2016','01/23/2019', 694204364);


INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription, Start_Date, End_Date,Customer_ID)
VALUES(352267347, 'BMW', 'Target', 'Precise.', '09/02/2016','04/02/2020', 694204364);

INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription, Start_Date, End_Date,Customer_ID)
VALUES(352214525, 'Toyota', 'Boogie', 'Great for Dances.', '09/05/2016','03/21/2018', 352223275);

INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription, Start_Date, End_Date,Customer_ID)
VALUES(359634525, 'Honda', 'Tapatio', 'Hot.', '07/07/1999','08/17/2016', 694201339);
 
INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription, Start_Date,End_Date, Customer_ID)
VALUES(694201340, 'Ford', 'Focus', 'Black.', '11/20/2019','11/07/2020', 694201341);
 
INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription, Start_date, End_Date, Customer_ID)
VALUES(383124995, 'Porsche', 'Panamera', 'I have no selfrespect.','03/05/2018','06/28/2021', 352223275);
 
 
INSERT INTO PREFERENCES(Preference_ID, Make, PModel, PDescription,Start_date, End_Date, Customer_ID)
VALUES(383124215, 'Porsche', 'Taycan', 'Yellowish.','03/08/2016','04/02/2019', 352223275);
 

 
CREATE OR REPLACE VIEW task_1_objective_4a
    AS SELECT First_Name, Last_Name, Street, City, CState, Zip, Phone, Email
    FROM CUSTOMER
    ORDER BY Last_Name;
 

CREATE OR REPLACE VIEW task_1_objective_4b
    AS SELECT c.First_Name, c.Last_Name, c.Phone, p.Make, p.PModel, p.Start_Date, p.End_Date, p.pdescription
    FROM CUSTOMER c JOIN PREFERENCES p
    ON (c.Customer_ID = p.Customer_ID);
 

CREATE OR REPLACE VIEW task_1_objective_4c
    AS SELECT c.First_Name, c.Last_Name, c.Phone, p.Make, p.PModel, p.Start_Date, p.End_Date, NVL(p.pdescription, 'No Preference') AS "Description"
    FROM CUSTOMER c LEFT OUTER JOIN PREFERENCES p
    ON (c.Customer_ID = p.Customer_ID);
 
 -- MEMO 2

CREATE TABLE EMPLOYEE
(
    employeeID      NUMBER(4)       CONSTRAINT emp_empid_pk PRIMARY KEY,
    MANAGERID       NUMBER(4)       CONSTRAINT emp_rid_fk REFERENCES EMPLOYEE(employeeID),
    first_name      VARCHAR2(20),
    last_name       VARCHAR2(20)    NOT NULL,
    emp_address     VARCHAR2(40),
    emp_city        VARCHAR2(20),
    emp_state       VARCHAR2(2)    DEFAULT 'CA',
    emp_zip         VARCHAR2(20),
    personal_phone  VARCHAR2(12)    CONSTRAINT emp_pp_uk UNIQUE,
    emp_email       VARCHAR2(20)    CONSTRAINT emp_em_uk UNIQUE,
    date_hired      DATE,
    emp_title       VARCHAR2(20),
    comm_pct        NUMBER(4,2)       CONSTRAINT emp_cp_ck CHECK (comm_pct BETWEEN 0.20 AND 0.30),
    emp_type        CHAR(2)         CONSTRAINT emp_et_ck CHECK (emp_type IN('SA', 'MA', 'SE')),
    CONSTRAINT emp_ck 
    CHECK(
    (emp_type = 'SA' AND comm_pct IS NOT NULL)
    OR (emp_type = 'MA' AND comm_pct IS NULL)
    OR (emp_type = 'SE' AND comm_pct IS NULL ))
);
 
INSERT INTO EMPLOYEE
VALUES (1000, NULL, 'Larry', 'Margaria', '123 Grand Dr', 'Aweston', 'TX', '62432', '805.345.2345', 'emp1000@calpoly.edu', '01/01/2014', 'Owner', NULL,  'MA');
 
 
INSERT INTO EMPLOYEE
VALUES (1001, 1000, 'Jim', 'Kaney', '124 Grand Dr', 'Votington', 'PA', '62433', '805.345.2346', 'emp1001@calpoly.edu', '01/07/2014', 'Accounting Manager', NULL,  'MA');
 
 
 
 
 
INSERT INTO EMPLOYEE
VALUES (1002, 1000, 'Norm', 'Allen', '125 Grand Dr', 'Zombieland', 'FL', '62434', '805.345.2347', 'emp1002@calpoly.edu', '03/07/2014', 'Service Manager', NULL,  'MA');
 
 
 
INSERT INTO EMPLOYEE 
VALUES (1003, 1000, 'Mary', 'Long','7986 Dash Ave', 'Los Angeles', 'CA','23487', '805.385.4435', 'emp1003@calpoly.edu', '07/12/2014', 'Sales Manager', 0.25, 'SA');
 
 
 
INSERT INTO EMPLOYEE

VALUES (1004, 1001, 'Steve', 'Euro', '127 Grand Dr', 'Bakersfield', 'GA', '62436', '805.345.2349', 'emp1004@calpoly.edu', '05/07/2014', 'Cashier', NULL, NULL);
 
 
INSERT INTO EMPLOYEE
VALUES (1005, 1002, 'Alan', 'Wrench', '129 Stand Dr', 'King City', 'OH', '62437', '805.345.2359', 'emp1005@calpoly.edu', '06/07/2014', 'Service Worker', NULL,  'SE');
 
 
INSERT INTO EMPLOYEE 
VALUES (1006, 1003, 'Adam', 'Packer','7926 Dash Ave', 'Motown', 'CO','23437', '805.385.3235', 'emp1006@calpoly.edu', '09/12/2014', 'Salesperson', 0.22, 'SA');
 
 
 
INSERT INTO EMPLOYEE 
VALUES (1007, 1001, 'Alice', 'Credit','943 Round Ct', 'San Jose', 'CA', '92348', '805.567.2345', 'emp1007@calpoly.edu', '02/03/2015','Bookkeeper', NULL,  NULL);
 
 
INSERT INTO EMPLOYEE
VALUES (1008, 1002, 'Woody', 'Apple','348 Quail Ct', 'Austin', 'TX', '23489', '452.345.2345', 'emp1008@calpoly.edu','06/10/2014', 'Service Worker', NULL, 'SE');
 
INSERT INTO EMPLOYEE
VALUES (1009, 1003, 'Larry', 'Jones','234 Dove Dr', 'Houston', 'TX', '23498', '597.157.2345', 'emp1009@calpoly.edu','04/13/2014', 'Salesperson', 0.24, 'SA');
 
 
INSERT INTO EMPLOYEE (employeeID, managerID, first_name, last_name, emp_address, emp_city, emp_zip, personal_phone, emp_email, date_hired, emp_title, comm_pct, emp_type)
VALUES (1010,1008,'Sherry', 'Sophomore','348 Raven Ave', 'Alameda', '89034', '805.345.2527', 'emp1010@calpoly.edu','09/25/2014', 'Intern', NULL,  NULL);
 
CREATE OR REPLACE VIEW task2a
AS SELECT first_name, last_name, personal_phone, emp_email
FROM employee
ORDER BY last_name;
 
CREATE OR REPLACE VIEW task2_4b
AS SELECT m.first_name || ' ' || m.last_name AS "Manager", m.emp_title AS "Title", r.first_name|| ' ' || r.last_name AS "Reportee", r.emp_title AS "Reportee Title"
FROM employee m JOIN employee r
ON(r.managerID = m.employeeID)
ORDER BY m.last_name;

--MEMO 3

CREATE TABLE SERVICE
(
    serviceCode         VARCHAR2(25)            CONSTRAINT ser_sc_pk PRIMARY KEY,
    serviceDescription  VARCHAR2(25)            NOT NULL,
    serviceCost         NUMBER(9,2)             NOT NULL
                                                CONSTRAINT ser_cos_ck CHECK(serviceCost > 0),
    price               NUMBER(9,2)             NOT NULL
                                                CONSTRAINT ser_pr_ck CHECK(price > 0),
    serviceMonth        NUMBER(3)               CONSTRAINT ser_mo_ck CHECK(serviceMonth > 0),
    mileage             NUMBER(9)               CONSTRAINT ser_mi_ck CHECK(mileage > 0)
);
 
 
 
CREATE TABLE PART
(
    partCode         VARCHAR2(25)            CONSTRAINT par_pc_pk PRIMARY KEY,
    partDescription  VARCHAR2(25)            NOT NULL,
    partCost         NUMBER(9,2)             NOT NULL
                                             CONSTRAINT par_cos_ck CHECK(partCost > 0),
    price            NUMBER(9,2)             NOT NULL
                                             CONSTRAINT par_pr_ck CHECK(price > 0)
);
 
 
 
INSERT INTO SERVICE
VALUES ('OILCHG', 'Oil Change', 9.95, 10.95, 6, 6000);
 
INSERT INTO SERVICE
VALUES ('MULTIPOINTINSP', 'Multi-Point Inspection', 29.95, 59.95, 6, 6000);
 
INSERT INTO SERVICE
VALUES('FLUIDS','Fluid Replacement', 29.95, 49.96, 30, 30000);
 
INSERT INTO SERVICE
VALUES('TIREROTATE','Tire Rotation', 6.95, 9.95, 12, 12000);
 
 
 
INSERT INTO PART
VALUES ('OILFILTER', 'Oil Filter', 9.95, 11.95);
 
INSERT INTO PART
VALUES ('WINSHIELDFLUID', 'Windshield fluid', 2.96, 4.95);
 
INSERT INTO PART
VALUES ('AIRFILTER', 'Air Filter', 3.95, 8.95);
 
INSERT INTO PART
VALUES ('SPARKPLUG4', 'Spark Plug Set (4)', 9.95, 19.95);
 
 
CREATE OR REPLACE VIEW task3_4a
AS SELECT serviceCode, serviceDescription, price, serviceMonth, mileage
FROM SERVICE
ORDER BY serviceCode;
 

CREATE OR REPLACE VIEW task3_4b
AS SELECT partCode, partDescription, partCost, price
FROM PART
ORDER BY partCode;

-- MEMO 4

CREATE TABLE SALES_VEHICLE
(
    VIN          NUMBER(9)       CONSTRAINT sv_vin_pk PRIMARY KEY,
    exteriorColor VARCHAR2(25)      NOT NULL,
    salesTrim          VARCHAR2(25) NOT NULL,
    salesCondition  VARCHAR2(25)       NOT NULL,
    status          VARCHAR2(25)        NOT NULL,
    purchasePrice   NUMBER(9,2)     CONSTRAINT sv_pp_ck CHECK(purchasePrice > 0),
    listPrice       NUMBER(9,2)     CONSTRAINT sv_lp_ck CHECK(listPrice > 0),
    VYear       NUMBER(4)    NOT NULL,
    VMake       VARCHAR2(25)  NOT NULL,
    VModel      VARCHAR2(25) NOT NULL,
    VMileage    NUMBER(9)    CONSTRAINT sv_vm_ck CHECK(VMileage > 0),
    vehicleType CHAR(2)        CONSTRAINT sv_svt_ck CHECK(vehicleType = 'SA')    
);
 
CREATE TABLE SERVICE_VEHICLE
(
    VIN          NUMBER(9)       CONSTRAINT sev_vin_pk PRIMARY KEY,
    VYear       NUMBER(4)    NOT NULL,
    VMake       VARCHAR2(25)  NOT NULL,
    VModel      VARCHAR2(25) NOT NULL,
    VMileage    NUMBER(9)    CONSTRAINT sev_vm_ck CHECK(VMileage > 0),
    vehicleType CHAR(2)        CONSTRAINT sev_svt_ck CHECK(vehicleType = 'SE')    
);
 
 
CREATE OR REPLACE VIEW Vehicle_List
AS SELECT VIN, VYear, VMake, VModel,VMileage, exteriorColor, salesTrim, salesCondition, status, listPrice
FROM SALES_VEHICLE
ORDER BY VMake, VModel;
 
 
 
CREATE OR REPLACE VIEW Vehicle_List_For_Sale
AS SELECT VIN, VYear, VMake, VModel,VMileage, exteriorColor, salesTrim, salesCondition, status, listPrice
FROM SALES_VEHICLE
WHERE status = 'Available'
ORDER BY VMake, VModel;
  
 
CREATE OR REPLACE VIEW Vehicle_List_Sold
AS SELECT VIN, VYear, VMake, VModel,VMileage, salesCondition, listPrice
FROM SALES_VEHICLE
WHERE status = 'SOLD'
ORDER BY VMake, VModel;
 
 
CREATE OR REPLACE VIEW Vehicle_Inventory_Value
AS SELECT SUM(listPrice) AS "TOTAL INVENTORY VALUE"
FROM SALES_VEHICLE
WHERE Status = 'Available';
 
CREATE OR REPLACE VIEW Vehicle_Inventory_Value_By_Make
AS SELECT VMake, SUM(listPrice) AS "TOTAL INVENTORY VALUE"
FROM SALES_VEHICLE
WHERE Status = 'Available'
GROUP BY VMAKE
ORDER BY VMAKE;


--MEMO 5

CREATE TABLE SELLER
(
sellerID            NUMBER(9)       CONSTRAINT   sell_sid_pk       PRIMARY KEY,
companyName         VARCHAR2(25),
contactName         VARCHAR2(25),
street              VARCHAR2(25),
city                VARCHAR2(25)    NOT NULL,
sellerState         CHAR(2)         NOT NULL,
zip                 VARCHAR2(10),
phone               VARCHAR2(12)    NOT NULL,
fax                 VARCHAR2(12)

);

CREATE TABLE SALES_INVOICE
(
  customer_ID         NUMBER(9)   NOT NULL CONSTRAINT si_cid_fk     REFERENCES CUSTOMER(customer_ID),
  salespersonID             NUMBER(9)   NOT NULL CONSTRAINT si_sid_fk     REFERENCES EMPLOYEE(employeeID),
  managerID           NUMBER(9)   CONSTRAINT si_mid_fk     REFERENCES EMPLOYEE(employeeID),
  salesVehicleID      NUMBER(9)   NOT NULL CONSTRAINT si_vid_fk     REFERENCES SALES_VEHICLE(VIN),
  tradeID             NUMBER(9)   CONSTRAINT si_tid_fk    REFERENCES SALES_VEHICLE(VIN),
  salesInvoiceDate    DATE        NOT NULL,
  invoiceID           NUMBER(9)   NOT NULL CONSTRAINT si_id_pk      PRIMARY KEY,
  dateApproved        DATE,
  salesAmount         NUMBER(9,2) NOT NULL CONSTRAINT si_sa_ck     CHECK(salesAmount >0),
  optionalSA          NUMBER(9,2),
  shipping            NUMBER(9,2) NOT NULL CONSTRAINT si_shi_ck     CHECK(shipping >0),
  discount            NUMBER(9,2),
  tradeAllowance      NUMBER(9,2),
  subtotal            NUMBER(9,2),
  tax                 NUMBER(9,2) NOT NULL CONSTRAINT si_tax_ck     CHECK(tax >0),
  misc                NUMBER(9,2),
  totalPrice          NUMBER(9,2)
);
 
 
 
CREATE TABLE PURCHASE_INVOICE
(
sellerID            NUMBER(9)      NOT NULL CONSTRAINT   pi_sid_fk       REFERENCES SELLER(sellerID),
managerID           NUMBER(9)      CONSTRAINT   pi_mid_fk               REFERENCES EMPLOYEE(employeeID),
VIN                 NUMBER(9)      NOT NULL CONSTRAINT   pi_vid_fk       REFERENCES SALES_VEHICLE(VIN),
purchaseInvoiceDate DATE           NOT NULL,
purchaseInvoiceID   NUMBER(9)      NOT NULL CONSTRAINT   pi_id_pk        PRIMARY KEY,
dateApproved        DATE,
salesAmount         NUMBER(9,2)    NOT NULL CONSTRAINT   pi_sa_ck        CHECK(salesAmount >0),
optionalSA          NUMBER(9,2)    CONSTRAINT              pi_osa_ck   CHECK(optionalSA >0),
shipping            NUMBER(9,2)    NOT NULL CONSTRAINT   pi_shi_ck       CHECK(shipping >0),
subtotal            NUMBER(9,2)    CONSTRAINT              pi_st_ck       CHECK(subtotal >0),
tax                 NUMBER(9,2)     NOT NULL CONSTRAINT   pi_tax_ck       CHECK(tax >0),
totalPrice          NUMBER(9,2)    NOT NULL     CONSTRAINT     pi_tp_ck       CHECK(totalPrice >0)
);
 
CREATE TABLE SERVICE_INVOICE
(
Customer_ID         NUMBER(9)   NOT NULL CONSTRAINT   seri_cid_fk       REFERENCES CUSTOMER(Customer_ID),
employeeID          NUMBER(4)   NOT NULL CONSTRAINT   seri_sid_fk       REFERENCES EMPLOYEE(employeeID),
VIN                 NUMBER(9)   NOT NULL CONSTRAINT   seri_vin_fk       REFERENCES SERVICE_VEHICLE(VIN),
partCode            VARCHAR2(25)    CONSTRAINT           seri_tid_fk       REFERENCES PART(partCode),
serviceCode         VARCHAR2(25)   CONSTRAINT seri_so_fk       REFERENCES SERVICE(serviceCode),
serviceInvoiceDate  DATE        NOT NULL,
serviceInvoiceID    NUMBER(9)   NOT NULL CONSTRAINT   seri_id_pk        PRIMARY KEY,
dateApproved        DATE        NOT NULL,
totalServiceCharges NUMBER(9,2) CONSTRAINT   seri_tsc_ck        CHECK(totalServiceCharges >0),
totalPartsCharges   NUMBER(9,2) CONSTRAINT   seri_tpc_ck        CHECK(totalPartsCharges >0),
subtotalCharges     NUMBER(9,2) CONSTRAINT            seri_stc_ck         CHECK(subtotalCharges >0),
misc                NUMBER(9,2) CONSTRAINT            seri_mis_ck         CHECK(misc >0),
tax                 NUMBER(9,2) NOT NULL CONSTRAINT   seri_tax_ck        CHECK(tax >0),
totalCharges        NUMBER(9,2) NOT NULL CONSTRAINT   seri_tc_ck          CHECK(totalCharges >0)
);
 
 
INSERT INTO SELLER
VALUES(432983830, 'Lexus', 'Nate Robinson', '4 Grand Ave', 'San Luis Obispo', 'CA', '94310', '432.434.7929', '628.522.5467');
 
INSERT INTO SELLER
VALUES(432983831, 'Honda', 'Jake Paul', '5 Grand Ave', 'San Luis Obispo', 'CA', '94310', '432.842.7328', '628.729.2685');
 
INSERT INTO SELLER
VALUES(432983832, 'Toyota', 'Snoop Dog', '6 Grand Ave', 'San Luis Obispo', 'CA', '94310', '432.672.9275', '628.138.2659');
 
INSERT INTO SELLER
VALUES(432983833, 'Ford', 'Mike Tyson', '7 Grand Ave', 'San Luis Obispo', 'CA', '94310', '432.926.1378', '628.527.9279');
 
INSERT INTO SELLER
VALUES(432983834, 'Ford', 'Tyson Fury', '8 Grand Ave', 'San Luis Obispo', 'CA', '94310', '432.378.9385', '628.268.9463');
 
 
 
INSERT INTO SALES_VEHICLE
VALUES(292859852, 'Silver', 'None', 'Excellent', 'Available', 5000.00, 6000.00, 2013, 'Ford', 'Fiesta', 25000, 'SA');
 
INSERT INTO SALES_VEHICLE
VALUES(292859853, 'Blue', 'None', 'Excellent', 'Available', 6000.00, 10000.00, 2008, 'Honda', 'Civic', 23100, 'SA');
 
INSERT INTO SALES_VEHICLE
VALUES(292859854, 'Blue', 'None', 'Excellent', 'Available', 7000.00,10000.00, 2008, 'Infiniti', 'G35', 21000, 'SA');
 
 
INSERT INTO SALES_VEHICLE
VALUES(292859855, 'Black', 'High', 'Excellent', 'Available', 8000.00,11000.00, 2019, 'Toyota', 'Takota', 16000, 'SA');
 
INSERT INTO SALES_VEHICLE
VALUES(292859856, 'White', 'Low', 'Excellent', 'Available', 18000.00,19000.00, 2019, 'Tesla', 'Model S', 56000, 'SA');
 
INSERT INTO SALES_VEHICLE
VALUES(292859857, 'Red', 'Mid', 'Excellent', 'TradeIn', 4000.00,8000.00, 2016, 'Ford', 'Fusion', 6000, 'SA');
 
INSERT INTO SALES_VEHICLE
VALUES(292859858, 'Gray', 'High', 'Excellent', 'TradeIn', 7000.00,10000.00, 2012, 'Honda', 'Accord', 5000, 'SA');
 
INSERT INTO SALES_VEHICLE
VALUES(292859859, 'Silver', 'Low', 'Excellent', 'TradeIn', 6000.00,90000.00, 2018, 'Toyota', 'Camry', 10000, 'SA');
 
  
INSERT INTO PURCHASE_INVOICE
VALUES(432983833, NULL, 292859852, '03/04/2018', 257898087, NULL, 6000.00, NULL, 500.00, 6500.00, 650.00, 7150.50);
 
INSERT INTO PURCHASE_INVOICE
VALUES(432983831, NULL, 292859853, '05/04/2016', 257898088, NULL, 10000.00, NULL, 600.00, 16000.00, 1600.00, 17600.00);
 
INSERT INTO PURCHASE_INVOICE
VALUES(432983833, NULL, 292859854, '03/04/2018', 257898089, NULL, 15000.00, NULL, 1500.00, 16500.00, 1650.00, 18150.00);
 
INSERT INTO PURCHASE_INVOICE
VALUES(432983833, NULL, 292859855, '01/15/2017', 257898090, NULL, 16000.00, NULL, 1000.00, 17000.00, 1700.00, 18700.00);
 
INSERT INTO PURCHASE_INVOICE
VALUES(432983833, NULL, 292859856, '01/30/2019', 257898091, NULL, 38000.00, NULL, 20000.00, 58000.00, 5800.00, 63800.00);
 
UPDATE PURCHASE_INVOICE
SET managerID = 1003, dateApproved = '03/05/2018'
WHERE purchaseInvoiceID = 257898087;
 
UPDATE PURCHASE_INVOICE
SET managerID = 1003, dateApproved = '05/05/2016'
WHERE purchaseInvoiceID = 257898088;
 
UPDATE PURCHASE_INVOICE
SET managerID = 1003, dateApproved = '03/05/2018'
WHERE purchaseInvoiceID = 257898089;
 
UPDATE PURCHASE_INVOICE
SET managerID = 1003, dateApproved = '01/20/2017'
WHERE purchaseInvoiceID = 257898090;
 
UPDATE PURCHASE_INVOICE
SET managerID = 1003, dateApproved = '02/05/2019'
WHERE purchaseInvoiceID = 257898091;

 
 
INSERT INTO SALES_INVOICE
VALUES(694201337, 1006, NULL, 292859852, 292859857, '11/25/2020', 53215410, NULL, 6000.00, 0.00,200.00,0.00,3000.00,3200.00,320.00,0.00,3520.00);
 
INSERT INTO SALES_INVOICE
VALUES(694201338, 1009, NULL, 292859853, 292859858, '11/20/2020', 53215411, NULL, 10000.00, 0.00,200.00,0.00,6000.00,4200.00,420.00,0.00,4620.00);
 
INSERT INTO SALES_INVOICE
VALUES(694201340, 1003, NULL, 292859854, 292859859, '11/15/2020', 53215412, NULL, 20000.00, 0.00,200.00,0.00,5000.00,15200.00,1520.00,0.00,16720.00);
 
INSERT INTO SALES_INVOICE
VALUES(123456791, 1006, NULL, 292859855, NULL, '11/03/2019', 53215413, NULL, 11000.00, 0.00,200.00,0.00,0.00,11000.00,1100.00,0.00,12100.00);
 
 
INSERT INTO SALES_INVOICE
VALUES(123456790, 1009, NULL, 292859856, NULL, '11/10/2019', 53215414, NULL, 19000.00, 0.00,200.00,0.00,0.00,19000.00,1900.00,0.00,20900.00);
 
UPDATE SALES_INVOICE
SET managerID = 1000, dateApproved = '11/26/2020'
WHERE invoiceID = 53215410;
 
UPDATE SALES_INVOICE
SET managerid = 1000, dateApproved = '11/21/2020'
WHERE INVOICEID = 53215411;
 
UPDATE SALES_INVOICE
SET managerid = 1000, dateApproved = '11/15/2020'
WHERE INVOICEID = 53215412;
 
UPDATE SALES_INVOICE
SET managerid = 1000, dateApproved = '11/04/2019'
WHERE INVOICEID = 53215413;
 
UPDATE SALES_INVOICE
SET managerid = 1000, dateApproved = '11/11/2019'
WHERE INVOICEID = 53215414;
UPDATE SALES_VEHICLE
SET status = 'SOLD'
WHERE status = 'Available';
 
UPDATE SALES_VEHICLE
SET status = 'Available'
WHERE status = 'TradeIn';



INSERT INTO SERVICE_VEHICLE
VALUES (123456789, 2012, 'Honda', 'Accord', 24000, 'SE');

INSERT INTO SERVICE_VEHICLE
VALUES(123456790, 2005, 'Honda', 'Civic', 9000, 'SE');

INSERT INTO SERVICE_VEHICLE
VALUES(123456791, 2010, 'Subaru', 'Impreza', 11000, 'SE');

 
INSERT INTO SERVICE_INVOICE
VALUES(123456789, 1005, 123456789, 'AIRFILTER', 'OILCHG', '3/9/2018', 456789123, '3/10/2018', 5000.00, 3000.00, 8000.00, NULL, 800.00, 8800.00);

 
 
INSERT INTO SERVICE_INVOICE
VALUES(123456790, 1008, 123456790, NULL, 'FLUIDS', '4/16/2018', 456789124, '4/17/2018', 1000.00, NULL, 1000.00, NULL, 100.00, 1100.00);
 

 
INSERT INTO SERVICE_INVOICE
VALUES(123456791, 1005, 123456791, 'OILFILTER', NULL, '2/1/2018', 456789125, '2/2/2018', NULL, 600.00, 600.00, NULL, 60.00, 660.00);
 
INSERT INTO SERVICE_VEHICLE (VIN, VYear, VMake, VModel, VMileage)
(
    SELECT VIN, VYear, VMake, VModel, VMileage
    FROM SALES_VEHICLE
    WHERE VIN = 292859855
);
 
UPDATE SERVICE_VEHICLE
SET vehicleType = 'SE'
WHERE VIN = 292859855;
 
 
INSERT INTO SERVICE_INVOICE
VALUES(694201341, 1005, 292859855, 'SPARKPLUG4', 'MULTIPOINTINSP', '7/9/2018', 456789126, '7/10/2018', 8000.00, 3000.00, 11000, NULL, 1100, 12100);
 
 
INSERT INTO SERVICE_VEHICLE (VIN, VYear, VMake, VModel, VMileage)
(
    SELECT VIN, VYear, VMake, VModel, VMileage
    FROM SALES_VEHICLE
    WHERE VIN = 292859854
);
 
UPDATE SERVICE_VEHICLE
SET vehicleType = 'SE'
WHERE VIN = 292859854;
 
 
 
INSERT INTO SERVICE_INVOICE
VALUES(694201340, 1008, 292859854,NULL,'TIREROTATE', '7/14/2019', 456789127, '7/15/2019', 6000.00, NULL, 6000.00, NULL, 600.00, 6600.00);
 
INSERT INTO SERVICE_VEHICLE (VIN, VYear, VMake, VModel, VMileage)
(
    SELECT VIN, VYear, VMake, VModel, VMileage
    FROM SALES_VEHICLE
    WHERE VIN = 292859853
);
 
UPDATE SERVICE_VEHICLE
SET vehicleType = 'SE'
WHERE VIN = 292859853;
 
INSERT INTO SERVICE_INVOICE
VALUES(694201338, 1005, 292859853, NULL, 'OILCHG', '4/13/2020', 456789128, '4/15/2020', NULL, 3500, 3500, NULL, 350, 3850);
 
CREATE OR REPLACE VIEW Car_Seller_List
AS SELECT companyName, contactName, Street, City, sellerState, Zip, Phone, Fax
FROM SELLER;
 
 
CREATE OR REPLACE VIEW Vehicle_Sales_List
AS SELECT si.invoiceID, e.first_name || ' ' || e.last_name "Salesperson", m.first_name || ' ' || m.last_name AS "Manager", sv.VIN, 
sv.VMake, sv.VModel, si.tradeID AS "Trade VIN", t.VMake AS "Trade Make", t.VModel AS "Trade Model", t.listPrice, si.Shipping, si.discount, si.tradeAllowance, si.subtotal, si.tax, si.misc, si.totalPrice
FROM SALES_INVOICE si
JOIN EMPLOYEE e
ON(si.salespersonID = e.employeeID)
JOIN EMPLOYEE m
ON(m.employeeID = e.managerID)
JOIN SALES_VEHICLE sv
ON(si.salesVehicleID = sv.VIN)
LEFT OUTER JOIN SALES_VEHICLE t
ON(t.VIN = si.tradeID);
 
 
 
CREATE OR REPLACE VIEW Vehicle_Purchase_List
AS SELECT p.purchaseInvoiceID, s.companyName, s.contactName, v.VIN, v.vmake, v.vmodel, p.salesAmount, p.shipping, p.tax, p.totalprice, m.first_name || ' ' || m.last_name AS "Manager"
FROM PURCHASE_INVOICE p
JOIN SELLER s
ON(p.sellerID = s.sellerID)
JOIN SALES_VEHICLE v
ON(v.VIN = p.VIN)
JOIN EMPLOYEE m
ON (m.employeeid = p.managerid);
 
 
CREATE OR REPLACE VIEW Service_Invoice_List
AS SELECT s.serviceInvoiceID, c.first_name || ' ' || c.last_name AS "Customer", v.VIN, v.VMake,
v.VModel, v.VMileage,s.totalServiceCharges,s.totalPartsCharges, s.tax, s.misc, s.totalCharges
FROM SERVICE_INVOICE s
JOIN CUSTOMER c
ON(s.customer_ID = c.customer_ID)
JOIN SERVICE_VEHICLE v
ON(v.VIN = s.VIN);


--MEMO 6

CREATE OR REPLACE VIEW Customer_Purchased_From_Us
AS SELECT first_name || ' ' || last_name "Customer", phone 
FROM CUSTOMER
WHERE Customer_ID IN
(
SELECT Customer_ID
FROM SALES_INVOICE
);
 
CREATE OR REPLACE VIEW Customer_Purchased_From_Us_No_Service
AS SELECT first_name || ' ' || last_name "Customer", phone 
FROM CUSTOMER
WHERE Customer_ID IN
(
SELECT Customer_ID
FROM SALES_INVOICE
WHERE Customer_ID NOT IN
(
   SELECT Customer_ID
   FROM SERVICE_INVOICE
)
);
 
CREATE OR REPLACE VIEW Customer_Interested_In_Porsche
AS SELECT first_name || ' ' || last_name "Customer", phone
FROM CUSTOMER
WHERE Customer_ID IN
(
   SELECT Customer_ID
   FROM PREFERENCES
   WHERE   Make = 'Porsche'
   AND end_date < SYSDATE
);
 
 
 
CREATE OR REPLACE VIEW Customer_Purchased_From_Us_No_TradeIn
AS SELECT first_name || ' ' || last_name "Customer", phone 
FROM CUSTOMER
WHERE Customer_ID IN
(
SELECT Customer_ID
FROM SALES_INVOICE
WHERE tradeID IS NULL
);
 
CREATE OR REPLACE VIEW Vehicles_Sold_Past_30_days
AS SELECT v.vmake || ' ' || v.vmodel AS "Vehicle"
FROM SALES_INVOICE s JOIN SALES_VEHICLE v
ON (s.salesvehicleID = v.VIN)
WHERE (SYSDATE - s.dateApproved ) <= 30;
 
 
 
CREATE OR REPLACE VIEW Service_Profit
AS SELECT s.serviceCode, SUM(si.subtotalCharges - s.serviceCost) AS "PROFIT"
FROM SERVICE_INVOICE si
JOIN SERVICE s
ON(si.serviceCode = s.serviceCode)
GROUP BY s.serviceCode;
 
 
CREATE OR REPLACE VIEW Highest_Commissions
AS SELECT e.first_name || ' ' || e.last_name AS "Best Salesperson by Commissions"
FROM EMPLOYEE e
JOIN SALES_INVOICE si
ON(e.employeeID = si.salespersonID)
HAVING SUM(e.comm_pct*si.subtotal) = 
( SELECT MAX(SUM(e.comm_pct*si.subtotal)) AS "COMMISSIONS"
FROM EMPLOYEE e
JOIN SALES_INVOICE si
ON(si.salespersonID = e.employeeID)
GROUP BY employeeID
)
GROUP BY e.first_name || ' ' || e.last_name;
 
 
 
CREATE OR REPLACE VIEW Largest_No_Vehicles_Sold
AS SELECT e.first_name || ' ' || e.last_name AS "Best Salesperson by Vehicles Sold"
FROM EMPLOYEE e
JOIN SALES_INVOICE si
ON(e.employeeID = si.salespersonID)
HAVING COUNT(si.subtotal) = 
( SELECT MAX(COUNT(si.subtotal))
FROM EMPLOYEE e
JOIN SALES_INVOICE si
ON(si.salespersonID = e.employeeID)
GROUP BY employeeID
)
GROUP BY e.first_name || ' ' || e.last_name;
 
CREATE OR REPLACE VIEW How_Much_Larry_Made
AS SELECT SUM(subtotal) AS "TOTAL MADE BY SALES"
FROM SALES_INVOICE;
