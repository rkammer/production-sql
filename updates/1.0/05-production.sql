ALTER TABLE production ADD COLUMN season_number   INT AFTER title;
ALTER TABLE production ADD COLUMN episodes_number INT AFTER season_number;
ALTER TABLE production ADD COLUMN production_stage_id INT NOT NULL;

ALTER TABLE production ADD CONSTRAINT fk_production_production_stage FOREIGN KEY (production_stage_id) REFERENCES production_stage (id);