DECLARE
customer_obj customers_obj_type;
BEGIN
FOR rec IN (select c.customer_id, c.name, c.address, o.status, o.order_date
FROM customers c join orders o ON c.customer_id=o.customer_id
where status='Canceled')
LOOP
customer_obj := customers_obj_type(rec.customer_id, rec.name, rec.address,rec.status,rec.order_date);
  DBMS_OUTPUT.PUT_LINE ('Customer`s id: '|| customer_obj.customer_id);
  DBMS_OUTPUT.PUT_LINE ('Customer`s name: '|| customer_obj.name);
  DBMS_OUTPUT.PUT_LINE ('Customer`s address: '|| customer_obj.address);
  DBMS_OUTPUT.PUT_LINE ('Order status: '|| customer_obj.status);
  DBMS_OUTPUT.PUT_LINE ('Order date: '|| customer_obj.order_date);
  DBMS_OUTPUT.PUT_LINE ('');
END LOOP;
END;
