ALTER TABLE production ADD COLUMN media_company_id   INTEGER NOT NULL AFTER title;
ALTER TABLE production ADD COLUMN business_group_id  INTEGER NOT NULL AFTER media_company_id;
ALTER TABLE production MODIFY network_id INTEGER NOT NULL AFTER business_group_id;
ALTER TABLE production MODIFY production_stage_id INT NOT NULL AFTER network_id;

ALTER TABLE production ADD COLUMN pilot CHAR(1) NOT NULL DEFAULT 'F' AFTER network_id;

UPDATE production SET media_company_id  = 1;
UPDATE production SET business_group_id = 1;

ALTER TABLE production ADD CONSTRAINT fk_production_media_company  FOREIGN KEY (media_company_id)   REFERENCES company           (id);
ALTER TABLE production ADD CONSTRAINT fk_production_business_group FOREIGN KEY (business_group_id)  REFERENCES business_group    (id);