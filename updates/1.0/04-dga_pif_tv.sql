ALTER TABLE dga_pif_tv ADD COLUMN copyright_holder_name  VARCHAR(50) NOT NULL              AFTER copyright_holder;
ALTER TABLE dga_pif_tv ADD COLUMN copyright_holder_phone VARCHAR(20) NOT NULL              AFTER copyright_holder_name;
ALTER TABLE dga_pif_tv ADD COLUMN network                CHAR(1)     NOT NULL DEFAULT 'F'  AFTER program_length_other_description;
ALTER TABLE dga_pif_tv ADD COLUMN basic_cable            CHAR(1)     NOT NULL DEFAULT 'F'  AFTER network_syndication;
ALTER TABLE dga_pif_tv ADD COLUMN pay_tv                 CHAR(1)     NOT NULL DEFAULT 'F'  AFTER basic_cable_other_description;
ALTER TABLE dga_pif_tv ADD COLUMN pilot                  CHAR(1)     NOT NULL DEFAULT 'F'  AFTER pay_tv_other_description;

