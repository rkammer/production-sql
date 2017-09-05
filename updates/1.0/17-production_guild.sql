ALTER TABLE production_guild DROP COLUMN document_name;

ALTER TABLE production_guild ADD COLUMN signatory_entity   VARCHAR(50) NOT NULL AFTER guild_id;
ALTER TABLE production_guild ADD COLUMN payroll_company_id INTEGER     NOT NULL AFTER signatory_entity;
ALTER TABLE production_guild ADD COLUMN contract_number    VARCHAR(20) NOT NULL AFTER payroll_company_id;

UPDATE production_guild SET payroll_company_id = 4;

ALTER TABLE production_guild ADD CONSTRAINT fk_production_guild_payroll_company FOREIGN KEY (payroll_company_id) REFERENCES company (id);