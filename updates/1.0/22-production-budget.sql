ALTER TABLE production DROP COLUMN gross_budget;
ALTER TABLE production DROP COLUMN net_budget;

ALTER TABLE production ADD COLUMN series_gross_budget  NUMERIC(15,2)  NOT NULL DEFAULT 0.00 AFTER tax_incentive;
ALTER TABLE production ADD COLUMN series_net_budget    NUMERIC(15,2)  NOT NULL DEFAULT 0.00 AFTER series_gross_budget;
ALTER TABLE production ADD COLUMN episode_gross_budget NUMERIC(15,2)  NOT NULL DEFAULT 0.00 AFTER series_net_budget;
ALTER TABLE production ADD COLUMN episode_net_budget   NUMERIC(15,2)  NOT NULL DEFAULT 0.00 AFTER episode_gross_budget;