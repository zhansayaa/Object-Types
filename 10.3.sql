DECLARE
TYPE cus_type IS TABLE OF CUSTOMERS_OBJ_TYPE INDEX BY BINARY_INTEGER;
cus_tab cus_type;
BEGIN
  select 
  CUSTOMERS_OBJ_TYPE(c.customer_id, c.name, c.address, o.status, o.order_date)
BULK COLLECT INTO cus_tab
  FROM customers c join orders o ON c.customer_id=o.customer_id
  where c.customer_id in (44,45,47) and status = 'Canceled';
FOR i in 1..cus_tab.count
LOOP	
    DBMS_OUTPUT.PUT_LINE ('Customer`s id: '|| cus_tab(i).customer_id);
    DBMS_OUTPUT.PUT_LINE ('Customer`s name: '|| cus_tab(i).name);
    DBMS_OUTPUT.PUT_LINE ('Customer`s address: '|| cus_tab(i).address);
    DBMS_OUTPUT.PUT_LINE ('Order status: '|| cus_tab(i).status);
    DBMS_OUTPUT.PUT_LINE ('Order date: '|| cus_tab(i).order_date);
    DBMS_OUTPUT.PUT_LINE ('');
  END LOOP;
END;  
