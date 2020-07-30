DECLARE
TYPE cus_type IS TABLE OF CUSTOMERS_OBJ_TYPE INDEX BY BINARY_INTEGER;
cus_tab cus_type;
cnt integer :=0;
BEGIN
FOR REC IN (select c.customer_id, c.name, c.address, o.status, o.order_date
  FROM customers c join orders o ON c.customer_id=o.customer_id 
  where c.customer_id in (6,7,8) and status = 'Shipped')
LOOP
cnt := cnt + 1;
  cus_tab(cnt) := customers_obj_type(rec.customer_id, rec.name, rec.address,rec.status,rec.order_date);
  DBMS_OUTPUT.PUT_LINE ('Customer`s id: '|| cus_tab(cnt).customer_id);
  DBMS_OUTPUT.PUT_LINE ('Customer`s name: '|| cus_tab(cnt).name);
DBMS_OUTPUT.PUT_LINE ('Customer`s address: '|| cus_tab(cnt).address);
DBMS_OUTPUT.PUT_LINE ('Order status: '|| cus_tab(cnt).status);
  DBMS_OUTPUT.PUT_LINE ('Order date: '|| cus_tab(cnt).order_date);
  DBMS_OUTPUT.PUT_LINE ('');
END LOOP;
END;
