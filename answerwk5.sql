DESCRIBE customers;

CREATE INDEX IdxPhone ON customers(mobile);
ALTER TABLE customers DROP INDEX IdxPhone;


CREATE USER IF NOT EXISTS 'bob'@'localhost' IDENTIFIED BY 'S$cu3r3!';

GRANT INSERT ON salesDB.* TO 'bob'@'localhost';


ALTER USER 'bob'@'localhost' IDENTIFIED BY 'P$55!23';
