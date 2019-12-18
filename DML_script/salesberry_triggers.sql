-------------------------
-----------------------------------------------------------------
-- Trigger definitions for Salesberry.
-- Includes triggers for:
-- Automatic ID generation and increment for various IDs used in the database.
-- Date checks for shipment and membership table.
-- Salary check for Employees to make sure nobody is underpaid than the minimum wage.
-- Author: Salil Maharjan
-- 11/20/2019
-------------------------
-----------------------------------------------------------------

---------------------------------------------
-- Automatic ID generation Triggers
---------------------------------------------

-- Department IDs
CREATE SEQUENCE deptid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER departmentid_tr BEFORE
    INSERT ON department
    FOR EACH ROW
BEGIN
    SELECT
        deptid_seq.NEXTVAL
    INTO :new.departmentid
    FROM
        dual;

END;
/
-- Employee IDs

CREATE SEQUENCE empid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER empid_tr BEFORE
    INSERT ON employee
    FOR EACH ROW
BEGIN
    SELECT
        empid_seq.NEXTVAL
    INTO :new.employeeid
    FROM
        dual;

END;
/
-- Invoice IDs

CREATE SEQUENCE invid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER invid_tr BEFORE
    INSERT ON invoice
    FOR EACH ROW
BEGIN
    SELECT
        invid_seq.NEXTVAL
    INTO :new.invoiceid
    FROM
        dual;

END;
/
-- Membership IDs

CREATE SEQUENCE memberid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER memberid_tr BEFORE
    INSERT ON membership
    FOR EACH ROW
BEGIN
    SELECT
        memberid_seq.NEXTVAL
    INTO :new.memberid
    FROM
        dual;

END;
/
-- Product IDs

CREATE SEQUENCE productid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER productid_tr BEFORE
    INSERT ON product
    FOR EACH ROW
BEGIN
    SELECT
        productid_seq.NEXTVAL
    INTO :new.productid
    FROM
        dual;

END;
/
-- Purchase IDs

CREATE SEQUENCE purchaseid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER purchaseid_tr BEFORE
    INSERT ON purchase
    FOR EACH ROW
BEGIN
    SELECT
        purchaseid_seq.NEXTVAL
    INTO :new.purchaseid
    FROM
        dual;

END;
/
-- Detail IDs

CREATE SEQUENCE detailid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER detailid_tr BEFORE
    INSERT ON purchasedetail
    FOR EACH ROW
BEGIN
    SELECT
        detailid_seq.NEXTVAL
    INTO :new.detailid
    FROM
        dual;

END;
/
-- Shipment IDs

CREATE SEQUENCE shipmentid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER shipmentid_tr BEFORE
    INSERT ON shipment
    FOR EACH ROW
BEGIN
    SELECT
        shipmentid_seq.NEXTVAL
    INTO :new.shipmentid
    FROM
        dual;

END;
/
-- Shipment Type IDs

CREATE SEQUENCE shiptypeid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER shiptypeid_tr BEFORE
    INSERT ON shipmenttype
    FOR EACH ROW
BEGIN
    SELECT
        shiptypeid_seq.NEXTVAL
    INTO :new.shiptypeid
    FROM
        dual;

END;
/
-- Warehouse IDs

CREATE SEQUENCE warehouseid_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER warehouseid_tr BEFORE
    INSERT ON warehouse
    FOR EACH ROW
BEGIN
    SELECT
        warehouseid_seq.NEXTVAL
    INTO :new.warehouseid
    FROM
        dual;

END;
/

---------------------------------------------
-- Date Check Triggers.
-- Replacing constraints with triggers that give
-- proper error message.
---------------------------------------------

-- Membership date check:

ALTER TABLE membership DROP CONSTRAINT dateck;

CREATE OR REPLACE TRIGGER memdateck_tr BEFORE
    INSERT OR UPDATE ON membership
    FOR EACH ROW
BEGIN
    -- Membership expiry date should be after issue date.
    IF ( :new.issuedate > :new.expirydate ) THEN
        raise_application_error(-20531, 'Membership expiry date cannot be before issue date.');
    END IF;
END;
/
-- Shipment date check:

ALTER TABLE shipment DROP CONSTRAINT shipmentdateck;

CREATE OR REPLACE TRIGGER shipdateck_tr BEFORE
    INSERT OR UPDATE ON shipment
    FOR EACH ROW
BEGIN
    -- Shipment arrival date cannot be before release date.
    IF ( :new.shipmentarrival < :new.shipmentrelease ) THEN
        raise_application_error(-20532, 'Shipment arrival date cannot be before release date.');
    END IF;
END;
/

---------------------------------------------
-- Employee salary Check Triggers according to Job.
---------------------------------------------
-- Employee salary check according to the job position 
-- IN PROGRESS

CREATE OR REPLACE TRIGGER salaryCK_tr BEFORE
    INSERT OR UPDATE ON employee
    FOR EACH ROW
BEGIN
    -- Booking should not be in the past
 if ( :new.salary < job.) THEN
    raise_application_error(-20111, 'Booking should not be in the past date');
END IF;
    -- Booking should not be backward
IF ( :new.datefrom > :new.dateto ) THEN
    raise_application_error(-20111, 'Booking should not be backward.');
END IF;
END;
/
