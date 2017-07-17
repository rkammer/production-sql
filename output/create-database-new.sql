CREATE TABLE state(
    code       CHAR(2)     NOT NULL,
    name       VARCHAR(50) NOT NULL,
    created    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(30),
    updated    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by VARCHAR(30),
    status     VARCHAR(30),
    CONSTRAINT pk_state_code PRIMARY KEY (code)
);

 CREATE TABLE company(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    address              VARCHAR(100),
    city                 VARCHAR(100),
    state_code           CHAR(2),
    phone                VARCHAR(20),
    website              VARCHAR(100),
    logo_path            VARCHAR(120),
    media_company        CHAR(1) NOT NULL DEFAULT 'F',
    production_company   CHAR(1) NOT NULL DEFAULT 'F',
    payroll_company      CHAR(1) NOT NULL DEFAULT 'F',
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_company_id    PRIMARY KEY (id),
    CONSTRAINT fk_company_state FOREIGN KEY (state_code) REFERENCES state (code)
);

 CREATE TABLE network(
    id               INTEGER     NOT NULL AUTO_INCREMENT,
    name             VARCHAR(50) NOT NULL,
    media_company_id INTEGER     NOT NULL,
    logo_path        VARCHAR(120),
    created          TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by       VARCHAR(30),
    updated          TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by       VARCHAR(30),
    status           VARCHAR(30),
    CONSTRAINT       pk_network_id            PRIMARY KEY (id),
    CONSTRAINT       fk_network_media_company FOREIGN KEY (media_company_id) REFERENCES company (id)
);

 CREATE TABLE production_length(
    id         INTEGER     NOT NULL AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    created    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(30),
    updated    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by VARCHAR(30),
    status     VARCHAR(30),
    CONSTRAINT pk_production_length_id PRIMARY KEY (id)
);

 CREATE TABLE production_type(
    id         INTEGER     NOT NULL AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    created    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(30),
    updated    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by VARCHAR(30),
    status     VARCHAR(30),
    CONSTRAINT pk_production_type_id PRIMARY KEY (id)
);

 CREATE TABLE production(
    id                               INTEGER        NOT NULL AUTO_INCREMENT,
    title                            VARCHAR(50)    NOT NULL,
    budget                           NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    writing_start_date               DATE,
    writing_end_date                 DATE,
    pre_production_start_date        DATE,
    pre_production_end_date          DATE,
    photography_start_date           DATE,
    photography_end_date             DATE,
    post_production_start_date       DATE,
    post_production_end_date         DATE,
    network_production_start_date    DATE,
    network_production_end_date      DATE,
    production_length_id             INTEGER        NOT NULL,
    network_id                       INTEGER        NOT NULL,
    production_type_id               INTEGER        NOT NULL,
    production_company_id            INTEGER        NOT NULL,
    payroll_company_id               INTEGER        NOT NULL,
    logo_path                        VARCHAR(120),
    created                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by                       VARCHAR(30),
    updated                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                       VARCHAR(30),
    status                           VARCHAR(30),
    CONSTRAINT pk_production_id                  PRIMARY KEY (id),
    CONSTRAINT fk_production_network             FOREIGN KEY (network_id)                 REFERENCES network           (id),
    CONSTRAINT fk_production_production_length   FOREIGN KEY (production_length_id)       REFERENCES production_length (id),
    CONSTRAINT fk_production_production_type     FOREIGN KEY (production_type_id)         REFERENCES production_type   (id),
    CONSTRAINT fk_production_production_company  FOREIGN KEY (production_company_id)      REFERENCES company           (id),
    CONSTRAINT fk_production_payroll_company     FOREIGN KEY (payroll_company_id)         REFERENCES company           (id)
);

 CREATE TABLE production_state(
    production_id       INTEGER NOT NULL,
    state_id            INTEGER NOT NULL,
    created             TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by          VARCHAR(30),
    updated             TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by          VARCHAR(30),
    status              VARCHAR(30),
    CONSTRAINT pk_production_state            PRIMARY KEY (production_id, state_id),
    CONSTRAINT fk_production_state_production FOREIGN KEY (production_id) REFERENCES production (id),
    CONSTRAINT fk_production_state_state      FOREIGN KEY (state_id)      REFERENCES state      (id)
);

 CREATE TABLE deal_type(
    id              INTEGER      NOT NULL AUTO_INCREMENT,
    abreviation     CHAR(2),
    name            VARCHAR(50),
    created         TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    created_by      VARCHAR(30),
    updated         TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by      VARCHAR(30),
    status          VARCHAR(30),
    CONSTRAINT pk_deal_type_id    PRIMARY KEY (id)
);



 CREATE TABLE field_work(
    id              INTEGER     NOT NULL AUTO_INCREMENT,
    abreviation     CHAR(2)     NOT NULL,
    name            VARCHAR(50) NOT NULL,
    created         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by      VARCHAR(30),
    updated         TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by      VARCHAR(30),
    status          VARCHAR(30),
    CONSTRAINT pk_field_work_id    PRIMARY KEY (id)
);

 CREATE TABLE season(
    id                               INTEGER        NOT NULL AUTO_INCREMENT,
    title                            VARCHAR(50)    NOT NULL,
    season_number                    INTEGER        NOT NULL,
    production_id                    INTEGER        NOT NULL,
    budget                           NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    writing_start_date               DATE,
    writing_end_date                 DATE,
    pre_production_start_date        DATE,
    pre_production_end_date          DATE,
    photography_start_date           DATE,
    photography_end_date             DATE,
    post_production_start_date       DATE,
    post_production_end_date         DATE,
    network_production_start_date    DATE,
    network_production_end_date      DATE,
    logo_path                        VARCHAR(120),
    created                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by                       VARCHAR(30),
    updated                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                       VARCHAR(30),
    status                           VARCHAR(30),
    CONSTRAINT pk_season_id          PRIMARY KEY (id),
    CONSTRAINT fk_season_production  FOREIGN KEY (production_id) REFERENCES production (id)
);

 CREATE TABLE episode(
    id                               INTEGER        NOT NULL AUTO_INCREMENT,
    title                            VARCHAR(50)    NOT NULL,
    season_id                        INTEGER        NOT NULL,
    episode_number                   INTEGER        NOT NULL,
    budget                           NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    writing_start_date               DATE,
    writing_end_date                 DATE,
    pre_production_start_date        DATE,
    pre_production_end_date          DATE,
    photography_start_date           DATE,
    photography_end_date             DATE,
    post_production_start_date       DATE,
    post_production_end_date         DATE,
    network_production_start_date    DATE,
    network_production_end_date      DATE,
    created                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by                       VARCHAR(30),
    updated                          TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                       VARCHAR(30),
    status                           VARCHAR(30),
    CONSTRAINT pk_episode_id         PRIMARY KEY (id),
    CONSTRAINT fk_episode_season     FOREIGN KEY (season_id) REFERENCES season (id)
);

 CREATE OR REPLACE VIEW company_get_list(
    company_id,
    company_name,
    company_address,
    company_city,
    company_state_code,
    company_state_name,
    company_phone,
    company_website,
    company_logo_path,
    company_media_company,
    company_production_company,
    company_payroll_company,
    company_created,
    company_created_by,
    company_updated,
    company_updated_by,
    company_status
) AS
    SELECT company.id                                            AS company_id,
           company.name                                          AS company_name,
           company.address                                       AS company_address,
           company.city                                          AS company_city,
           company.state_code                                    AS company_state_code,
           state.name                                            AS company_state_name,
           company.phone                                         AS company_phone,
           company.website                                       AS company_website,
           company.logo_path                                     AS company_logo_path,
           company.media_company                                 AS company_media_company,
           company.production_company                            AS company_production_company,
           company.payroll_company                               AS company_payroll_company,
           DATE_FORMAT(company.created,'%m/%d/%Y %H:%i:%S')      AS company_created,
           company.created_by                                    AS company_created_by,
           DATE_FORMAT(company.updated,'%m/%d/%Y %H:%i:%S')      AS company_updated,
           company.updated_by                                    AS company_updated_by,
           company.status                                        AS company_status
      FROM company AS company LEFT JOIN state AS state on state.code = company.state_code;

 CREATE OR REPLACE VIEW company_media_get_list(
    company_media_id,
    company_media_name,
    company_media_address,
    company_media_city,
    company_media_state_code,
    company_media_state_name,
    company_media_phone,
    company_media_website,
    company_media_logo_path,
    company_media_media_company,
    company_media_production_company,
    company_media_payroll_company,
    company_media_created,
    company_media_created_by,
    company_media_updated,
    company_media_updated_by,
    company_media_status
) AS
    SELECT company_media.id                                            AS company_media_id,
           company_media.name                                          AS company_media_name,
           company_media.address                                       AS company_media_address,
           company_media.city                                          AS company_media_city,
           company_media.state_code                                    AS company_media_state_code,
           state.name                                                  AS company_media_state_name,
           company_media.phone                                         AS company_media_phone,
           company_media.website                                       AS company_media_website,
           company_media.logo_path                                     AS company_media_logo_path,
           company_media.media_company                                 AS company_media_media_company,
           company_media.production_company                            AS company_media_production_company,
           company_media.payroll_company                               AS company_media_payroll_company,
           DATE_FORMAT(company_media.created,'%m/%d/%Y %H:%i:%S')      AS company_media_created,
           company_media.created_by                                    AS company_media_created_by,
           DATE_FORMAT(company_media.updated,'%m/%d/%Y %H:%i:%S')      AS company_media_updated,
           company_media.updated_by   AS company_media_updated_by,
           company_media.status                                        AS company_media_status
      FROM company AS company_media LEFT JOIN state AS state on state.code = company_media.state_code
     WHERE company_media.media_company = 'T';

 CREATE OR REPLACE VIEW company_production_get_list(
    company_production_id,
    company_production_name,
    company_production_address,
    company_production_city,
    company_production_state_code,
    company_production_state_name,
    company_production_phone,
    company_production_website,
    company_production_logo_path,
    company_production_media_company,
    company_production_production_company,
    company_production_payroll_company,
    company_production_created,
    company_production_created_by,
    company_production_updated,
    company_production_updated_by,
    company_production_status
) AS
    SELECT company_production.id                                            AS company_production_id,
           company_production.name                                          AS company_production_name,
           company_production.address                                       AS company_production_address,
           company_production.city                                          AS company_production_city,
           company_production.state_code                                    AS company_production_state_code,
           state.name                                                       AS company_production_state_name,
           company_production.phone                                         AS company_production_phone,
           company_production.website                                       AS company_production_website,
           company_production.logo_path                                     AS company_production_logo_path,
           company_production.media_company                                 AS company_production_media_company,
           company_production.production_company                            AS company_production_production_company,
           company_production.payroll_company                               AS company_production_payroll_company,
           DATE_FORMAT(company_production.created,'%m/%d/%Y %H:%i:%S')      AS company_production_created,
           company_production.created_by                                    AS company_production_created_by,
           DATE_FORMAT(company_production.updated,'%m/%d/%Y %H:%i:%S')      AS company_production_updated,
           company_production.updated_by                                    AS company_production_updated_by,
           company_production.status                                        AS company_production_status
      FROM company AS company_production LEFT JOIN state AS state on state.code = company_production.state_code
     WHERE company_production.production_company = 'T';

 CREATE OR REPLACE VIEW company_payroll_get_list(
    company_payroll_id,
    company_payroll_name,
    company_payroll_address,
    company_payroll_city,
    company_payroll_state_code,
    company_payroll_state_name,
    company_payroll_phone,
    company_payroll_website,
    company_payroll_logo_path,
    company_payroll_media_company,
    company_payroll_production_company,
    company_payroll_payroll_company,
    company_payroll_created,
    company_payroll_created_by,
    company_payroll_updated,
    company_payroll_updated_by,
    company_payroll_status
) AS
    SELECT company_payroll.id                                            AS company_payroll_id,
           company_payroll.name                                          AS company_payroll_name,
           company_payroll.address                                       AS company_payroll_address,
           company_payroll.city                                          AS company_payroll_city,
           company_payroll.state_code                                    AS company_payroll_state_code,
           state.name                                                    AS company_payroll_state_name,
           company_payroll.phone                                         AS company_payroll_phone,
           company_payroll.website                                       AS company_payroll_website,
           company_payroll.logo_path                                     AS company_payroll_logo_path,
           company_payroll.media_company                                 AS company_payroll_media_company,
           company_payroll.production_company                            AS company_payroll_production_company,
           company_payroll.payroll_company                               AS company_payroll_payroll_company,
           DATE_FORMAT(company_payroll.created,'%m/%d/%Y %H:%i:%S')      AS company_payroll_created,
           company_payroll.created_by                                    AS company_payroll_created_by,
           DATE_FORMAT(company_payroll.updated,'%m/%d/%Y %H:%i:%S')      AS company_payroll_updated,
           company_payroll.updated_by                                    AS company_payroll_updated_by,
           company_payroll.status                                        AS company_payroll_status
      FROM company AS company_payroll LEFT JOIN state AS state on state.code = company_payroll.state_code
     WHERE company_payroll.payroll_company = 'T';

 CREATE OR REPLACE VIEW network_get_list(
    network_id,
    network_name,
    network_media_company_id,
    network_media_company_name,
    network_logo_path,
    network_created,
    network_created_by,
    network_updated,
    network_updated_by,
    network_status
) AS
    SELECT network.id                                            AS network_id,
           network.name                                          AS network_name,
           network.media_company_id                              AS network_media_company_id,
           media_company.name                                    AS network_media_company_name,
           network.logo_path                                     AS network_logo_path,
           DATE_FORMAT(network.created,'%m/%d/%Y %H:%i:%S')      AS network_created,
           network.created_by                                    AS network_created_by,
           DATE_FORMAT(network.updated,'%m/%d/%Y %H:%i:%S')      AS network_updated,
           network.updated_by                                    AS network_updated_by,
           network.status                                        AS network_status
      FROM network AS network INNER JOIN company AS media_company ON media_company.id = network.media_company_id;

 CREATE VIEW state_get_list(
    state_code,
    state_name,
    state_created,
    state_created_by,
    state_updated,
    state_updated_by,
    state_status
) AS
    SELECT state.code                                      AS state_code,
           state.name                                      AS state_name,
           DATE_FORMAT(state.created,'%m/%d/%Y %H:%i:%S')  AS state_created,
           state.created_by                                AS state_created_by,
           DATE_FORMAT(state.updated,'%m/%d/%Y %H:%i:%S')  AS state_updated,
           state.updated_by                                AS state_updated_by,
           state.status                                    AS state_status
      FROM state AS state;

 CREATE OR REPLACE VIEW production_length_get_list(
    production_length_id,
    production_length_name,
    production_length_created,
    production_length_created_by,
    production_length_updated,
    production_length_updated_by,
    production_length_status
) AS
    SELECT production_length.id                                            AS production_length_id,
           production_length.name                                          AS production_length_name,
           DATE_FORMAT(production_length.created,'%m/%d/%Y %H:%i:%S')      AS production_length_created,
           production_length.created_by                                    AS production_length_created_by,
           DATE_FORMAT(production_length.updated,'%m/%d/%Y %H:%i:%S')      AS production_length_updated,
           production_length.updated_by                                    AS production_length_updated_by,
           production_length.status                                        AS production_length_status
      FROM production_length                                               AS production_length;

 CREATE OR REPLACE VIEW production_type_get_list(
    production_type_id,
    production_type_name,
    production_type_created,
    production_type_created_by,
    production_type_updated,
    production_type_updated_by,
    production_type_status
) AS
    SELECT production_type.id                                            AS production_type_id,
           production_type.name                                          AS production_type_name,
           DATE_FORMAT(production_type.created,'%m/%d/%Y %H:%i:%S')      AS production_type_created,
           production_type.created_by                                    AS production_type_created_by,
           DATE_FORMAT(production_type.updated,'%m/%d/%Y %H:%i:%S')      AS production_type_updated,
           production_type.updated_by                                    AS production_type_updated_by,
           production_type.status                                        AS production_type_status
      FROM production_type                                               AS production_type;

 CREATE OR REPLACE VIEW production_get_list(
    production_id,
    production_title,
    production_budget,
    production_writing_start_date,
    production_writing_end_date,
    production_pre_production_start_date,
    production_pre_production_end_date,
    production_photography_start_date,
    production_photography_end_date,
    production_post_production_start_date,
    production_post_production_end_date,
    production_network_production_start_date,
    production_network_production_end_date,
    production_production_length_id,
    production_production_length_name,
    production_network_id,
    production_network_name,
    production_production_type_id,
    production_production_type_name,
    production_production_company_id,
    production_production_company_name,
    production_payroll_company_id,
    production_payroll_name,
    production_logo_path,
    production_created,
    production_created_by,
    production_updated,
    production_updated_by,
    production_status
) AS
    SELECT production.id                                                       AS production_id,
           production.title                                                    AS production_title,
           production.budget                                                   AS production_budget,
           production.writing_start_date                                       AS production_writing_start_date,
           production.writing_end_date                                         AS production_writing_end_date,
           DATE_FORMAT(production.pre_production_start_date,'%m/%d/%Y')        AS production_pre_production_start_date,
           DATE_FORMAT(production.pre_production_end_date,'%m/%d/%Y')          AS production_pre_production_end_date,
           DATE_FORMAT(production.photography_start_date,'%m/%d/%Y')           AS production_photography_start_date,
           DATE_FORMAT(production.photography_end_date,'%m/%d/%Y')             AS production_photography_end_date,
           DATE_FORMAT(production.post_production_start_date,'%m/%d/%Y')       AS production_post_production_start_date,
           DATE_FORMAT(production.post_production_end_date,'%m/%d/%Y')         AS production_post_production_end_date,
           DATE_FORMAT(production.network_production_start_date,'%m/%d/%Y')    AS production_network_production_start_date,
           DATE_FORMAT(production.network_production_end_date,'%m/%d/%Y')      AS production_network_production_end_date,
           production.production_length_id                                     AS production_production_length_id,
           production_length.name                                              AS production_production_length_name,
           production.network_id                                               AS production_network_id,
           network.name                                                        AS production_network_name,
           production.production_type_id                                       AS production_production_type_id,
           production_type.name                                                AS production_production_type_name,
           production.production_company_id                                    AS production_production_company_id,
           production_company.name                                             AS production_production_company_name,
           production.payroll_company_id                                       AS production_payroll_company_id,
           payroll_company.name                                                AS production_payroll_name,
           production.logo_path                                                AS production_logo_path,
           DATE_FORMAT(production.created,'%m/%d/%Y %H:%i:%S')                 AS production_created,
           production.created_by                                               AS production_created_by,
           DATE_FORMAT(production.updated,'%m/%d/%Y %H:%i:%S')                 AS production_updated,
           production.updated_by                                               AS production_updated_by,
           production.status                                                   AS production_status
      FROM production AS production INNER JOIN network             AS network            ON network.id             =   production.network_id
                                    INNER JOIN production_length   AS production_length  ON production_length.id   =   production.production_length_id
                                    INNER JOIN production_type     AS production_type    ON production_type.id     =   production.production_type_id
                                    INNER JOIN company             AS production_company ON production_company.id  =   production.production_company_id
                                    INNER JOIN company             AS payroll_company    ON payroll_company.id     =   production.payroll_company_id;

 CREATE OR REPLACE VIEW production_state_get_list(
    production_state_production_id,
    production_state_state_id,
    production_state_created,
    production_state_created_by,
    production_state_updated,
    production_state_updated_by,
    production_state_status
) AS
SELECT production_state.production_id                                  AS production_state_production_id,
       production_state.state_id                                       AS production_state_state_id,
       DATE_FORMAT(production_state.created,'%m/%d/%Y %H:%i:%S')       AS production_state_created,
       production_state.created_by                                     AS production_state_created_by,
       DATE_FORMAT(production_state.updated,'%m/%d/%Y %H:%i:%S')       AS production_state_updated,
       production_state.updated_by                                     AS production_state_updated_by,
       production_state.status                                         AS production_state_status
  FROM production_state AS production_state;

 CREATE OR REPLACE VIEW deal_type_get_list(
    deal_type_id,
    deal_type_abreviation,
    deal_type_name,
    deal_type_created,
    deal_type_created_by,
    deal_type_updated,
    deal_type_updated_by,
    deal_type_status
) AS
    SELECT deal_type.id                                            AS deal_type_id,
           deal_type.abreviation                                   AS deal_type_abreviation,
           deal_type.name                                          AS deal_type_name,
           DATE_FORMAT(deal_type.created,'%m/%d/%Y %H:%i:%S')      AS deal_type_created,
           deal_type.created_by                                    AS deal_type_created_by,
           DATE_FORMAT(deal_type.updated,'%m/%d/%Y %H:%i:%S')      AS deal_type_updated,
           deal_type.updated_by                                    AS deal_type_updated_by,
           deal_type.status                                        AS deal_type_status
      FROM deal_type AS deal_type;

 CREATE OR REPLACE VIEW field_work_get_list(
    field_work_id,
    field_work_abreviation,
    field_work_name,
    field_work_created,
    field_work_created_by,
    field_work_updated,
    field_work_updated_by,
    field_work_status
) AS
    SELECT field_work.id                                            AS field_work_id,
           field_work.abreviation                                   AS field_work_abreviation,
           field_work.name                                          AS field_work_name,
           DATE_FORMAT(field_work.created,'%m/%d/%Y %H:%i:%S')      AS field_work_created,
           field_work.created_by                                    AS field_work_created_by,
           DATE_FORMAT(field_work.updated,'%m/%d/%Y %H:%i:%S')      AS field_work_updated,
           field_work.updated_by                                    AS field_work_updated_by,
           field_work.status                                        AS field_work_status
      FROM field_work AS field_work;

 CREATE OR REPLACE VIEW season_get_list(
    season_id,
    season_title,
    season_season_number,
    season_production_id,
    season_production_title,
    season_budget,
    season_production_production_length_id,
    season_production_production_length_name,
    season_production_network_id,
    season_production_network_name,
    season_production_production_type_id,
    season_production_production_type_name,
    season_writing_start_date,
    season_writing_end_date,
    season_pre_production_start_date,
    season_pre_production_end_date,
    season_photography_start_date,
    season_photography_end_date,
    season_post_production_start_date,
    season_post_production_end_date,
    season_network_production_start_date,
    season_network_production_end_date,
    season_logo_path,
    season_created,
    season_created_by,
    season_updated,
    season_updated_by,
    season_status
) AS
    SELECT season.id                                                               AS season_id,
           season.title                                                            AS season_title,
           LPAD(season.season_number, 2, 0)                                        AS season_season_number,
           season.production_id                                                    AS season_production_id,
           production.title                                                        AS season_production_title,
           season.budget                                                           AS season_budget,
           production.production_length_id                                         AS season_production_production_length_id,
           production_length.name                                                  AS season_production_production_length_name,
           production.network_id                                                   AS season_production_network_id,
           network.name                                                            AS season_production_network_name,
           production.production_type_id                                           AS season_production_production_type_id,
           production_type.name                                                    AS season_production_production_type_name,
           DATE_FORMAT(season.writing_start_date,'%m/%d/%Y')                       AS season_writing_start_date,
           DATE_FORMAT(season.writing_end_date,'%m/%d/%Y')                         AS season_writing_end_date,
           DATE_FORMAT(season.pre_production_start_date,'%m/%d/%Y')                AS season_pre_production_start_date,
           DATE_FORMAT(season.pre_production_end_date,'%m/%d/%Y')                  AS season_pre_production_end_date,
           DATE_FORMAT(season.photography_start_date,'%m/%d/%Y')                   AS season_photography_start_date,
           DATE_FORMAT(season.photography_end_date,'%m/%d/%Y')                     AS season_photography_end_date,
           DATE_FORMAT(season.post_production_start_date,'%m/%d/%Y')               AS season_post_production_start_date,
           DATE_FORMAT(season.post_production_end_date,'%m/%d/%Y')                 AS season_post_production_end_date,
           DATE_FORMAT(season.network_production_start_date,'%m/%d/%Y')            AS season_network_production_start_date,
           DATE_FORMAT(season.network_production_end_date,'%m/%d/%Y')              AS season_network_production_end_date,
           season.logo_path                                                        AS season_logo_path,
           DATE_FORMAT(season.created,'%m/%d/%Y %H:%i:%S')                         AS season_created,
           season.created_by                                                       AS season_created_by,
           DATE_FORMAT(season.updated,'%m/%d/%Y %H:%i:%S')                         AS season_updated,
           season.updated_by                                                       AS season_updated_by,
           season.status                                                           AS season_status
      FROM season AS season INNER JOIN production          AS production         ON production.id = season.production_id
                            INNER JOIN network             AS network            ON network.id             =   production.network_id
                            INNER JOIN production_length   AS production_length  ON production_length.id   =   production.production_length_id
                            INNER JOIN production_type     AS production_type    ON production_type.id     =   production.production_type_id;

 CREATE OR REPLACE VIEW episode_get_list(
    episode_id,
    episode_title,
    episode_episode_number,
    episode_episode_abreviation,
    episode_season_id,
    episode_season_title,
    episode_season_number,
    episode_production_id,
    episode_production_title,
    episode_budget,
    episode_production_production_length_id,
    episode_production_production_length_name,
    episode_production_network_id,
    episode_production_network_name,
    episode_production_production_type_id,
    episode_production_production_type_name,
    episode_writing_start_date,
    episode_writing_end_date,
    episode_pre_production_start_date,
    episode_pre_production_end_date,
    episode_photography_start_date,
    episode_photography_end_date,
    episode_post_production_start_date,
    episode_post_production_end_date,
    episode_network_production_start_date,
    episode_network_production_end_date,
    episode_created,
    episode_created_by,
    episode_updated,
    episode_updated_by,
    episode_status
) AS
    SELECT episode.id                                                                               AS episode_id,
           episode.title                                                                            AS episode_title,
           LPAD(episode.episode_number, 2, 0)                                                       AS episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))   AS episode_episode_abreviation,
           episode.season_id                                                                        AS episode_season_id,
           season.title                                                                             AS episode_season_title,
           season.season_number                                                                     AS episode_season_number,
           season.production_id                                                                     AS episode_production_id,
           production.title                                                                         AS episode_production_title,
           season.budget                                                                            AS episode_budget,
           production.production_length_id                                                          AS episode_production_production_length_id,
           production_length.name                                                                   AS episode_production_production_length_name,
           production.network_id                                                                    AS episode_production_network_id,
           network.name                                                                             AS episode_production_network_name,
           production.production_type_id                                                            AS episode_production_production_type_id,
           production_type.name                                                                     AS episode_production_production_type_name,
           DATE_FORMAT(episode.writing_start_date,            '%m/%d/%Y')                           AS episode_writing_start_date,
           DATE_FORMAT(episode.writing_end_date,              '%m/%d/%Y')                           AS episode_writing_end_date,
           DATE_FORMAT(episode.pre_production_start_date,     '%m/%d/%Y')                           AS episode_pre_production_start_date,
           DATE_FORMAT(episode.pre_production_end_date,       '%m/%d/%Y')                           AS episode_pre_production_end_date,
           DATE_FORMAT(episode.photography_start_date,        '%m/%d/%Y')                           AS episode_photography_start_date,
           DATE_FORMAT(episode.photography_end_date,          '%m/%d/%Y')                           AS episode_photography_end_date,
           DATE_FORMAT(episode.post_production_start_date,    '%m/%d/%Y')                           AS episode_post_production_start_date,
           DATE_FORMAT(episode.post_production_end_date,      '%m/%d/%Y')                           AS episode_post_production_end_date,
           DATE_FORMAT(episode.network_production_start_date, '%m/%d/%Y')                           AS episode_network_production_start_date,
           DATE_FORMAT(episode.network_production_end_date,   '%m/%d/%Y')                           AS episode_network_production_end_date,
           DATE_FORMAT(episode.created,                       '%m/%d/%Y %H:%i:%S')                  AS episode_created,
           episode.created_by                                                                       AS episode_created_by,
           DATE_FORMAT(episode.updated,                       '%m/%d/%Y %H:%i:%S')                  AS episode_updated,
           episode.updated_by                                                                       AS episode_updated_by,
           episode.status                                                                           AS episode_status
      FROM episode AS episode INNER JOIN season              AS season             ON episode.season_id      = season.id
                              INNER JOIN production          AS production         ON production.id          = season.production_id
                              INNER JOIN network             AS network            ON network.id             = production.network_id
                              INNER JOIN production_length   AS production_length  ON production_length.id   = production.production_length_id
                              INNER JOIN production_type     AS production_type    ON production_type.id     = production.production_type_id;

 DELIMITER //
CREATE PROCEDURE company_set_list(
    INOUT company_id                   INTEGER,
    IN    company_name                 VARCHAR(50),
    IN    company_address              VARCHAR(100),
    IN    company_city                 VARCHAR(100),
    IN    company_state_code           CHAR(2),
    IN    company_phone                VARCHAR(20),
    IN    company_website              VARCHAR(100),
    IN    company_logo_path            VARCHAR(120),
    IN    company_media_company        CHAR(1),
    IN    company_production_company   CHAR(1),
    IN    company_payroll_company      CHAR(1),
    IN    company_created_by           VARCHAR(30),
    IN    company_updated_by           VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM company
     WHERE id = company_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO company
        (
            name,
            address,
            city,
            state_code,
            phone,
            website,
            logo_path,
            media_company,
            production_company,
            payroll_company,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            company_name,
            company_address,
            company_city,
            company_state_code,
            company_phone,
            company_website,
            company_logo_path,
            company_media_company,
            company_production_company,
            company_payroll_company,
            company_created_by,
            company_updated_by,
            'CREATED'
        );

        SET company_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE company
           SET name               =    company_name,
               address            =    company_address,
               city               =    company_city,
               state_code         =    company_state_code,
               phone              =    company_phone,
               website            =    company_website,
               logo_path          =    company_logo_path,
               media_company      =    company_media_company,
               production_company =    company_production_company,
               payroll_company    =    company_payroll_company,
               updated_by         =    company_updated_by,
               status             =    'UPDATED'
         WHERE id                 =    company_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE network_set_list(
    INOUT network_id                 INTEGER,
    IN    network_name               VARCHAR(50),
    IN    network_media_company_id   INTEGER,
    IN    network_logo_path          VARCHAR(120),
    IN    network_created_by         VARCHAR(30),
    IN    network_updated_by         VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM network
     WHERE id = network_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO network
        (
            media_company_id,
            name,
            logo_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            network_media_company_id,
            network_name,
            network_logo_path,
            network_created_by,
            network_updated_by,
            'CREATED'
        );

        SET network_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE network
           SET media_company_id = network_media_company_id,
               name             = network_name,
               logo_path        = network_logo_path,
               updated_by       = network_updated_by,
               status           = 'UPDATED'
         WHERE id               = network_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_length_set_list(
    INOUT production_length_id           INTEGER,
    IN    production_length_name         VARCHAR(50),
    IN    production_length_created_by   VARCHAR(30),
    IN    production_length_updated_by   VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_length
     WHERE id = production_length_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_length
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_length_name,
            production_length_logo_path,
            production_length_created_by,
            production_length_updated_by,
            'CREATED'
        );

        SET production_length_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_length
           SET name       = production_length_name,
               updated_by = production_length_updated_by,
               status     = 'UPDATED'
         WHERE id         = production_length_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_type_set_list(
    INOUT production_type_id           INTEGER,
    IN    production_type_name         VARCHAR(50),
    IN    production_type_created_by   VARCHAR(30),
    IN    production_type_updated_by   VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_type
     WHERE id = production_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_type
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_type_name,
            production_type_created_by,
            production_type_updated_by,
            'CREATED'
        );

        SET production_type_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_type
           SET name       = production_type_name,
               updated_by = production_type_updated_by,
               status     = 'UPDATED'
         WHERE id         = production_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_set_list(
    INOUT production_id                               INTEGER,
    IN    production_title                            VARCHAR(50),
    IN    production_budget                           NUMERIC(15,2),
    IN    production_writing_start_date               DATE,
    IN    production_writing_end_date                 DATE,
    IN    production_pre_production_start_date        DATE,
    IN    production_pre_production_end_date          DATE,
    IN    production_photography_start_date           DATE,
    IN    production_photography_end_date             DATE,
    IN    production_post_production_start_date       DATE,
    IN    production_post_production_end_date         DATE,
    IN    production_network_production_start_date    DATE,
    IN    production_network_production_end_date      DATE,
    IN    production_production_length_id             INTEGER,
    IN    production_network_id                       INTEGER,
    IN    production_production_type_id               INTEGER,
    IN    production_production_company_id            INTEGER,
    IN    production_payroll_company_id               INTEGER,
    IN    production_logo_path                        VARCHAR(120),
    IN    production_created_by                       VARCHAR(30),
    IN    production_updated_by                       VARCHAR(30),
    IN    production_status                           VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production
     WHERE id = production_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production
        (
            title,
            budget,
            writing_start_date,
            writing_end_date,
            pre_production_start_date,
            pre_production_end_date,
            photography_start_date,
            photography_end_date,
            post_production_start_date,
            post_production_end_date,
            network_production_start_date,
            network_production_end_date,
            production_length_id,
            network_id,
            production_type_id,
            production_company_id,
            payroll_company_id,
            logo_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_title,
            production_budget,
            production_writing_start_date,
            production_writing_end_date,
            production_pre_production_start_date,
            production_pre_production_end_date,
            production_photography_start_date,
            production_photography_end_date,
            production_post_production_start_date,
            production_post_production_end_date,
            production_network_production_start_date,
            production_network_production_end_date,
            production_production_length_id,
            production_network_id,
            production_production_type_id,
            production_production_company_id,
            production_payroll_company_id,
            production_logo_path,
            production_created_by,
            production_updated_by,
            'CREATED'
        );

        SET production_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production
           SET title                          =  production_title,
               budget                         =  production_budget,
               writing_start_date             =  production_writing_start_date,
               writing_end_date               =  production_writing_end_date,
               pre_production_start_date      =  production_pre_production_start_date,
               pre_production_end_date        =  production_pre_production_end_date,
               photography_start_date         =  production_photography_start_date,
               photography_end_date           =  production_photography_end_date,
               post_production_start_date     =  production_post_production_start_date,
               post_production_end_date       =  production_post_production_end_date,
               network_production_start_date  =  production_network_production_start_date,
               network_production_end_date    =  production_network_production_end_date,
               production_length_id           =  production_production_length_id,
               network_id                     =  production_network_id,
               production_type_id             =  production_production_type_id,
               production_company_id          =  production_production_company_id,
               payroll_company_id             =  production_payroll_company_id,
               logo_path                      =  production_logo_path,
               updated_by                     =  production_updated_by,
               status                         =  'UPDATED'
         WHERE id                             =   production_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 

 DELIMITER //
CREATE PROCEDURE deal_type_set_list(
    INOUT deal_type_id              INTEGER,
    IN    deal_type_abreviation     CHAR(2),
    IN    deal_type_name            CHAR(50),
    IN    deal_type_created_by      VARCHAR(30),
    IN    deal_type_updated_by      VARCHAR(30),
    IN    deal_type_status          VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM deal_type
     WHERE id = deal_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO deal_type
        (
            abreviation,
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            deal_type_abreviation,
            deal_type_name,
            deal_type_created_by,
            deal_type_updated_by,
            'CREATED'
        );

        SET deal_type_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE deal_type
           SET abreviation   = abreviation,
               name          = name,
               updated_by    = updated_by,
               status        = 'UPDATED'
         WHERE id            = deal_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE field_work_set_list(
    INOUT field_work_id              INTEGER,
    IN    field_work_abreviation     CHAR(2),
    IN    field_work_name            CHAR(50),
    IN    field_work_created_by      VARCHAR(30),
    IN    field_work_updated_by      VARCHAR(30),
    IN    field_work_status          VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM field_work
     WHERE id = field_work_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO field_work
        (
            abreviation,
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            field_work_abreviation,
            field_work_name,
            field_work_created_by,
            field_work_updated_by,
            'CREATED'
        );

        SET field_work_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE field_work
           SET abreviation   = abreviation,
               name          = name,
               updated_by    = updated_by,
               status        = 'UPDATED'
         WHERE id            = field_work_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE season_set_list(
    INOUT  season_id                               INTEGER,
    IN     season_title                            VARCHAR(50),
    IN     season_season_number                    INTEGER,
    IN     season_production_id                    INTEGER,
    IN     season_budget                           NUMERIC(15,2),
    IN     season_writing_start_date               DATE,
    IN     season_writing_end_date                 DATE,
    IN     season_pre_production_start_date        DATE,
    IN     season_pre_production_end_date          DATE,
    IN     season_photography_start_date           DATE,
    IN     season_photography_end_date             DATE,
    IN     season_post_production_start_date       DATE,
    IN     season_post_production_end_date         DATE,
    IN     season_network_production_start_date    DATE,
    IN     season_network_production_end_date      DATE,
    IN     season_logo_path                        VARCHAR(120),
    IN     season_created_by                       VARCHAR(30),
    IN     season_updated_by                       VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM season
     WHERE id = season_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO season
        (
            id,
            title,
            season_number,
            production_id,
            budget,
            writing_start_date,
            writing_end_date,
            pre_production_start_date,
            pre_production_end_date,
            photography_start_date,
            photography_end_date,
            post_production_start_date,
            post_production_end_date,
            network_production_start_date,
            network_production_end_date,
            logo_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            season_id,
            season_title,
            season_season_number,
            season_production_id,
            season_budget,
            season_writing_start_date,
            season_writing_end_date,
            season_pre_production_start_date,
            season_pre_production_end_date,
            season_photography_start_date,
            season_photography_end_date,
            season_post_production_start_date,
            season_post_production_end_date,
            season_network_production_start_date,
            season_network_production_end_date,
            season_logo_path,
            season_created_by,
            season_updated_by,
            'CREATED'
        );

        SET season_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE season
           SET title                          =  season_title,
               season_number                  =  season_season_number,
               production_id                  =  season_production_id,
               budget                         =  season_budget,
               writing_start_date             =  season_writing_start_date,
               writing_end_date               =  season_writing_end_date,
               pre_production_start_date      =  season_pre_production_start_date,
               pre_production_end_date        =  season_pre_production_end_date,
               photography_start_date         =  season_photography_start_date,
               photography_end_date           =  season_photography_end_date,
               post_production_start_date     =  season_post_production_start_date,
               post_production_end_date       =  season_post_production_end_date,
               network_production_start_date  =  season_network_production_start_date,
               network_production_end_date    =  season_network_production_end_date,
               logo_path                      =  season_logo_path,
               created_by                     =  season_created_by,
               updated_by                     =  season_updated_by,
               status                         =  'UPDATED'
         WHERE id                             =  season_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE episode_set_list(
    INOUT  episode_id                               INTEGER,
    IN     episode_title                            VARCHAR(50),
    IN     episode_episode_number                   INTEGER,
    IN     episode_season_id                        INTEGER,
    IN     episode_budget                           NUMERIC(15,2),
    IN     episode_writing_start_date               DATE,
    IN     episode_writing_end_date                 DATE,
    IN     episode_pre_production_start_date        DATE,
    IN     episode_pre_production_end_date          DATE,
    IN     episode_photography_start_date           DATE,
    IN     episode_photography_end_date             DATE,
    IN     episode_post_production_start_date       DATE,
    IN     episode_post_production_end_date         DATE,
    IN     episode_network_production_start_date    DATE,
    IN     episode_network_production_end_date      DATE,
    IN     episode_created_by                       VARCHAR(30),
    IN     episode_updated_by                       VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM episode
     WHERE id = episode_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO episode
        (
            id,
            title,
            episode_number,
            season_id,
            budget,
            writing_start_date,
            writing_end_date,
            pre_production_start_date,
            pre_production_end_date,
            photography_start_date,
            photography_end_date,
            post_production_start_date,
            post_production_end_date,
            network_production_start_date,
            network_production_end_date,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            episode_id,
            episode_title,
            episode_episode_number,
            episode_season_id,
            episode_budget,
            episode_writing_start_date,
            episode_writing_end_date,
            episode_pre_production_start_date,
            episode_pre_production_end_date,
            episode_photography_start_date,
            episode_photography_end_date,
            episode_post_production_start_date,
            episode_post_production_end_date,
            episode_network_production_start_date,
            episode_network_production_end_date,
            episode_created_by,
            episode_updated_by,
            'CREATED'
        );

        SET episode_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE episode
           SET title                          =  episode_title,
               episode_number                 =  episode_episode_number,
               season_id                      =  episode_season_id,
               budget                         =  episode_budget,
               writing_start_date             =  episode_writing_start_date,
               writing_end_date               =  episode_writing_end_date,
               pre_production_start_date      =  episode_pre_production_start_date,
               pre_production_end_date        =  episode_pre_production_end_date,
               photography_start_date         =  episode_photography_start_date,
               photography_end_date           =  episode_photography_end_date,
               post_production_start_date     =  episode_post_production_start_date,
               post_production_end_date       =  episode_post_production_end_date,
               network_production_start_date  =  episode_network_production_start_date,
               network_production_end_date    =  episode_network_production_end_date,
               created_by                     =  episode_created_by,
               updated_by                     =  episode_updated_by,
               status                         =  'UPDATED'
         WHERE id                             =  episode_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 INSERT INTO production_type
(name,created_by,updated_by,status)
VALUES
('Fully Scripted',   'RKAMMER', 'RKAMMER', 'CREATED'),
('Comedy-Variety',   'RKAMMER', 'RKAMMER', 'CREATED'),
('Scripted',         'RKAMMER', 'RKAMMER', 'CREATED'),
('Semi-Scripted',    'RKAMMER', 'RKAMMER', 'CREATED'),
('Reality',          'RKAMMER', 'RKAMMER', 'CREATED'),
('Non-Dramatic',     'RKAMMER', 'RKAMMER', 'CREATED'),
('Stand-Up Special', 'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO production_length
(name, created_by, updated_by, status)
VALUES
('15 Mins or Less', 'RKAMMER', 'RKAMMER', 'CREATED'),
('15-30 Mins',      'RKAMMER', 'RKAMMER', 'CREATED'),
('31-60 Mins',      'RKAMMER', 'RKAMMER', 'CREATED'),
('61-75 Mins',      'RKAMMER', 'RKAMMER', 'CREATED'),
('76-90 Mins',      'RKAMMER', 'RKAMMER', 'CREATED'),
('91-120 Mins',     'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO state
(code, name, created_by, updated_by, status)
VALUES
('AL', 'Alabama',              'RKAMMER', 'RKAMMER', 'CREATED'),
('AK', 'Alaska',               'RKAMMER', 'RKAMMER', 'CREATED'),
('AZ', 'Arizona',              'RKAMMER', 'RKAMMER', 'CREATED'),
('AR', 'Arkansas',             'RKAMMER', 'RKAMMER', 'CREATED'),
('CA', 'California',           'RKAMMER', 'RKAMMER', 'CREATED'),
('CO', 'Colorado',             'RKAMMER', 'RKAMMER', 'CREATED'),
('CT', 'Connecticut',          'RKAMMER', 'RKAMMER', 'CREATED'),
('DE', 'Delaware',             'RKAMMER', 'RKAMMER', 'CREATED'),
('DC', 'District of Columbia', 'RKAMMER', 'RKAMMER', 'CREATED'),
('FL', 'Florida',              'RKAMMER', 'RKAMMER', 'CREATED'),
('GA', 'Georgia',              'RKAMMER', 'RKAMMER', 'CREATED'),
('HI', 'Hawaii',               'RKAMMER', 'RKAMMER', 'CREATED'),
('ID', 'Idaho',                'RKAMMER', 'RKAMMER', 'CREATED'),
('IL', 'Illinois',             'RKAMMER', 'RKAMMER', 'CREATED'),
('IN', 'Indiana',              'RKAMMER', 'RKAMMER', 'CREATED'),
('IA', 'Iowa',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('KS', 'Kansas',               'RKAMMER', 'RKAMMER', 'CREATED'),
('KY', 'Kentucky',             'RKAMMER', 'RKAMMER', 'CREATED'),
('LA', 'Louisiana',            'RKAMMER', 'RKAMMER', 'CREATED'),
('ME', 'Maine',                'RKAMMER', 'RKAMMER', 'CREATED'),
('MD', 'Maryland',             'RKAMMER', 'RKAMMER', 'CREATED'),
('MA', 'Massachusetts',        'RKAMMER', 'RKAMMER', 'CREATED'),
('MI', 'Michigan',             'RKAMMER', 'RKAMMER', 'CREATED'),
('MN', 'Minnesota',            'RKAMMER', 'RKAMMER', 'CREATED'),
('MS', 'Mississippi',          'RKAMMER', 'RKAMMER', 'CREATED'),
('MO', 'Missouri',             'RKAMMER', 'RKAMMER', 'CREATED'),
('MT', 'Montana',              'RKAMMER', 'RKAMMER', 'CREATED'),
('NE', 'Nebraska',             'RKAMMER', 'RKAMMER', 'CREATED'),
('NV', 'Nevada',               'RKAMMER', 'RKAMMER', 'CREATED'),
('NH', 'New Hampshire',        'RKAMMER', 'RKAMMER', 'CREATED'),
('NJ', 'New Jersey',           'RKAMMER', 'RKAMMER', 'CREATED'),
('NM', 'New Mexico',           'RKAMMER', 'RKAMMER', 'CREATED'),
('NY', 'New York',             'RKAMMER', 'RKAMMER', 'CREATED'),
('NC', 'North Carolina',       'RKAMMER', 'RKAMMER', 'CREATED'),
('ND', 'North Dakota',         'RKAMMER', 'RKAMMER', 'CREATED'),
('OH', 'Ohio',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('OK', 'Oklahoma',             'RKAMMER', 'RKAMMER', 'CREATED'),
('OR', 'Oregon',               'RKAMMER', 'RKAMMER', 'CREATED'),
('PA', 'Pennsylvania',         'RKAMMER', 'RKAMMER', 'CREATED'),
('PR', 'Puerto Rico',          'RKAMMER', 'RKAMMER', 'CREATED'),
('RI', 'Rhode Island',         'RKAMMER', 'RKAMMER', 'CREATED'),
('SC', 'South Carolina',       'RKAMMER', 'RKAMMER', 'CREATED'),
('SD', 'South Dakota',         'RKAMMER', 'RKAMMER', 'CREATED'),
('TN', 'Tennessee',            'RKAMMER', 'RKAMMER', 'CREATED'),
('TX', 'Texas',                'RKAMMER', 'RKAMMER', 'CREATED'),
('UT', 'Utah',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('VT', 'Vermont',              'RKAMMER', 'RKAMMER', 'CREATED'),
('VA', 'Virginia',             'RKAMMER', 'RKAMMER', 'CREATED'),
('VI', 'Virgin Islands',       'RKAMMER', 'RKAMMER', 'CREATED'),
('WA', 'Washington',           'RKAMMER', 'RKAMMER', 'CREATED'),
('WV', 'West Virginia',        'RKAMMER', 'RKAMMER', 'CREATED'),
('WI', 'Wisconsin',            'RKAMMER', 'RKAMMER', 'CREATED'),
('WY', 'Wyoming',              'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO deal_type
(abreviation, name, created_by, updated_by, status)
VALUES
('FD', 'Flat Deal',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('ST', 'Staff',                     'RKAMMER', 'RKAMMER', 'CREATED'),
('SL', 'Sale of Literary Material', 'RKAMMER', 'RKAMMER', 'CREATED'),
('OP', 'Option',                    'RKAMMER', 'RKAMMER', 'CREATED'),
('',   'Unknown',                   'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO company
(name, address, city, state_code, phone, website, logo_path, media_company, production_company, payroll_company, created_by, updated_by, status)
VALUES
('Media Company I',       NULL, NULL, 'CA', NULL, NULL, NULL, 'T', 'F', 'F', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Production Company I',  NULL, NULL, 'CA', NULL, NULL, NULL, 'F', 'T', 'F', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Production Company II', NULL, NULL, 'CA', NULL, NULL, NULL, 'F', 'T', 'F', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Payroll Company I',     NULL, NULL, 'CA', NULL, NULL, NULL, 'F', 'F', 'T', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Payroll Company II',    NULL, NULL, 'CA', NULL, NULL, NULL, 'F', 'F', 'T', 'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO network
(name, media_company_id, logo_path, created_by, updated_by, status)
VALUES
('Network One',   1, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Network Two',   1, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Network Three', 1, NULL, 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO dga_quarter
(name, description, created_by, updated_by, status)
VALUES
('1st', 'First Quarter',   'RKAMMER', 'RKAMMER', 'CREATED'),
('2nd', 'Second Quarter',  'RKAMMER', 'RKAMMER', 'CREATED'),
('3rd', 'Third  Quarter',  'RKAMMER', 'RKAMMER', 'CREATED'),
('4st', 'Fourth Quarter',  'RKAMMER', 'RKAMMER', 'CREATED');