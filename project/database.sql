CREATE TABLE Employee (
    Employee_ID   INTEGER      PRIMARY KEY,
    First_Name    VARCHAR(50)  NOT NULL,
    Last_Name     VARCHAR(50)  NOT NULL,
    Street        VARCHAR(200), 
    Apartment     VARCHAR(200),
    City          VARCHAR(50),
    State         VARCHAR(50), 
    Postal_Code   INTEGER,
    Country       VARCHAR(100),
    Gender        VARCHAR(20),
    Phone_Number  VARCHAR(10),
    Store_ID      INTEGER      NOT NULL,
    Department_ID INTEGER      NOT NULL
);

CREATE TABLE Schedule (
    Schedule_ID   INTEGER      PRIMARY KEY,
    Day_Of_Week   VARCHAR(10)  NOT NULL,
    Start_Time    VARCHAR(10)  NOT NULL,
    End_Time      VARCHAR(10)  NOT NULL,
    Employee_ID   INTEGER      NOT NULL
);

CREATE TABLE Department (
    Department_ID   INTEGER       PRIMARY KEY,
    Department_Name VARCHAR(50)   NOT NULL,
    Location        VARCHAR(100)  NOT NULL,
    Store_ID        INTEGER       NOT NULL
);

CREATE TABLE Sale (
    Sale_ID       INTEGER      PRIMARY KEY,
    SaleDateTime  VARCHAR(50),
    PaymentMethod VARCHAR(50),
    Employee_ID   INTEGER      NOT NULL,
    Store_ID      INTEGER      NOT NULL
);

CREATE TABLE Store (
    Store_ID      INTEGER      PRIMARY KEY,
    Street        VARCHAR(200),
    City          VARCHAR(50),
    State         VARCHAR(50),
    Zip_Code      INTEGER,
    Country       VARCHAR(100)
);

CREATE TABLE Product (
    Product_ID           INTEGER        PRIMARY KEY,
    Product_Name         VARCHAR(50)    NOT NULL,
    Product_Cost         FLOAT,
    Sell_Price           FLOAT,
    Quantity_In_Stock    INTEGER,
    Max_Quantity         INTEGER,
    Department_ID        INTEGER        NOT NULL
);

CREATE TABLE ProductOrder (
    Product_Order_ID     INTEGER        PRIMARY KEY,
    Quantity             INTEGER        NOT NULL,
    Price_Paid           FLOAT          NOT NULL,
    Product_ID           INTEGER        NOT NULL,
    Sale_ID              INTEGER        NOT NULL
);

ALTER TABLE Employee
    ADD CONSTRAINT fk_employee_storeid
        FOREIGN KEY (Store_ID)
        REFERENCES Store (Store_ID);

ALTER TABLE Employee
    ADD CONSTRAINT fk_employee_departmentid
        FOREIGN KEY (Department_ID)
        REFERENCES Department (Department_ID);

ALTER TABLE Schedule
    ADD CONSTRAINT fk_schedule_employeeid
        FOREIGN KEY (Employee_ID)
        REFERENCES Employee (Employee_ID);

ALTER TABLE Department
    ADD CONSTRAINT fk_department_storeid
        FOREIGN KEY (Store_ID)
        REFERENCES Store (Store_ID);

ALTER TABLE Sale
    ADD CONSTRAINT fk_sale_employeeid
        FOREIGN KEY (Employee_ID)
        REFERENCES Employee (Employee_ID);

ALTER TABLE Sale
    ADD CONSTRAINT fk_sale_storeid
        FOREIGN KEY (Store_ID)
        REFERENCES Store (Store_ID);

ALTER TABLE Product
       ADD CONSTRAINT fk_product_departmentid
           FOREIGN KEY (Department_ID)
           REFERENCES Department (Department_ID);

ALTER TABLE ProductOrder
       ADD CONSTRAINT fk_productorder_productid
           FOREIGN KEY (Product_ID)
           REFERENCES Product (Product_ID);

ALTER TABLE ProductOrder
       ADD CONSTRAINT fk_productorder_saleid
           FOREIGN KEY (Sale_ID)
           REFERENCES Sale (Sale_ID);

INSERT INTO Store VALUES (
    1,
    "FakeStreet",
    "New York City",
    "New York",
    12345,
    "USA"
);

INSERT INTO Department VALUES (
    1,
    "Hardware",
    "Back Right",
    1
);

INSERT INTO Employee VALUES (
    1,
    "John",
    "Doe",
    "FakeStreet",
    "FakeApt",
    "New York City",
    "New York",
    12345,
    "USA",
    "Male",
    123456789,
    1,
    1
);

INSERT INTO Schedule VALUES (
    1,
    "Saturday",
    "9:00AM",
    "6:00PM",
    1
);

INSERT INTO Product VALUES (
    1,
    "Air",
    4,
    5,
    100,
    200,
    1
);

INSERT INTO Sale VALUES (
    1,
    "11/16/2021 11:20AM",
    "Cash",
    1,
    1
);

INSERT INTO ProductOrder VALUES (
    1,
    1,
    5,
    1,
    1
);