ALTER TABLE dga_pif_tv ADD COLUMN copyright_holder_name  VARCHAR(50) NOT NULL              AFTER copyright_holder;
ALTER TABLE dga_pif_tv ADD COLUMN copyright_holder_phone VARCHAR(20) NOT NULL              AFTER copyright_holder_name;
ALTER TABLE dga_pif_tv ADD COLUMN network                CHAR(1)     NOT NULL DEFAULT 'F'  AFTER program_length_other_description;
ALTER TABLE dga_pif_tv ADD COLUMN basic_cable            CHAR(1)     NOT NULL DEFAULT 'F'  AFTER network_syndication;
ALTER TABLE dga_pif_tv ADD COLUMN pay_tv                 CHAR(1)     NOT NULL DEFAULT 'F'  AFTER basic_cable_other_description;
ALTER TABLE dga_pif_tv ADD COLUMN pilot                  CHAR(1)     NOT NULL DEFAULT 'F'  AFTER pay_tv_other_description;




copyright_holder_name   = dga_pif_tv_copyright_holder_name,
copyright_holder_phone  = dga_pif_tv_copyright_holder_phone,
network                 = dga_pif_tv_network,
basic_cable             = dga_pif_tv_basic_cable,
pay_tv                  = dga_pif_tv_pay_tv,
pilot                   = dga_pif_tv_pilot,