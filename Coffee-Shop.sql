CREATE TABLE Employee(
  employee_id       INT         NOT NULL,
  first_name        varchar(30) NOT NULL,
  last_name         varchar(30) NOT NULL,
  hire_date         DATE        NOT NULL,
  job_title         varchar(30) NOT NULL,
  
  PRIMARY KEY (employee_id)
);

CREATE TABLE Coffee_Shop(
  shop_id           INT         NOT NULL,
  shop_name         varchar(30) NOT NULL,
  city              varchar(30) NOT NULL,
  state             char(2)     NOT NULL,
  
  PRIMARY KEY (shop_id)
);

CREATE TABLE Supplier (
  supplier_id       INT         NOT NULL,
  company_name      varchar(50) NOT NULL,
  country           varchar(30) NOT NULL,
  sales_contact_name varchar(60)NOT NULL,
  email             varchar(50) NOT NULL,
  
  PRIMARY KEY (supplier_id)
);

CREATE TABLE Coffee (
  coffee_id         INT         NOT NULL,
  shop_id           INT         NOT NULL,
  supplier_id       INT         NOT NULL,
  coffee_name       varchar(30) NOT NULL,
  price_per_pound   numeric(5,2)NOT NULL,
  
  PRIMARY KEY (coffee_id),
  FOREIGN KEY (shop_id) REFERENCES Coffee_Shop (shop_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier (supplier_id)
);

CREATE VIEW CusView AS
SELECT
  CONCAT(first_name,last_name) AS Name,
  employee_id,             
  hire_date,         
  job_title
  
FROM Employee;

CREATE INDEX CoffeeNameIndex ON Coffee(coffee_name);

INSERT INTO Employee (employee_id, first_name, last_name, hire_date, job_title) VALUES(5, "Ryan", "Smith", '2021-6-6', "Worker");
INSERT INTO Coffee_Shop (shop_id, shop_name, city, state) VALUES(8, "Ryans Coffee Shop", "Baltimore", pa);
INSERT INTO Supplier (supplier_id, company_name, country, sales_contact_name, email) VALUES(8, "Coffee House", "america", "ryan", "na@na.com");
