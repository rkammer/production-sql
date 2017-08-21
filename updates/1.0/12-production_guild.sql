ALTER TABLE production_guild ADD COLUMN dga_sideletter_six   CHAR(1) NOT NULL DEFAULT 'F' AFTER document_name;
ALTER TABLE production_guild ADD COLUMN dga_all_rights_media CHAR(1) NOT NULL DEFAULT 'F' AFTER dga_sideletter_six;

UPDATE production_guild
   SET dga_sideletter_six   = 'F',
       dga_all_rights_media = 'F';