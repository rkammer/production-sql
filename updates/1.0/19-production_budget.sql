ALTER TABLE production ADD COLUMN tax_incentive CHAR(1)        NOT NULL DEFAULT 'F'  AFTER budget;
ALTER TABLE production ADD COLUMN gross_budget  NUMERIC(15,2)  NOT NULL DEFAULT 0.00 AFTER tax_incentive;
ALTER TABLE production ADD COLUMN net_budget    NUMERIC(15,2)  NOT NULL DEFAULT 0.00 AFTER gross_budget;

UPDATE production SET gross_budget = budget, tax_incentive = 'F';

ALTER TABLE production DROP COLUMN budget;