CREATE OR REPLACE TYPE customers_obj_type AS OBJECT
(customer_id NUMBER(8),
name VARCHAR2(255),
address VARCHAR2(50),
status VARCHAR2(50),
order_date date,
CONSTRUCTOR FUNCTION customers_obj_type
(SELF IN OUT NOCOPY customers_obj_type, customer_id NUMBER)
RETURN SELF AS RESULT,
CONSTRUCTOR FUNCTION customers_obj_type
(SELF IN OUT NOCOPY customers_obj_type, customer_id NUMBER,
name VARCHAR2, status VARCHAR2)
RETURN SELF AS RESULT);

CREATE OR REPLACE TYPE BODY customers_obj_type AS
CONSTRUCTOR FUNCTION customers_obj_type
(SELF IN OUT NOCOPY customers_obj_type, customer_id NUMBER)
RETURN SELF AS RESULT
IS
BEGIN
SELF.customer_id := customer_id;
SELECT name, address
INTO SELF.name, SELF.status
FROM customers
WHERE customer_id = SELF.customer_id;
RETURN;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RETURN;
END;
CONSTRUCTOR FUNCTION customers_obj_type
(SELF IN OUT NOCOPY customers_obj_type, customer_id NUMBER,
name VARCHAR2, status VARCHAR2)
RETURN SELF AS RESULT
IS
BEGIN
SELF.customer_id := customer_id;
SELF.name := name;
SELF.status := address;
RETURN;
END;
END;