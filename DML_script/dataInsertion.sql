-------------------------
-----------------------------------------------------------------
-- Sample Data insertion for Salesberry.
-- Insertion of data to all the fourteen tables.
-- Shows usage triggers for data entry and valid data according to
-- the defined constraints for each table.
-- Author: Salil Maharjan
-- 11/20/2019
-----------------------------------------------------------------
-------------------------

-----------------------------------------------------------------
-- Branch Table:
-----------------------------------------------------------------
INSERT INTO branch (
    branchid,
    branchname,
    branchlocation,
    managerid
) VALUES (
    1,
    'Salesberry Department Store',
    'Satdobato',
    1
);

INSERT INTO branch (
    branchid,
    branchname,
    branchlocation,
    managerid
) VALUES (
    2,
    'Saleways',
    'Jawalakhel',
    2
);

INSERT INTO branch (
    branchid,
    branchname,
    branchlocation,
    managerid
) VALUES (
    3,
    'Salesberry Wholesale',
    'Lagankhel',
    3
);

INSERT INTO branch (
    branchid,
    branchname,
    branchlocation,
    managerid
) VALUES (
    4,
    'Saleways Supermarket',
    'Maharajgunj',
    4
);

INSERT INTO branch (
    branchid,
    branchname,
    branchlocation,
    managerid
) VALUES (
    5,
    'Saleways Department Store',
    'Hattigauda',
    5
);

INSERT INTO branch (
    branchid,
    branchname,
    branchlocation,
    managerid
) VALUES (
    6,
    'Salesberry Department Store',
    'Chakrapath',
    6
);

INSERT INTO branch (
    branchid,
    branchname,
    branchlocation,
    managerid
) VALUES (
    7,
    'Salesberry Department Store',
    'Sitapaila',
    7
);

INSERT INTO branch (
    branchid,
    branchname,
    branchlocation,
    managerid
) VALUES (
    8,
    'Saleways',
    'Pokhara',
    8
);

INSERT INTO branch (
    branchid,
    branchname,
    branchlocation,
    managerid
) VALUES (
    9,
    'Salesberry Department Store',
    'Dharan',
    9
);
-----------------------------------------------------------------
-- Department Insertions using trigger for Department ID generation
-----------------------------------------------------------------
INSERT INTO department (
    departmentname,
    aisle,
    floor
) VALUES (
    'Groceries',
    1,
    1
);

INSERT INTO department (
    departmentname,
    aisle,
    floor
) VALUES (
    'Fish Products',
    2,
    1
);

INSERT INTO department (
    departmentname,
    aisle,
    floor
) VALUES (
    'Toiletries',
    3,
    1
);

INSERT INTO department (
    departmentname,
    aisle,
    floor
) VALUES (
    'Kitchen Items',
    1,
    2
);

INSERT INTO department (
    departmentname,
    aisle,
    floor
) VALUES (
    'Electronics',
    2,
    2
);

INSERT INTO department (
    departmentname,
    aisle,
    floor
) VALUES (
    'Garments',
    1,
    3
);
-----------------------------------------------------------------
-- Employee Insertions using trigger for Employee ID generation
-----------------------------------------------------------------
INSERT INTO employee (
    branchid,
    empfirstname,
    emplastname,
    empemail,
    empphone,
    hiredate,
    salary,
    managerid,
    jobid
) VALUES (
    1,
    'Stanislaw ',
    'Zhang',
    'szhang@gmail.com',
    '9865726132',
    TO_DATE('10-SEP-98', 'DD-MON-RR'),
    25000,
    NULL,
    'BR_MG'
);

INSERT INTO employee (
    branchid,
    empfirstname,
    emplastname,
    empemail,
    empphone,
    hiredate,
    salary,
    managerid,
    jobid
) VALUES (
    2,
    'Jadene ',
    'Mccormick',
    'jdene@gmail.com',
    '9751827261',
    TO_DATE('23-NOV-99', 'DD-MON-RR'),
    27000,
    NULL,
    'BR_MG'
);

INSERT INTO employee (
    branchid,
    empfirstname,
    emplastname,
    empemail,
    empphone,
    hiredate,
    salary,
    managerid,
    jobid
) VALUES (
    3,
    'Kalum ',
    'Cox',
    'cox@gmail.com',
    '9861726712',
    TO_DATE('01-JAN-95', 'DD-MON-RR'),
    29000,
    NULL,
    'BR_MG'
);

INSERT INTO employee (
    branchid,
    empfirstname,
    emplastname,
    empemail,
    empphone,
    hiredate,
    salary,
    managerid,
    jobid
) VALUES (
    1,
    'Mac ',
    'Fulton',
    'fulton@gmail.com',
    '9816272671',
    TO_DATE('01-FEB-01', 'DD-MON-RR'),
    18000,
    45,
    'FI_MG'
);

INSERT INTO employee (
    branchid,
    empfirstname,
    emplastname,
    empemail,
    empphone,
    hiredate,
    salary,
    managerid,
    jobid
) VALUES (
    2,
    'Livia ',
    'Hodges',
    'hodges@yahoo.com',
    '9861725790',
    TO_DATE('28-MAR-05', 'DD-MON-RR'),
    15000,
    61,
    'FI_MG'
);

INSERT INTO employee (
    branchid,
    empfirstname,
    emplastname,
    empemail,
    empphone,
    hiredate,
    salary,
    managerid,
    jobid
) VALUES (
    3,
    'Prince',
    'Ayah ',
    'ayah@gmail.com',
    '9751028912',
    TO_DATE('14-APR-07', 'DD-MON-RR'),
    11000,
    62,
    'ACCT'
);

INSERT INTO employee (
    branchid,
    empfirstname,
    emplastname,
    empemail,
    empphone,
    hiredate,
    salary,
    managerid,
    jobid
) VALUES (
    1,
    'Sanaya ',
    'Jensen',
    'jensen@hotmail.com',
    '9875612307',
    TO_DATE('16-MAY-04', 'DD-MON-RR'),
    17000,
    45,
    'SA_MG'
);

INSERT INTO employee (
    branchid,
    empfirstname,
    emplastname,
    empemail,
    empphone,
    hiredate,
    salary,
    managerid,
    jobid
) VALUES (
    2,
    'Harleen ',
    'Taylor',
    'taylor@gmail.com',
    '9871672812',
    TO_DATE('21-JUN-07', 'DD-MON-RR'),
    15000,
    61,
    'SA_MG'
);
-----------------------------------------------------------------
-- Job data insertion
-----------------------------------------------------------------
INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'BR_MG',
    'Branch Manager',
    10000,
    30000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'FI_MG',
    'Finance Manager',
    10000,
    20000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'ACCT',
    'Accountant',
    9000,
    15000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'SA_MG',
    'Sales Manager',
    10000,
    18000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'SA_RP',
    'Sales Representative',
    6000,
    12000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'PR_MG',
    'Purchasing Manager',
    8000,
    15000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'PR_CK',
    'Purchasing Clerk',
    5100,
    5500
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'ST_MG',
    'Stock Manager',
    5500,
    8500
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'ST_CK',
    'Stock Clerk',
    5100,
    6000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'SP_CK',
    'Shipping Clerk',
    5100,
    6500
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'IT_PG',
    'Programmer',
    5100,
    10000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'MK_MG',
    'Marketing Manager',
    9000,
    15000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'HR_RP',
    'Human Resources Rep',
    5100,
    9000
);

INSERT INTO job (
    jobid,
    jobtitle,
    minsalary,
    maxsalary
) VALUES (
    'PR_RP',
    'Public Relations Rep',
    5100,
    10500
);
-----------------------------------------------------------------
-- Payment Type data insertion
-----------------------------------------------------------------
INSERT INTO paymenttype (
    paymenttype,
    typename
) VALUES (
    'CH',
    'Cash'
);

INSERT INTO paymenttype (
    paymenttype,
    typename
) VALUES (
    'CR',
    'Credit Card'
);

INSERT INTO paymenttype (
    paymenttype,
    typename
) VALUES (
    'DR',
    'Debit Card'
);
-----------------------------------------------------------------
-- Membership data insertion using trigger for Member ID generation
-----------------------------------------------------------------
INSERT INTO membership (
    issuedate,
    expirydate,
    branchid,
    memberscore
) VALUES (
    TO_DATE('16-FEB-99', 'DD-MON-RR'),
    TO_DATE('16-FEB-09', 'DD-MON-RR'),
    1,
    23.21
);

INSERT INTO membership (
    issuedate,
    expirydate,
    branchid,
    memberscore
) VALUES (
    TO_DATE('08-MAY-02', 'DD-MON-RR'),
    TO_DATE('08-MAY-12', 'DD-MON-RR'),
    2,
    12.23
);

INSERT INTO membership (
    issuedate,
    expirydate,
    branchid,
    memberscore
) VALUES (
    TO_DATE('17-JUN-03', 'DD-MON-RR'),
    TO_DATE('17-JUN-13', 'DD-MON-RR'),
    3,
    16.42
);

INSERT INTO membership (
    issuedate,
    expirydate,
    branchid,
    memberscore
) VALUES (
    TO_DATE('13-APR-10', 'DD-MON-RR'),
    TO_DATE('13-APR-20', 'DD-MON-RR'),
    2,
    4.32
);

INSERT INTO membership (
    issuedate,
    expirydate,
    branchid,
    memberscore
) VALUES (
    TO_DATE('24-JUL-13', 'DD-MON-RR'),
    TO_DATE('24-JUL-23', 'DD-MON-RR'),
    1,
    2.32
);
-----------------------------------------------------------------
-- Member data insertion
-----------------------------------------------------------------
INSERT INTO member (
    memberid,
    firstname,
    lastname,
    phone,
    email,
    address
) VALUES (
    10,
    'Sufyan',
    'Wilkes',
    '9818134643',
    'wilkes@gmail.com',
    'Satdobato'
);

INSERT INTO member (
    memberid,
    firstname,
    lastname,
    phone,
    email,
    address
) VALUES (
    11,
    'Efe',
    'Alexander',
    '9817827312',
    'efe@hotmail.com',
    'Lagankhel'
);

INSERT INTO member (
    memberid,
    firstname,
    lastname,
    phone,
    email,
    address
) VALUES (
    12,
    'Halima',
    'Guevara',
    '9817263712',
    'halima@yahoo.com',
    'Jawalakhel'
);

INSERT INTO member (
    memberid,
    firstname,
    lastname,
    phone,
    email,
    address
) VALUES (
    13,
    'Vikki',
    'Bernard',
    '9872617283',
    'vikki@hotmail.com',
    'Sitapaila'
);

INSERT INTO member (
    memberid,
    firstname,
    lastname,
    phone,
    email,
    address
) VALUES (
    14,
    'Emelie',
    'Rivers',
    '9872617263',
    'emelie@gmail.com',
    'Jhamsikhel'
);

-----------------------------------------------------------------
-- Warehouse data insertion using trigger to generate Warehouse ID
-----------------------------------------------------------------

INSERT INTO warehouse (
    warehousename,
    branchid
) VALUES (
    'SalesBerry Satdobato',
    1
);

INSERT INTO warehouse (
    warehousename,
    branchid
) VALUES (
    'Saleways Jawalakhel',
    2
);

INSERT INTO warehouse (
    warehousename,
    branchid
) VALUES (
    'Salesberry Lagankhel',
    3
);

INSERT INTO warehouse (
    warehousename,
    branchid
) VALUES (
    'Salesway Maharajgunj',
    4
);

INSERT INTO warehouse (
    warehousename,
    branchid
) VALUES (
    'Salesway Hattigauda',
    5
);

-----------------------------------------------------------------
-- Shipment Type data insertion using trigger to generate shipment type ID
-----------------------------------------------------------------

INSERT INTO shipmenttype (
    type,
    location,
    shipdescription
) VALUES (
    'N',
    'Biratnagar',
    'Shipment of nationally produced products.'
);

INSERT INTO shipmenttype (
    type,
    location,
    shipdescription
) VALUES (
    'I',
    'China',
    'Get shipment detail on release.'
);

INSERT INTO shipmenttype (
    type,
    location,
    shipdescription
) VALUES (
    'L',
    'Satdobato',
    'Weekly shipment.'
);

INSERT INTO shipmenttype (
    type,
    location
) VALUES (
    'I',
    'Thailand'
);

-----------------------------------------------------------------
-- Shipment data insertion
-----------------------------------------------------------------

INSERT INTO shipment (
    warehouseid,
    shipmentid,
    shipmentarrival,
    shipmentrelease,
    shiptypeid,
    status,
    employeeid
) VALUES (
    1,
    1,
    TO_DATE('05-MAR-19', 'DD-MON-RR'),
    TO_DATE('08-JAN-19', 'DD-MON-RR'),
    1,
    'D',
    81
);

INSERT INTO shipment (
    warehouseid,
    shipmentid,
    shipmentarrival,
    shipmentrelease,
    shiptypeid,
    status,
    employeeid
) VALUES (
    2,
    2,
    TO_DATE('17-SEP-19', 'DD-MON-RR'),
    TO_DATE('20-MAR-19', 'DD-MON-RR'),
    2,
    'D',
    65
);

INSERT INTO shipment (
    warehouseid,
    shipmentid,
    shipmentarrival,
    shipmentrelease,
    shiptypeid,
    status,
    employeeid
) VALUES (
    3,
    3,
    TO_DATE('23-MAY-19', 'DD-MON-RR'),
    TO_DATE('14-MAY-19', 'DD-MON-RR'),
    3,
    'V',
    66
);

INSERT INTO shipment (
    warehouseid,
    shipmentid,
    shipmentarrival,
    shipmentrelease,
    shiptypeid,
    status,
    employeeid
) VALUES (
    2,
    4,
    TO_DATE('21-NOV-19', 'DD-MON-RR'),
    TO_DATE('18-JUL-19', 'DD-MON-RR'),
    1,
    'I',
    65
);

INSERT INTO shipment (
    warehouseid,
    shipmentid,
    shipmentarrival,
    shipmentrelease,
    shiptypeid,
    status,
    employeeid
) VALUES (
    1,
    5,
    TO_DATE('18-FEB-20', 'DD-MON-RR'),
    TO_DATE('25-NOV-19', 'DD-MON-RR'),
    4,
    'R',
    81
);

-----------------------------------------------------------------
-- Product data insertion using trigger to generate product ID
-----------------------------------------------------------------

INSERT INTO product (
    productname,
    msrp,
    productdes,
    costprice,
    stockquantity,
    departmentid,
    warehouseid,
    shipmentid
) VALUES (
    'Pasta',
    3.99,
    NULL,
    1.89,
    2999,
    1,
    1,
    1
);

INSERT INTO product (
    productname,
    msrp,
    productdes,
    costprice,
    stockquantity,
    departmentid,
    warehouseid,
    shipmentid
) VALUES (
    'Cereal',
    7.99,
    'Breakfast Cereals',
    2.99,
    2432,
    1,
    2,
    2
);

INSERT INTO product (
    productname,
    msrp,
    productdes,
    costprice,
    stockquantity,
    departmentid,
    warehouseid,
    shipmentid
) VALUES (
    'Salmon',
    23.98,
    NULL,
    8.76,
    34,
    2,
    1,
    5
);

INSERT INTO product (
    productname,
    msrp,
    productdes,
    costprice,
    stockquantity,
    departmentid,
    warehouseid,
    shipmentid
) VALUES (
    'Calamari',
    19.89,
    'Arrived fresh today',
    6.54,
    56,
    2,
    2,
    4
);

INSERT INTO product (
    productname,
    msrp,
    productdes,
    costprice,
    stockquantity,
    departmentid,
    warehouseid,
    shipmentid
) VALUES (
    'Toothbrush',
    2.12,
    NULL,
    0.89,
    273,
    3,
    1,
    5
);

INSERT INTO product (
    productname,
    msrp,
    productdes,
    costprice,
    stockquantity,
    departmentid,
    warehouseid,
    shipmentid
) VALUES (
    'Skillet',
    36.23,
    'New non-stick skillet',
    10.12,
    182,
    4,
    2,
    4
);

INSERT INTO product (
    productname,
    msrp,
    productdes,
    costprice,
    stockquantity,
    departmentid,
    warehouseid,
    shipmentid
) VALUES (
    'Television',
    1521.99,
    NULL,
    1222.21,
    12,
    5,
    1,
    1
);

INSERT INTO product (
    productname,
    msrp,
    productdes,
    costprice,
    stockquantity,
    departmentid,
    warehouseid,
    shipmentid
) VALUES (
    'Jeans',
    65.99,
    NULL,
    32.12,
    182,
    6,
    2,
    2
);

-----------------------------------------------------------------
-- Purchase data insertion using trigger for Purchase ID
-----------------------------------------------------------------

INSERT INTO purchase (
    "Date",
    memberid,
    employeeid
) VALUES (
    TO_DATE('22-AUG-19', 'DD-MON-RR'),
    NULL,
    82
);

INSERT INTO purchase (
    "Date",
    memberid,
    employeeid
) VALUES (
    TO_DATE('20-AUG-19', 'DD-MON-RR'),
    10,
    82
);

INSERT INTO purchase (
    "Date",
    memberid,
    employeeid
) VALUES (
    TO_DATE('18-SEP-19', 'DD-MON-RR'),
    NULL,
    82
);

-----------------------------------------------------------------
-- Purchase Detail data insertion using trigger to get Detail ID automatically
-----------------------------------------------------------------

INSERT INTO purchasedetail (
    purchaseid,
    productid,
    quantity
) VALUES (
    21,
    1,
    3
);

INSERT INTO purchasedetail (
    purchaseid,
    productid,
    quantity
) VALUES (
    22,
    3,
    3
);

INSERT INTO purchasedetail (
    purchaseid,
    productid,
    quantity
) VALUES (
    22,
    4,
    3
);

INSERT INTO purchasedetail (
    purchaseid,
    productid,
    quantity
) VALUES (
    21,
    2,
    5
);

INSERT INTO purchasedetail (
    purchaseid,
    productid,
    quantity
) VALUES (
    22,
    5,
    2
);

INSERT INTO purchasedetail (
    purchaseid,
    productid,
    quantity
) VALUES (
    22,
    6,
    1
);

INSERT INTO purchasedetail (
    purchaseid,
    productid,
    quantity
) VALUES (
    23,
    7,
    1
);

-----------------------------------------------------------------
-- Invoice data insertion using trigger to get Invoice ID
-----------------------------------------------------------------

INSERT INTO invoice (
    amount,
    datetime,
    paymenttype,
    purchaseid
) VALUES (
    51.92,
    TO_DATE('22-AUG-19', 'DD-MON-RR'),
    'CH',
    21
);

INSERT INTO invoice (
    amount,
    datetime,
    paymenttype,
    purchaseid
) VALUES (
    142.12,
    TO_DATE('20-AUG-19', 'DD-MON-RR'),
    'DR',
    22
);

INSERT INTO invoice (
    amount,
    datetime,
    paymenttype,
    purchaseid
) VALUES (
    1521.99,
    TO_DATE('18-SEP-19', 'DD-MON-RR'),
    'CR',
    23
);