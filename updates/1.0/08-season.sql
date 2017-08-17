ALTER TABLE season ADD COLUMN media_company_id  INTEGER NOT NULL AFTER season_number;
ALTER TABLE season ADD COLUMN business_group_id INTEGER NOT NULL AFTER media_company_id;
ALTER TABLE season ADD COLUMN network_id        INTEGER NOT NULL AFTER business_group_id;

UPDATE season
   SET media_company_id  = 1,
       business_group_id = 1,
       network_id        = 1;

ALTER TABLE season ADD CONSTRAINT fk_season_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id);
ALTER TABLE season ADD CONSTRAINT fk_season_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id);
ALTER TABLE season ADD CONSTRAINT fk_network_id            FOREIGN KEY (network_id)        REFERENCES network        (id);