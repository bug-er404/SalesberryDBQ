-------------------------
-----------------------------------------------------------------
-- DDL to create Tables and Constraints necessary for Salesberry.
-- Based on the generation of DDL from Oracle Data Modeler.
-- Author: Salil Maharjan
-- 11/20/2019
-------------------------
-----------------------------------------------------------------
CREATE TABLE branch (
    branchid         NUMBER(5) NOT NULL,
    branchname       VARCHAR2(50 CHAR) NOT NULL,
    branchlocation   VARCHAR2(25 CHAR) NOT NULL,
    managerid        NUMBER(10) NOT NULL
);

ALTER TABLE branch ADD CONSTRAINT branch_pk PRIMARY KEY ( branchid );

CREATE TABLE department (
    departmentid     NUMBER(10) NOT NULL,
    departmentname   VARCHAR2(25) NOT NULL,
    aisle            NUMBER(3) NOT NULL,
    floor            NUMBER(2) NOT NULL
);

ALTER TABLE department ADD CONSTRAINT department_pk PRIMARY KEY ( departmentid );

CREATE TABLE employee (
    branchid       NUMBER(5) NOT NULL,
    employeeid     NUMBER(10) NOT NULL,
    empfirstname   VARCHAR2(25 CHAR) NOT NULL,
    emplastname    VARCHAR2(25 CHAR) NOT NULL,
    empemail       VARCHAR2(50),
    empphone       CHAR(10) NOT NULL,
    hiredate       DATE NOT NULL,
    salary         NUMBER(10, 2) NOT NULL,
    managerid      NUMBER(10),
    jobid          VARCHAR2(15 CHAR) NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT emp_emailck CHECK ( empemail LIKE '%_@__%.__%' );

ALTER TABLE employee
    ADD CONSTRAINT emp_phoneck CHECK ( REGEXP_LIKE ( empphone,
                                                     '^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$' ) );

ALTER TABLE employee
    ADD CONSTRAINT emp_salaryck CHECK ( ( salary > 5000 ) );

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employeeid );

ALTER TABLE employee ADD CONSTRAINT empphoneuc UNIQUE ( empphone );

ALTER TABLE employee ADD CONSTRAINT empemailuc UNIQUE ( empemail );

CREATE TABLE invoice (
    invoiceid     NUMBER(10) NOT NULL,
    amount        NUMBER(10, 2) NOT NULL,
    datetime      DATE DEFAULT sysdate NOT NULL,
    paymenttype   CHAR(2 BYTE) DEFAULT 'CH' NOT NULL,
    purchaseid    NUMBER(10) NOT NULL
);

ALTER TABLE invoice ADD CONSTRAINT inv_amountck CHECK ( amount > 0 );

ALTER TABLE invoice
    ADD CONSTRAINT paymenttypedfv CHECK ( paymenttype IN (
        'CH',
        'CR',
        'DR'
    ) );

CREATE UNIQUE INDEX invoice__idx ON
    invoice (
        purchaseid
    ASC );

ALTER TABLE invoice ADD CONSTRAINT invoice_pk PRIMARY KEY ( invoiceid );

CREATE TABLE job (
    jobid       VARCHAR2(15 CHAR) NOT NULL,
    jobtitle    VARCHAR2(30 CHAR) NOT NULL,
    minsalary   NUMBER(10, 2) NOT NULL,
    maxsalary   NUMBER(10, 2) NOT NULL
);

ALTER TABLE job
    ADD CONSTRAINT job_salaryck CHECK ( ( minsalary > 5000 ) );

ALTER TABLE job ADD CONSTRAINT job_pk PRIMARY KEY ( jobid );

ALTER TABLE job ADD CONSTRAINT jobtitleuc UNIQUE ( jobtitle );

CREATE TABLE member (
    memberid    NUMBER(10) NOT NULL,
    firstname   VARCHAR2(20 CHAR) NOT NULL,
    lastname    VARCHAR2(20 CHAR) NOT NULL,
    phone       CHAR(10) NOT NULL,
    email       VARCHAR2(50),
    address     VARCHAR2(50 CHAR)
);

ALTER TABLE member
    ADD CONSTRAINT mem_phoneck CHECK ( REGEXP_LIKE ( phone,
                                                     '^[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$' ) );

ALTER TABLE member ADD CONSTRAINT mem_emailck CHECK ( email LIKE '%_@__%.__%' );

CREATE UNIQUE INDEX member__idx ON
    member (
        memberid
    ASC );

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( phone );

ALTER TABLE member ADD CONSTRAINT emailuc UNIQUE ( email );

CREATE TABLE membership (
    memberid      NUMBER(10) NOT NULL,
    issuedate     DATE NOT NULL,
    expirydate    DATE NOT NULL,
    branchid      NUMBER(5) NOT NULL,
    memberscore   NUMBER(4, 2) DEFAULT 0
);

ALTER TABLE membership ADD CONSTRAINT membership_pk PRIMARY KEY ( memberid );

ALTER TABLE membership ADD CONSTRAINT dateck CHECK ( expirydate > issuedate );

CREATE TABLE paymenttype (
    paymenttype   CHAR(2 BYTE) DEFAULT 'CH' NOT NULL,
    typename      VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE paymenttype ADD CONSTRAINT paymenttype_pk PRIMARY KEY ( paymenttype );

ALTER TABLE paymenttype
    ADD CONSTRAINT paymentdfv CHECK ( paymenttype IN (
        'CH',
        'CR',
        'DR'
    ) );

CREATE TABLE product (
    productid       NUMBER(10) NOT NULL,
    productname     VARCHAR2(50 CHAR) NOT NULL,
    msrp            NUMBER(10, 2) NOT NULL,
    productdes      VARCHAR2(80 CHAR),
    costprice       NUMBER(10, 2) NOT NULL,
    stockquantity   NUMBER(10),
    departmentid    NUMBER(10) NOT NULL,
    warehouseid     NUMBER(5) NOT NULL,
    shipmentid      NUMBER(10) NOT NULL
);

ALTER TABLE product ADD CONSTRAINT prd_priceck CHECK ( msrp > 0 );

ALTER TABLE product ADD CONSTRAINT prd_amountck CHECK ( costprice > 0 );

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( productid );

CREATE TABLE purchase (
    purchaseid   NUMBER(10) NOT NULL,
    "Date"       DATE DEFAULT sysdate NOT NULL,
    memberid     NUMBER(10),
    employeeid   NUMBER(10) NOT NULL
);

ALTER TABLE purchase ADD CONSTRAINT purchase_pk PRIMARY KEY ( purchaseid );

CREATE TABLE purchasedetail (
    purchaseid   NUMBER(10) NOT NULL,
    productid    NUMBER(10) NOT NULL,
    quantity     NUMBER(10) DEFAULT 1 NOT NULL,
    detailid     NUMBER(10) NOT NULL
);

ALTER TABLE purchasedetail ADD CONSTRAINT pdt_quantityck CHECK ( quantity > 0 );

ALTER TABLE purchasedetail ADD CONSTRAINT purchasedetail_pk PRIMARY KEY ( purchaseid,
                                                                          detailid );

CREATE TABLE shipment (
    warehouseid       NUMBER(5) NOT NULL,
    shipmentid        NUMBER(10) NOT NULL,
    shipmentarrival   DATE,
    shipmentrelease   DATE NOT NULL,
    shiptypeid        NUMBER(5) NOT NULL,
    status            CHAR(1) DEFAULT 'R' NOT NULL,
    employeeid        NUMBER(10) NOT NULL
);

ALTER TABLE shipment ADD CONSTRAINT shipment_pk PRIMARY KEY ( shipmentid );

ALTER TABLE shipment ADD CONSTRAINT shipmentdateck CHECK ( shipmentarrival > shipmentrelease );

ALTER TABLE shipment
    ADD CONSTRAINT shipmentstatusdfv CHECK ( status IN (
        'R',
        'D',
        'I',
        'V'
    ) );

CREATE TABLE shipmenttype (
    shiptypeid        NUMBER(5) NOT NULL,
    type              CHAR(1 CHAR) NOT NULL,
    location          VARCHAR2(50 CHAR) NOT NULL,
    shipdescription   VARCHAR2(80 CHAR)
);

ALTER TABLE shipmenttype ADD CONSTRAINT shipmenttype_pk PRIMARY KEY ( shiptypeid );

ALTER TABLE shipmenttype
    ADD CONSTRAINT shipmenttypedfv CHECK ( type IN (
        'N',
        'L',
        'I'
    ) );

CREATE TABLE warehouse (
    warehouseid     NUMBER(5) NOT NULL,
    warehousename   VARCHAR2(20 CHAR) NOT NULL,
    branchid        NUMBER(5) NOT NULL
);

ALTER TABLE warehouse ADD CONSTRAINT warehouse_pk PRIMARY KEY ( warehouseid );

ALTER TABLE employee
    ADD CONSTRAINT employee_branch_fk FOREIGN KEY ( branchid )
        REFERENCES branch ( branchid );

ALTER TABLE employee
    ADD CONSTRAINT employee_employee_fk FOREIGN KEY ( managerid )
        REFERENCES employee ( employeeid );

ALTER TABLE employee
    ADD CONSTRAINT employee_job_fk FOREIGN KEY ( jobid )
        REFERENCES job ( jobid );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_paymenttype_fk FOREIGN KEY ( paymenttype )
        REFERENCES paymenttype ( paymenttype );

ALTER TABLE invoice
    ADD CONSTRAINT invoice_purchase_fk FOREIGN KEY ( purchaseid )
        REFERENCES purchase ( purchaseid );

ALTER TABLE member
    ADD CONSTRAINT member_membership_fk FOREIGN KEY ( memberid )
        REFERENCES membership ( memberid );

ALTER TABLE membership
    ADD CONSTRAINT membership_branch_fk FOREIGN KEY ( branchid )
        REFERENCES branch ( branchid );

ALTER TABLE membership
    ADD CONSTRAINT membership_member_fk FOREIGN KEY ( phone )
        REFERENCES member ( phone );

ALTER TABLE product
    ADD CONSTRAINT product_department_fk FOREIGN KEY ( departmentid )
        REFERENCES department ( departmentid );

ALTER TABLE product
    ADD CONSTRAINT product_shipment_fk FOREIGN KEY ( shipmentid )
        REFERENCES shipment ( shipmentid );

ALTER TABLE product
    ADD CONSTRAINT product_warehouse_fk FOREIGN KEY ( warehouseid )
        REFERENCES warehouse ( warehouseid );

ALTER TABLE purchase
    ADD CONSTRAINT purchase_employee_fk FOREIGN KEY ( employeeid )
        REFERENCES employee ( employeeid );

ALTER TABLE purchase
    ADD CONSTRAINT purchase_invoice_fk FOREIGN KEY ( invoiceid )
        REFERENCES invoice ( invoiceid );

ALTER TABLE purchasedetail
    ADD CONSTRAINT purchasedetail_product_fk FOREIGN KEY ( productid )
        REFERENCES product ( productid );

ALTER TABLE purchasedetail
    ADD CONSTRAINT purchasedetail_purchase_fk FOREIGN KEY ( purchaseid )
        REFERENCES purchase ( purchaseid );

ALTER TABLE shipment
    ADD CONSTRAINT shipment_employee_fk FOREIGN KEY ( employeeid )
        REFERENCES employee ( employeeid );

ALTER TABLE shipment
    ADD CONSTRAINT shipment_shipmenttype_fk FOREIGN KEY ( shiptypeid )
        REFERENCES shipmenttype ( shiptypeid );

ALTER TABLE shipment
    ADD CONSTRAINT shipment_warehouse_fk FOREIGN KEY ( warehouseid )
        REFERENCES warehouse ( warehouseid );

ALTER TABLE warehouse
    ADD CONSTRAINT warehouse_branch_fk FOREIGN KEY ( branchid )
        REFERENCES branch ( branchid );


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             4
-- ALTER TABLE                             47
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0