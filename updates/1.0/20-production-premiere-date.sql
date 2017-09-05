ALTER TABLE production DROP COLUMN network_production_start_date;
ALTER TABLE production DROP COLUMN network_production_end_date;

ALTER TABLE production ADD COLUMN premiere_date DATE AFTER post_production_end_date;