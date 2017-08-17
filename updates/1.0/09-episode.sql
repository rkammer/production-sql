ALTER TABLE episode ADD COLUMN media_company_id  INTEGER NOT NULL AFTER title;
ALTER TABLE episode ADD COLUMN business_group_id INTEGER NOT NULL AFTER media_company_id;
ALTER TABLE episode ADD COLUMN network_id        INTEGER NOT NULL AFTER business_group_id;
ALTER TABLE episode ADD COLUMN production_id     INTEGER NOT NULL AFTER network_id;

UPDATE episode
   SET media_company_id  = 1,
       business_group_id = 1,
       network_id        = 1,
       production_id     = 1;

ALTER TABLE episode ADD CONSTRAINT fk_episode_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id);
ALTER TABLE episode ADD CONSTRAINT fk_episode_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id);
ALTER TABLE episode ADD CONSTRAINT fk_episode_network        FOREIGN KEY (network_id)        REFERENCES network        (id);
ALTER TABLE episode ADD CONSTRAINT fk_episode_production     FOREIGN KEY (production_id)     REFERENCES production     (id);