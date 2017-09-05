ALTER TABLE production DROP COLUMN pilot;
ALTER TABLE production ADD  COLUMN production_show_type_id INT NOT NULL AFTER network_id;

UPDATE production SET production_show_type_id = 1;

ALTER TABLE production ADD CONSTRAINT fk_production_show_type FOREIGN KEY (production_show_type_id) REFERENCES production_show_type (id);