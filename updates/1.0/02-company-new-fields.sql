ALTER TABLE company ADD COLUMN zipcode   VARCHAR(9)   AFTER state_code;
ALTER TABLE company ADD COLUMN faxnumber VARCHAR(20)  AFTER phone;
ALTER TABLE company ADD COLUMN email     VARCHAR(100) AFTER faxnumber;
