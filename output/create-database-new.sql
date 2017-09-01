CREATE TABLE state(
    code       CHAR(2)     NOT NULL,
    name       VARCHAR(50) NOT NULL,
    created    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(30),
    updated    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by VARCHAR(30),
    status     VARCHAR(30),
    CONSTRAINT pk_state_code PRIMARY KEY (code)
) ENGINE = InnoDB;

 CREATE TABLE company(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    address              VARCHAR(100),
    city                 VARCHAR(100),
    state_code           CHAR(2),
    zipcode              VARCHAR(9),
    phone                VARCHAR(20),
    faxnumber            VARCHAR(20),
    email                VARCHAR(100),
    website              VARCHAR(100),
    logo_path            VARCHAR(120),
    wga_company_number   VARCHAR(50),
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
) ENGINE = InnoDB;

 CREATE TABLE business_group(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    company_id           INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_business_group_id    PRIMARY KEY (id),
    CONSTRAINT fk_business_group_company FOREIGN KEY (company_id) REFERENCES company (id)
) ENGINE = InnoDB;

 CREATE TABLE network(
    id                   INTEGER     NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50) NOT NULL,
    media_company_id     INTEGER     NOT NULL,
    business_group_id    INTEGER     NOT NULL,
    logo_path            VARCHAR(120),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_network_id             PRIMARY KEY (id),
    CONSTRAINT fk_network_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_network_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id)
) ENGINE = InnoDB;

 CREATE TABLE production_length(
    id         INTEGER     NOT NULL AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    created    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(30),
    updated    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by VARCHAR(30),
    status     VARCHAR(30),
    CONSTRAINT pk_production_length_id PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE production_type(
    id         INTEGER     NOT NULL AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    created    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(30),
    updated    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by VARCHAR(30),
    status     VARCHAR(30),
    CONSTRAINT pk_production_type_id PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE production(
    id                               INTEGER        NOT NULL AUTO_INCREMENT,
    title                            VARCHAR(50)    NOT NULL,
    media_company_id                 INTEGER        NOT NULL,
    business_group_id                INTEGER        NOT NULL,
    network_id                       INTEGER        NOT NULL,
    pilot                            CHAR(1) NOT NULL DEFAULT 'F',
    production_stage_id              INT NOT NULL,
    season_number                    INT,
    episodes_number                  INT,
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
    CONSTRAINT fk_production_payroll_company     FOREIGN KEY (payroll_company_id)         REFERENCES company           (id),
    CONSTRAINT fk_production_media_company       FOREIGN KEY (media_company_id)           REFERENCES company           (id),
    CONSTRAINT fk_production_business_group      FOREIGN KEY (business_group_id)          REFERENCES business_group    (id),
    CONSTRAINT fk_production_production_stage    FOREIGN KEY (production_stage_id)        REFERENCES production_stage  (id)
) ENGINE = InnoDB;

 CREATE TABLE production_state(
    production_id       INTEGER NOT NULL,
    state_code          CHAR(2) NOT NULL,
    created             TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by          VARCHAR(30),
    updated             TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by          VARCHAR(30),
    status              VARCHAR(30),
    CONSTRAINT pk_production_state            PRIMARY KEY (production_id, state_code),
    CONSTRAINT fk_production_state_production FOREIGN KEY (production_id) REFERENCES production (id),
    CONSTRAINT fk_production_state_state      FOREIGN KEY (state_code)    REFERENCES state      (code)
) ENGINE = InnoDB;

 CREATE TABLE season(
    id                               INTEGER        NOT NULL AUTO_INCREMENT,
    title                            VARCHAR(50)    NOT NULL,
    season_number                    INTEGER        NOT NULL,
    media_company_id                 INTEGER        NOT NULL,
    business_group_id                INTEGER        NOT NULL,
    network_id                       INTEGER        NOT NULL,
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
    CONSTRAINT pk_season_id             PRIMARY KEY (id),
    CONSTRAINT fk_season_production     FOREIGN KEY (production_id)     REFERENCES production     (id),
    CONSTRAINT fk_season_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_season_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id),
    CONSTRAINT fk_network_id            FOREIGN KEY (network_id)        REFERENCES network        (id)
) ENGINE = InnoDB;

 CREATE TABLE episode(
    id                               INTEGER        NOT NULL AUTO_INCREMENT,
    title                            VARCHAR(50)    NOT NULL,
    media_company_id                 INTEGER        NOT NULL,
    business_group_id                INTEGER        NOT NULL,
    network_id                       INTEGER        NOT NULL,
    production_id                    INTEGER        NOT NULL,
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
    CONSTRAINT pk_episode_id             PRIMARY KEY (id),
    CONSTRAINT fk_episode_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_episode_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id),
    CONSTRAINT fk_episode_network        FOREIGN KEY (network_id)        REFERENCES network        (id),
    CONSTRAINT fk_episode_production     FOREIGN KEY (production_id)     REFERENCES production     (id),
    CONSTRAINT fk_episode_season         FOREIGN KEY (season_id)         REFERENCES season         (id)
) ENGINE = InnoDB;

 CREATE TABLE contact(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    first_name           VARCHAR(50)  NOT NULL,
    middle_name          VARCHAR(50),
    last_name            VARCHAR(50)  NOT NULL,
    suffix               VARCHAR(50),
    address              VARCHAR(100),
    city                 VARCHAR(100),
    state_code           CHAR(2),
    phone                VARCHAR(20),
    email                VARCHAR(100),
    ssn                  VARCHAR(11),
    website              VARCHAR(100),
    picture_path         VARCHAR(120),
    created              TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_contact_id    PRIMARY KEY (id),
    CONSTRAINT fk_contact_state FOREIGN KEY (state_code) REFERENCES state (CODE)
) ENGINE = InnoDB;

 CREATE TABLE company_contact(
    company_id           INTEGER,
    contact_id           INTEGER,
    created              TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_company_contact PRIMARY KEY (company_id, contact_id),
    CONSTRAINT fk_company_contact_company FOREIGN KEY (company_id) REFERENCES company (id),
    CONSTRAINT fk_company_contact_contact FOREIGN KEY (contact_id) REFERENCES contact (id)
) ENGINE = InnoDB;

 CREATE TABLE media_type(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_media_type_id    PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE period(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    period               VARCHAR(20)  NOT NULL,
    plural               VARCHAR(30)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_period_id    PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE guild(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    acronym              VARCHAR(50)  NOT NULL,
    name                 VARCHAR(150),
    logo_path            VARCHAR(120),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_guild_id PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE contact_role(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_contact_role_id  PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE production_contact(
    production_id        INTEGER,
    contact_id           INTEGER,
    contact_role_id      INTEGER,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_production_contact_id    PRIMARY KEY (production_id, contact_id),
    CONSTRAINT fk_production_contact_production FOREIGN KEY (production_id)   REFERENCES production   (id),
    CONSTRAINT fk_production_contact_contact    FOREIGN KEY (contact_id)      REFERENCES contact      (id),
    CONSTRAINT fk_production_contact_role       FOREIGN KEY (contact_role_id) REFERENCES contact_role (id)
) ENGINE = InnoDB;

 CREATE TABLE production_stage(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_production_stage_id    PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE production_guild(
    production_id        INTEGER NOT NULL,
    guild_id             INTEGER NOT NULL,
    document_name        VARCHAR(100)  NOT NULL,
    dga_sideletter_six   CHAR(1) NOT NULL DEFAULT 'F',
    dga_all_rights_media CHAR(1) NOT NULL DEFAULT 'F',
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_production_guild PRIMARY KEY (production_id, guild_id),
    CONSTRAINT fk_production_guild_production FOREIGN KEY (production_id) REFERENCES production (id),
    CONSTRAINT fk_production_guild_guild      FOREIGN KEY (guild_id)      REFERENCES guild      (id)
) ENGINE = InnoDB;

 CREATE TABLE ledger(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(10)     NOT NULL,
    title                VARCHAR(50)  NOT NULL,
    media_company_id     INTEGER      NOT NULL,
    business_group_id    INTEGER      NOT NULL,
    network_id           INTEGER      NOT NULL,
    production_id        INTEGER      NOT NULL,
    season_id            INTEGER,
    episode_id           INTEGER,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_ledger_id             PRIMARY KEY (id),
    CONSTRAINT fk_ledger_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_ledger_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id),
    CONSTRAINT fk_ledger_network        FOREIGN KEY (network_id)        REFERENCES network        (id),
    CONSTRAINT fk_ledger_production     FOREIGN KEY (production_id)     REFERENCES production     (id),
    CONSTRAINT fk_ledger_season         FOREIGN KEY (season_id)         REFERENCES season         (id),
    CONSTRAINT fk_ledger_episode        FOREIGN KEY (episode_id)        REFERENCES episode        (id)
) ENGINE = InnoDB;

 CREATE TABLE account(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(10)     NOT NULL,
    title                VARCHAR(50)  NOT NULL,
    media_company_id     INTEGER      NOT NULL,
    business_group_id    INTEGER      NOT NULL,
    network_id           INTEGER      NOT NULL,
    production_id        INTEGER      NOT NULL,
    season_id            INTEGER,
    episode_id           INTEGER,
    ledger_id            INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_account_id             PRIMARY KEY (id),
    CONSTRAINT fk_account_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_account_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id),
    CONSTRAINT fk_account_network        FOREIGN KEY (network_id)        REFERENCES network        (id),
    CONSTRAINT fk_account_production     FOREIGN KEY (production_id)     REFERENCES production     (id),
    CONSTRAINT fk_account_season         FOREIGN KEY (season_id)         REFERENCES season         (id),
    CONSTRAINT fk_account_episode        FOREIGN KEY (episode_id)        REFERENCES episode        (id),
    CONSTRAINT fk_account_ledger         FOREIGN KEY (ledger_id)         REFERENCES ledger         (id)
) ENGINE = InnoDB;

 CREATE TABLE subaccount(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(10)     NOT NULL,
    title                VARCHAR(50)  NOT NULL,
    media_company_id     INTEGER      NOT NULL,
    business_group_id    INTEGER      NOT NULL,
    network_id           INTEGER      NOT NULL,
    production_id        INTEGER      NOT NULL,
    season_id            INTEGER,
    episode_id           INTEGER,
    ledger_id            INTEGER      NOT NULL,
    account_id           INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_subaccount_id             PRIMARY KEY (id),
    CONSTRAINT fk_subaccount_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_subaccount_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id),
    CONSTRAINT fk_subaccount_network        FOREIGN KEY (network_id)        REFERENCES network        (id),
    CONSTRAINT fk_subaccount_production     FOREIGN KEY (production_id)     REFERENCES production     (id),
    CONSTRAINT fk_subaccount_season         FOREIGN KEY (season_id)         REFERENCES season         (id),
    CONSTRAINT fk_subaccount_episode        FOREIGN KEY (episode_id)        REFERENCES episode        (id),
    CONSTRAINT fk_subaccount_ledger         FOREIGN KEY (ledger_id)         REFERENCES ledger         (id),
    CONSTRAINT fk_subaccount_account        FOREIGN KEY (account_id)        REFERENCES account        (id)
) ENGINE = InnoDB;

 CREATE TABLE transaction(
    id                   INTEGER        NOT NULL AUTO_INCREMENT,
    media_company_id     INTEGER        NOT NULL,
    business_group_id    INTEGER        NOT NULL,
    network_id           INTEGER        NOT NULL,
    production_id        INTEGER        NOT NULL,
    season_id            INTEGER,
    episode_id           INTEGER,
    ledger_id            INTEGER        NOT NULL,
    account_id           INTEGER        NOT NULL,
    subaccount_id        INTEGER        NOT NULL,
    description          VARCHAR(50)    NOT NULL,
    budget               NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    total_budget         NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    guarantee            INTEGER        NOT NULL DEFAULT 0,
    period_id            INTEGER        NOT NULL,
    actual               NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    total_actual         NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    comment              VARCHAR(255),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_transaction_id             PRIMARY KEY (id),
    CONSTRAINT fk_transaction_media_company  FOREIGN KEY (media_company_id)  REFERENCES company        (id),
    CONSTRAINT fk_transaction_business_group FOREIGN KEY (business_group_id) REFERENCES business_group (id),
    CONSTRAINT fk_transaction_network        FOREIGN KEY (network_id)        REFERENCES network        (id),
    CONSTRAINT fk_transaction_production     FOREIGN KEY (production_id)     REFERENCES production     (id),
    CONSTRAINT fk_transaction_season         FOREIGN KEY (season_id)         REFERENCES season         (id),
    CONSTRAINT fk_transaction_episode        FOREIGN KEY (episode_id)        REFERENCES episode        (id),
    CONSTRAINT fk_transaction_ledger         FOREIGN KEY (ledger_id)         REFERENCES ledger         (id),
    CONSTRAINT fk_transaction_account        FOREIGN KEY (account_id)        REFERENCES account        (id),
    CONSTRAINT fk_transaction_subaccount     FOREIGN KEY (subaccount_id)     REFERENCES subaccount     (id),
    CONSTRAINT fk_transaction_period         FOREIGN KEY (period_id)         REFERENCES period         (id)
) ENGINE = InnoDB;

 CREATE TABLE production_show_type(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    name                 VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_production_show_type_id    PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE dga_quarterly_earning(
    id                   INTEGER     NOT NULL AUTO_INCREMENT,
    quarter              VARCHAR(10) NOT NULL,
    year                 YEAR        NOT NULL,
    company_id           INTEGER     NOT NULL,
    contact_id           INTEGER     NOT NULL,
    prepared_by          VARCHAR(50),
    phone                VARCHAR(20),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_dga_quarterly_earning_id       PRIMARY KEY (id),
    CONSTRAINT fk_dga_quarterly_company          FOREIGN KEY (company_id) REFERENCES company (id),
    CONSTRAINT fk_dga_quarterly_contact          FOREIGN KEY (contact_id) REFERENCES contact (id),
    CONSTRAINT fk_dga_quarterly_company_contact  FOREIGN KEY (company_id, contact_id) REFERENCES company_contact (company_id, contact_id)
) ENGINE = InnoDB;

 CREATE TABLE dga_quarterly_earning_item(
    id                          INTEGER        NOT NULL AUTO_INCREMENT,
    dga_quarterly_earning_id    INTEGER        NOT NULL,
    name                        VARCHAR(50)    NOT NULL,
    ssn                         VARCHAR(11),
    category                    VARCHAR(30),
    production_id               INTEGER,
    earnings                    NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    created                     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                  VARCHAR(30),
    updated                     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                  VARCHAR(30),
    status                      VARCHAR(30),
    CONSTRAINT pk_dga_quarterly_earning_item_id                    PRIMARY KEY (id),
    CONSTRAINT fk_dga_quarterly_earning_item_dga_quarterly_earning FOREIGN KEY (dga_quarterly_earning_id) REFERENCES dga_quarterly_earning (id),
    CONSTRAINT fk_dga_quarterly_earning_item_production            FOREIGN KEY (production_id)            REFERENCES production (id)
) ENGINE = InnoDB;

 CREATE TABLE dga_weekly_work(
    id                   INTEGER     NOT NULL AUTO_INCREMENT,
    production_id        INT         NOT NULL,
    episode_id           INT         NOT NULL,
    company_id           INT         NOT NULL,
    contact_id           INT         NOT NULL,
    week_start_date      DATE        NOT NULL,
    week_end_date        DATE        NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_dga_weekly_work_id               PRIMARY KEY (id),
    CONSTRAINT fk_dga_weekly_work_production       FOREIGN KEY (production_id)          REFERENCES production (id),
    CONSTRAINT fk_dga_weekly_work_episode          FOREIGN KEY (episode_id)             REFERENCES episode    (id),
    CONSTRAINT fk_dga_weekly_work_company          FOREIGN KEY (company_id)             REFERENCES company    (id),
    CONSTRAINT fk_dga_weekly_work_contact          FOREIGN KEY (contact_id)             REFERENCES contact    (id),
    CONSTRAINT fk_dga_weekly_work_company_contact  FOREIGN KEY (company_id, contact_id) REFERENCES company_contact (company_id, contact_id)
) ENGINE = InnoDB;

 CREATE TABLE dga_weekly_work_item(
    id                          INTEGER      NOT NULL AUTO_INCREMENT,
    dga_weekly_work_id          INTEGER      NOT NULL,
    name                        VARCHAR(50)  NOT NULL,
    ssn                         VARCHAR(11),
    category                    VARCHAR(30),
    created                     TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    created_by                  VARCHAR(30),
    updated                     TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                  VARCHAR(30),
    status                      VARCHAR(30),
    CONSTRAINT pk_dga_weekly_work_item_id              PRIMARY KEY (id),
    CONSTRAINT fk_dga_weekly_work_item_dga_weekly_work FOREIGN KEY (dga_weekly_work_id) REFERENCES dga_weekly_work (id)
) ENGINE = InnoDB;

 CREATE TABLE dga_director_deal_memo(
    id                                        INTEGER        NOT NULL AUTO_INCREMENT,
    contact_id                                INT            NOT NULL,
    ssn                                       VARCHAR(11)    NOT NULL,
    loanout                                   VARCHAR(30)    NOT NULL,
    fid                                       VARCHAR(30)    NOT NULL,
    salary                                    NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    salary_period_id                          INT,
    aditional_time                            NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    aditional_time_period_id                  INT            NOT NULL,
    start_date                                DATE           NOT NULL,
    guaranteed                                INT,
    guaranteed_period_id                      INT,
    dga_covered                               CHAR(1),
    addition_terms                            VARCHAR(1024),
    production_id                             INT            NOT NULL,
    episode_id                                INT            NOT NULL,
    episode_specific_length                   VARCHAR(50),
    segment                                   CHAR(1) DEFAULT 'F',
    segment_specific_length                   VARCHAR(50),
    pilot                                     CHAR(1) DEFAULT 'F',
    dramatic_basic_cable_budget               NUMERIC(15,2),
    television_license_director               CHAR(1) DEFAULT 'F',
    television_license_budget                 CHAR(1) DEFAULT 'F',
    produced_for_network                      CHAR(1) DEFAULT 'F',
    produced_for_non_network                  CHAR(1) DEFAULT 'F',
    produced_for_basic_cable                  CHAR(1) DEFAULT 'F',
    produced_for_pay_tv                       CHAR(1) DEFAULT 'F',
    produced_for_home_video                   CHAR(1) DEFAULT 'F',
    show_type_dramatic                        CHAR(1) DEFAULT 'F',
    show_type_quiz_game                       CHAR(1) DEFAULT 'F',
    show_type_variety                         CHAR(1) DEFAULT 'F',
    show_type_sports_event                    CHAR(1) DEFAULT 'F',
    show_type_sports_event_name               VARCHAR(50),
    show_type_news_and_commentary             CHAR(1) DEFAULT 'F',
    show_type_local_freelance                 CHAR(1) DEFAULT 'F',
    show_type_local_all_other                 CHAR(1) DEFAULT 'F',
    show_type_series_after_02102002           CHAR(1) DEFAULT 'F',
    show_type_series_prior_02102002           CHAR(1) DEFAULT 'F',
    show_type_special                         CHAR(1) DEFAULT 'F',
    show_type_movie_mini_series               CHAR(1) DEFAULT 'F',
    show_type_strip                           CHAR(1) DEFAULT 'F',
    show_type_other                           CHAR(1) DEFAULT 'F',
    show_type_other_name                      VARCHAR(50),
    show_type_high_budget                     CHAR(1) DEFAULT 'F',
    show_type_low_budget                      CHAR(1) DEFAULT 'F',
    show_type_prime_time                      CHAR(1) DEFAULT 'F',
    show_type_non_prime_time                  CHAR(1) DEFAULT 'F',
    show_type_live_broadcast                  CHAR(1) DEFAULT 'F',
    employer_name                             VARCHAR(50),
    employee_name                             VARCHAR(50) NOT NULL,
    employee_date                             DATE        NOT NULL,
    signatory                                 VARCHAR(50) NOT NULL,
    signatory_by                              VARCHAR(50) NOT NULL,
    signatory_date                            DATE        NOT NULL,
    created                                   TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                                VARCHAR(30),
    updated                                   TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                                VARCHAR(30),
    status                                    VARCHAR(30),
    CONSTRAINT pk_dga_director_deal_memo_id                     PRIMARY KEY (id),
    CONSTRAINT fk_dga_director_deal_memo_contact                FOREIGN KEY (contact_id)               REFERENCES contact    (id),
    CONSTRAINT fk_dga_director_deal_memo_salary_period          FOREIGN KEY (salary_period_id)         REFERENCES period     (id),
    CONSTRAINT fk_dga_director_deal_memo_aditional_time_period  FOREIGN KEY (aditional_time_period_id) REFERENCES period     (id),
    CONSTRAINT fk_dga_director_deal_memo_guaranteed_period      FOREIGN KEY (guaranteed_period_id)     REFERENCES period     (id),
    CONSTRAINT fk_dga_director_deal_memo_production             FOREIGN KEY (production_id)            REFERENCES production (id),
    CONSTRAINT fk_dga_director_deal_memo_episode                FOREIGN KEY (episode_id)               REFERENCES episode    (id)
) ENGINE = InnoDB;

 CREATE TABLE dga_employment_data(
    id                                     INTEGER      NOT NULL AUTO_INCREMENT,
    report_date                            DATE         NOT NULL,
    prepared_by                            VARCHAR(50)  NOT NULL,
    quarter                                VARCHAR(10)  NOT NULL,
    year                                   YEAR         NOT NULL,
    phone                                  VARCHAR(20)  NOT NULL,
    company_id                             INTEGER      NOT NULL,
    production_id                          INTEGER      NOT NULL,
    director_name                          VARCHAR(50),
    director_first_number                  INTEGER,
    director_gender                        CHAR(1),
    director_caucasion                     CHAR(1),
    director_afro_american                 CHAR(1),
    director_latino                        CHAR(1),
    director_asian                         CHAR(1),
    director_native                        CHAR(1),
    director_unknown                       CHAR(1),
    unit_production_name                   VARCHAR(50),
    unit_production_gender                 CHAR(1),
    unit_production_caucasion              CHAR(1),
    unit_production_afro_american          CHAR(1),
    unit_production_latino                 CHAR(1),
    unit_production_asian                  CHAR(1),
    unit_production_native                 CHAR(1),
    unit_production_unknown                CHAR(1),
    first_assistant_name                   VARCHAR(50),
    first_assistant_gender                 CHAR(1),
    first_assistant_caucasion              CHAR(1),
    first_assistant_afro_american          CHAR(1),
    first_assistant_latino                 CHAR(1),
    first_assistant_asian                  CHAR(1),
    first_assistant_native                 CHAR(1),
    first_assistant_unknown                CHAR(1),
    second_assistant_name                  VARCHAR(50),
    second_assistant_gender                CHAR(1),
    second_assistant_caucasion             CHAR(1),
    second_assistant_afro_american         CHAR(1),
    second_assistant_latino                CHAR(1),
    second_assistant_asian                 CHAR(1),
    second_assistant_native                CHAR(1),
    second_assistant_unknown               CHAR(1),
    technical_coordinator_name             VARCHAR(50),
    technical_coordinator_gender           CHAR(1),
    technical_coordinator_caucasion        CHAR(1),
    technical_coordinator_afro_american    CHAR(1),
    technical_coordinator_latino           CHAR(1),
    technical_coordinator_asian            CHAR(1),
    technical_coordinator_native           CHAR(1),
    technical_coordinator_unknown          CHAR(1),
    associate_director_name                VARCHAR(50),
    associate_director_gender              CHAR(1),
    associate_director_caucasion           CHAR(1),
    associate_director_afro_american       CHAR(1),
    associate_director_latino              CHAR(1),
    associate_director_asian               CHAR(1),
    associate_director_native              CHAR(1),
    associate_director_unknown             CHAR(1),
    stage_manager_name                     VARCHAR(50),
    stage_manager_gender                   CHAR(1),
    stage_manager_caucasion                CHAR(1),
    stage_manager_afro_american            CHAR(1),
    stage_manager_latino                   CHAR(1),
    stage_manager_asian                    CHAR(1),
    stage_manager_native                   CHAR(1),
    stage_manager_unknown                  CHAR(1),
    created                                TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                             VARCHAR(30),
    updated                                TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                             VARCHAR(30),
    status                                 VARCHAR(30),
    CONSTRAINT pk_dga_employment_data_id         PRIMARY KEY (id),
    CONSTRAINT fk_dga_employment_data_company    FOREIGN KEY (company_id)    REFERENCES company    (id),
    CONSTRAINT fk_dga_employment_data_production FOREIGN KEY (production_id) REFERENCES production (id)
) ENGINE = InnoDB;

 CREATE TABLE dga_stage_manager_deal_memo(
    id                                        INTEGER        NOT NULL AUTO_INCREMENT,
    contact_id                                INT            NOT NULL,
    ssn                                       VARCHAR(11)    NOT NULL,
    loanout                                   VARCHAR(30)    NOT NULL,
    fid                                       VARCHAR(30)    NOT NULL,
    salary                                    NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    salary_period_id                          INT,
    aditional_time                            NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    aditional_time_period_id                  INT            NOT NULL,
    start_date                                DATE           NOT NULL,
    guaranteed                                INT,
    guaranteed_period_id                      INT,
    production_id                             INT            NOT NULL,
    episode_id                                INT,
    category_associate_director               CHAR(1),
    category_stage_manager                    CHAR(1),
    category_aditional_stage_manager          CHAR(1),
    prime_time_per_week_studio                CHAR(1),
    prime_time_per_week_location              CHAR(1),
    prime_time_per_day_studio                 CHAR(1),
    prime_time_per_day_location               CHAR(1),
    other_per_week_40                         CHAR(1),
    other_per_week_flat_60                    CHAR(1),
    other_per_day_8                           CHAR(1),
    other_per_day_flat_12                     CHAR(1),
    project_info_30_lower                     CHAR(1),
    project_info_30_between                   CHAR(1),
    project_info_30_higher                    CHAR(1),
    project_info_60_lower                     CHAR(1),
    project_info_60_between                   CHAR(1),
    project_info_60_higher                    CHAR(1),
    project_info_120_lower                    CHAR(1),
    project_info_120_between                  CHAR(1),
    project_info_120_higher                   CHAR(1),
    other_conditions                          VARCHAR(255),
    -- employer_name                             VARCHAR(50),
    employee_name                             VARCHAR(50) NOT NULL,
    employee_date                             DATE        NOT NULL,
    signatory                                 VARCHAR(50) NOT NULL,
    signatory_by                              VARCHAR(50) NOT NULL,
    signatory_date                            DATE        NOT NULL,
    created                                   TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                                VARCHAR(30),
    updated                                   TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                                VARCHAR(30),
    status                                    VARCHAR(30),
    CONSTRAINT pk_dga_stage_manager_deal_memo_id                     PRIMARY KEY (id),
    CONSTRAINT fk_dga_stage_manager_deal_memo_contact                FOREIGN KEY (contact_id)               REFERENCES contact    (id),
    CONSTRAINT fk_dga_stage_manager_deal_memo_salary_period          FOREIGN KEY (salary_period_id)         REFERENCES period     (id),
    CONSTRAINT fk_dga_stage_manager_deal_memo_aditional_time_period  FOREIGN KEY (aditional_time_period_id) REFERENCES period     (id),
    CONSTRAINT fk_dga_stage_manager_deal_memo_guaranteed_period      FOREIGN KEY (guaranteed_period_id)     REFERENCES period     (id),
    CONSTRAINT fk_dga_stage_manager_deal_memo_production             FOREIGN KEY (production_id)            REFERENCES production (id),
    CONSTRAINT fk_dga_stage_manager_deal_memo_episode                FOREIGN KEY (episode_id)               REFERENCES episode    (id)
) ENGINE = InnoDB;

 CREATE TABLE dga_director_scripted_deal_memo(
    id                                        INTEGER        NOT NULL AUTO_INCREMENT,
    contact_id                                INT            NOT NULL,
    ssn                                       VARCHAR(11)    NOT NULL,
    loanout                                   VARCHAR(30)    NOT NULL,
    fid                                       VARCHAR(30)    NOT NULL,
    salary                                    NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    salary_period_id                          INT,
    aditional_time                            NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    aditional_time_period_id                  INT            NOT NULL,
    start_date                                DATE           NOT NULL,
    guaranteed                                INT,
    guaranteed_period_id                      INT,
    dga_covered                               CHAR(1),
    addition_terms                            VARCHAR(1024),
    production_id                             INT            NOT NULL,
    project_number                            VARCHAR(30),
    episode_id                                INT            NOT NULL,
    episode_specific_length                   VARCHAR(50),
    segment                                   CHAR(1) DEFAULT 'F',
    segment_specific_length                   VARCHAR(50),
    length_30                                 CHAR(1) DEFAULT 'F',
    length_60                                 CHAR(1) DEFAULT 'F',
    length_90                                 CHAR(1) DEFAULT 'F',
    length_120                                CHAR(1) DEFAULT 'F',
    length_other                              CHAR(1) DEFAULT 'F',
    pilot                                     CHAR(1) DEFAULT 'F',
    dramatic_basic_cable_budget               NUMERIC(15,2),
    type_production_multi_camera              CHAR(1) DEFAULT 'F',
    type_production_single_camera             CHAR(1) DEFAULT 'F',
    -- television_license_director               CHAR(1) DEFAULT 'F',
    -- television_license_budget                 CHAR(1) DEFAULT 'F',
    produced_for_network                      CHAR(1) DEFAULT 'F',
    produced_for_non_network                  CHAR(1) DEFAULT 'F',
    produced_for_basic_cable                  CHAR(1) DEFAULT 'F',
    produced_for_pay_tv                       CHAR(1) DEFAULT 'F',
    produced_for_home_video                   CHAR(1) DEFAULT 'F',
    produced_non_network_prime_time           CHAR(1) DEFAULT 'F',
    produced_non_network_non_prime_time       CHAR(1) DEFAULT 'F',
    project_budget_more                       CHAR(1) DEFAULT 'F',
    project_budget_less                       CHAR(1) DEFAULT 'F',
    second_unit_director                      CHAR(1) DEFAULT 'F',
    segment_applicable                        CHAR(1) DEFAULT 'F',
    individual_final_cut_authority            VARCHAR(50),
    other_conditions                          VARCHAR(50),
    employer_name                             VARCHAR(50),
    employee_name                             VARCHAR(50) NOT NULL,
    employee_date                             DATE        NOT NULL,
    signatory                                 VARCHAR(50) NOT NULL,
    signatory_by                              VARCHAR(50) NOT NULL,
    signatory_date                            DATE        NOT NULL,
    created                                   TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                                VARCHAR(30),
    updated                                   TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                                VARCHAR(30),
    status                                    VARCHAR(30),
    CONSTRAINT pk_dga_director_scripted_deal_memo_id                     PRIMARY KEY (id),
    CONSTRAINT fk_dga_director_scripted_deal_memo_contact                FOREIGN KEY (contact_id)               REFERENCES contact    (id),
    CONSTRAINT fk_dga_director_scripted_deal_memo_salary_period          FOREIGN KEY (salary_period_id)         REFERENCES period     (id),
    CONSTRAINT fk_dga_director_scripted_deal_memo_aditional_time_period  FOREIGN KEY (aditional_time_period_id) REFERENCES period     (id),
    CONSTRAINT fk_dga_director_scripted_deal_memo_guaranteed_period      FOREIGN KEY (guaranteed_period_id)     REFERENCES period     (id),
    CONSTRAINT fk_dga_director_scripted_deal_memo_production             FOREIGN KEY (production_id)            REFERENCES production (id),
    CONSTRAINT fk_dga_director_scripted_deal_memo_episode                FOREIGN KEY (episode_id)               REFERENCES episode    (id)
) ENGINE = InnoDB;

 CREATE TABLE dga_upm_deal_memo(
    id                                                  INTEGER        NOT NULL AUTO_INCREMENT,
    contact_id                                          INT            NOT NULL,
    ssn                                                 VARCHAR(11)    NOT NULL,
    loanout                                             VARCHAR(30)    NOT NULL,
    fid                                                 VARCHAR(30)    NOT NULL,
    category_unit_production_manager                    CHAR(1)        NOT NULL DEFAULT 'F',
    category_additional_second_assistant_director       CHAR(1)        NOT NULL DEFAULT 'F',
    category_first_assistant_director                   CHAR(1)        NOT NULL DEFAULT 'F',
    category_associate_director                         CHAR(1)        NOT NULL DEFAULT 'F',
    category_key_second_assistant_director              CHAR(1)        NOT NULL DEFAULT 'F',
    category_associate_director_line_cut                CHAR(1)        NOT NULL DEFAULT 'F',
    category_second_assistant_director                  CHAR(1)        NOT NULL DEFAULT 'F',
    salary_studio                                       NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    salary_studio_period_id                             INT,
    salary_location                                     NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    salary_location_period_id                           INT,
    start_date                                          DATE           NOT NULL,
    guaranteed_period_1                                 CHAR(1)        NOT NULL DEFAULT 'F',
    guaranteed_period_3                                 CHAR(1)        NOT NULL DEFAULT 'F',
    guaranteed_period_7                                 CHAR(1)        NOT NULL DEFAULT 'F',
    production_id                                       INT            NOT NULL,
    episode_id                                          INT            NOT NULL,
    type_production_feature                             CHAR(1)        NOT NULL DEFAULT 'F',
    type_production_multi_camera_prime_time             CHAR(1)        NOT NULL DEFAULT 'F',
    type_production_single_camera                       CHAR(1)        NOT NULL DEFAULT 'F',
    type_production_other_television                    CHAR(1)        NOT NULL DEFAULT 'F',
    project_info_30_lower                               CHAR(1)        NOT NULL DEFAULT 'F',
    project_info_30_between                             CHAR(1)        NOT NULL DEFAULT 'F',
    project_info_30_higher                              CHAR(1)        NOT NULL DEFAULT 'F',
    project_info_60_lower                               CHAR(1)        NOT NULL DEFAULT 'F',
    project_info_60_between                             CHAR(1)        NOT NULL DEFAULT 'F',
    project_info_60_higher                              CHAR(1)        NOT NULL DEFAULT 'F',
    project_info_120_lower                              CHAR(1)        NOT NULL DEFAULT 'F',
    project_info_120_between                            CHAR(1)        NOT NULL DEFAULT 'F',
    project_info_120_higher                             CHAR(1)        NOT NULL DEFAULT 'F',
    location_studio                                     CHAR(1)        NOT NULL DEFAULT 'F',
    location_distant                                    CHAR(1)        NOT NULL DEFAULT 'F',
    location_distant_specific                           VARCHAR(50),
    location_both                                       CHAR(1)        NOT NULL DEFAULT 'F',
    location_both_specific                              VARCHAR(50),
    other_conditions                                    VARCHAR(50),
    employer_name                                       VARCHAR(50),
    employee_name                                       VARCHAR(50)    NOT NULL,
    employee_date                                       DATE           NOT NULL,
    signatory                                           VARCHAR(50)    NOT NULL,
    signatory_by                                        VARCHAR(50)    NOT NULL,
    signatory_date                                      DATE           NOT NULL,
    created                                             TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                                          VARCHAR(30),
    updated                                             TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                                          VARCHAR(30),
    status                                              VARCHAR(30),
    CONSTRAINT pk_dga_upm_deal_memo_id                     PRIMARY KEY (id),
    CONSTRAINT fk_dga_upm_deal_memo_contact                FOREIGN KEY (contact_id)                 REFERENCES contact    (id),
    CONSTRAINT fk_dga_upm_deal_memo_salary_studio_period   FOREIGN KEY (salary_studio_period_id)    REFERENCES period     (id),
    CONSTRAINT fk_dga_upm_deal_memo_salary_location_period FOREIGN KEY (salary_location_period_id)  REFERENCES period     (id),
    CONSTRAINT fk_dga_upm_deal_memo_production             FOREIGN KEY (production_id)              REFERENCES production (id),
    CONSTRAINT fk_dga_upm_deal_memo_episode                FOREIGN KEY (episode_id)                 REFERENCES episode    (id)
) ENGINE = InnoDB;

 CREATE TABLE dga_pif_tv(
    id                                                         INTEGER       NOT NULL AUTO_INCREMENT,
    company_id                                                 INTEGER       NOT NULL,
    contact_id                                                 INTEGER       NOT NULL,
    production_id                                              INTEGER       NOT NULL,
    copyright_holder                                           VARCHAR(50)   NOT NULL,
    copyright_holder_name                                      VARCHAR(50)   NOT NULL,
    copyright_holder_phone                                     VARCHAR(20)   NOT NULL,
    writers                                                    VARCHAR(255)  NOT NULL,
    budget                                                     NUMERIC(15,2) NOT NULL,
    locations                                                  VARCHAR(255)  NOT NULL,
    date_pre_production                                        DATE          NOT NULL,
    date_principal_photography                                 DATE          NOT NULL,
    date_wrap                                                  DATE          NOT NULL,
    format_multi_camera                                        CHAR(1)       NOT NULL DEFAULT 'F',
    format_single_camera                                       CHAR(1)       NOT NULL DEFAULT 'F',
    produced_digital                                           CHAR(1)       NOT NULL DEFAULT 'F',
    produced_film                                              CHAR(1)       NOT NULL DEFAULT 'F',
    produced_tape                                              CHAR(1)       NOT NULL DEFAULT 'F',
    produced_live                                              CHAR(1)       NOT NULL DEFAULT 'F',
    produced_other                                             CHAR(1)       NOT NULL DEFAULT 'F',
    produced_other_description                                 VARCHAR(50),
    program_type_dramatic                                      CHAR(1)       NOT NULL DEFAULT 'F',
    program_type_sitcom                                        CHAR(1)       NOT NULL DEFAULT 'F',
    program_type_reality                                       CHAR(1)       NOT NULL DEFAULT 'F',
    program_type_variety                                       CHAR(1)       NOT NULL DEFAULT 'F',
    program_type_other                                         CHAR(1)       NOT NULL DEFAULT 'F',
    program_type_other_description                             VARCHAR(50),
    program_length_30                                          CHAR(1)       NOT NULL DEFAULT 'F',
    program_length_60                                          CHAR(1)       NOT NULL DEFAULT 'F',
    program_length_90                                          CHAR(1)       NOT NULL DEFAULT 'F',
    program_length_120                                         CHAR(1)       NOT NULL DEFAULT 'F',
    program_length_other                                       CHAR(1)       NOT NULL DEFAULT 'F',
    program_length_other_description                           VARCHAR(50),
    network                                                    CHAR(1)       NOT NULL DEFAULT 'F',
    network_abc                                                CHAR(1)       NOT NULL DEFAULT 'F',
    network_cbs                                                CHAR(1)       NOT NULL DEFAULT 'F',
    network_fox                                                CHAR(1)       NOT NULL DEFAULT 'F',
    network_nbc                                                CHAR(1)       NOT NULL DEFAULT 'F',
    network_pbs                                                CHAR(1)       NOT NULL DEFAULT 'F',
    network_upn                                                CHAR(1)       NOT NULL DEFAULT 'F',
    network_wb                                                 CHAR(1)       NOT NULL DEFAULT 'F',
    network_syndication                                        CHAR(1)       NOT NULL DEFAULT 'F',
    network_syndication_description                            VARCHAR(50),
    basic_cable                                                CHAR(1)       NOT NULL DEFAULT 'F',
    basic_cable_a_and_e                                        CHAR(1)       NOT NULL DEFAULT 'F',
    basic_cable_disney                                         CHAR(1)       NOT NULL DEFAULT 'F',
    basic_cable_lifetime                                       CHAR(1)       NOT NULL DEFAULT 'F',
    basic_cable_mtv                                            CHAR(1)       NOT NULL DEFAULT 'F',
    basic_cable_nickelodeon                                    CHAR(1)       NOT NULL DEFAULT 'F',
    basic_cable_tnt                                            CHAR(1)       NOT NULL DEFAULT 'F',
    basic_cable_usa                                            CHAR(1)       NOT NULL DEFAULT 'F',
    basic_cable_other                                          CHAR(1)       NOT NULL DEFAULT 'F',
    basic_cable_other_description                              VARCHAR(50),
    pay_tv                                                     CHAR(1)       NOT NULL DEFAULT 'F',
    pay_tv_hbo                                                 CHAR(1)       NOT NULL DEFAULT 'F',
    pay_tv_showtime                                            CHAR(1)       NOT NULL DEFAULT 'F',
    pay_tv_tmc                                                 CHAR(1)       NOT NULL DEFAULT 'F',
    pay_tv_starz                                               CHAR(1)       NOT NULL DEFAULT 'F',
    pay_tv_cinemax                                             CHAR(1)       NOT NULL DEFAULT 'F',
    pay_tv_other                                               CHAR(1)       NOT NULL DEFAULT 'F',
    pay_tv_other_description                                   VARCHAR(50),
    pilot                                                      CHAR(1)       NOT NULL DEFAULT 'F',
    direct_to_video                                            CHAR(1)       NOT NULL DEFAULT 'F',
    other                                                      CHAR(1)       NOT NULL DEFAULT 'F',
    other_description                                          VARCHAR(50),
    employee_info_director_name                                VARCHAR(100),
    employee_info_1_name                                       VARCHAR(100),
    employee_info_1_upm                                        CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_1_associate_director                         CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_2_name                                       VARCHAR(100),
    employee_info_2_first_assistant_director                   CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_2_stage_manager                              CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_3_name                                       VARCHAR(100),
    employee_info_3_key_second_assistant_director              CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_3_second_stage_manager                       CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_4_name                                       VARCHAR(100),
    employee_info_4_second_assistant_director                  CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_4_third_stage_manager                        CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_5_name                                       VARCHAR(100),
    employee_info_5_add_second_assistant_director              CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_5_production_associate                       CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_6_name                                       VARCHAR(100),
    employee_info_6_associate_director                         CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_7_name                                       VARCHAR(100),
    employee_info_7_associate_director_line_cut                CHAR(1)       NOT NULL DEFAULT 'F',
    employee_info_other_description                            VARCHAR(50),
    affiliations_sav                                           CHAR(1)       NOT NULL DEFAULT 'F',
    affiliations_wga                                           CHAR(1)       NOT NULL DEFAULT 'F',
    affiliations_dcg                                           CHAR(1)       NOT NULL DEFAULT 'F',
    affiliations_aftra                                         CHAR(1)       NOT NULL DEFAULT 'F',
    affiliations_iatse                                         CHAR(1)       NOT NULL DEFAULT 'F',
    affiliations_nabet                                         CHAR(1)       NOT NULL DEFAULT 'F',
    affiliations_afm                                           CHAR(1)       NOT NULL DEFAULT 'F',
    affiliations_actra                                         CHAR(1)       NOT NULL DEFAULT 'F',
    affiliations_other                                         CHAR(1)       NOT NULL DEFAULT 'F',
    affiliations_other_description                             VARCHAR(50),
    employment_contact_name                                    VARCHAR(100),
    employment_contacr_phone                                   VARCHAR(20),
    residuals_contact_name                                     VARCHAR(100),
    residuals_contacr_phone                                    VARCHAR(20),
    primary_finance_source                                     VARCHAR(100),
    primary_finance_contact                                    VARCHAR(100),
    primary_finance_phone                                      VARCHAR(20),
    completion_bond_company                                    VARCHAR(100),
    completion_bond_contact                                    VARCHAR(100),
    completion_bond_phone                                      VARCHAR(20),
    payroll_company                                            VARCHAR(100),
    payroll_contact                                            VARCHAR(100),
    payroll_phone                                              VARCHAR(20),
    credit_line                                                CHAR(1)      NOT NULL DEFAULT 'F',
    credit_line_bank                                           VARCHAR(100),
    credit_line_contact                                        VARCHAR(100),
    credit_line_phone                                          VARCHAR(20),
    foreign_distribuitors                                      VARCHAR(255),
    domestic_distribuitors                                     VARCHAR(255),
    signature                                                  VARCHAR(100),
    signature_title                                            VARCHAR(100),
    signature_print_name                                       VARCHAR(100),
    signature_phone                                            VARCHAR(20),
    signature_date                                             DATE,
    created                                                    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                                                 VARCHAR(30),
    updated                                                    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                                                 VARCHAR(30),
    status                                                     VARCHAR(30),
    CONSTRAINT pk_dga_pif_tv_id               PRIMARY KEY (id),
    CONSTRAINT fk_dga_pif_tv_company          FOREIGN KEY (company_id)             REFERENCES company (id),
    CONSTRAINT fk_dga_pif_tv_contact          FOREIGN KEY (contact_id)             REFERENCES contact (id),
    CONSTRAINT fk_dga_pif_tv_company_contact  FOREIGN KEY (company_id, contact_id) REFERENCES company_contact (company_id, contact_id),
    CONSTRAINT fk_dga_pif_tv_production       FOREIGN KEY (production_id)          REFERENCES production (id)
) ENGINE = InnoDB;

 CREATE TABLE dga_pif_tv_company(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    dga_pif_tv_id        INTEGER      NOT NULL,
    company_name         VARCHAR(50)  NOT NULL,
    company_phone        VARCHAR(20)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_dga_pif_tv_id           PRIMARY KEY (id),
    CONSTRAINT fk_dga_pif_tv_company_item FOREIGN KEY (dga_pif_tv_id) REFERENCES dga_pif_tv (id)
) ENGINE = InnoDB;

 CREATE TABLE wga_work_list(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    company_id           INTEGER      NOT NULL,
    week_ending          INT          NOT NULL,
    contact_id           INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_work_list_id               PRIMARY KEY (id),
    CONSTRAINT fk_wga_work_list_company          FOREIGN KEY (company_id)             REFERENCES company (id),
    CONSTRAINT fk_wga_work_list_contact          FOREIGN KEY (contact_id)             REFERENCES contact (id),
    CONSTRAINT fk_wga_work_list_company_contact  FOREIGN KEY (company_id, contact_id) REFERENCES company_contact (company_id, contact_id)
) ENGINE = InnoDB;

 CREATE TABLE wga_deal_type(
    id                   INTEGER     NOT NULL AUTO_INCREMENT,
    code                 CHAR(2),
    title                VARCHAR(30) NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_deal_type_id    PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE wga_field_of_work(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(1),
    title                VARCHAR(50),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_field_of_work_id      PRIMARY KEY (id),
    CONSTRAINT pk_wga_field_of_work_contact FOREIGN KEY contact_id REFERENCES contact (id)
) ENGINE = InnoDB;

 CREATE TABLE wga_work_list_item(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    wga_work_list_id     INTEGER      NOT NULL,
    contact_id           INTEGER      NOT NULL,
    episode_id           INTEGER      NOT NULL,
    deal_type_id         INTEGER      NOT NULL,
    field_of_work_id     INTEGER      NOT NULL,
    date_start           DATE,
    date_end             DATE,
    additional_data      VARCHAR(100),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_work_list_item_id                 PRIMARY KEY (id),
    CONSTRAINT fk_wga_work_list_item_wga_work_list_item FOREIGN KEY (wga_work_list_id) REFERENCES wga_work_list     (id),
    CONSTRAINT fk_wga_work_list_item_contact            FOREIGN KEY (contact_id)       REFERENCES contact           (id),
    CONSTRAINT fk_wga_work_list_item_episode            FOREIGN KEy (episode_id)       REFERENCES episode           (id),
    CONSTRAINT fk_wga_work_list_item_wga_deal_type      FOREIGN KEY (deal_type_id)     REFERENCES wga_deal_type     (id),
    CONSTRAINT fk_wga_work_list_item_wga_field_of_work  FOREIGN KEY (field_of_work_id) REFERENCES wga_field_of_work (id)
) ENGINE = InnoDB;

 CREATE TABLE wga_ntwc(
    id                                      INTEGER     NOT NULL AUTO_INCREMENT,
    date                                    DATE        NOT NULL,
    production_id                           INTEGER     NOT NULL,
    production_number                       VARCHAR(30) NOT NULL,
    episode_id                              INTEGER     NOT NULL,
    pilot                                   CHAR(1)  DEFAULT 'F',
    pilot_network_id                        INTEGER,
    pilot_production_lenght_id              INTEGER,
    executive_producer_contact_id           INTEGER NOT NULL,
    director_contact_id                     INTEGER NOT NULL,
    story_editor_contact_id                 INTEGER NOT NULL,
    other_executive_producer_contact_id     INTEGER,
    producer_contact_id                     INTEGER,
    supervising_producer_contact_id         INTEGER,
    sent_to_writers                         DATE    NOT NULL,
    protest_communicated                    DATE    NOT NULL,
    by_contact_id                           INTEGER,
    created                                 TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by                              VARCHAR(30),
    updated                                 TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                              VARCHAR(30),
    status                                  VARCHAR(30),
    CONSTRAINT pk_wga_ntwc_id                                          PRIMARY KEY (id),
    CONSTRAINT fk_wga_ntwc_production                                  FOREIGN KEY (production_id)                                      REFERENCES production        (id),
    CONSTRAINT fk_wga_ntwc_episode                                     FOREIGN KEY (episode_id)                                         REFERENCES episode           (id),
    CONSTRAINT fk_wga_ntwc_network                                     FOREIGN KEY (pilot_network_id)                                   REFERENCES network           (id),
    CONSTRAINT fk_wga_ntwc_production_length                           FOREIGN KEY (pilot_production_lenght_id)                         REFERENCES production_length (id),
    CONSTRAINT fk_wga_ntwc_executive_producer_contact                  FOREIGN KEY (executive_producer_contact_id)                      REFERENCES contact           (id),
    CONSTRAINT fk_wga_ntwc_executive_producer_production_contact       FOREIGN KEY (production_id, executive_producer_contact_id)       REFERENCES production_contact (production_id, contact_id),
    CONSTRAINT fk_wga_ntwc_director_contact                            FOREIGN KEY (director_contact_id)                                REFERENCES contact           (id),
    CONSTRAINT fk_wga_ntwc_director_production_contact                 FOREIGN KEY (production_id, director_contact_id)                 REFERENCES production_contact (production_id, contact_id),
    CONSTRAINT fk_wga_ntwc_story_editor_contact                        FOREIGN KEY (story_editor_contact_id)                            REFERENCES contact           (id),
    CONSTRAINT fk_wga_ntwc_story_editor_production_contact             FOREIGN KEY (production_id, story_editor_contact_id)             REFERENCES production_contact (production_id, contact_id),
    CONSTRAINT fk_wga_ntwc_other_executive_producer_contact            FOREIGN KEY (other_executive_producer_contact_id)                REFERENCES contact           (id),
    CONSTRAINT fk_wga_ntwc_other_executive_producer_production_contact FOREIGN KEY (production_id, other_executive_producer_contact_id) REFERENCES production_contact (production_id, contact_id),
    CONSTRAINT fk_wga_ntwc_producer_contact                            FOREIGN KEY (producer_contact_id)                                REFERENCES contact           (id),
    CONSTRAINT fk_wga_ntwc_producer_production_contact                 FOREIGN KEY (production_id, producer_contact_id)                 REFERENCES production_contact (production_id, contact_id),
    CONSTRAINT fk_wga_ntwc_supervising_producer_contact                FOREIGN KEY (supervising_producer_contact_id)                    REFERENCES contact           (id),
    CONSTRAINT fk_wga_ntwc_supervising_producer_production_contact     FOREIGN KEY (production_id, supervising_producer_contact_id)     REFERENCES production_contact (production_id, contact_id),
    CONSTRAINT fk_wga_ntwc_by_contact                                  FOREIGN KEY (by_contact_id)                                      REFERENCES contact           (id),
    CONSTRAINT fk_wga_ntwc_by_production_contact                       FOREIGN KEY (production_id, by_contact_id)                       REFERENCES production_contact (production_id, contact_id)
) ENGINE = InnoDB;

 CREATE TABLE wga_ntwc_participant_writer(
    wga_ntwc_id          INTEGER      NOT NULL,
    contact_id           INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_ntwc_participant_writer PRIMARY KEY (wga_ntwc_id, contact_id),
    CONSTRAINT fk_wga_ntwc_participant_writer_wga_ntwc FOREIGN KEY (wga_ntwc_id) REFERENCES wga_ntwc (id),
    CONSTRAINT fk_wga_ntwc_participant_writer_contact  FOREIGN KEY (contact_id)  REFERENCES contact  (id)
) ENGINE = InnoDB;

 CREATE TABLE wga_ntwc_writing_credit(
    wga_ntwc_id          INTEGER      NOT NULL,
    contact_id           INTEGER      NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_ntwc_writing_credit PRIMARY KEY (wga_ntwc_id, contact_id),
    CONSTRAINT fk_wga_ntwc_writing_credit_wga_ntwc FOREIGN KEY (wga_ntwc_id) REFERENCES wga_ntwc (id),
    CONSTRAINT fk_wga_ntwc_writing_credit_contact  FOREIGN KEY (contact_id)  REFERENCES contact  (id)
) ENGINE = InnoDB;

 CREATE TABLE wga_ntwc_source_material_episode(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    wga_ntwc_id          INT NOT NULL,
    name                 VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_ntwc_source_material_episode_id       PRIMARY KEY (id),
    CONSTRAINT fk_wga_ntwc_source_material_episode_wga_ntwc FOREIGN KEY (wga_ntwc_id) REFERENCES wga_ntwc (id)
) ENGINE = InnoDB;

 CREATE TABLE wga_ntwc_source_material_production(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    wga_ntwc_id          INT NOT NULL,
    name                 VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_ntwc_source_material_production_id       PRIMARY KEY (id),
    CONSTRAINT fk_wga_ntwc_source_material_production_wga_ntwc FOREIGN KEY (wga_ntwc_id) REFERENCES wga_ntwc (id)
) ENGINE = InnoDB;

 CREATE TABLE sav_performer_type(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(3)      NOT NULL,
    title                VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_sav_performer_type_id PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE sav_production_type(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 VARCHAR(10),
    title                VARCHAR(50),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_sav_production_type_id    PRIMARY KEY (id)
) ENGINE = InnoDB;

 CREATE TABLE sav_final_cast_list_info(
    id                      INTEGER      NOT NULL AUTO_INCREMENT,
    date_filled             date         NOT NULL,
    production_id           INT          NOT NULL,
    shooting_location       VARCHAR(400) NOT NULL,
    production_company_id   INT          NOT NULL,
    start_date              DATE         NOT NULL,
    end_date                DATE         NOT NULL,
    federal_id              VARCHAR(50)  NOT NULL,
    state_id                VARCHAR(50)  NOT NULL,
    picture_id              VARCHAR(50)  NOT NULL,
    distribuitor_id         VARCHAR(50)  NOT NULL,
    sav_production_type_id  INT          NOT NULL,
    created                 TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by              VARCHAR(30),
    updated                 TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by              VARCHAR(30),
    status                  VARCHAR(30),
    CONSTRAINT pk_sav_final_cast_list_info_id                  PRIMARY KEY (id),
    CONSTRAINT fk_sav_final_cast_list_info_production          FOREIGN KEY (production_id)          REFERENCES production          (id),
    CONSTRAINT fk_sav_final_cast_list_info_production_company  FOREIGN KEY (production_company_id)  REFERENCES company             (id),
    CONSTRAINT fk_sav_final_cast_list_info_sav_production_type FOREIGN KEY (sav_production_type_id) REFERENCES sav_production_type (id)
) ENGINE = InnoDB;

 CREATE TABLE sav_final_cast_list_info_item(
    id                               INTEGER      NOT NULL AUTO_INCREMENT,
    sav_final_cast_list_info_id      INT          NOT NULL,
    production_id                    INT          NOT NULL,
    contact_id                       INT          NOT NULL,
    loan_out_corp                    VARCHAR(50),
    federal_id                       VARCHAR(30),
    days_number                      INT,
    weeks_number                     INT,
    start_date                       DATE,
    end_date                         DATE,
    contract_type                    CHAR(1),
    sav_performer_type_id            INT NOT NULL,
    salary_total_gross               NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    salary_base                      NUMERIC(15,2)  NOT NULL DEFAULT 0.00,
    units_type                       INT,
    units_salary                     INT,
    units_total                      INT,
    created                          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    created_by                       VARCHAR(30),
    updated                          TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by                       VARCHAR(30),
    status                           VARCHAR(30),
    CONSTRAINT pk_sav_final_cast_list_info_item_id                       PRIMARY KEY (id),
    CONSTRAINT fk_sav_final_cast_list_info_item_sav_final_cast_list_info FOREIGN KEY (sav_final_cast_list_info_id) REFERENCES sav_final_cast_list_info (id),
    CONSTRAINT fk_sav_final_cast_list_contact                            FOREIGN KEY (contact_id)                  REFERENCES contact                  (id),
    CONSTRAINT fk_sav_final_cast_list_production                         FOREIGN KEY (production_id)               REFERENCES production               (id),
    CONSTRAINT fk_sav_final_cast_list_production_contact                 FOREIGN KEY (production_id, contact_id)   REFERENCES production_contact       (production_id, contact_id),
    CONSTRAINT fk_sav_final_cast_list_sav_performer_type                 FOREIGN KEY (sav_performer_type_id)       REFERENCES sav_performer_type       (id)
) ENGINE = InnoDB;

 CREATE TABLE sav_role(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    code                 CHAR(10),
    title                VARCHAR(50),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_sav_role_id    PRIMARY KEY (id)
) ENGINE = InnoDB;

 DELIMITER //
CREATE FUNCTION contact_get_full_name(contact_id INT)
RETURNS VARCHAR(255)
BEGIN
    DECLARE wk_full_name VARCHAR(255);

    SELECT CASE WHEN TRIM(contact.middle_name) IS NULL
                  OR TRIM(contact.middle_name) = '' THEN
                  CASE WHEN TRIM(contact.suffix) IS NULL OR TRIM(contact.suffix) = '' THEN
                        CONCAT(TRIM(contact.first_name), ' ', TRIM(contact.last_name))
                  ELSE
                        CONCAT(TRIM(contact.first_name), ' ', TRIM(contact.last_name), ' ', TRIM(contact.suffix))
                  END
           ELSE
                  CASE WHEN TRIM(contact.suffix) IS NULL OR TRIM(contact.suffix) = '' THEN
                        CONCAT(TRIM(contact.first_name), ' ', TRIM(contact.middle_name), ' ', TRIM(contact.last_name))
                  ELSE
                        CONCAT(TRIM(contact.first_name), ' ', TRIM(contact.middle_name), ' ', TRIM(contact.last_name), ' ', TRIM(contact.suffix))

                  END
           END
           INTO wk_full_name
      FROM contact AS contact
     WHERE contact.id = contact_id;

     RETURN wk_full_name;

END //
DELIMITER ;

 DROP FUNCTION production_get_states;

DELIMITER //
CREATE FUNCTION production_get_states(production_id INT)
RETURNS VARCHAR(1024)
BEGIN
    DECLARE wk_finished INTEGER       DEFAULT 0;
    DECLARE wk_states   VARCHAR(1024) DEFAULT '';
    DECLARE wk_state    VARCHAR(50);

    DECLARE cr_states
     CURSOR FOR
     SELECT state.name
       FROM production_state AS production_state INNER JOIN state AS state ON state.code = production_state.state_code
      WHERE production_state.production_id = production_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET wk_finished = 1;

    OPEN cr_states;
    getStates: LOOP
        FETCH cr_states INTO wk_state;

        IF wk_finished = 1 THEN
            LEAVE getStates;
        END IF;

        IF wk_states = '' THEN
            SET wk_states = wk_state;
        ELSE
            SET wk_states = CONCAT(wk_states, ', ', wk_state);
        END IF ;

    END LOOP getStates;
    CLOSE cr_states;


    RETURN wk_states;

END //
DELIMITER ;

 CREATE OR REPLACE VIEW company_get_list(
    company_id,
    company_name,
    company_address,
    company_city,
    company_state_code,
    company_state_name,
    company_zipcode,
    company_phone,
    company_faxnumber,
    company_website,
    company_email,
    company_logo_path,
    company_wga_company_number,
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
           company.zipcode                                       AS company_zipcode,
           company.phone                                         AS company_phone,
           company.faxnumber                                     AS company_faxnumber,
           company.website                                       AS company_website,
           company.email                                         AS company_email,
           company.logo_path                                     AS company_logo_path,
           company.wga_company_number                            AS company_wga_company_number,
           company.media_company                                 AS company_media_company,
           company.production_company                            AS company_production_company,
           company.payroll_company                               AS company_payroll_company,
           DATE_FORMAT(company.created,'%m/%d/%Y %H:%i:%S')      AS company_created,
           company.created_by                                    AS company_created_by,
           DATE_FORMAT(company.updated,'%m/%d/%Y %H:%i:%S')      AS company_updated,
           company.updated_by                                    AS company_updated_by,
           company.status                                        AS company_status
      FROM company AS company LEFT JOIN state AS state on state.code = company.state_code;

 CREATE OR REPLACE VIEW business_group_get_list(
    business_group_id,
    business_group_name,
    business_group_company_id,
    business_group_company_name,
    business_group_created,
    business_group_created_by,
    business_group_updated,
    business_group_updated_by,
    business_group_status
) AS
    SELECT business_group.id                                              AS  business_group_id,
           business_group.name                                            AS  business_group_name,
           business_group.company_id                                      AS  business_group_company_id,
           company.name                                                   AS  business_group_company_name,
           DATE_FORMAT(business_group.created,'%m/%d/%Y %H:%i:%S')        AS  business_group_created,
           business_group.created_by                                      AS  business_group_created_by,
           DATE_FORMAT(business_group.updated,'%m/%d/%Y %H:%i:%S')        AS  business_group_updated,
           business_group.updated_by                                      AS  business_group_updated_by,
           business_group.status                                          AS  business_group_status
      FROM business_group AS business_group INNER JOIN company AS company ON company.id = business_group.company_id;

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
    network_business_group_id,
    network_business_group_name,
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
           network.business_group_id                             AS network_business_group_id,
           business_group.name                                   AS network_business_group_name,
           network.logo_path                                     AS network_logo_path,
           DATE_FORMAT(network.created,'%m/%d/%Y %H:%i:%S')      AS network_created,
           network.created_by                                    AS network_created_by,
           DATE_FORMAT(network.updated,'%m/%d/%Y %H:%i:%S')      AS network_updated,
           network.updated_by                                    AS network_updated_by,
           network.status                                        AS network_status
      FROM network AS network INNER JOIN company        AS media_company  ON media_company.id  = network.media_company_id
                              INNER JOIN business_group AS business_group ON business_group.id = network.business_group_id;

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
    production_media_company_id,
    production_media_company_name,
    production_business_group_id,
    production_business_group_name,
    production_network_id,
    production_network_name,
    production_pilot,
    production_production_stage_id,
    production_production_stage_name,
    production_season_number,
    production_episodes_number,
    production_budget,
    production_states,
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
           production.media_company_id                                         AS production_media_company_id,
           media_company.name                                                  AS production_media_company_name,
           production.business_group_id                                        AS production_business_group_id,
           business_group.name                                                 AS production_business_group_name,
           production.network_id                                               AS production_network_id,
           network.name                                                        AS production_network_name,
           production.pilot                                                    AS production_pilot,
           production.production_stage_id                                      AS production_production_stage_id,
           production_stage.name                                               AS production_production_stage_name,
           production.season_number                                            AS production_season_number,
           production.episodes_number                                          AS production_episodes_number,
           production.budget                                                   AS production_budget,
           production_get_states(production.id)                                AS production_states,
           production.writing_start_date                                       AS production_writing_start_date,
           production.writing_end_date                                         AS production_writing_end_date,
           DATE_FORMAT(production.pre_production_start_date,    '%m/%d/%Y')    AS production_pre_production_start_date,
           DATE_FORMAT(production.pre_production_end_date,      '%m/%d/%Y')    AS production_pre_production_end_date,
           DATE_FORMAT(production.photography_start_date,       '%m/%d/%Y')    AS production_photography_start_date,
           DATE_FORMAT(production.photography_end_date,         '%m/%d/%Y')    AS production_photography_end_date,
           DATE_FORMAT(production.post_production_start_date,   '%m/%d/%Y')    AS production_post_production_start_date,
           DATE_FORMAT(production.post_production_end_date,     '%m/%d/%Y')    AS production_post_production_end_date,
           DATE_FORMAT(production.network_production_start_date,'%m/%d/%Y')    AS production_network_production_start_date,
           DATE_FORMAT(production.network_production_end_date,  '%m/%d/%Y')    AS production_network_production_end_date,
           production.production_length_id                                     AS production_production_length_id,
           production_length.name                                              AS production_production_length_name,
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
                                    INNER JOIN company             AS payroll_company    ON payroll_company.id     =   production.payroll_company_id
                                    INNER JOIN company             AS media_company      ON media_company.id       =   production.media_company_id
                                    INNER JOIN business_group      AS business_group     ON business_group.id      =   production.business_group_id
                                    INNER JOIN production_stage    AS production_stage   ON production_stage.id    =   production.production_stage_id;


 CREATE OR REPLACE VIEW production_state_get_list(
    production_state_production_id,
    production_state_state_code,
    production_state_state_name,
    production_state_created,
    production_state_created_by,
    production_state_updated,
    production_state_updated_by,
    production_state_status
) AS
SELECT production_state.production_id                                  AS production_state_production_id,
       production_state.state_code                                     AS production_state_state_code,
       state.name                                                      AS production_state_state_name,
       DATE_FORMAT(production_state.created,'%m/%d/%Y %H:%i:%S')       AS production_state_created,
       production_state.created_by                                     AS production_state_created_by,
       DATE_FORMAT(production_state.updated,'%m/%d/%Y %H:%i:%S')       AS production_state_updated,
       production_state.updated_by                                     AS production_state_updated_by,
       production_state.status                                         AS production_state_status
  FROM production_state AS production_state INNER JOIN state AS state ON state.code = production_state.state_code;

 CREATE OR REPLACE VIEW season_get_list(
    season_id,
    season_title,
    season_season_number,
    season_media_company_id,
    season_media_company_name,
    season_business_group_id,
    season_business_group_name,
    season_network_id,
    season_network_name,
    season_production_id,
    season_production_title,
    season_budget,
    season_production_production_length_id,
    season_production_production_length_name,
    -- season_production_network_id,
    -- season_production_network_name,
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
           season.media_company_id                                                 AS season_media_company_id,
           media_company.name                                                      AS season_media_company_name,
           season.business_group_id                                                AS season_business_group_id,
           business_group.name                                                     AS season_business_group_name,
           season.network_id                                                       AS season_network_id,
           network.name                                                            AS season_network_name,
           season.production_id                                                    AS season_production_id,
           production.title                                                        AS season_production_title,
           season.budget                                                           AS season_budget,
           production.production_length_id                                         AS season_production_production_length_id,
           production_length.name                                                  AS season_production_production_length_name,
        --    production.network_id                                                   AS season_production_network_id,
        --    network.name                                                            AS season_production_network_name,
           production.production_type_id                                           AS season_production_production_type_id,
           production_type.name                                                    AS season_production_production_type_name,
           DATE_FORMAT(season.writing_start_date,           '%m/%d/%Y')            AS season_writing_start_date,
           DATE_FORMAT(season.writing_end_date,             '%m/%d/%Y')            AS season_writing_end_date,
           DATE_FORMAT(season.pre_production_start_date,    '%m/%d/%Y')            AS season_pre_production_start_date,
           DATE_FORMAT(season.pre_production_end_date,      '%m/%d/%Y')            AS season_pre_production_end_date,
           DATE_FORMAT(season.photography_start_date,       '%m/%d/%Y')            AS season_photography_start_date,
           DATE_FORMAT(season.photography_end_date,         '%m/%d/%Y')            AS season_photography_end_date,
           DATE_FORMAT(season.post_production_start_date,   '%m/%d/%Y')            AS season_post_production_start_date,
           DATE_FORMAT(season.post_production_end_date,     '%m/%d/%Y')            AS season_post_production_end_date,
           DATE_FORMAT(season.network_production_start_date,'%m/%d/%Y')            AS season_network_production_start_date,
           DATE_FORMAT(season.network_production_end_date,  '%m/%d/%Y')            AS season_network_production_end_date,
           season.logo_path                                                        AS season_logo_path,
           DATE_FORMAT(season.created,'%m/%d/%Y %H:%i:%S')                         AS season_created,
           season.created_by                                                       AS season_created_by,
           DATE_FORMAT(season.updated,'%m/%d/%Y %H:%i:%S')                         AS season_updated,
           season.updated_by                                                       AS season_updated_by,
           season.status                                                           AS season_status
      FROM season AS season INNER JOIN production          AS production         ON production.id = season.production_id
                            -- INNER JOIN network             AS network            ON network.id             =   production.network_id
                            INNER JOIN production_length   AS production_length  ON production_length.id   =   production.production_length_id
                            INNER JOIN production_type     AS production_type    ON production_type.id     =   production.production_type_id
                            INNER JOIN company             AS media_company      ON media_company.id       =   season.media_company_id
                            INNER JOIN business_group      AS business_group     ON business_group.id      =   season.business_group_id
                            INNER JOIN network             AS network            ON network.id             =   season.network_id;



 CREATE OR REPLACE VIEW episode_get_list(
    episode_id,
    episode_title,
    episode_episode_number,
    episode_episode_abbreviation,
    episode_media_company_id,
    episode_media_company_name,
    episode_business_group_id,
    episode_business_group_name,
    episode_network_id,
    episode_network_name,
    episode_production_id,
    episode_production_title,
    episode_season_id,
    episode_season_title,
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
    episode_created,
    episode_created_by,
    episode_updated,
    episode_updated_by,
    episode_status
) AS
    SELECT episode.id                                                                               AS episode_id,
           episode.title                                                                            AS episode_title,
           LPAD(episode.episode_number, 2, 0)                                                       AS episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))   AS episode_episode_abbreviation,
           episode.media_company_id                                                                 AS episode_media_company_id,
           media_company.name                                                                       AS episode_media_company_name,
           episode.business_group_id                                                                AS episode_business_group_id,
           business_group.name                                                                      AS episode_business_group_name,
           episode.network_id                                                                       AS episode_network_id,
           network.name                                                                             AS episode_network_name,
           episode.production_id                                                                    AS episode_production_id,
           production.title                                                                         AS episode_production_title,
           episode.season_id                                                                        AS episode_season_id,
           season.title                                                                             AS episode_season_title,
           episode.budget                                                                           AS episode_budget,
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
      FROM episode AS episode INNER JOIN company        AS media_company  ON media_company.id  = episode.media_company_id
                              INNER JOIN business_group AS business_group ON business_group.id = episode.business_group_id
                              INNER JOIN network        AS network        ON network.id        = episode.network_id
                              INNER JOIN production     AS production     ON production.id     = episode.production_id
                              INNER JOIN season         AS season         ON season.id         = episode.season_id;

 CREATE OR REPLACE VIEW contact_get_list(
    contact_id,
    contact_first_name,
    contact_middle_name,
    contact_last_name,
    contact_suffix,
    contact_full_name,
    contact_address,
    contact_city,
    contact_state_code,
    contact_state_name,
    contact_phone,
    contact_email,
    contact_ssn,
    contact_website,
    contact_picture_path,
    contact_created,
    contact_created_by,
    contact_updated,
    contact_updated_by,
    contact_status
) AS
    SELECT contact.id                                             AS contact_id,
           contact.first_name                                     AS contact_first_name,
           contact.middle_name                                    AS contact_middle_name,
           contact.last_name                                      AS contact_last_name,
           contact.suffix                                         AS contact_suffix,
           contact_get_full_name(contact.id)                      AS contact_full_name,
           contact.address                                        AS contact_address,
           contact.city                                           AS contact_city,
           contact.state_code                                     AS contact_state_code,
           state.name                                             AS contact_state_name,
           contact.phone                                          AS contact_phone,
           contact.email                                          AS contact_email,
           contact.ssn                                            AS contact_ssn,
           contact.website                                        AS contact_website,
           contact.picture_path                                   AS contact_picture_path,
           DATE_FORMAT(contact.created,'%m/%d/%Y %H:%i:%S')       AS contact_created,
           contact.created_by                                     AS contact_created_by,
           DATE_FORMAT(contact.updated,'%m/%d/%Y %H:%i:%S')       AS contact_updated,
           contact.updated_by                                     AS contact_updated_by,
           contact.status                                         AS contact_status
     FROM contact as contact INNER JOIN state AS state ON state.code = contact.state_code;

 CREATE OR REPLACE VIEW company_contact_get_list(
    company_contact_company_id,
    -- company_contact_company_name,
    contact_contact_first_name,
    contact_contact_middle_name,
    contact_contact_last_name,
    contact_contact_suffix,
    contact_contact_full_name,
    company_contact_contact_id,
    company_contact_contact_name,
    company_contact_created,
    company_contact_created_by,
    company_contact_updated,
    company_contact_updated_by,
    company_contact_status
) AS
    SELECT company_contact.company_id                                  AS company_contact_company_id,
           company.name                                                AS company_contact_company_name,
           company_contact.contact_id                                  AS company_contact_contact_id,
        --    contact.name                                                AS company_contact_contact_name,
           contact.first_name                                          AS contact_contact_first_name,
           contact.middle_name                                         AS contact_contact_middle_name,
           contact.last_name                                           AS contact_contact_last_name,
           contact.suffix                                              AS contact_contact_suffix,
           contact_get_full_name(contact.id)                           AS contact_contact_full_name,
           DATE_FORMAT(company_contact.created,'%m/%d/%Y %H:%i:%S')    AS company_contact_created,
           company_contact.created_by                                  AS company_contact_created_by,
           DATE_FORMAT(company_contact.updated,'%m/%d/%Y %H:%i:%S')    AS company_contact_updated,
           company_contact.updated_by                                  AS company_contact_updated_by,
           company_contact.status                                      AS company_contact_status
      FROM company_contact AS company_contact INNER JOIN company on company.id = company_contact.company_id
                                              INNER JOIN contact on contact.id = company_contact.contact_id;

 CREATE OR REPLACE VIEW media_type_get_list(
    media_type_id,
    media_type_name,
    media_type_created,
    media_type_created_by,
    media_type_updated,
    media_type_updated_by,
    media_type_status
) AS
    SELECT media_type.id                                            AS media_type_id,
           media_type.name                                          AS media_type_name,
           DATE_FORMAT(media_type.created,'%m/%d/%Y %H:%i:%S')      AS media_type_created,
           media_type.created_by                                    AS media_type_created_by,
           DATE_FORMAT(media_type.updated,'%m/%d/%Y %H:%i:%S')      AS media_type_updated,
           media_type.updated_by                                    AS media_type_updated_by,
           media_type.status                                        AS media_type_status
      FROM media_type AS media_type;

 CREATE OR REPLACE VIEW period_get_list(
    period_id,
    period_name,
    period_period,
    period_plural,
    period_created,
    period_created_by,
    period_updated,
    period_updated_by,
    period_status
) AS
    SELECT period.id                                            AS period_id,
           period.name                                          AS period_name,
           period.period                                        AS period_period,
           period.plural                                        AS period_plural,
           DATE_FORMAT(period.created,'%m/%d/%Y %H:%i:%S')      AS period_created,
           period.created_by                                    AS period_created_by,
           DATE_FORMAT(period.updated,'%m/%d/%Y %H:%i:%S')      AS period_updated,
           period.updated_by                                    AS period_updated_by,
           period.status                                        AS period_status
      FROM period AS period;

 CREATE OR REPLACE VIEW guild_get_list(
    guild_id,
    guild_acronym,
    guild_name,
    guild_logo_path,
    guild_created,
    guild_created_by,
    guild_updated,
    guild_updated_by,
    guild_status
) AS
    SELECT guild.id                                            AS guild_id,
           guild.acronym                                       AS guild_acronym,
           guild.name                                          AS guild_name,
           guild.logo_path                                     AS guild_logo_path,
           DATE_FORMAT(guild.created,'%m/%d/%Y %H:%i:%S')      AS guild_created,
           guild.created_by                                    AS guild_created_by,
           DATE_FORMAT(guild.updated,'%m/%d/%Y %H:%i:%S')      AS guild_updated,
           guild.updated_by                                    AS guild_updated_by,
           guild.status                                        AS guild_status
      FROM guild AS guild;

 CREATE OR REPLACE VIEW contact_role_get_list(
    contact_role_id,
    contact_role_name,
    contact_role_created,
    contact_role_created_by,
    contact_role_updated,
    contact_role_updated_by,
    contact_role_status
) AS
    SELECT contact_role.id                                            AS contact_role_id,
           contact_role.name                                          AS contact_role_name,
           DATE_FORMAT(contact_role.created,'%m/%d/%Y %H:%i:%S')      AS contact_role_created,
           contact_role.created_by                                    AS contact_role_created_by,
           DATE_FORMAT(contact_role.updated,'%m/%d/%Y %H:%i:%S')      AS contact_role_updated,
           contact_role.updated_by                                    AS contact_role_updated_by,
           contact_role.status                                        AS contact_role_status
      FROM contact_role AS contact_role;

 CREATE OR REPLACE VIEW production_contact_get_list(
    production_contact_production_id,
    production_contact_production_title,
    production_contact_contact_id,
    production_contact_contact_name,
    production_contact_contact_phone,
    production_contact_contact_email,
    production_contact_contact_role_id,
    production_contact_contact_role_name,
    production_contact_created,
    production_contact_created_by,
    production_contact_updated,
    production_contact_updated_by,
    production_contact_status
) AS
    SELECT production_contact.production_id                            AS production_contact_production_id,
           production.title                                            AS production_contact_production_title,
           production_contact.contact_id                               AS production_contact_contact_id,
           contact_get_full_name(contact.id)                           AS production_contact_contact_name,
           contact.phone                                               AS production_contact_contact_phone,
           contact.email                                               AS production_contact_contact_email,
           production_contact.contact_role_id                          AS production_contact_contact_role_id,
           contact_role.name                                           AS production_contact_contact_role_name,
           DATE_FORMAT(production_contact.created,'%m/%d/%Y %H:%i:%S') AS production_contact_created,
           production_contact.created_by                               AS production_contact_created_by,
           DATE_FORMAT(production_contact.updated,'%m/%d/%Y %H:%i:%S') AS production_contact_updated,
           production_contact.updated_by                               AS production_contact_updated_by,
           production_contact.status                                   AS production_contact_status
      FROM production_contact AS production_contact INNER JOIN production   AS production   ON production.id   = production_contact.production_id
                                                    INNER JOIN contact      AS contact      ON contact.id      = production_contact.contact_id
                                                    INNER JOIN contact_role AS contact_role ON contact_role.id = production_contact.contact_role_id;

 CREATE OR REPLACE VIEW production_stage_get_list(
    production_stage_id,
    production_stage_name,
    production_stage_created,
    production_stage_created_by,
    production_stage_updated,
    production_stage_updated_by,
    production_stage_status
) AS
    SELECT production_stage.id                                            AS production_stage_id,
           production_stage.name                                          AS production_stage_name,
           DATE_FORMAT(production_stage.created,'%m/%d/%Y %H:%i:%S')      AS production_stage_created,
           production_stage.created_by                                    AS production_stage_created_by,
           DATE_FORMAT(production_stage.updated,'%m/%d/%Y %H:%i:%S')      AS production_stage_updated,
           production_stage.updated_by                                    AS production_stage_updated_by,
           production_stage.status                                        AS production_stage_status
      FROM production_stage AS production_stage;

 CREATE OR REPLACE VIEW production_guild_get_list(
    production_guild_production_id,
    production_guild_production_title,
    production_guild_guild_id,
    prodcution_guild_guild_acronym,
    production_guild_guild_name,
    production_guild_document_name,
    production_guild_dga_sideletter_six,
    production_guild_dga_all_rights_media,
    production_guild_created,
    production_guild_created_by,
    production_guild_updated,
    production_guild_updated_by,
    production_guild_status
) AS
    SELECT production_guild.production_id                                  AS production_guild_production_id,
           production.title                                                AS production_guild_production_title,
           production_guild.guild_id                                       AS production_guild_guild_id,
           guild.acronym                                                   AS prodcution_guild_guild_acronym,
           guild.name                                                      AS production_guild_guild_name,
           production_guild.document_name                                  AS production_guild_document_name,
           production_guild.dga_sideletter_six                             AS production_guild_dga_sideletter_six,
           production_guild.dga_all_rights_media                           AS production_guild_dga_all_rights_media,
           DATE_FORMAT(production_guild.created,'%m/%d/%Y %H:%i:%S')       AS production_guild_created,
           production_guild.created_by                                     AS production_guild_created_by,
           DATE_FORMAT(production_guild.updated,'%m/%d/%Y %H:%i:%S')       AS production_guild_updated,
           production_guild.updated_by                                     AS production_guild_updated_by,
           production_guild.status                                         AS production_guild_status
      FROM production_guild AS production_guild INNER JOIN production AS production ON production.id = production_guild.production_id
                                                INNER JOIN guild      AS guild      ON guild.id      = production_guild.guild_id;

 CREATE OR REPLACE VIEW ledger_get_list(
    ledger_id,
    ledger_code,
    ledger_title,
    ledger_media_company_id,
    ledger_business_group_id,
    ledger_network_id,
    ledger_production_id,
    ledger_season_id,
    ledger_episode_id,
    ledger_created,
    ledger_created_by,
    ledger_updated,
    ledger_updated_by,
    ledger_status
) AS
    SELECT ledger.id                                            AS ledger_id,
           ledger.code                                          AS ledger_code,
           ledger.title                                         AS ledger_title,
           ledger.media_company_id                              AS ledger_media_company_id,
           ledger.business_group_id                             AS ledger_business_group_id,
           ledger.network_id                                    AS ledger_network_id,
           ledger.production_id                                 AS ledger_production_id,
           ledger.season_id                                     AS ledger_season_id,
           ledger.episode_id                                    AS ledger_episode_id,
           DATE_FORMAT(ledger.created,'%m/%d/%Y %H:%i:%S')      AS ledger_created,
           ledger.created_by                                    AS ledger_created_by,
           DATE_FORMAT(ledger.updated,'%m/%d/%Y %H:%i:%S')      AS ledger_updated,
           ledger.updated_by                                    AS ledger_updated_by,
           ledger.status                                        AS ledger_status
      FROM ledger AS ledger;

 CREATE OR REPLACE VIEW account_get_list(
    account_id,
    account_code,
    account_title,
    account_media_company_id,
    account_business_group_id,
    account_network_id,
    account_production_id,
    account_season_id,
    account_episode_id,
    account_ledger_id,
    account_created,
    account_created_by,
    account_updated,
    account_updated_by,
    account_status
) AS
    SELECT account.id                                       AS account_id,
           account.code                                     AS account_code,
           account.title                                    AS account_title,
           account.media_company_id                         AS account_media_company_id,
           account.business_group_id                        AS account_business_group_id,
           account.network_id                               AS account_network_id,
           account.production_id                            AS account_production_id,
           account.season_id                                AS account_season_id,
           account.episode_id                               AS account_episode_id,
           account.ledger_id                                AS account_ledger_id,
           DATE_FORMAT(account.created,'%m/%d/%Y %H:%i:%S') AS account_created,
           account.created_by                               AS account_created_by,
           DATE_FORMAT(account.updated,'%m/%d/%Y %H:%i:%S') AS account_updated,
           account.updated_by                               AS account_updated_by,
           account.status                                   AS account_status
      FROM account AS account;

 CREATE OR REPLACE VIEW subaccount_get_list(
    subaccount_id,
    subaccount_code,
    subaccount_title,
    subaccount_media_company_id,
    subaccount_business_group_id,
    subaccount_network_id,
    subaccount_production_id,
    subaccount_season_id,
    subaccount_episode_id,
    subaccount_ledger_id,
    subaccount_account_id,
    subaccount_created,
    subaccount_created_by,
    subaccount_updated,
    subaccount_updated_by,
    subaccount_status
) AS
    SELECT subaccount.id                                        AS subaccount_id,
           subaccount.code                                      AS subaccount_code,
           subaccount.title                                     AS subaccount_title,
           subaccount.media_company_id                          AS subaccount_media_company_id,
           subaccount.business_group_id                         AS subaccount_business_group_id,
           subaccount.network_id                                AS subaccount_network_id,
           subaccount.production_id                             AS subaccount_production_id,
           subaccount.season_id                                 AS subaccount_season_id,
           subaccount.episode_id                                AS subaccount_episode_id,
           subaccount.ledger_id                                 AS subaccount_ledger_id,
           subaccount.account_id                                AS subaccount_account_id,
           DATE_FORMAT(subaccount.created,'%m/%d/%Y %H:%i:%S')  AS subaccount_created,
           subaccount.created_by                                AS subaccount_created_by,
           DATE_FORMAT(subaccount.updated,'%m/%d/%Y %H:%i:%S')  AS subaccount_updated,
           subaccount.updated_by                                AS subaccount_updated_by,
           subaccount.status                                    AS subaccount_status
      FROM subaccount AS subaccount;

 CREATE OR REPLACE VIEW transaction_get_list(
    transaction_id,
    transaction_media_company_id,
    transaction_business_group_id,
    transaction_network_id,
    transaction_production_id,
    transaction_season_id,
    transaction_episode_id,
    transaction_ledger_id,
    transaction_account_id,
    transaction_subaccount_id,
    transaction_description,
    transaction_budget,
    transaction_total_budget,
    transaction_guarantee,
    transaction_period_id,
    transaction_period_name,
    transaction_period_period,
    transaction_period_plural,
    transaction_actual,
    transaction_total_actual,
    transaction_comment,
    transaction_created,
    transaction_created_by,
    transaction_updated,
    transaction_updated_by,
    transaction_status
) AS
    SELECT transaction.id                                       AS transaction_id,
           transaction.media_company_id                         AS transaction_media_company_id,
           transaction.business_group_id                        AS transaction_business_group_id,
           transaction.network_id                               AS transaction_network_id,
           transaction.production_id                            AS transaction_production_id,
           transaction.season_id                                AS transaction_season_id,
           transaction.episode_id                               AS transaction_episode_id,
           transaction.ledger_id                                AS transaction_ledger_id,
           transaction.account_id                               AS transaction_account_id,
           transaction.subaccount_id                            AS transaction_subaccount_id,
           transaction.description                              AS transaction_description,
           transaction.budget                                   AS transaction_budget,
           transaction.total_budget                             AS transaction_total_budget,
           transaction.guarantee                                AS transaction_guarantee,
           transaction.period_id                                AS transaction_period_id,
           period.name                                          AS transaction_period_name,
           period.period                                        AS transaction_period_period,
           period.plural                                        AS transaction_period_plural,
           transaction.actual                                   AS transaction_actual,
           transaction.total_actual                             AS transaction_total_actual,
           transaction.comment                                  AS transaction_comment,
           DATE_FORMAT(transaction.created,'%m/%d/%Y %H:%i:%S') AS transaction_created,
           transaction.created_by                               AS transaction_created_by,
           DATE_FORMAT(transaction.updated,'%m/%d/%Y %H:%i:%S') AS transaction_updated,
           transaction.updated_by                               AS transaction_updated_by,
           transaction.status                                   AS transaction_status
      FROM transaction AS transaction INNER JOIN period ON period.id = transaction.period_id;

 CREATE OR REPLACE VIEW production_show_type_get_list(
    production_show_type_id,
    production_show_type_name,
    production_show_type_created,
    production_show_type_created_by,
    production_show_type_updated,
    production_show_type_updated_by,
    production_show_type_status
) AS
    SELECT production_show_type.id                                       AS production_show_type_id,
           production_show_type.name                                     AS production_show_type_name,
           DATE_FORMAT(production_show_type.created,'%m/%d/%Y %H:%i:%S') AS production_show_type_created,
           production_show_type.created_by                               AS production_show_type_created_by,
           DATE_FORMAT(production_show_type.updated,'%m/%d/%Y %H:%i:%S') AS production_show_type_updated,
           production_show_type.updated_by                               AS production_show_type_updated_by,
           production_show_type.status                                   AS production_show_type_status
      FROM production_show_type AS production_show_type;

 CREATE OR REPLACE VIEW dga_quarterly_earning_get_list(
    dga_quarterly_earning_id,
    dga_quarterly_earning_quarter,
    dga_quarterly_earning_year,
    dga_quarterly_earning_company_id,
    dga_quarterly_earning_company_name,
    dga_quarterly_earning_company_address,
    dga_quarterly_earning_company_city,
    dga_quarterly_earning_company_state_code,
    dga_quarterly_earning_company_state_name,
    dga_quarterly_earning_company_phone,
    dga_quarterly_earning_company_website,
    dga_quarterly_earning_company_logo_path,
    dga_quarterly_earning_contact_id,
    -- dga_quarterly_earning_contact_name,
    dga_quarterly_earning_contact_first_name,
    dga_quarterly_earning_contact_middle_name,
    dga_quarterly_earning_contact_last_name,
    dga_quarterly_earning_contact_suffix,
    dga_quarterly_earning_contact_full_name,
    dga_quarterly_earning_prepared_by,
    dga_quarterly_earning_phone,
    dga_quarterly_earning_created,
    dga_quarterly_earning_created_by,
    dga_quarterly_earning_updated,
    dga_quarterly_earning_updated_by,
    dga_quarterly_earning_status
) AS
    SELECT dga_quarterly_earning.id                                                       AS dga_quarterly_earning_id,
           dga_quarterly_earning.quarter                                                  AS dga_quarterly_earning_quarter,
           dga_quarterly_earning.year                                                     AS dga_quarterly_earning_year,
           dga_quarterly_earning.company_id                                               AS dga_quarterly_earning_company_id,
           company.name                                                                   AS dga_quarterly_earning_company_name,
           company.address                                                                AS dga_quarterly_earning_company_address,
           company.city                                                                   AS dga_quarterly_earning_company_city,
           company.state_code                                                             AS dga_quarterly_earning_company_state_code,
           state.name                                                                     AS dga_quarterly_earning_company_state_name,
           company.phone                                                                  AS dga_quarterly_earning_company_phone,
           company.website                                                                AS dga_quarterly_earning_company_website,
           company.logo_path                                                              AS dga_quarterly_earning_company_logo_path,
           dga_quarterly_earning.contact_id                                               AS dga_quarterly_earning_contact_id,
        --    contact.name                                                                   AS dga_quarterly_earning_contact_name,
           contact.first_name                                                             AS dga_quarterly_earning_contact_first_name,
           contact.middle_name                                                            AS dga_quarterly_earning_contact_middle_name,
           contact.last_name                                                              AS dga_quarterly_earning_contact_last_name,
           contact.suffix                                                                 AS dga_quarterly_earning_contact_suffix,
           contact_get_full_name(contact.id)                                              AS dga_quarterly_earning_contact_full_name,
           dga_quarterly_earning.prepared_by                                              AS dga_quarterly_earning_prepared_by,
           dga_quarterly_earning.phone                                                    AS dga_quarterly_earning_phone,
           DATE_FORMAT(dga_quarterly_earning.created,'%m/%d/%Y %H:%i:%S')                 AS dga_quarterly_earning_created,
           dga_quarterly_earning.created_by                                               AS dga_quarterly_earning_created_by,
           DATE_FORMAT(dga_quarterly_earning.updated,'%m/%d/%Y %H:%i:%S')                 AS dga_quarterly_earning_updated,
           dga_quarterly_earning.updated_by                                               AS dga_quarterly_earning_updated_by,
           dga_quarterly_earning.status                                                   AS dga_quarterly_earning_status
      FROM dga_quarterly_earning AS dga_quarterly_earning INNER JOIN company_contact AS company_contact ON company_contact.company_id = dga_quarterly_earning.company_id
                                                                                                       AND company_contact.contact_id = dga_quarterly_earning.contact_id
                                                        INNER JOIN company         AS company           ON company.id                 = company_contact.company_id
                                                        INNER JOIN contact         AS contact           ON contact.id                 = company_contact.contact_id
                                                        INNER JOIN state           AS state             ON company.state_code         = state.code;

 CREATE OR REPLACE VIEW dga_quarterly_earning_item_get_list(
    dga_quarterly_earning_item_id,
    dga_quarterly_earning_item_dga_quarterly_earning_id,
    dga_quarterly_earning_item_dga_quarterly_earning_quarterly,
    dga_quarterly_earning_item_dga_quarterly_earning_year,
    dga_quarterly_earning_item_name,
    dga_quarterly_earning_item_ssn,
    dga_quarterly_earning_item_category,
    dga_quarterly_earning_item_production_id,
    dga_quarterly_earning_item_production_title,
    dga_quarterly_earning_item_earnings,
    dga_quarterly_earning_item_created,
    dga_quarterly_earning_item_created_by,
    dga_quarterly_earning_item_updated,
    dga_quarterly_earning_item_updated_by,
    dga_quarterly_earning_item_status
) AS
    SELECT dga_quarterly_earning_item.id                                                         AS  dga_quarterly_earning_item_id,
           dga_quarterly_earning_item.dga_quarterly_earning_id                                   AS  dga_quarterly_earning_item_dga_quarterly_earning_id,
           dga_quarterly_earning.quarter                                                         AS  dga_quarterly_earning_item_dga_quarterly_earning_quarterly,
           dga_quarterly_earning.year                                                            AS  dga_quarterly_earning_item_dga_quarterly_earning_year,
           dga_quarterly_earning_item.name                                                       AS  dga_quarterly_earning_item_name,
           dga_quarterly_earning_item.ssn                                                        AS  dga_quarterly_earning_item_ssn,
           dga_quarterly_earning_item.category                                                   AS  dga_quarterly_earning_item_category,
           dga_quarterly_earning_item.production_id                                              AS  dga_quarterly_earning_item_production_id,
           production.title                                                                      AS  dga_quarterly_earning_item_production_title,
           dga_quarterly_earning_item.earnings                                                   AS  dga_quarterly_earning_item_earnings,
           DATE_FORMAT(dga_quarterly_earning_item.created,'%m/%d/%Y %H:%i:%S')                   AS  dga_quarterly_earning_item_created,
           dga_quarterly_earning_item.created_by                                                 AS  dga_quarterly_earning_item_created_by,
           DATE_FORMAT(dga_quarterly_earning_item.updated,'%m/%d/%Y %H:%i:%S')                   AS  dga_quarterly_earning_item_updated,
           dga_quarterly_earning_item.updated_by                                                 AS  dga_quarterly_earning_item_updated_by,
           dga_quarterly_earning_item.status                                                     AS  dga_quarterly_earning_item_status
      FROM dga_quarterly_earning_item AS dga_quarterly_earning_item INNER JOIN dga_quarterly_earning AS dga_quarterly_earning ON dga_quarterly_earning.id  = dga_quarterly_earning_item.dga_quarterly_earning_id
                                                                    INNER JOIN production            AS production            ON production.id             = dga_quarterly_earning_item.production_id;

 
CREATE OR REPLACE VIEW dga_weekly_work_get_list(
    dga_weekly_work_id,
    dga_weekly_work_production_id,
    dga_weekly_work_production_title,
    dga_weekly_work_episode_id,
    dga_weekly_work_episode_title,
    dga_weekly_work_company_id,
    dga_weekly_work_company_name,
    dga_weekly_work_company_address,
    dga_weekly_work_company_city,
    dga_weekly_work_company_state_code,
    dga_weekly_work_company_state_name,
    dga_weekly_work_company_zipcode,
    dga_weekly_work_company_phone,
    dga_weekly_work_company_faxnumber,
    dga_weekly_work_company_email,
    dga_weekly_work_company_website,
    dga_weekly_work_company_logo_path,
    dga_weekly_work_contact_id,
    -- dga_weekly_work_contact_name,
    dga_weekly_work_contact_first_name,
    dga_weekly_work_contact_middle_name,
    dga_weekly_work_contact_last_name,
    dga_weekly_work_contact_suffix,
    dga_weekly_work_contact_full_name,
    dga_weekly_work_week_start_date,
    dga_weekly_work_week_end_date,
    dga_weekly_work_created,
    dga_weekly_work_created_by,
    dga_weekly_work_updated,
    dga_weekly_work_updated_by,
    dga_weekly_work_status
) AS
    SELECT dga_weekly_work.id                                                     AS dga_weekly_work_id,
           dga_weekly_work.production_id                                          AS dga_weekly_work_production_id,
           production.title                                                       AS dga_weekly_work_production_title,
           dga_weekly_work.episode_id                                             AS dga_weekly_work_episode_id,
           episode.title                                                          AS dga_weekly_work_episode_title,
           dga_weekly_work.company_id                                             AS dga_weekly_work_company_id,
           company.name                                                           AS dga_weekly_work_company_name,
           company.address                                                        AS dga_weekly_work_company_address,
           company.city                                                           AS dga_weekly_work_company_city,
           company.state_code                                                     AS dga_weekly_work_company_state_code,
           state.name                                                             AS dga_weekly_work_company_state_name,
           company.zipcode                                                        AS dga_weekly_work_company_zipcode,
           company.phone                                                          AS dga_weekly_work_company_phone,
           company.faxnumber                                                      AS dga_weekly_work_company_faxnumber,
           company.email                                                          AS dga_weekly_work_company_email,
           company.website                                                        AS dga_weekly_work_company_website,
           company.logo_path                                                      AS dga_weekly_work_company_logo_path,
           dga_weekly_work.contact_id                                             AS dga_weekly_work_contact_id,
        --    contact.name                                                           AS dga_weekly_work_contact_name,
           contact.first_name                                                     AS dga_weekly_work_contact_first_name,
           contact.middle_name                                                    AS dga_weekly_work_contact_middle_name,
           contact.last_name                                                      AS dga_weekly_work_contact_last_name,
           contact.suffix                                                         AS dga_weekly_work_contact_suffix,
           contact_get_full_name(contact.id)                                      AS dga_weekly_work_contact_full_name,
           DATE_FORMAT(dga_weekly_work.week_start_date, '%m/%d/%Y')               AS dga_weekly_work_week_start_date,
           DATE_FORMAT(dga_weekly_work.week_end_date,   '%m/%d/%Y')               AS dga_weekly_work_week_end_date,
           DATE_FORMAT(dga_weekly_work.created,         '%m/%d/%Y %H:%i:%S')      AS dga_weekly_work_created,
           dga_weekly_work.created_by                                             AS dga_weekly_work_created_by,
           DATE_FORMAT(dga_weekly_work.updated,         '%m/%d/%Y %H:%i:%S')      AS dga_weekly_work_updated,
           dga_weekly_work.updated_by                                             AS dga_weekly_work_updated_by,
           dga_weekly_work.status                                                 AS dga_weekly_work_status
      FROM dga_weekly_work AS dga_weekly_work INNER JOIN production AS production ON production.id       = dga_weekly_work.production_id
                                              INNER JOIN episode    AS episode    ON episode.id          = dga_weekly_work.episode_id
                                              INNER JOIN company    AS company    ON company.id          = dga_weekly_work.company_id
                                              INNER JOIN contact    AS contact    ON contact.id          = dga_weekly_work.contact_id
                                              INNER JOIN state      AS state      ON company.state_code  = state.code;

 CREATE OR REPLACE VIEW dga_weekly_work_item_get_list(
    dga_weekly_work_item_id,
    dga_weekly_work_item_dga_weekly_work_id,
    dga_weekly_work_item_name,
    dga_weekly_work_item_ssn,
    dga_weekly_work_item_category,
    dga_weekly_work_item_created,
    dga_weekly_work_item_created_by,
    dga_weekly_work_item_updated,
    dga_weekly_work_item_updated_by,
    dga_weekly_work_item_status
) AS
    SELECT dga_weekly_work_item.id                                            AS dga_weekly_work_item_id,
           dga_weekly_work_id                                                 AS dga_weekly_work_item_dga_weekly_work_id,
           name                                                               AS dga_weekly_work_item_name,
           ssn                                                                AS dga_weekly_work_item_ssn,
           category                                                           AS dga_weekly_work_item_category,
           DATE_FORMAT(dga_weekly_work_item.created,'%m/%d/%Y %H:%i:%S')      AS dga_weekly_work_item_created,
           dga_weekly_work_item.created_by                                    AS dga_weekly_work_item_created_by,
           DATE_FORMAT(dga_weekly_work_item.updated,'%m/%d/%Y %H:%i:%S')      AS dga_weekly_work_item_updated,
           dga_weekly_work_item.updated_by                                    AS dga_weekly_work_item_updated_by,
           dga_weekly_work_item.status                                        AS dga_weekly_work_item_status
      FROM dga_weekly_work_item AS dga_weekly_work_item;

 CREATE OR REPLACE VIEW dga_director_deal_memo_get_list(
    dga_director_deal_memo_id,
    dga_director_deal_memo_contact_id,
    dga_director_deal_memo_contact_first_name,
    dga_director_deal_memo_contact_middle_name,
    dga_director_deal_memo_contact_last_name,
    dga_director_deal_memo_contact_suffix,
    dga_director_deal_memo_contact_full_name,
    dga_director_deal_memo_contact_address,
    dga_director_deal_memo_contact_city,
    dga_director_deal_memo_contact_state_code,
    dga_director_deal_memo_contact_state_name,
    dga_director_deal_memo_contact_phone,
    dga_director_deal_memo_contact_email,
    dga_director_deal_memo_ssn,
    dga_director_deal_memo_loanout,
    dga_director_deal_memo_fid,
    dga_director_deal_memo_salary,
    dga_director_deal_memo_salary_period_id,
    dga_director_deal_memo_salary_period_name,
    dga_director_deal_memo_salary_period_period,
    dga_director_deal_memo_salary_period_plural,
    dga_director_deal_memo_aditional_time,
    dga_director_deal_memo_aditional_time_period_id,
    dga_director_deal_memo_aditional_time_period_name,
    dga_director_deal_memo_aditional_time_period_period,
    dga_director_deal_memo_aditional_time_period_plural,
    dga_director_deal_memo_start_date,
    dga_director_deal_memo_guaranteed,
    dga_director_deal_memo_guaranteed_period_id,
    dga_director_deal_memo_guaranteed_period_name,
    dga_director_deal_memo_guaranteed_period_period,
    dga_director_deal_memo_guaranteed_period_plural,
    dga_director_deal_memo_dga_covered,
    dga_director_deal_memo_addition_terms,
    dga_director_deal_memo_production_id,
    dga_director_deal_memo_production_title,
    dga_director_deal_memo_episode_id,
    dga_director_deal_memo_episode_title,
    dga_director_deal_memo_episode_episode_number,
    dga_director_deal_memo_episode_episode_abreviation,
    dga_director_deal_memo_episode_specific_length,
    dga_director_deal_memo_segment,
    dga_director_deal_memo_segment_specific_length,
    dga_director_deal_memo_pilot,
    dga_director_deal_memo_dramatic_basic_cable_budget,
    dga_director_deal_memo_television_license_director,
    dga_director_deal_memo_television_license_budget,
    dga_director_deal_memo_produced_for_network,
    dga_director_deal_memo_produced_for_non_network,
    dga_director_deal_memo_produced_for_basic_cable,
    dga_director_deal_memo_produced_for_pay_tv,
    dga_director_deal_memo_produced_for_home_video,
    dga_director_deal_memo_show_type_dramatic,
    dga_director_deal_memo_show_type_quiz_game,
    dga_director_deal_memo_show_type_variety,
    dga_director_deal_memo_show_type_news_and_commentary,
    dga_director_deal_memo_show_type_local_freelance,
    dga_director_deal_memo_show_type_local_all_other,
    dga_director_deal_memo_show_type_sports_event,
    dga_director_deal_memo_show_type_sports_event_name,
    dga_director_deal_memo_show_type_series_after_02102002,
    dga_director_deal_memo_show_type_series_prior_02102002,
    dga_director_deal_memo_show_type_special,
    dga_director_deal_memo_show_type_movie_mini_series,
    dga_director_deal_memo_show_type_strip,
    dga_director_deal_memo_show_type_other,
    dga_director_deal_memo_show_type_other_name,
    dga_director_deal_memo_show_type_high_budget,
    dga_director_deal_memo_show_type_low_budget,
    dga_director_deal_memo_show_type_prime_time,
    dga_director_deal_memo_show_type_non_prime_time,
    dga_director_deal_memo_show_type_live_broadcast,
    dga_director_deal_memo_employer_name,
    dga_director_deal_memo_employee_name,
    dga_director_deal_memo_employee_date,
    dga_director_deal_memo_signatory,
    dga_director_deal_memo_signatory_by,
    dga_director_deal_memo_signatory_date,
    dga_director_deal_memo_created,
    dga_director_deal_memo_created_by,
    dga_director_deal_memo_updated,
    dga_director_deal_memo_updated_by,
    dga_director_deal_memo_status
) AS
    SELECT dga_director_deal_memo.id                                                                AS dga_director_deal_memo_id,
           dga_director_deal_memo.contact_id                                                        AS dga_director_deal_memo_contact_id,
           contact.first_name                                                                       AS dga_director_deal_memo_contact_first_name,
           contact.middle_name                                                                      AS dga_director_deal_memo_contact_middle_name,
           contact.last_name                                                                        AS dga_director_deal_memo_contact_last_name,
           contact.suffix                                                                           AS dga_director_deal_memo_contact_suffix,
           contact_get_full_name(contact.id)                                                        AS dga_director_deal_memo_contact_full_name,
           contact.address                                                                          AS dga_director_deal_memo_contact_address,
           contact.city                                                                             AS dga_director_deal_memo_contact_city,
           contact.state_code                                                                       AS dga_director_deal_memo_contact_state_code,
           state.name                                                                               AS dga_director_deal_memo_contact_state_name,
           contact.phone                                                                            AS dga_director_deal_memo_contact_phone,
           contact.email                                                                            AS dga_director_deal_memo_contact_email,
           dga_director_deal_memo.ssn                                                               AS dga_director_deal_memo_ssn,
           dga_director_deal_memo.loanout                                                           AS dga_director_deal_memo_loanout,
           dga_director_deal_memo.fid                                                               AS dga_director_deal_memo_fid,
           dga_director_deal_memo.salary                                                            AS dga_director_deal_memo_salary,
           dga_director_deal_memo.salary_period_id                                                  AS dga_director_deal_memo_salary_period_id,
           salary_period.name                                                                       AS dga_director_deal_memo_salary_period_name,
           salary_period.period                                                                     AS dga_director_deal_memo_salary_period_period,
           salary_period.plural                                                                     AS dga_director_deal_memo_salary_period_plural,
           dga_director_deal_memo.aditional_time                                                    AS dga_director_deal_memo_aditional_time,
           dga_director_deal_memo.aditional_time_period_id                                          AS dga_director_deal_memo_aditional_time_period_id,
           aditional_time_period.name                                                               AS dga_director_deal_memo_aditional_time_period_name,
           aditional_time_period.period                                                             AS dga_director_deal_memo_aditional_time_period_period,
           aditional_time_period.plural                                                             AS dga_director_deal_memo_aditional_time_period_plural,
           DATE_FORMAT(dga_director_deal_memo.start_date,'%m/%d/%Y %H:%i:%S')                       AS dga_director_deal_memo_start_date,
           dga_director_deal_memo.guaranteed                                                        AS dga_director_deal_memo_guaranteed,
           dga_director_deal_memo.guaranteed_period_id                                              AS dga_director_deal_memo_guaranteed_period_id,
           guaranteed_period.name                                                                   AS dga_director_deal_memo_guaranteed_period_name,
           guaranteed_period.period                                                                 AS dga_director_deal_memo_guaranteed_period_period,
           guaranteed_period.plural                                                                 AS dga_director_deal_memo_guaranteed_period_plural,
           dga_director_deal_memo.dga_covered                                                       AS dga_director_deal_memo_dga_covered,
           dga_director_deal_memo.addition_terms                                                    AS dga_director_deal_memo_addition_terms,
           dga_director_deal_memo.production_id                                                     AS dga_director_deal_memo_production_id,
           production.title                                                                         AS dga_director_deal_memo_production_title,
           dga_director_deal_memo.episode_id                                                        AS dga_director_deal_memo_episode_id,
           episode.title                                                                            AS dga_director_deal_memo_episode_title,
           LPAD(episode.episode_number, 2, 0)                                                       AS dga_director_deal_memo_episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))   AS dga_director_deal_memo_episode_episode_abreviation,
           dga_director_deal_memo.episode_specific_length                                           AS dga_director_deal_memo_episode_specific_length,
           dga_director_deal_memo.segment                                                           AS dga_director_deal_memo_segment,
           dga_director_deal_memo.segment_specific_length                                           AS dga_director_deal_memo_segment_specific_length,
           dga_director_deal_memo.pilot                                                             AS dga_director_deal_memo_pilot,
           dga_director_deal_memo.dramatic_basic_cable_budget                                       AS dga_director_deal_memo_dramatic_basic_cable_budget,
           dga_director_deal_memo.television_license_director                                       AS dga_director_deal_memo_television_license_director,
           dga_director_deal_memo.television_license_budget                                         AS dga_director_deal_memo_television_license_budget,
           dga_director_deal_memo.produced_for_network                                              AS dga_director_deal_memo_produced_for_network,
           dga_director_deal_memo.produced_for_non_network                                          AS dga_director_deal_memo_produced_for_non_network,
           dga_director_deal_memo.produced_for_basic_cable                                          AS dga_director_deal_memo_produced_for_basic_cable,
           dga_director_deal_memo.produced_for_pay_tv                                               AS dga_director_deal_memo_produced_for_pay_tv,
           dga_director_deal_memo.produced_for_home_video                                           AS dga_director_deal_memo_produced_for_home_video,
           dga_director_deal_memo.show_type_dramatic                                                AS dga_director_deal_memo_show_type_dramatic,
           dga_director_deal_memo.show_type_quiz_game                                               AS dga_director_deal_memo_show_type_quiz_game,
           dga_director_deal_memo.show_type_variety                                                 AS dga_director_deal_memo_show_type_variety,
           dga_director_deal_memo.show_type_news_and_commentary                                     AS dga_director_deal_memo_show_type_news_and_commentary,
           dga_director_deal_memo.show_type_local_freelance                                         AS dga_director_deal_memo_show_type_local_freelance,
           dga_director_deal_memo.show_type_local_all_other                                         AS dga_director_deal_memo_show_type_local_all_other,
           dga_director_deal_memo.show_type_sports_event                                            AS dga_director_deal_memo_show_type_sports_event,
           dga_director_deal_memo.show_type_sports_event_name                                       AS dga_director_deal_memo_show_type_sports_event_name,
           dga_director_deal_memo.show_type_series_after_02102002                                   AS dga_director_deal_memo_show_type_series_after_02102002,
           dga_director_deal_memo.show_type_series_prior_02102002                                   AS dga_director_deal_memo_show_type_series_prior_02102002,
           dga_director_deal_memo.show_type_special                                                 AS dga_director_deal_memo_show_type_special,
           dga_director_deal_memo.show_type_movie_mini_series                                       AS dga_director_deal_memo_show_type_movie_mini_series,
           dga_director_deal_memo.show_type_strip                                                   AS dga_director_deal_memo_show_type_strip,
           dga_director_deal_memo.show_type_other                                                   AS dga_director_deal_memo_show_type_other,
           dga_director_deal_memo.show_type_other_name                                              AS dga_director_deal_memo_show_type_other_name,
           dga_director_deal_memo.show_type_high_budget                                             AS dga_director_deal_memo_show_type_high_budget,
           dga_director_deal_memo.show_type_low_budget                                              AS dga_director_deal_memo_show_type_low_budget,
           dga_director_deal_memo.show_type_prime_time                                              AS dga_director_deal_memo_show_type_prime_time,
           dga_director_deal_memo.show_type_non_prime_time                                          AS dga_director_deal_memo_show_type_non_prime_time,
           dga_director_deal_memo.show_type_live_broadcast                                          AS dga_director_deal_memo_show_type_live_broadcast,
           dga_director_deal_memo.employer_name                                                     AS dga_director_deal_memo_employer_name,
           dga_director_deal_memo.employee_name                                                     AS dga_director_deal_memo_employee_name,
           dga_director_deal_memo.employee_date                                                     AS dga_director_deal_memo_employee_date,
           dga_director_deal_memo.signatory                                                         AS dga_director_deal_memo_signatory,
           dga_director_deal_memo.signatory_by                                                      AS dga_director_deal_memo_signatory_by,
           DATE_FORMAT(dga_director_deal_memo.signatory_date,'%m/%d/%Y')                            AS dga_director_deal_memo_signatory_date,
           DATE_FORMAT(dga_director_deal_memo.created,'%m/%d/%Y %H:%i:%S')                          AS dga_director_deal_memo_created,
           dga_director_deal_memo.created_by                                                        AS dga_director_deal_memo_created_by,
           DATE_FORMAT(dga_director_deal_memo.updated,'%m/%d/%Y %H:%i:%S')                          AS dga_director_deal_memo_updated,
           dga_director_deal_memo.updated_by                                                        AS dga_director_deal_memo_updated_by,
           dga_director_deal_memo.status                                                            AS dga_director_deal_memo_status
      FROM dga_director_deal_memo AS dga_director_deal_memo
                                                            INNER JOIN contact    AS contact               ON contact.id               = dga_director_deal_memo.contact_id
                                                            LEFT  JOIN state      AS state                 ON state.code               = contact.state_code
                                                            LEFT  JOIN period     AS salary_period         ON salary_period.id         = dga_director_deal_memo.salary_period_id
                                                            LEFT  JOIN period     AS aditional_time_period ON aditional_time_period.id = dga_director_deal_memo.aditional_time_period_id
                                                            LEFT  JOIN period     AS guaranteed_period     ON guaranteed_period.id     = dga_director_deal_memo.guaranteed_period_id
                                                            INNER JOIN production AS production            ON production.id            = dga_director_deal_memo.production_id
                                                            INNER JOIN episode    AS episode               ON episode.id               = dga_director_deal_memo.episode_id
                                                            INNER JOIN season     AS season                ON episode.season_id        = season.id;

 CREATE OR REPLACE VIEW dga_employment_data_get_list(
    dga_employment_data_id,
    dga_employment_data_report_date,
    dga_employment_data_prepared_by,
    dga_employment_data_quarter,
    dga_employment_data_year,
    dga_employment_data_phone,
    dga_employment_data_company_id,
    dga_employment_data_company_name,
    dga_employment_data_company_address,
    dga_employment_data_company_city,
    dga_employment_data_company_state_code,
    dga_employment_data_company_phone,
    dga_employment_data_company_website,
    dga_employment_data_production_id,
    dga_employment_data_production_title,
    dga_employment_data_director_name,
    dga_employment_data_director_first_number,
    dga_employment_data_director_gender,
    dga_employment_data_director_caucasion,
    dga_employment_data_director_afro_american,
    dga_employment_data_director_latino,
    dga_employment_data_director_asian,
    dga_employment_data_director_native,
    dga_employment_data_director_unknown,
    dga_employment_data_unit_production_name,
    dga_employment_data_unit_production_gender,
    dga_employment_data_unit_production_caucasion,
    dga_employment_data_unit_production_afro_american,
    dga_employment_data_unit_production_latino,
    dga_employment_data_unit_production_asian,
    dga_employment_data_unit_production_native,
    dga_employment_data_unit_production_unknown,
    dga_employment_data_first_assistant_name,
    dga_employment_data_first_assistant_gender,
    dga_employment_data_first_assistant_caucasion,
    dga_employment_data_first_assistant_afro_american,
    dga_employment_data_first_assistant_latino,
    dga_employment_data_first_assistant_asian,
    dga_employment_data_first_assistant_native,
    dga_employment_data_first_assistant_unknown,
    dga_employment_data_second_assistant_name,
    dga_employment_data_second_assistant_gender,
    dga_employment_data_second_assistant_caucasion,
    dga_employment_data_second_assistant_afro_american,
    dga_employment_data_second_assistant_latino,
    dga_employment_data_second_assistant_asian,
    dga_employment_data_second_assistant_native,
    dga_employment_data_second_assistant_unknown,
    dga_employment_data_technical_coordinator_name,
    dga_employment_data_technical_coordinator_gender,
    dga_employment_data_technical_coordinator_caucasion,
    dga_employment_data_technical_coordinator_afro_american,
    dga_employment_data_technical_coordinator_latino,
    dga_employment_data_technical_coordinator_asian,
    dga_employment_data_technical_coordinator_native,
    dga_employment_data_technical_coordinator_unknown,
    dga_employment_data_associate_director_name,
    dga_employment_data_associate_director_gender,
    dga_employment_data_associate_director_caucasion,
    dga_employment_data_associate_director_afro_american,
    dga_employment_data_associate_director_latino,
    dga_employment_data_associate_director_asian,
    dga_employment_data_associate_director_native,
    dga_employment_data_associate_director_unknown,
    dga_employment_data_stage_manager_name,
    dga_employment_data_stage_manager_gender,
    dga_employment_data_stage_manager_caucasion,
    dga_employment_data_stage_manager_afro_american,
    dga_employment_data_stage_manager_latino,
    dga_employment_data_stage_manager_asian,
    dga_employment_data_stage_manager_native,
    dga_employment_data_stage_manager_unknown,
    dga_employment_data_created,
    dga_employment_data_created_by,
    dga_employment_data_updated,
    dga_employment_data_updated_by,
    dga_employment_data_status
) AS
    SELECT dga_employment_data.id                                                             AS dga_employment_data_id,
           DATE_FORMAT(dga_employment_data.report_date,'%m/%d/%Y')                            AS dga_employment_data_report_date,
           dga_employment_data.prepared_by                                                    AS dga_employment_data_prepared_by,
           dga_employment_data.quarter                                                        AS dga_employment_data_quarter,
           dga_employment_data.year                                                           AS dga_employment_data_year,
           dga_employment_data.phone                                                          AS dga_employment_data_phone,
           dga_employment_data.company_id                                                     AS dga_employment_data_company_id,
           company.name                                                                       AS dga_employment_data_company_name,
           company.address                                                                    AS dga_employment_data_company_address,
           company.city                                                                       AS dga_employment_data_company_city,
           company.state_code                                                                 AS dga_employment_data_company_state_code,
           company.phone                                                                      AS dga_employment_data_company_phone,
           company.website                                                                    AS dga_employment_data_company_website,
           dga_employment_data.production_id                                                  AS dga_employment_data_production_id,
           production.title                                                                   AS dga_employment_data_production_title,
           dga_employment_data.director_name                                                  AS dga_employment_data_director_name,
           dga_employment_data.director_first_number                                          AS dga_employment_data_director_first_number,
           dga_employment_data.director_gender                                                AS dga_employment_data_director_gender,
           dga_employment_data.director_caucasion                                             AS dga_employment_data_director_caucasion,
           dga_employment_data.director_afro_american                                         AS dga_employment_data_director_afro_american,
           dga_employment_data.director_latino                                                AS dga_employment_data_director_latino,
           dga_employment_data.director_asian                                                 AS dga_employment_data_director_asian,
           dga_employment_data.director_native                                                AS dga_employment_data_director_native,
           dga_employment_data.director_unknown                                               AS dga_employment_data_director_unknown,
           dga_employment_data.unit_production_name                                           AS dga_employment_data_unit_production_name,
           dga_employment_data.unit_production_gender                                         AS dga_employment_data_unit_production_gender,
           dga_employment_data.unit_production_caucasion                                      AS dga_employment_data_unit_production_caucasion,
           dga_employment_data.unit_production_afro_american                                  AS dga_employment_data_unit_production_afro_american,
           dga_employment_data.unit_production_latino                                         AS dga_employment_data_unit_production_latino,
           dga_employment_data.unit_production_asian                                          AS dga_employment_data_unit_production_asian,
           dga_employment_data.unit_production_native                                         AS dga_employment_data_unit_production_native,
           dga_employment_data.unit_production_unknown                                        AS dga_employment_data_unit_production_unknown,
           dga_employment_data.first_assistant_name                                           AS dga_employment_data_first_assistant_name,
           dga_employment_data.first_assistant_gender                                         AS dga_employment_data_first_assistant_gender,
           dga_employment_data.first_assistant_caucasion                                      AS dga_employment_data_first_assistant_caucasion,
           dga_employment_data.first_assistant_afro_american                                  AS dga_employment_data_first_assistant_afro_american,
           dga_employment_data.first_assistant_latino                                         AS dga_employment_data_first_assistant_latino,
           dga_employment_data.first_assistant_asian                                          AS dga_employment_data_first_assistant_asian,
           dga_employment_data.first_assistant_native                                         AS dga_employment_data_first_assistant_native,
           dga_employment_data.first_assistant_unknown                                        AS dga_employment_data_first_assistant_unknown,
           dga_employment_data.second_assistant_name                                          AS dga_employment_data_second_assistant_name,
           dga_employment_data.second_assistant_gender                                        AS dga_employment_data_second_assistant_gender,
           dga_employment_data.second_assistant_caucasion                                     AS dga_employment_data_second_assistant_caucasion,
           dga_employment_data.second_assistant_afro_american                                 AS dga_employment_data_second_assistant_afro_american,
           dga_employment_data.second_assistant_latino                                        AS dga_employment_data_second_assistant_latino,
           dga_employment_data.second_assistant_asian                                         AS dga_employment_data_second_assistant_asian,
           dga_employment_data.second_assistant_native                                        AS dga_employment_data_second_assistant_native,
           dga_employment_data.second_assistant_unknown                                       AS dga_employment_data_second_assistant_unknown,
           dga_employment_data.technical_coordinator_name                                     AS dga_employment_data_technical_coordinator_name,
           dga_employment_data.technical_coordinator_gender                                   AS dga_employment_data_technical_coordinator_gender,
           dga_employment_data.technical_coordinator_caucasion                                AS dga_employment_data_technical_coordinator_caucasion,
           dga_employment_data.technical_coordinator_afro_american                            AS dga_employment_data_technical_coordinator_afro_american,
           dga_employment_data.technical_coordinator_latino                                   AS dga_employment_data_technical_coordinator_latino,
           dga_employment_data.technical_coordinator_asian                                    AS dga_employment_data_technical_coordinator_asian,
           dga_employment_data.technical_coordinator_native                                   AS dga_employment_data_technical_coordinator_native,
           dga_employment_data.technical_coordinator_unknown                                  AS dga_employment_data_technical_coordinator_unknown,
           dga_employment_data.associate_director_name                                        AS dga_employment_data_associate_director_name,
           dga_employment_data.associate_director_gender                                      AS dga_employment_data_associate_director_gender,
           dga_employment_data.associate_director_caucasion                                   AS dga_employment_data_associate_director_caucasion,
           dga_employment_data.associate_director_afro_american                               AS dga_employment_data_associate_director_afro_american,
           dga_employment_data.associate_director_latino                                      AS dga_employment_data_associate_director_latino,
           dga_employment_data.associate_director_asian                                       AS dga_employment_data_associate_director_asian,
           dga_employment_data.associate_director_native                                      AS dga_employment_data_associate_director_native,
           dga_employment_data.associate_director_unknown                                     AS dga_employment_data_associate_director_unknown,
           dga_employment_data.stage_manager_name                                             AS dga_employment_data_stage_manager_name,
           dga_employment_data.stage_manager_gender                                           AS dga_employment_data_stage_manager_gender,
           dga_employment_data.stage_manager_caucasion                                        AS dga_employment_data_stage_manager_caucasion,
           dga_employment_data.stage_manager_afro_american                                    AS dga_employment_data_stage_manager_afro_american,
           dga_employment_data.stage_manager_latino                                           AS dga_employment_data_stage_manager_latino,
           dga_employment_data.stage_manager_asian                                            AS dga_employment_data_stage_manager_asian,
           dga_employment_data.stage_manager_native                                           AS dga_employment_data_stage_manager_native,
           dga_employment_data.stage_manager_unknown                                          AS dga_employment_data_stage_manager_unknown,
           DATE_FORMAT(dga_employment_data.created,'%m/%d/%Y %H:%i:%S')                       AS dga_employment_data_created,
           dga_employment_data.created_by                                                     AS dga_employment_data_created_by,
           DATE_FORMAT(dga_employment_data.updated,'%m/%d/%Y %H:%i:%S')                       AS dga_employment_data_updated,
           dga_employment_data.updated_by                                                     AS dga_employment_data_updated_by,
           dga_employment_data.status                                                         AS dga_employment_data_status
      FROM dga_employment_data AS dga_employment_data INNER JOIN company    AS company    ON company.id    =  dga_employment_data.company_id
                                                      INNER JOIN production AS production ON production.id = dga_employment_data.production_id;

 CREATE OR REPLACE VIEW dga_stage_manager_deal_memo_get_list(
    dga_stage_manager_deal_memo_id,
    dga_stage_manager_deal_memo_contact_id,
    -- dga_stage_manager_memo_contact_name,
    dga_stage_manager_deal_memo_contact_first_name,
    dga_stage_manager_deal_memo_contact_middle_name,
    dga_stage_manager_deal_memo_contact_last_name,
    dga_stage_manager_deal_memo_contact_suffix,
    dga_stage_manager_deal_memo_contact_full_name,
    dga_stage_manager_memo_contact_address,
    dga_stage_manager_memo_contact_city,
    dga_stage_manager_memo_contact_state_code,
    dga_stage_manager_memo_contact_state_name,
    dga_stage_manager_memo_contact_phone,
    dga_stage_manager_memo_contact_email,
    dga_stage_manager_deal_memo_ssn,
    dga_stage_manager_deal_memo_loanout,
    dga_stage_manager_deal_memo_fid,
    dga_stage_manager_deal_memo_salary,
    dga_stage_manager_deal_memo_salary_period_id,
    dga_stage_manager_deal_memo_salary_period_name,
    dga_stage_manager_deal_memo_salary_period_period,
    dga_stage_manager_deal_memo_salary_period_plural,
    dga_stage_manager_deal_memo_aditional_time,
    dga_stage_manager_deal_memo_aditional_time_period_id,
    dga_stage_manager_deal_memo_aditional_time_period_name,
    dga_stage_manager_deal_memo_aditional_time_period_period,
    dga_stage_manager_deal_memo_aditional_time_period_plural,
    dga_stage_manager_deal_memo_start_date,
    dga_stage_manager_deal_memo_guaranteed,
    dga_stage_manager_deal_memo_guaranteed_period_id,
    dga_stage_manager_deal_memo_guaranteed_period_name,
    dga_stage_manager_deal_memo_guaranteed_period_period,
    dga_stage_manager_deal_memo_guaranteed_period_plural,
    dga_stage_manager_deal_memo_production_id,
    dga_stage_manager_deal_memo_production_title,
    dga_stage_manager_deal_memo_episode_id,
    dga_stage_manager_deal_memo_episode_title,
    dga_stage_manager_deal_memo_episode_episode_number,
    dga_stage_manager_deal_memo_episode_episode_abreviation,
    dga_stage_manager_deal_memo_category_associate_director,
    dga_stage_manager_deal_memo_category_stage_manager,
    dga_stage_manager_deal_memo_category_aditional_stage_manager,
    dga_stage_manager_deal_memo_prime_time_per_week_studio,
    dga_stage_manager_deal_memo_prime_time_per_week_location,
    dga_stage_manager_deal_memo_prime_time_per_day_studio,
    dga_stage_manager_deal_memo_prime_time_per_day_location,
    dga_stage_manager_deal_memo_other_per_week_40,
    dga_stage_manager_deal_memo_other_per_week_flat_60,
    dga_stage_manager_deal_memo_other_per_day_8,
    dga_stage_manager_deal_memo_other_per_day_flat_12,
    dga_stage_manager_deal_memo_project_info_30_lower,
    dga_stage_manager_deal_memo_project_info_30_between,
    dga_stage_manager_deal_memo_project_info_30_higher,
    dga_stage_manager_deal_memo_project_info_60_lower,
    dga_stage_manager_deal_memo_project_info_60_between,
    dga_stage_manager_deal_memo_project_info_60_higher,
    dga_stage_manager_deal_memo_project_info_120_lower,
    dga_stage_manager_deal_memo_project_info_120_between,
    dga_stage_manager_deal_memo_project_info_120_higher,
    dga_stage_manager_deal_memo_other_conditions,
    -- dga_stage_manager_deal_memo_employer_name,
    dga_stage_manager_deal_memo_employee_name,
    dga_stage_manager_deal_memo_employee_date,
    dga_stage_manager_deal_memo_signatory,
    dga_stage_manager_deal_memo_signatory_by,
    dga_stage_manager_deal_memo_signatory_date,
    dga_stage_manager_deal_memo_created,
    dga_stage_manager_deal_memo_created_by,
    dga_stage_manager_deal_memo_updated,
    dga_stage_manager_deal_memo_updated_by,
    dga_stage_manager_deal_memo_status
) AS
    SELECT dga_stage_manager_deal_memo.id                                                            AS dga_stage_manager_deal_memo_id,
           dga_stage_manager_deal_memo.contact_id                                                    AS dga_stage_manager_deal_memo_contact_id,
        --    contact.name                                                                              AS dga_stage_manager_memo_contact_name,
           contact.first_name                                                                        AS dga_stage_manager_deal_memo_contact_first_name,
           contact.middle_name                                                                       AS dga_stage_manager_deal_memo_contact_middle_name,
           contact.last_name                                                                         AS dga_stage_manager_deal_memo_contact_last_name,
           contact.suffix                                                                            AS dga_stage_manager_deal_memo_contact_suffix,
           contact_get_full_name(contact.id)                                                         AS dga_stage_manager_deal_memo_contact_full_name,
           contact.address                                                                           AS dga_stage_manager_memo_contact_address,
           contact.city                                                                              AS dga_stage_manager_memo_contact_city,
           contact.state_code                                                                        AS dga_stage_manager_memo_contact_state_code,
           state.name                                                                                AS dga_stage_manager_memo_contact_state_name,
           contact.phone                                                                             AS dga_stage_manager_memo_contact_phone,
           contact.email                                                                             AS dga_stage_manager_memo_contact_email,
           dga_stage_manager_deal_memo.ssn                                                           AS dga_stage_manager_deal_memo_ssn,
           dga_stage_manager_deal_memo.loanout                                                       AS dga_stage_manager_deal_memo_loanout,
           dga_stage_manager_deal_memo.fid                                                           AS dga_stage_manager_deal_memo_fid,
           dga_stage_manager_deal_memo.salary                                                        AS dga_stage_manager_deal_memo_salary,
           dga_stage_manager_deal_memo.salary_period_id                                              AS dga_stage_manager_deal_memo_salary_period_id,
           salary_period.name                                                                        AS dga_stage_manager_deal_memo_salary_period_name,
           salary_period.period                                                                      AS dga_stage_manager_deal_memo_salary_period_period,
           salary_period.plural                                                                      AS dga_stage_manager_deal_memo_salary_period_plural,
           dga_stage_manager_deal_memo.aditional_time                                                AS dga_stage_manager_deal_memo_aditional_time,
           dga_stage_manager_deal_memo.aditional_time_period_id                                      AS dga_stage_manager_deal_memo_aditional_time_period_id,
           aditional_time_period.name                                                                AS dga_stage_manager_deal_memo_aditional_time_period_name,
           aditional_time_period.period                                                              AS dga_stage_manager_deal_memo_aditional_time_period_period,
           aditional_time_period.plural                                                              AS dga_stage_manager_deal_memo_aditional_time_period_plural,
           dga_stage_manager_deal_memo.start_date                                                    AS dga_stage_manager_deal_memo_start_date,
           dga_stage_manager_deal_memo.guaranteed                                                    AS dga_stage_manager_deal_memo_guaranteed,
           dga_stage_manager_deal_memo.guaranteed_period_id                                          AS dga_stage_manager_deal_memo_guaranteed_period_id,
           guaranteed_period.name                                                                    AS dga_stage_manager_deal_memo_guaranteed_period_name,
           guaranteed_period.period                                                                  AS dga_stage_manager_deal_memo_guaranteed_period_period,
           guaranteed_period.plural                                                                  AS dga_stage_manager_deal_memo_guaranteed_period_plural,
           dga_stage_manager_deal_memo.production_id                                                 AS dga_stage_manager_deal_memo_production_id,
           production.title                                                                          AS dga_stage_manager_deal_memo_production_title,
           dga_stage_manager_deal_memo.episode_id                                                    AS dga_stage_manager_deal_memo_episode_id,
           episode.title                                                                             AS dga_stage_manager_deal_memo_episode_title,
           LPAD(episode.episode_number, 2, 0)                                                        AS dga_stage_manager_deal_memo_episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))    AS dga_stage_manager_deal_memo_episode_episode_abreviation,
           dga_stage_manager_deal_memo.category_associate_director                                   AS dga_stage_manager_deal_memo_category_associate_director,
           dga_stage_manager_deal_memo.category_stage_manager                                        AS dga_stage_manager_deal_memo_category_stage_manager,
           dga_stage_manager_deal_memo.category_aditional_stage_manager                              AS dga_stage_manager_deal_memo_category_aditional_stage_manager,
           dga_stage_manager_deal_memo.prime_time_per_week_studio                                    AS dga_stage_manager_deal_memo_prime_time_per_week_studio,
           dga_stage_manager_deal_memo.prime_time_per_week_location                                  AS dga_stage_manager_deal_memo_prime_time_per_week_location,
           dga_stage_manager_deal_memo.prime_time_per_day_studio                                     AS dga_stage_manager_deal_memo_prime_time_per_day_studio,
           dga_stage_manager_deal_memo.prime_time_per_day_location                                   AS dga_stage_manager_deal_memo_prime_time_per_day_location,
           dga_stage_manager_deal_memo.other_per_week_40                                             AS dga_stage_manager_deal_memo_other_per_week_40,
           dga_stage_manager_deal_memo.other_per_week_flat_60                                        AS dga_stage_manager_deal_memo_other_per_week_flat_60,
           dga_stage_manager_deal_memo.other_per_day_8                                               AS dga_stage_manager_deal_memo_other_per_day_8,
           dga_stage_manager_deal_memo.other_per_day_flat_12                                         AS dga_stage_manager_deal_memo_other_per_day_flat_12,
           dga_stage_manager_deal_memo.project_info_30_lower                                         AS dga_stage_manager_deal_memo_project_info_30_lower,
           dga_stage_manager_deal_memo.project_info_30_between                                       AS dga_stage_manager_deal_memo_project_info_30_between,
           dga_stage_manager_deal_memo.project_info_30_higher                                        AS dga_stage_manager_deal_memo_project_info_30_higher,
           dga_stage_manager_deal_memo.project_info_60_lower                                         AS dga_stage_manager_deal_memo_project_info_60_lower,
           dga_stage_manager_deal_memo.project_info_60_between                                       AS dga_stage_manager_deal_memo_project_info_60_between,
           dga_stage_manager_deal_memo.project_info_60_higher                                        AS dga_stage_manager_deal_memo_project_info_60_higher,
           dga_stage_manager_deal_memo.project_info_120_lower                                        AS dga_stage_manager_deal_memo_project_info_120_lower,
           dga_stage_manager_deal_memo.project_info_120_between                                      AS dga_stage_manager_deal_memo_project_info_120_between,
           dga_stage_manager_deal_memo.project_info_120_higher                                       AS dga_stage_manager_deal_memo_project_info_120_higher,
           dga_stage_manager_deal_memo.other_conditions                                              AS dga_stage_manager_deal_memo_other_conditions,
        --    dga_stage_manager_deal_memo.employer_name                                                 AS dga_stage_manager_deal_memo_employer_name,
           dga_stage_manager_deal_memo.employee_name                                                 AS dga_stage_manager_deal_memo_employee_name,
           dga_stage_manager_deal_memo.employee_date                                                 AS dga_stage_manager_deal_memo_employee_date,
           dga_stage_manager_deal_memo.signatory                                                     AS dga_stage_manager_deal_memo_signatory,
           dga_stage_manager_deal_memo.signatory_by                                                  AS dga_stage_manager_deal_memo_signatory_by,
           dga_stage_manager_deal_memo.signatory_date                                                AS dga_stage_manager_deal_memo_signatory_date,
           DATE_FORMAT(dga_stage_manager_deal_memo.created,'%m/%d/%Y %H:%i:%S')                      AS dga_stage_manager_deal_memo_created,
           dga_stage_manager_deal_memo.created_by                                                    AS dga_stage_manager_deal_memo_created_by,
           DATE_FORMAT(dga_stage_manager_deal_memo.updated,'%m/%d/%Y %H:%i:%S')                      AS dga_stage_manager_deal_memo_updated,
           dga_stage_manager_deal_memo.updated_by                                                    AS dga_stage_manager_deal_memo_updated_by,
           dga_stage_manager_deal_memo.status                                                        AS dga_stage_manager_deal_memo_status
      FROM dga_stage_manager_deal_memo AS dga_stage_manager_deal_memo INNER JOIN contact    AS contact               ON contact.id               = dga_stage_manager_deal_memo.contact_id
                                                                      LEFT  JOIN state      AS state                 ON state.code               = contact.state_code
                                                                      LEFT  JOIN period     AS salary_period         ON salary_period.id         = dga_stage_manager_deal_memo.salary_period_id
                                                                      LEFT  JOIN period     AS aditional_time_period ON aditional_time_period.id = dga_stage_manager_deal_memo.aditional_time_period_id
                                                                      LEFT  JOIN period     AS guaranteed_period     ON guaranteed_period.id     = dga_stage_manager_deal_memo.guaranteed_period_id
                                                                      INNER JOIN production AS production            ON production.id            = dga_stage_manager_deal_memo.production_id
                                                                      INNER JOIN episode    AS episode               ON episode.id               = dga_stage_manager_deal_memo.episode_id
                                                                      INNER JOIN season     AS season                ON episode.season_id        = season.id;

 CREATE OR REPLACE VIEW dga_director_scripted_deal_memo_get_list(
    dga_director_scripted_deal_memo_id,
    dga_director_scripted_deal_memo_contact_id,
    dga_director_scripted_deal_memo_contact_first_name,
    dga_director_scripted_deal_memo_contact_middle_name,
    dga_director_scripted_deal_memo_contact_last_name,
    dga_director_scripted_deal_memo_contact_suffix,
    dga_director_scripted_deal_memo_contact_full_name,
    dga_director_scripted_deal_memo_contact_address,
    dga_director_scripted_deal_memo_contact_city,
    dga_director_scripted_deal_memo_contact_state_code,
    dga_director_scripted_deal_memo_contact_state_name,
    dga_director_scripted_deal_memo_contact_phone,
    dga_director_scripted_deal_memo_contact_email,
    dga_director_scripted_deal_memo_ssn,
    dga_director_scripted_deal_memo_loanout,
    dga_director_scripted_deal_memo_fid,
    dga_director_scripted_deal_memo_salary,
    dga_director_scripted_deal_memo_salary_period_id,
    dga_director_scripted_deal_memo_salary_period_name,
    dga_director_scripted_deal_memo_salary_period_period,
    dga_director_scripted_deal_memo_salary_period_plural,
    dga_director_scripted_deal_memo_aditional_time,
    dga_director_scripted_deal_memo_aditional_time_period_id,
    dga_director_scripted_deal_memo_aditional_time_period_name,
    dga_director_scripted_deal_memo_aditional_time_period_period,
    dga_director_scripted_deal_memo_aditional_time_period_plural,
    dga_director_scripted_deal_memo_start_date,
    dga_director_scripted_deal_memo_guaranteed,
    dga_director_scripted_deal_memo_guaranteed_period_id,
    dga_director_scripted_deal_memo_guaranteed_period_name,
    dga_director_scripted_deal_memo_guaranteed_period_period,
    dga_director_scripted_deal_memo_guaranteed_period_plural,
    dga_director_scripted_deal_memo_dga_covered,
    dga_director_scripted_deal_memo_addition_terms,
    dga_director_scripted_deal_memo_production_id,
    dga_director_scripted_deal_memo_production_title,
    dga_director_scripted_deal_memo_project_number,
    dga_director_scripted_deal_memo_episode_id,
    dga_director_scripted_deal_memo_episode_title,
    dga_director_scripted_deal_memo_episode_episode_number,
    dga_director_scripted_deal_memo_episode_episode_abreviation,
    dga_director_scripted_deal_memo_episode_specific_length,
    dga_director_scripted_deal_memo_segment,
    dga_director_scripted_deal_memo_segment_specific_length,
    dga_director_scripted_deal_memo_length_30,
    dga_director_scripted_deal_memo_length_60,
    dga_director_scripted_deal_memo_length_90,
    dga_director_scripted_deal_memo_length_120,
    dga_director_scripted_deal_memo_length_other,
    dga_director_scripted_deal_memo_pilot,
    dga_director_scripted_deal_memo_dramatic_basic_cable_budget,
    dga_director_scripted_deal_memo_type_production_multi_camera,
    dga_director_scripted_deal_memo_type_production_single_camera,
    dga_director_scripted_deal_memo_produced_for_network,
    dga_director_scripted_deal_memo_produced_for_non_network,
    dga_director_scripted_deal_memo_produced_for_basic_cable,
    dga_director_scripted_deal_memo_produced_for_pay_tv,
    dga_director_scripted_deal_memo_produced_for_home_video,
    dga_director_scripted_deal_memo_produced_non_network_prime_time,
    dga_director_scripted_deal_memo_produced_nnetwork_nprime_time,
    dga_director_scripted_deal_memo_project_budget_more,
    dga_director_scripted_deal_memo_project_budget_less,
    dga_director_scripted_deal_memo_second_unit_director,
    dga_director_scripted_deal_memo_segment_applicable,
    dga_director_scripted_deal_memo_individual_final_cut_authority,
    dga_director_scripted_deal_memo_other_conditions,
    dga_director_scripted_deal_memo_employer_name,
    dga_director_scripted_deal_memo_employee_name,
    dga_director_scripted_deal_memo_employee_date,
    dga_director_scripted_deal_memo_signatory,
    dga_director_scripted_deal_memo_signatory_by,
    dga_director_scripted_deal_memo_signatory_date,
    dga_director_scripted_deal_memo_created,
    dga_director_scripted_deal_memo_created_by,
    dga_director_scripted_deal_memo_updated,
    dga_director_scripted_deal_memo_updated_by,
    dga_director_scripted_deal_memo_status
) AS
    SELECT dga_director_scripted_deal_memo.id                                                                       AS dga_director_scripted_deal_memo_id,
           dga_director_scripted_deal_memo.contact_id                                                               AS dga_director_scripted_deal_memo_contact_id,
        --    contact.name                                                                                             AS dga_director_scripted_deal_memo_contact_name,
           contact.first_name                                                                                       AS dga_director_scripted_deal_memo_contact_first_name,
           contact.middle_name                                                                                      AS dga_director_scripted_deal_memo_contact_middle_name,
           contact.last_name                                                                                        AS dga_director_scripted_deal_memo_contact_last_name,
           contact.suffix                                                                                           AS dga_director_scripted_deal_memo_contact_suffix,
           contact_get_full_name(contact.id)                                                                        AS dga_director_scripted_deal_memo_contact_full_name,
           contact.address                                                                                          AS dga_director_scripted_deal_memo_contact_address,
           contact.city                                                                                             AS dga_director_scripted_deal_memo_contact_city,
           contact.state_code                                                                                       AS dga_director_scripted_deal_memo_contact_state_code,
           state.name                                                                                               AS dga_director_scripted_deal_memo_contact_state_name,
           contact.phone                                                                                            AS dga_director_scripted_deal_memo_contact_phone,
           contact.email                                                                                            AS dga_director_scripted_deal_memo_contact_email,
           dga_director_scripted_deal_memo.ssn                                                                      AS dga_director_scripted_deal_memo_ssn,
           dga_director_scripted_deal_memo.loanout                                                                  AS dga_director_scripted_deal_memo_loanout,
           dga_director_scripted_deal_memo.fid                                                                      AS dga_director_scripted_deal_memo_fid,
           dga_director_scripted_deal_memo.salary                                                                   AS dga_director_scripted_deal_memo_salary,
           dga_director_scripted_deal_memo.salary_period_id                                                         AS dga_director_scripted_deal_memo_salary_period_id,
           salary_period.name                                                                                       AS dga_director_scripted_deal_memo_salary_period_name,
           salary_period.period                                                                                     AS dga_director_scripted_deal_memo_salary_period_period,
           salary_period.plural                                                                                     AS dga_director_scripted_deal_memo_salary_period_plural,
           dga_director_scripted_deal_memo.aditional_time                                                           AS dga_director_scripted_deal_memo_aditional_time,
           dga_director_scripted_deal_memo.aditional_time_period_id                                                 AS dga_director_scripted_deal_memo_aditional_time_period_id,
           aditional_time_period.name                                                                               AS dga_director_scripted_deal_memo_aditional_time_period_name,
           aditional_time_period.period                                                                             AS dga_director_scripted_deal_memo_aditional_time_period_period,
           aditional_time_period.plural                                                                             AS dga_director_scripted_deal_memo_aditional_time_period_plural,
           DATE_FORMAT(dga_director_scripted_deal_memo.start_date,'%m/%d/%Y')                                       AS dga_director_scripted_deal_memo_start_date,
           dga_director_scripted_deal_memo.guaranteed                                                               AS dga_director_scripted_deal_memo_guaranteed,
           dga_director_scripted_deal_memo.guaranteed_period_id                                                     AS dga_director_scripted_deal_memo_guaranteed_period_id,
           guaranteed_period.name                                                                                   AS dga_director_scripted_deal_memo_guaranteed_period_name,
           guaranteed_period.period                                                                                 AS dga_director_scripted_deal_memo_guaranteed_period_period,
           guaranteed_period.plural                                                                                 AS dga_director_scripted_deal_memo_guaranteed_period_plural,
           dga_director_scripted_deal_memo.dga_covered                                                              AS dga_director_scripted_deal_memo_dga_covered,
           dga_director_scripted_deal_memo.addition_terms                                                           AS dga_director_scripted_deal_memo_addition_terms,
           dga_director_scripted_deal_memo.production_id                                                            AS dga_director_scripted_deal_memo_production_id,
           production.title                                                                                         AS dga_director_scripted_deal_memo_production_title,
           dga_director_scripted_deal_memo.project_number                                                           AS dga_director_scripted_deal_memo_project_number,
           dga_director_scripted_deal_memo.episode_id                                                               AS dga_director_scripted_deal_memo_episode_id,
           episode.title                                                                                            AS dga_director_scripted_deal_memo_episode_title,
           LPAD(episode.episode_number, 2, 0)                                                                       AS dga_director_scripted_deal_memo_episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))                   AS dga_director_scripted_deal_memo_episode_episode_abreviation,
           dga_director_scripted_deal_memo.episode_specific_length                                                  AS dga_director_scripted_deal_memo_episode_specific_length,
           dga_director_scripted_deal_memo.segment                                                                  AS dga_director_scripted_deal_memo_segment,
           dga_director_scripted_deal_memo.segment_specific_length                                                  AS dga_director_scripted_deal_memo_segment_specific_length,
           dga_director_scripted_deal_memo.length_30                                                                AS dga_director_scripted_deal_memo_length_30,
           dga_director_scripted_deal_memo.length_60                                                                AS dga_director_scripted_deal_memo_length_60,
           dga_director_scripted_deal_memo.length_90                                                                AS dga_director_scripted_deal_memo_length_90,
           dga_director_scripted_deal_memo.length_120                                                               AS dga_director_scripted_deal_memo_length_120,
           dga_director_scripted_deal_memo.length_other                                                             AS dga_director_scripted_deal_memo_length_other,
           dga_director_scripted_deal_memo.pilot                                                                    AS dga_director_scripted_deal_memo_pilot,
           dga_director_scripted_deal_memo.dramatic_basic_cable_budget                                              AS dga_director_scripted_deal_memo_dramatic_basic_cable_budget,
           dga_director_scripted_deal_memo.type_production_multi_camera                                             AS dga_director_scripted_deal_memo_type_production_multi_camera,
           dga_director_scripted_deal_memo.type_production_single_camera                                            AS dga_director_scripted_deal_memo_type_production_single_camera,
        --    dga_director_scripted_deal_memo.television_license_director                                              AS dga_director_scripted_deal_memo_television_license_director,
        --    dga_director_scripted_deal_memo.television_license_budget                                                AS dga_director_scripted_deal_memo_television_license_budget,
           dga_director_scripted_deal_memo.produced_for_network                                                     AS dga_director_scripted_deal_memo_produced_for_network,
           dga_director_scripted_deal_memo.produced_for_non_network                                                 AS dga_director_scripted_deal_memo_produced_for_non_network,
           dga_director_scripted_deal_memo.produced_for_basic_cable                                                 AS dga_director_scripted_deal_memo_produced_for_basic_cable,
           dga_director_scripted_deal_memo.produced_for_pay_tv                                                      AS dga_director_scripted_deal_memo_produced_for_pay_tv,
           dga_director_scripted_deal_memo.produced_for_home_video                                                  AS dga_director_scripted_deal_memo_produced_for_home_video,
           dga_director_scripted_deal_memo.produced_non_network_prime_time                                          AS dga_director_scripted_deal_memo_produced_non_network_prime_time,
           dga_director_scripted_deal_memo.produced_non_network_non_prime_time                                      AS dga_director_scripted_deal_memo_produced_nnetwork_nprime_time,
           dga_director_scripted_deal_memo.project_budget_more                                                      AS dga_director_scripted_deal_memo_project_budget_more,
           dga_director_scripted_deal_memo.project_budget_less                                                      AS dga_director_scripted_deal_memo_project_budget_less,
           dga_director_scripted_deal_memo.second_unit_director                                                     AS dga_director_scripted_deal_memo_second_unit_director,
           dga_director_scripted_deal_memo.segment_applicable                                                       AS dga_director_scripted_deal_memo_segment_applicable,
           dga_director_scripted_deal_memo.individual_final_cut_authority                                           AS dga_director_scripted_deal_memo_individual_final_cut_authority,
           dga_director_scripted_deal_memo.other_conditions                                                         AS dga_director_scripted_deal_memo_other_conditions,
           dga_director_scripted_deal_memo.employer_name                                                            AS dga_director_scripted_deal_memo_employer_name,
           dga_director_scripted_deal_memo.employee_name                                                            AS dga_director_scripted_deal_memo_employee_name,
           DATE_FORMAT(dga_director_scripted_deal_memo.employee_date,'%m/%d/%Y %H:%i:%S')                           AS dga_director_scripted_deal_memo_employee_date,
           dga_director_scripted_deal_memo.signatory                                                                AS dga_director_scripted_deal_memo_signatory,
           dga_director_scripted_deal_memo.signatory_by                                                             AS dga_director_scripted_deal_memo_signatory_by,
           DATE_FORMAT(dga_director_scripted_deal_memo.signatory_date,'%m/%d/%Y %H:%i:%S')                          AS dga_director_scripted_deal_memo_signatory_date,
           DATE_FORMAT(dga_director_scripted_deal_memo.created,'%m/%d/%Y %H:%i:%S')                                 AS dga_director_scripted_deal_memo_created,
           dga_director_scripted_deal_memo.created_by                                                               AS dga_director_scripted_deal_memo_created_by,
           DATE_FORMAT(dga_director_scripted_deal_memo.updated,'%m/%d/%Y %H:%i:%S')                                 AS dga_director_scripted_deal_memo_updated,
           dga_director_scripted_deal_memo.updated_by                                                               AS dga_director_scripted_deal_memo_updated_by,
           dga_director_scripted_deal_memo.status                                                                   AS dga_director_scripted_deal_memo_status
      FROM dga_director_scripted_deal_memo AS dga_director_scripted_deal_memo INNER JOIN contact    AS contact               ON contact.id               = dga_director_scripted_deal_memo.contact_id
                                                                              LEFT  JOIN state      AS state                 ON state.code               = contact.state_code
                                                                              LEFT  JOIN period     AS salary_period         ON salary_period.id         = dga_director_scripted_deal_memo.salary_period_id
                                                                              LEFT  JOIN period     AS aditional_time_period ON aditional_time_period.id = dga_director_scripted_deal_memo.aditional_time_period_id
                                                                              LEFT  JOIN period     AS guaranteed_period     ON guaranteed_period.id     = dga_director_scripted_deal_memo.guaranteed_period_id
                                                                              INNER JOIN production AS production            ON production.id            = dga_director_scripted_deal_memo.production_id
                                                                              INNER JOIN episode    AS episode               ON episode.id               = dga_director_scripted_deal_memo.episode_id
                                                                              INNER JOIN season     AS season                ON episode.season_id        = season.id;

 CREATE OR REPLACE VIEW dga_upm_deal_memo_get_list(
    dga_upm_deal_memo_id,
    dga_upm_deal_memo_contact_id,
    dga_upm_deal_memo_contact_first_name,
    dga_upm_deal_memo_contact_middle_name,
    dga_upm_deal_memo_contact_last_name,
    dga_upm_deal_memo_contact_full_name,
    dga_upm_deal_memo_contact_suffix,
    dga_upm_deal_memo_contact_address,
    dga_upm_deal_memo_contact_city,
    dga_upm_deal_memo_contact_state_code,
    dga_upm_deal_memo_contact_state_name,
    dga_upm_deal_memo_contact_phone,
    dga_upm_deal_memo_contact_email,
    dga_upm_deal_memo_contact_website,
    dga_upm_deal_memo_contact_picture_path,
    dga_upm_deal_memo_ssn,
    dga_upm_deal_memo_loanout,
    dga_upm_deal_memo_fid,
    dga_upm_deal_memo_category_unit_production_manager,
    dga_upm_deal_memo_category_additional_second_assistant_director,
    dga_upm_deal_memo_category_first_assistant_director,
    dga_upm_deal_memo_category_associate_director,
    dga_upm_deal_memo_category_key_second_assistant_director,
    dga_upm_deal_memo_category_associate_director_line_cut,
    dga_upm_deal_memo_category_second_assistant_director,
    dga_upm_deal_memo_salary_studio,
    dga_upm_deal_memo_salary_studio_period_id,
    dga_upm_deal_memo_salary_location,
    dga_upm_deal_memo_salary_location_period_id,
    dga_upm_deal_memo_start_date,
    dga_upm_deal_memo_guaranteed_period_1,
    dga_upm_deal_memo_guaranteed_period_3,
    dga_upm_deal_memo_guaranteed_period_7,
    dga_upm_deal_memo_production_id,
    dga_upm_deal_memo_production_title,
    dga_upm_deal_memo_episode_id,
    dga_upm_deal_memo_episode_title,
    dga_upm_deal_memo_episode_number,
    dga_upm_deal_memo_episode_abbreviation,
    dga_upm_deal_memo_type_production_feature,
    dga_upm_deal_memo_type_production_multi_camera_prime_time,
    dga_upm_deal_memo_type_production_single_camera,
    dga_upm_deal_memo_type_production_other_television,
    dga_upm_deal_memo_project_info_30_lower,
    dga_upm_deal_memo_project_info_30_between,
    dga_upm_deal_memo_project_info_30_higher,
    dga_upm_deal_memo_project_info_60_lower,
    dga_upm_deal_memo_project_info_60_between,
    dga_upm_deal_memo_project_info_60_higher,
    dga_upm_deal_memo_project_info_120_lower,
    dga_upm_deal_memo_project_info_120_between,
    dga_upm_deal_memo_project_info_120_higher,
    dga_upm_deal_memo_location_studio,
    dga_upm_deal_memo_location_distant,
    dga_upm_deal_memo_location_distant_specific,
    dga_upm_deal_memo_location_both,
    dga_upm_deal_memo_location_both_specific,
    dga_upm_deal_memo_other_conditions,
    dga_upm_deal_memo_employer_name,
    dga_upm_deal_memo_employee_name,
    dga_upm_deal_memo_employee_date,
    dga_upm_deal_memo_signatory,
    dga_upm_deal_memo_signatory_by,
    dga_upm_deal_memo_signatory_date,
    dga_upm_deal_memo_created,
    dga_upm_deal_memo_created_by,
    dga_upm_deal_memo_updated,
    dga_upm_deal_memo_updated_by,
    dga_upm_deal_memo_status
) AS
    SELECT dga_upm_deal_memo.id                                                                    AS dga_upm_deal_memo_id,
           dga_upm_deal_memo.contact_id                                                            AS dga_upm_deal_memo_contact_id,
           contact.first_name                                                                      AS dga_upm_deal_memo_contact_first_name,
           contact.middle_name                                                                     AS dga_upm_deal_memo_contact_middle_name,
           contact.last_name                                                                       AS dga_upm_deal_memo_contact_last_name,
           contact_get_full_name(dga_upm_deal_memo.contact_id)                                     AS dga_upm_deal_memo_contact_full_name,
           contact.suffix                                                                          AS dga_upm_deal_memo_contact_suffix,
           contact.address                                                                         AS dga_upm_deal_memo_contact_address,
           contact.city                                                                            AS dga_upm_deal_memo_contact_city,
           contact.state_code                                                                      AS dga_upm_deal_memo_contact_state_code,
           state.name                                                                              AS dga_upm_deal_memo_contact_state_name,
           contact.phone                                                                           AS dga_upm_deal_memo_contact_phone,
           contact.email                                                                           AS dga_upm_deal_memo_contact_email,
           contact.website                                                                         AS dga_upm_deal_memo_contact_website,
           contact.picture_path                                                                    AS dga_upm_deal_memo_contact_picture_path,
           dga_upm_deal_memo.ssn                                                                   AS dga_upm_deal_memo_ssn,
           dga_upm_deal_memo.loanout                                                               AS dga_upm_deal_memo_loanout,
           dga_upm_deal_memo.fid                                                                   AS dga_upm_deal_memo_fid,
           dga_upm_deal_memo.category_unit_production_manager                                      AS dga_upm_deal_memo_category_unit_production_manager,
           dga_upm_deal_memo.category_additional_second_assistant_director                         AS dga_upm_deal_memo_category_additional_second_assistant_director,
           dga_upm_deal_memo.category_first_assistant_director                                     AS dga_upm_deal_memo_category_first_assistant_director,
           dga_upm_deal_memo.category_associate_director                                           AS dga_upm_deal_memo_category_associate_director,
           dga_upm_deal_memo.category_key_second_assistant_director                                AS dga_upm_deal_memo_category_key_second_assistant_director,
           dga_upm_deal_memo.category_associate_director_line_cut                                  AS dga_upm_deal_memo_category_associate_director_line_cut,
           dga_upm_deal_memo.category_second_assistant_director                                    AS dga_upm_deal_memo_category_second_assistant_director,
           dga_upm_deal_memo.salary_studio                                                         AS dga_upm_deal_memo_salary_studio,
           dga_upm_deal_memo.salary_studio_period_id                                               AS dga_upm_deal_memo_salary_studio_period_id,
           dga_upm_deal_memo.salary_location                                                       AS dga_upm_deal_memo_salary_location,
           dga_upm_deal_memo.salary_location_period_id                                             AS dga_upm_deal_memo_salary_location_period_id,
           dga_upm_deal_memo.start_date                                                            AS dga_upm_deal_memo_start_date,
           dga_upm_deal_memo.guaranteed_period_1                                                   AS dga_upm_deal_memo_guaranteed_period_1,
           dga_upm_deal_memo.guaranteed_period_3                                                   AS dga_upm_deal_memo_guaranteed_period_3,
           dga_upm_deal_memo.guaranteed_period_7                                                   AS dga_upm_deal_memo_guaranteed_period_7,
           dga_upm_deal_memo.production_id                                                         AS dga_upm_deal_memo_production_id,
           production.title                                                                        AS dga_upm_deal_memo_production_title,
           dga_upm_deal_memo.episode_id                                                            AS dga_upm_deal_memo_episode_id,
           episode.title                                                                           AS dga_upm_deal_memo_episode_title,
           LPAD(episode.episode_number, 2, 0)                                                      AS dga_upm_deal_memo_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))  AS dga_upm_deal_memo_episode_abbreviation,
           dga_upm_deal_memo.type_production_feature                                               AS dga_upm_deal_memo_type_production_feature,
           dga_upm_deal_memo.type_production_multi_camera_prime_time                               AS dga_upm_deal_memo_type_production_multi_camera_prime_time,
           dga_upm_deal_memo.type_production_single_camera                                         AS dga_upm_deal_memo_type_production_single_camera,
           dga_upm_deal_memo.type_production_other_television                                      AS dga_upm_deal_memo_type_production_other_television,
           dga_upm_deal_memo.project_info_30_lower                                                 AS dga_upm_deal_memo_project_info_30_lower,
           dga_upm_deal_memo.project_info_30_between                                               AS dga_upm_deal_memo_project_info_30_between,
           dga_upm_deal_memo.project_info_30_higher                                                AS dga_upm_deal_memo_project_info_30_higher,
           dga_upm_deal_memo.project_info_60_lower                                                 AS dga_upm_deal_memo_project_info_60_lower,
           dga_upm_deal_memo.project_info_60_between                                               AS dga_upm_deal_memo_project_info_60_between,
           dga_upm_deal_memo.project_info_60_higher                                                AS dga_upm_deal_memo_project_info_60_higher,
           dga_upm_deal_memo.project_info_120_lower                                                AS dga_upm_deal_memo_project_info_120_lower,
           dga_upm_deal_memo.project_info_120_between                                              AS dga_upm_deal_memo_project_info_120_between,
           dga_upm_deal_memo.project_info_120_higher                                               AS dga_upm_deal_memo_project_info_120_higher,
           dga_upm_deal_memo.location_studio                                                       AS dga_upm_deal_memo_location_studio,
           dga_upm_deal_memo.location_distant                                                      AS dga_upm_deal_memo_location_distant,
           dga_upm_deal_memo.location_distant_specific                                             AS dga_upm_deal_memo_location_distant_specific,
           dga_upm_deal_memo.location_both                                                         AS dga_upm_deal_memo_location_both,
           dga_upm_deal_memo.location_both_specific                                                AS dga_upm_deal_memo_location_both_specific,
           dga_upm_deal_memo.other_conditions                                                      AS dga_upm_deal_memo_other_conditions,
           dga_upm_deal_memo.employer_name                                                         AS dga_upm_deal_memo_employer_name,
           dga_upm_deal_memo.employee_name                                                         AS dga_upm_deal_memo_employee_name,
           dga_upm_deal_memo.employee_date                                                         AS dga_upm_deal_memo_employee_date,
           dga_upm_deal_memo.signatory                                                             AS dga_upm_deal_memo_signatory,
           dga_upm_deal_memo.signatory_by                                                          AS dga_upm_deal_memo_signatory_by,
           dga_upm_deal_memo.signatory_date                                                        AS dga_upm_deal_memo_signatory_date,
           DATE_FORMAT(dga_upm_deal_memo.created,'%m/%d/%Y %H:%i:%S')                              AS dga_upm_deal_memo_created,
           dga_upm_deal_memo.created_by                                                            AS dga_upm_deal_memo_created_by,
           DATE_FORMAT(dga_upm_deal_memo.updated,'%m/%d/%Y %H:%i:%S')                              AS dga_upm_deal_memo_updated,
           dga_upm_deal_memo.updated_by                                                            AS dga_upm_deal_memo_updated_by,
           dga_upm_deal_memo.status                                                                AS dga_upm_deal_memo_status
      FROM dga_upm_deal_memo AS dga_upm_deal_memo INNER JOIN contact    AS contact    ON contact.id         = dga_upm_deal_memo.contact_id
                                                  INNER JOIN state      AS state      ON state.code         = contact.state_code
                                                  INNER JOIN production AS production ON production.id      = dga_upm_deal_memo.production_id
                                                  INNER JOIN episode    AS episode    ON episode.id         = dga_upm_deal_memo.episode_id
                                                  INNER JOIN season     AS season     ON episode.season_id  = season.id;

 CREATE OR REPLACE VIEW dga_pif_tv_get_list(
    dga_pif_tv_id,
    dga_pif_tv_company_id,
    dga_pif_tv_company_name,
    dga_pif_tv_contact_id,
    dga_pif_tv_contact_full_name,
    dga_pif_tv_contact_phone,
    dga_pif_tv_contact_email,
    dga_pif_tv_production_id,
    dga_pif_tv_production_title,
    dga_pif_tv_copyright_holder,
    dga_pif_tv_copyright_holder_name,
    dga_pif_tv_copyright_holder_phone,
    dga_pif_tv_writers,
    dga_pif_tv_budget,
    dga_pif_tv_locations,
    dga_pif_tv_date_pre_production,
    dga_pif_tv_date_principal_photography,
    dga_pif_tv_date_wrap,
    dga_pif_tv_format_multi_camera,
    dga_pif_tv_format_single_camera,
    dga_pif_tv_produced_digital,
    dga_pif_tv_produced_film,
    dga_pif_tv_produced_tape,
    dga_pif_tv_produced_live,
    dga_pif_tv_produced_other,
    dga_pif_tv_produced_other_description,
    dga_pif_tv_program_type_dramatic,
    dga_pif_tv_program_type_sitcom,
    dga_pif_tv_program_type_reality,
    dga_pif_tv_program_type_variety,
    dga_pif_tv_program_type_other,
    dga_pif_tv_program_type_other_description,
    dga_pif_tv_program_length_30,
    dga_pif_tv_program_length_60,
    dga_pif_tv_program_length_90,
    dga_pif_tv_program_length_120,
    dga_pif_tv_program_length_other,
    dga_pif_tv_program_length_other_description,
    dga_pif_tv_network,
    dga_pif_tv_network_abc,
    dga_pif_tv_network_cbs,
    dga_pif_tv_network_fox,
    dga_pif_tv_network_nbc,
    dga_pif_tv_network_pbs,
    dga_pif_tv_network_upn,
    dga_pif_tv_network_wb,
    dga_pif_tv_network_syndication,
    dga_pif_tv_network_syndication_description,
    dga_pif_tv_basic_cable,
    dga_pif_tv_basic_cable_a_and_e,
    dga_pif_tv_basic_cable_disney,
    dga_pif_tv_basic_cable_lifetime,
    dga_pif_tv_basic_cable_mtv,
    dga_pif_tv_basic_cable_nickelodeon,
    dga_pif_tv_basic_cable_tnt,
    dga_pif_tv_basic_cable_usa,
    dga_pif_tv_basic_cable_other,
    dga_pif_tv_basic_cable_other_description,
    dga_pif_tv_pay_tv,
    dga_pif_tv_pay_tv_hbo,
    dga_pif_tv_pay_tv_showtime,
    dga_pif_tv_pay_tv_tmc,
    dga_pif_tv_pay_tv_starz,
    dga_pif_tv_pay_tv_cinemax,
    dga_pif_tv_pay_tv_other,
    dga_pif_tv_pay_tv_other_description,
    dga_pif_tv_pilot,
    dga_pif_tv_direct_to_video,
    dga_pif_tv_other,
    dga_pif_tv_other_description,
    dga_pif_tv_employee_info_director_name,
    dga_pif_tv_employee_info_1_name,
    dga_pif_tv_employee_info_1_upm,
    dga_pif_tv_employee_info_1_associate_director,
    dga_pif_tv_employee_info_2_name,
    dga_pif_tv_employee_info_2_first_assistant_director,
    dga_pif_tv_employee_info_2_stage_manager,
    dga_pif_tv_employee_info_3_name,
    dga_pif_tv_employee_info_3_key_second_assistant_director,
    dga_pif_tv_employee_info_3_second_stage_manager,
    dga_pif_tv_employee_info_4_name,
    dga_pif_tv_employee_info_4_second_assistant_director,
    dga_pif_tv_employee_info_4_third_stage_manager,
    dga_pif_tv_employee_info_5_name,
    dga_pif_tv_employee_info_5_add_second_assistant_director,
    dga_pif_tv_employee_info_5_production_associate,
    dga_pif_tv_employee_info_6_name,
    dga_pif_tv_employee_info_6_associate_director,
    dga_pif_tv_employee_info_7_name,
    dga_pif_tv_employee_info_7_associate_director_line_cut,
    dga_pif_tv_employee_info_other_description,
    dga_pif_tv_affiliations_sav,
    dga_pif_tv_affiliations_wga,
    dga_pif_tv_affiliations_dcg,
    dga_pif_tv_affiliations_aftra,
    dga_pif_tv_affiliations_iatse,
    dga_pif_tv_affiliations_nabet,
    dga_pif_tv_affiliations_afm,
    dga_pif_tv_affiliations_actra,
    dga_pif_tv_affiliations_other,
    dga_pif_tv_affiliations_other_description,
    dga_pif_tv_employment_contact_name,
    dga_pif_tv_employment_contacr_phone,
    dga_pif_tv_residuals_contact_name,
    dga_pif_tv_residuals_contacr_phone,
    dga_pif_tv_primary_finance_source,
    dga_pif_tv_primary_finance_contact,
    dga_pif_tv_primary_finance_phone,
    dga_pif_tv_completion_bond_company,
    dga_pif_tv_completion_bond_contact,
    dga_pif_tv_completion_bond_phone,
    dga_pif_tv_payroll_company,
    dga_pif_tv_payroll_contact,
    dga_pif_tv_payroll_phone,
    dga_pif_tv_credit_line,
    dga_pif_tv_credit_line_bank,
    dga_pif_tv_credit_line_contact,
    dga_pif_tv_credit_line_phone,
    dga_pif_tv_foreign_distribuitors,
    dga_pif_tv_domestic_distribuitors,
    dga_pif_tv_signature,
    dga_pif_tv_signature_title,
    dga_pif_tv_signature_print_name,
    dga_pif_tv_signature_phone,
    dga_pif_tv_signature_date,
    dga_pif_tv_created,
    dga_pif_tv_created_by,
    dga_pif_tv_updated,
    dga_pif_tv_updated_by,
    dga_pif_tv_status
) AS
    SELECT dga_pif_tv.id                                                 AS dga_pif_tv_id,
           dga_pif_tv.company_id                                         AS dga_pif_tv_company_id,
           company.name                                                  AS dga_pif_tv_company_name,
           dga_pif_tv.contact_id                                         AS dga_pif_tv_contact_id,
           contact_get_full_name(dga_pif_tv.contact_id)                  AS dga_pif_tv_contact_full_name,
           contact.phone                                                 AS dga_pif_tv_contact_phone,
           contact.email                                                 AS dga_pif_tv_contact_email,
           dga_pif_tv.production_id                                      AS dga_pif_tv_production_id,
           production.title                                              AS dga_pif_tv_production_title,
           dga_pif_tv.copyright_holder                                   AS dga_pif_tv_copyright_holder,
           dga_pif_tv.copyright_holder_name                              AS dga_pif_tv_copyright_holder_name,
           dga_pif_tv.copyright_holder_phone                             AS dga_pif_tv_copyright_holder_phone,
           dga_pif_tv.writers                                            AS dga_pif_tv_writers,
           dga_pif_tv.budget                                             AS dga_pif_tv_budget,
           dga_pif_tv.locations                                          AS dga_pif_tv_locations,
           DATE_FORMAT(dga_pif_tv.date_pre_production,'%m/%d/%Y')        AS dga_pif_tv_date_pre_production,
           DATE_FORMAT(dga_pif_tv.date_principal_photography,'%m/%d/%Y') AS dga_pif_tv_date_principal_photography,
           DATE_FORMAT(dga_pif_tv.date_wrap,'%m/%d/%Y')                  AS dga_pif_tv_date_wrap,
           dga_pif_tv.format_multi_camera                                AS dga_pif_tv_format_multi_camera,
           dga_pif_tv.format_single_camera                               AS dga_pif_tv_format_single_camera,
           dga_pif_tv.produced_digital                                   AS dga_pif_tv_produced_digital,
           dga_pif_tv.produced_film                                      AS dga_pif_tv_produced_film,
           dga_pif_tv.produced_tape                                      AS dga_pif_tv_produced_tape,
           dga_pif_tv.produced_live                                      AS dga_pif_tv_produced_live,
           dga_pif_tv.produced_other                                     AS dga_pif_tv_produced_other,
           dga_pif_tv.produced_other_description                         AS dga_pif_tv_produced_other_description,
           dga_pif_tv.program_type_dramatic                              AS dga_pif_tv_program_type_dramatic,
           dga_pif_tv.program_type_sitcom                                AS dga_pif_tv_program_type_sitcom,
           dga_pif_tv.program_type_reality                               AS dga_pif_tv_program_type_reality,
           dga_pif_tv.program_type_variety                               AS dga_pif_tv_program_type_variety,
           dga_pif_tv.program_type_other                                 AS dga_pif_tv_program_type_other,
           dga_pif_tv.program_type_other_description                     AS dga_pif_tv_program_type_other_description,
           dga_pif_tv.program_length_30                                  AS dga_pif_tv_program_length_30,
           dga_pif_tv.program_length_60                                  AS dga_pif_tv_program_length_60,
           dga_pif_tv.program_length_90                                  AS dga_pif_tv_program_length_90,
           dga_pif_tv.program_length_120                                 AS dga_pif_tv_program_length_120,
           dga_pif_tv.program_length_other                               AS dga_pif_tv_program_length_other,
           dga_pif_tv.program_length_other_description                   AS dga_pif_tv_program_length_other_description,
           dga_pif_tv.network                                            AS dga_pif_tv_network,
           dga_pif_tv.network_abc                                        AS dga_pif_tv_network_abc,
           dga_pif_tv.network_cbs                                        AS dga_pif_tv_network_cbs,
           dga_pif_tv.network_fox                                        AS dga_pif_tv_network_fox,
           dga_pif_tv.network_nbc                                        AS dga_pif_tv_network_nbc,
           dga_pif_tv.network_pbs                                        AS dga_pif_tv_network_pbs,
           dga_pif_tv.network_upn                                        AS dga_pif_tv_network_upn,
           dga_pif_tv.network_wb                                         AS dga_pif_tv_network_wb,
           dga_pif_tv.network_syndication                                AS dga_pif_tv_network_syndication,
           dga_pif_tv.network_syndication_description                    AS dga_pif_tv_network_syndication_description,
           dga_pif_tv.basic_cable                                        AS dga_pif_tv_basic_cable,
           dga_pif_tv.basic_cable_a_and_e                                AS dga_pif_tv_basic_cable_a_and_e,
           dga_pif_tv.basic_cable_disney                                 AS dga_pif_tv_basic_cable_disney,
           dga_pif_tv.basic_cable_lifetime                               AS dga_pif_tv_basic_cable_lifetime,
           dga_pif_tv.basic_cable_mtv                                    AS dga_pif_tv_basic_cable_mtv,
           dga_pif_tv.basic_cable_nickelodeon                            AS dga_pif_tv_basic_cable_nickelodeon,
           dga_pif_tv.basic_cable_tnt                                    AS dga_pif_tv_basic_cable_tnt,
           dga_pif_tv.basic_cable_usa                                    AS dga_pif_tv_basic_cable_usa,
           dga_pif_tv.basic_cable_other                                  AS dga_pif_tv_basic_cable_other,
           dga_pif_tv.basic_cable_other_description                      AS dga_pif_tv_basic_cable_other_description,
           dga_pif_tv.pay_tv                                             AS dga_pif_tv_pay_tv,
           dga_pif_tv.pay_tv_hbo                                         AS dga_pif_tv_pay_tv_hbo,
           dga_pif_tv.pay_tv_showtime                                    AS dga_pif_tv_pay_tv_showtime,
           dga_pif_tv.pay_tv_tmc                                         AS dga_pif_tv_pay_tv_tmc,
           dga_pif_tv.pay_tv_starz                                       AS dga_pif_tv_pay_tv_starz,
           dga_pif_tv.pay_tv_cinemax                                     AS dga_pif_tv_pay_tv_cinemax,
           dga_pif_tv.pay_tv_other                                       AS dga_pif_tv_pay_tv_other,
           dga_pif_tv.pay_tv_other_description                           AS dga_pif_tv_pay_tv_other_description,
           dga_pif_tv.direct_to_video                                    AS dga_pif_tv_direct_to_video,
           dga_pif_tv.other                                              AS dga_pif_tv_other,
           dga_pif_tv.other_description                                  AS dga_pif_tv_other_description,
           dga_pif_tv.pilot                                              AS dga_pif_tv_pilot,
           dga_pif_tv.employee_info_director_name                        AS dga_pif_tv_employee_info_director_name,
           dga_pif_tv.employee_info_1_name                               AS dga_pif_tv_employee_info_1_name,
           dga_pif_tv.employee_info_1_upm                                AS dga_pif_tv_employee_info_1_upm,
           dga_pif_tv.employee_info_1_associate_director                 AS dga_pif_tv_employee_info_1_associate_director,
           dga_pif_tv.employee_info_2_name                               AS dga_pif_tv_employee_info_2_name,
           dga_pif_tv.employee_info_2_first_assistant_director           AS dga_pif_tv_employee_info_2_first_assistant_director,
           dga_pif_tv.employee_info_2_stage_manager                      AS dga_pif_tv_employee_info_2_stage_manager,
           dga_pif_tv.employee_info_3_name                               AS dga_pif_tv_employee_info_3_name,
           dga_pif_tv.employee_info_3_key_second_assistant_director      AS dga_pif_tv_employee_info_3_key_second_assistant_director,
           dga_pif_tv.employee_info_3_second_stage_manager               AS dga_pif_tv_employee_info_3_second_stage_manager,
           dga_pif_tv.employee_info_4_name                               AS dga_pif_tv_employee_info_4_name,
           dga_pif_tv.employee_info_4_second_assistant_director          AS dga_pif_tv_employee_info_4_second_assistant_director,
           dga_pif_tv.employee_info_4_third_stage_manager                AS dga_pif_tv_employee_info_4_third_stage_manager,
           dga_pif_tv.employee_info_5_name                               AS dga_pif_tv_employee_info_5_name,
           dga_pif_tv.employee_info_5_add_second_assistant_director      AS dga_pif_tv_employee_info_5_add_second_assistant_director,
           dga_pif_tv.employee_info_5_production_associate               AS dga_pif_tv_employee_info_5_production_associate,
           dga_pif_tv.employee_info_6_name                               AS dga_pif_tv_employee_info_6_name,
           dga_pif_tv.employee_info_6_associate_director                 AS dga_pif_tv_employee_info_6_associate_director,
           dga_pif_tv.employee_info_7_name                               AS dga_pif_tv_employee_info_7_name,
           dga_pif_tv.employee_info_7_associate_director_line_cut        AS dga_pif_tv_employee_info_7_associate_director_line_cut,
           dga_pif_tv.employee_info_other_description                    AS dga_pif_tv_employee_info_other_description,
           dga_pif_tv.affiliations_sav                                   AS dga_pif_tv_affiliations_sav,
           dga_pif_tv.affiliations_wga                                   AS dga_pif_tv_affiliations_wga,
           dga_pif_tv.affiliations_dcg                                   AS dga_pif_tv_affiliations_dcg,
           dga_pif_tv.affiliations_aftra                                 AS dga_pif_tv_affiliations_aftra,
           dga_pif_tv.affiliations_iatse                                 AS dga_pif_tv_affiliations_iatse,
           dga_pif_tv.affiliations_nabet                                 AS dga_pif_tv_affiliations_nabet,
           dga_pif_tv.affiliations_afm                                   AS dga_pif_tv_affiliations_afm,
           dga_pif_tv.affiliations_actra                                 AS dga_pif_tv_affiliations_actra,
           dga_pif_tv.affiliations_other                                 AS dga_pif_tv_affiliations_other,
           dga_pif_tv.affiliations_other_description                     AS dga_pif_tv_affiliations_other_description,
           dga_pif_tv.employment_contact_name                            AS dga_pif_tv_employment_contact_name,
           dga_pif_tv.employment_contacr_phone                           AS dga_pif_tv_employment_contacr_phone,
           dga_pif_tv.residuals_contact_name                             AS dga_pif_tv_residuals_contact_name,
           dga_pif_tv.residuals_contacr_phone                            AS dga_pif_tv_residuals_contacr_phone,
           dga_pif_tv.primary_finance_source                             AS dga_pif_tv_primary_finance_source,
           dga_pif_tv.primary_finance_contact                            AS dga_pif_tv_primary_finance_contact,
           dga_pif_tv.primary_finance_phone                              AS dga_pif_tv_primary_finance_phone,
           dga_pif_tv.completion_bond_company                            AS dga_pif_tv_completion_bond_company,
           dga_pif_tv.completion_bond_contact                            AS dga_pif_tv_completion_bond_contact,
           dga_pif_tv.completion_bond_phone                              AS dga_pif_tv_completion_bond_phone,
           dga_pif_tv.payroll_company                                    AS dga_pif_tv_payroll_company,
           dga_pif_tv.payroll_contact                                    AS dga_pif_tv_payroll_contact,
           dga_pif_tv.payroll_phone                                      AS dga_pif_tv_payroll_phone,
           dga_pif_tv.credit_line                                        AS dga_pif_tv_credit_line,
           dga_pif_tv.credit_line_bank                                   AS dga_pif_tv_credit_line_bank,
           dga_pif_tv.credit_line_contact                                AS dga_pif_tv_credit_line_contact,
           dga_pif_tv.credit_line_phone                                  AS dga_pif_tv_credit_line_phone,
           dga_pif_tv.foreign_distribuitors                              AS dga_pif_tv_foreign_distribuitors,
           dga_pif_tv.domestic_distribuitors                             AS dga_pif_tv_domestic_distribuitors,
           dga_pif_tv.signature                                          AS dga_pif_tv_signature,
           dga_pif_tv.signature_title                                    AS dga_pif_tv_signature_title,
           dga_pif_tv.signature_print_name                               AS dga_pif_tv_signature_print_name,
           dga_pif_tv.signature_phone                                    AS dga_pif_tv_signature_phone,
           dga_pif_tv.signature_date                                     AS dga_pif_tv_signature_date,
           DATE_FORMAT(dga_pif_tv.created,'%m/%d/%Y %H:%i:%S')           AS dga_pif_tv_created,
           dga_pif_tv.created_by                                         AS dga_pif_tv_created_by,
           DATE_FORMAT(dga_pif_tv.updated,'%m/%d/%Y %H:%i:%S')           AS dga_pif_tv_updated,
           dga_pif_tv.updated_by                                         AS dga_pif_tv_updated_by,
           dga_pif_tv.status                                             AS dga_pif_tv_status
      FROM dga_pif_tv AS dga_pif_tv INNER JOIN company    AS company    ON company.id    = dga_pif_tv.company_id
                                    INNER JOIN production AS production ON production.id = dga_pif_tv.production_id
                                    INNER JOIN contact    AS contact    ON contact.id    = dga_pif_tv.contact_id;

 CREATE OR REPLACE VIEW dga_pif_tv_company_get_list(
    dga_pif_tv_company_id,
    dga_pif_tv_company_dga_pif_tv_id,
    dga_pif_tv_company_company_name,
    dga_pif_tv_company_company_phone,
    dga_pif_tv_company_created,
    dga_pif_tv_company_created_by,
    dga_pif_tv_company_updated,
    dga_pif_tv_company_updated_by,
    dga_pif_tv_company_status
) AS
    SELECT dga_pif_tv_company.id                                             AS dga_pif_tv_company_id,
           dga_pif_tv_company.dga_pif_tv_id                                  AS dga_pif_tv_company_dga_pif_tv_id,
           dga_pif_tv_company.company_name                                   AS dga_pif_tv_company_company_name,
           dga_pif_tv_company.company_phone                                  AS dga_pif_tv_company_company_phone,
           DATE_FORMAT(dga_pif_tv_company.created,'%m/%d/%Y %H:%i:%S')       AS dga_pif_tv_company_created,
           dga_pif_tv_company.created_by                                     AS dga_pif_tv_company_created_by,
           DATE_FORMAT(dga_pif_tv_company.updated,'%m/%d/%Y %H:%i:%S')       AS dga_pif_tv_company_updated,
           dga_pif_tv_company.updated_by                                     AS dga_pif_tv_company_updated_by,
           dga_pif_tv_company.status                                         AS dga_pif_tv_company_status
      FROM dga_pif_tv_company AS dga_pif_tv_company;

 CREATE OR REPLACE VIEW wga_work_list_get_list(
    wga_work_list_id,
    wga_work_list_company_id,
    wga_work_list_company_number,
    wga_work_list_company_name,
    wga_work_list_company_address,
    wga_work_list_company_city,
    wga_work_list_company_state_code,
    wga_work_list_company_state_name,
    wga_work_list_company_phone,
    wga_work_list_company_website,
    wga_work_list_week_ending,
    wga_work_list_contact_id,
    wga_work_list_contact_first_name,
    wga_work_list_contact_middle_name,
    wga_work_list_contact_last_name,
    wga_work_list_contact_suffix,
    wga_work_list_contact_full_name,
    wga_work_list_contact_address,
    wga_work_list_contact_city,
    wga_work_list_contact_state_code,
    wga_work_list_contact_state_name,
    wga_work_list_contact_phone,
    wga_work_list_contact_email,
    wga_work_list_created,
    wga_work_list_created_by,
    wga_work_list_updated,
    wga_work_list_updated_by,
    wga_work_list_status
) AS
    SELECT wga_work_list.id                                              AS wga_work_list_id,
           wga_work_list.company_id                                      AS wga_work_list_company_id,
           company.wga_company_number                                    AS wga_work_list_company_number,
           company.name                                                  AS wga_work_list_company_name,
           company.address                                               AS wga_work_list_company_address,
           company.city                                                  AS wga_work_list_company_city,
           company.state_code                                            AS wga_work_list_company_state_code,
           company_state.name                                            AS wga_work_list_company_state_name,
           company.phone                                                 AS wga_work_list_company_phone,
           company.website                                               AS wga_work_list_company_website,
           wga_work_list.week_ending                                     AS wga_work_list_week_ending,
           wga_work_list.contact_id                                      AS wga_work_list_contact_id,
           contact.first_name                                            AS wga_work_list_contact_first_name,
           contact.middle_name                                           AS wga_work_list_contact_middle_name,
           contact.last_name                                             AS wga_work_list_contact_last_name,
           contact.suffix                                                AS wga_work_list_contact_suffix,
           contact_get_full_name(contact.id)                             AS wga_work_list_contact_full_name,
           contact.address                                               AS wga_work_list_contact_address,
           contact.city                                                  AS wga_work_list_contact_city,
           contact.state_code                                            AS wga_work_list_contact_state_code,
           contact_state.name                                            AS wga_work_list_contact_state_name,
           contact.phone                                                 AS wga_work_list_contact_phone,
           contact.email                                                 AS wga_work_list_contact_email,
           DATE_FORMAT(wga_work_list.created,'%m/%d/%Y %H:%i:%S')        AS wga_work_list_created,
           wga_work_list.created_by                                      AS wga_work_list_created_by,
           DATE_FORMAT(wga_work_list.updated,'%m/%d/%Y %H:%i:%S')        AS wga_work_list_updated,
           wga_work_list.updated_by                                      AS wga_work_list_updated_by,
           wga_work_list.status                                          AS wga_work_list_status
      FROM wga_work_list AS wga_work_list INNER JOIN company AS company       ON company.id         = wga_work_list.company_id
                                          INNER JOIN state   AS company_state ON company_state.code = company.state_code
                                          INNER JOIN contact AS contact       ON contact.id         = wga_work_list.contact_id
                                          INNER JOIN state   AS contact_state ON contact_state.code = company.state_code;

 CREATE OR REPLACE VIEW wga_deal_type_get_list(
    wga_deal_type_id,
    wga_deal_type_code,
    wga_deal_type_title,
    wga_deal_type_full_title,
    wga_deal_type_created,
    wga_deal_type_created_by,
    wga_deal_type_updated,
    wga_deal_type_updated_by,
    wga_deal_type_status
) AS
    SELECT wga_deal_type.id                                              AS  wga_deal_type_id,
           wga_deal_type.code                                            AS  wga_deal_type_code,
           wga_deal_type.title                                           AS  wga_deal_type_title,
           CASE WHEN TRIM(wga_deal_type.code) IS NULL
                  OR TRIM(wga_deal_type.code) = '' THEN
                wga_deal_type.title
           ELSE
                CONCAT(wga_deal_type.code, ' - ', wga_deal_type.title)
           END                                                           AS  wga_deal_type_full_title,
           DATE_FORMAT(wga_deal_type.created,'%m/%d/%Y %H:%i:%S')        AS  wga_deal_type_created,
           wga_deal_type.created_by                                      AS  wga_deal_type_created_by,
           DATE_FORMAT(wga_deal_type.updated,'%m/%d/%Y %H:%i:%S')        AS  wga_deal_type_updated,
           wga_deal_type.updated_by                                      AS  wga_deal_type_updated_by,
           wga_deal_type.status                                          AS  wga_deal_type_status
      FROM wga_deal_type AS wga_deal_type;

 CREATE OR REPLACE VIEW wga_field_of_work_get_list(
    wga_field_of_work_id,
    wga_field_of_work_code,
    wga_field_of_work_title,
    wga_field_of_work_full_title,
    wga_field_of_work_created,
    wga_field_of_work_created_by,
    wga_field_of_work_updated,
    wga_field_of_work_updated_by,
    wga_field_of_work_status
) AS
    SELECT wga_field_of_work.id                                                             AS wga_field_of_work_id,
           wga_field_of_work.code                                                           AS wga_field_of_work_code,
           wga_field_of_work.title                                                          AS wga_field_of_work_title,
           CASE WHEN TRIM(wga_field_of_work.code) IS NULL
                  OR TRIM(wga_field_of_work.code) = '' THEN
                wga_field_of_work.title
           ELSE
                CONCAT(wga_field_of_work.code, ' - ', wga_field_of_work.title)
           END                                                                              AS wga_field_of_work_full_title,
           DATE_FORMAT(wga_field_of_work.created,'%m/%d/%Y %H:%i:%S')                       AS wga_field_of_work_created,
           wga_field_of_work.created_by                                                     AS wga_field_of_work_created_by,
           DATE_FORMAT(wga_field_of_work.updated,'%m/%d/%Y %H:%i:%S')                       AS wga_field_of_work_updated,
           wga_field_of_work.updated_by                                                     AS wga_field_of_work_updated_by,
           wga_field_of_work.status                                                         AS wga_field_of_work_status
      FROM wga_field_of_work AS wga_field_of_work;

 CREATE OR REPLACE VIEW wga_work_list_item_get_list(
    wga_work_list_item_id,
    wga_work_list_item_wga_work_list_id,
    wga_work_list_item_contact_id,
    wga_work_list_item_contact_first_name,
    wga_work_list_item_contact_middle_name,
    wga_work_list_item_contact_last_name,
    wga_work_list_item_contact_full_name,
    wga_work_list_item_contact_suffix,
    wga_work_list_item_contact_address,
    wga_work_list_item_contact_city,
    wga_work_list_item_contact_state_code,
    wga_work_list_item_contact_phone,
    wga_work_list_item_contact_email,
    wga_work_list_item_contact_ssn,
    wga_work_list_production_id,
    wga_work_list_production_title,
    wga_work_list_item_episode_id,
    wga_work_list_item_episode_title,
    wga_work_list_item_episode_episode_number,
    wga_work_list_item_episode_episode_abbreviation,
    wga_work_list_item_deal_type_id,
    wga_work_list_item_deal_type_code,
    wga_work_list_item_deal_type_title,
    wga_work_list_item_deal_type_full_title,
    wga_work_list_item_field_of_work_id,
    wga_work_list_item_field_of_work_code,
    wga_work_list_item_field_of_work_title,
    wga_work_list_item_field_of_work_full_title,
    wga_work_list_item_date_start,
    wga_work_list_item_date_end,
    wga_work_list_item_additional_data,
    wga_work_list_item_created,
    wga_work_list_item_created_by,
    wga_work_list_item_updated,
    wga_work_list_item_updated_by,
    wga_work_list_item_status
) AS
    SELECT wga_work_list_item.id                                                                    AS wga_work_list_item_id,
           wga_work_list_item.wga_work_list_id                                                      AS wga_work_list_item_wga_work_list_id,
           wga_work_list_item.contact_id                                                            AS wga_work_list_item_contact_id,
           contact.first_name                                                                       AS wga_work_list_item_contact_first_name,
           contact.middle_name                                                                      AS wga_work_list_item_contact_middle_name,
           contact.last_name                                                                        AS wga_work_list_item_contact_last_name,
           contact_get_full_name(contact.id)                                                        AS wga_work_list_item_contact_full_name,
           contact.suffix                                                                           AS wga_work_list_item_contact_suffix,
           contact.address                                                                          AS wga_work_list_item_contact_address,
           contact.city                                                                             AS wga_work_list_item_contact_city,
           contact.state_code                                                                       AS wga_work_list_item_contact_state_code,
           contact.phone                                                                            AS wga_work_list_item_contact_phone,
           contact.email                                                                            AS wga_work_list_item_contact_email,
           contact.ssn                                                                              AS wga_work_list_item_contact_ssn,
           production.id                                                                            AS wga_work_list_production_id,
           production.title                                                                         AS wga_work_list_production_title,
           wga_work_list_item.episode_id                                                            AS wga_work_list_item_episode_id,
           episode.title                                                                            AS wga_work_list_item_episode_title,
           LPAD(episode.episode_number, 2, 0)                                                       AS wga_work_list_item_episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))   AS wga_work_list_item_episode_episode_abbreviation,
           wga_work_list_item.deal_type_id                                                          AS wga_work_list_item_deal_type_id,
           wga_deal_type.code                                                                       AS wga_work_list_item_deal_type_code,
           wga_deal_type.title                                                                      AS wga_work_list_item_deal_type_title,
           CASE WHEN TRIM(wga_deal_type.code) IS NULL
                  OR TRIM(wga_deal_type.code) = '' THEN
                wga_deal_type.title
           ELSE
                CONCAT(wga_deal_type.code, ' - ', wga_deal_type.title)
           END                                                                                      AS wga_work_list_deal_type_full_title,
           wga_work_list_item.field_of_work_id                                                      AS wga_work_list_item_field_of_work_id,
           wga_field_of_work.code                                                                   AS wga_work_list_item_field_of_work_code,
           wga_field_of_work.title                                                                  AS wga_work_list_item_field_of_work_title,
           CASE WHEN TRIM(wga_field_of_work.code) IS NULL
                  OR TRIM(wga_field_of_work.code) = '' THEN
                wga_field_of_work.title
           ELSE
                CONCAT(wga_field_of_work.code, ' - ', wga_field_of_work.title)
           END                                                                                      AS wga_work_list_item_field_of_work_full_title,
           DATE_FORMAT(wga_work_list_item.date_start,  '%m/%d/%Y')                                  AS wga_work_list_item_date_start,
           DATE_FORMAT(wga_work_list_item.date_end,    '%m/%d/%Y')                                  AS wga_work_list_item_date_end,
           wga_work_list_item.additional_data                                                       AS wga_work_list_item_additional_data,
           DATE_FORMAT(wga_work_list_item.created,     '%m/%d/%Y %H:%i:%S')                         AS wga_work_list_item_created,
           wga_work_list_item.created_by                                                            AS wga_work_list_item_created_by,
           DATE_FORMAT(wga_work_list_item.updated,     '%m/%d/%Y %H:%i:%S')                         AS wga_work_list_item_updated,
           wga_work_list_item.updated_by                                                            AS wga_work_list_item_updated_by,
           wga_work_list_item.status                                                                AS wga_work_list_item_status
      FROM wga_work_list_item AS wga_work_list_item INNER JOIN contact           AS contact           ON contact.id           = wga_work_list_item.contact_id
                                                    INNER JOIN episode           AS episode           ON episode.id           = wga_work_list_item.episode_id
                                                    INNER JOIN season            AS season            ON episode.season_id    = season.id
                                                    INNER JOIN production        AS production        ON production.id        = season.production_id
                                                    INNER JOIN wga_deal_type     AS wga_deal_type     ON wga_deal_type.id     = wga_work_list_item.deal_type_id
                                                    INNER JOIN wga_field_of_work AS wga_field_of_work ON wga_field_of_work.id = wga_work_list_item.field_of_work_id;

 CREATE OR REPLACE VIEW wga_ntwc_get_list(
    wga_ntwc_id,
    wga_ntwc_date,
    wga_ntwc_production_id,
    wga_ntwc_production_title,
    wga_ntwc_production_number,
    wga_ntwc_episode_id,
    wga_ntwc_episode_title,
    wga_ntwc_episode_episode_number,
    wga_ntwc_episode_episode_abbreviation,
    wga_ntwc_pilot,
    wga_ntwc_pilot_network_id,
    wga_ntwc_pilot_network_name,
    wga_ntwc_pilot_production_lenght_id,
    wga_ntwc_pilot_production_lenght_name,
    wga_ntwc_executive_producer_contact_id,
    wga_ntwc_director_contact_id,
    wga_ntwc_story_editor_contact_id,
    wga_ntwc_other_executive_producer_contact_id,
    wga_ntwc_producer_contact_id,
    wga_ntwc_supervising_producer_contact_id,
    wga_ntwc_sent_to_writers,
    wga_ntwc_protest_communicated,
    wga_ntwc_by_contact_id,
    wga_ntwc_created,
    wga_ntwc_created_by,
    wga_ntwc_updated,
    wga_ntwc_updated_by,
    wga_ntwc_status
) AS
    SELECT wga_ntwc.id                                                                              AS wga_ntwc_id,
           DATE_FORMAT(wga_ntwc.date,'%m/%d/%Y')                                                    AS wga_ntwc_date,
           wga_ntwc.production_id                                                                   AS wga_ntwc_production_id,
           production.title                                                                         AS wga_ntwc_production_title,
           wga_ntwc.production_number                                                               AS wga_ntwc_production_number,
           wga_ntwc.episode_id                                                                      AS wga_ntwc_episode_id,
           episode.title                                                                            AS wga_ntwc_episode_title,
           LPAD(episode.episode_number, 2, 0)                                                       AS wga_ntwc_episode_episode_number,
           CONCAT('S', LPAD(season.season_number, 2, 0), 'E', LPAD(episode.episode_number, 2, 0))   AS wga_ntwc_episode_episode_abbreviation,
           wga_ntwc.pilot                                                                           AS wga_ntwc_pilot,
           wga_ntwc.pilot_network_id                                                                AS wga_ntwc_pilot_network_id,
           network.name                                                                             AS wga_ntwc_pilot_network_name,
           wga_ntwc.pilot_production_lenght_id                                                      AS wga_ntwc_pilot_production_lenght_id,
           production_length.name                                                                   AS wga_ntwc_pilot_production_lenght_name,
           wga_ntwc.executive_producer_contact_id                                                   AS wga_ntwc_executive_producer_contact_id,
           wga_ntwc.director_contact_id                                                             AS wga_ntwc_director_contact_id,
           wga_ntwc.story_editor_contact_id                                                         AS wga_ntwc_story_editor_contact_id,
           wga_ntwc.other_executive_producer_contact_id                                             AS wga_ntwc_other_executive_producer_contact_id,
           wga_ntwc.producer_contact_id                                                             AS wga_ntwc_producer_contact_id,
           wga_ntwc.supervising_producer_contact_id                                                 AS wga_ntwc_supervising_producer_contact_id,
           DATE_FORMAT(wga_ntwc.sent_to_writers,      '%m/%d/%Y')                                   AS wga_ntwc_sent_to_writers,
           DATE_FORMAT(wga_ntwc.protest_communicated, '%m/%d/%Y')                                   AS wga_ntwc_protest_communicated,
           wga_ntwc.by_contact_id                                                                   AS wga_ntwc_by_contact_id,
           DATE_FORMAT(wga_ntwc.created, '%m/%d/%Y %H:%i:%S')                                       AS wga_ntwc_created,
           wga_ntwc.created_by                                                                      AS wga_ntwc_created_by,
           DATE_FORMAT(wga_ntwc.updated, '%m/%d/%Y %H:%i:%S')                                       AS wga_ntwc_updated,
           wga_ntwc.updated_by                                                                      AS wga_ntwc_updated_by,
           wga_ntwc.status                                                                          AS wga_ntwc_status
      FROM wga_ntwc AS wga_ntwc INNER JOIN production        AS production        ON production.id        = wga_ntwc.production_id
                                INNER JOIN episode           AS episode           ON episode.id           = wga_ntwc.episode_id
                                INNER JOIN season            AS season            ON season.id            = episode.season_id
                                LEFT  JOIN network           AS network           ON network.id           = wga_ntwc.pilot_network_id
                                LEFT  JOIN production_length AS production_length ON production_length.id = wga_ntwc.pilot_production_lenght_id
                                ;

 CREATE OR REPLACE VIEW wga_ntwc_participant_writer_get_list(
    wga_ntwc_participant_writer_wga_ntwc_id,
    wga_ntwc_participant_writer_contact_id,
    wga_ntwc_participant_writer_contact_first_name,
    wga_ntwc_participant_writer_contact_middle_name,
    wga_ntwc_participant_writer_contact_last_name,
    wga_ntwc_participant_writer_contact_suffix,
    wga_ntwc_participant_writer_contact_full_name,
    wga_ntwc_participant_writer_contact_address,
    wga_ntwc_participant_writer_contact_city,
    wga_ntwc_participant_writer_contact_state_code,
    wga_ntwc_participant_writer_created,
    wga_ntwc_participant_writer_created_by,
    wga_ntwc_participant_writer_updated,
    wga_ntwc_participant_writer_updated_by,
    wga_ntwc_participant_writer_status
) AS
    SELECT wga_ntwc_participant_writer.wga_ntwc_id                                   AS wga_ntwc_participant_writer_wga_ntwc_id,
           wga_ntwc_participant_writer.contact_id                                    AS wga_ntwc_participant_writer_contact_id,
           contact.first_name                                                        AS wga_ntwc_participant_writer_contact_first_name,
           contact.middle_name                                                       AS wga_ntwc_participant_writer_contact_middle_name,
           contact.last_name                                                         AS wga_ntwc_participant_writer_contact_last_name,
           contact.suffix                                                            AS wga_ntwc_participant_writer_contact_suffix,
           contact_get_full_name(contact.id)                                         AS wga_ntwc_participant_writer_contact_full_name,
           contact.address                                                           AS wga_ntwc_participant_writer_contact_address,
           contact.city                                                              AS wga_ntwc_participant_writer_contact_city,
           contact.state_code                                                        AS wga_ntwc_participant_writer_contact_state_code,
           DATE_FORMAT(wga_ntwc_participant_writer.created,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_participant_writer_created,
           wga_ntwc_participant_writer.created_by                                    AS wga_ntwc_participant_writer_created_by,
           DATE_FORMAT(wga_ntwc_participant_writer.updated,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_participant_writer_updated,
           wga_ntwc_participant_writer.updated_by                                    AS wga_ntwc_participant_writer_updated_by,
           wga_ntwc_participant_writer.status                                        AS wga_ntwc_participant_writer_status
      FROM wga_ntwc_participant_writer AS wga_ntwc_participant_writer INNER JOIN contact AS contact ON contact.id = wga_ntwc_participant_writer.contact_id;

 CREATE OR REPLACE VIEW wga_ntwc_writing_credit_get_list(
    wga_ntwc_writing_credit_wga_ntwc_id,
    wga_ntwc_writing_credit_contact_id,
    wga_ntwc_writing_credit_contact_first_name,
    wga_ntwc_writing_credit_contact_middle_name,
    wga_ntwc_writing_credit_contact_last_name,
    wga_ntwc_writing_credit_contact_suffix,
    wga_ntwc_writing_credit_contact_full_name,
    wga_ntwc_writing_credit_contact_address,
    wga_ntwc_writing_credit_contact_city,
    wga_ntwc_writing_credit_contact_state_code,
    wga_ntwc_writing_credit_created,
    wga_ntwc_writing_credit_created_by,
    wga_ntwc_writing_credit_updated,
    wga_ntwc_writing_credit_updated_by,
    wga_ntwc_writing_credit_status
) AS
    SELECT wga_ntwc_writing_credit.wga_ntwc_id                                   AS wga_ntwc_writing_credit_wga_ntwc_id,
           wga_ntwc_writing_credit.contact_id                                    AS wga_ntwc_writing_credit_contact_id,
           contact.first_name                                                    AS wga_ntwc_writing_credit_contact_first_name,
           contact.middle_name                                                   AS wga_ntwc_writing_credit_contact_middle_name,
           contact.last_name                                                     AS wga_ntwc_writing_credit_contact_last_name,
           contact.suffix                                                        AS wga_ntwc_writing_credit_contact_suffix,
           contact_get_full_name(contact.id)                                     AS wga_ntwc_writing_credit_contact_full_name,
           contact.address                                                       AS wga_ntwc_writing_credit_contact_address,
           contact.city                                                          AS wga_ntwc_writing_credit_contact_city,
           contact.state_code                                                    AS wga_ntwc_writing_credit_contact_state_code,
           DATE_FORMAT(wga_ntwc_writing_credit.created,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_writing_credit_created,
           wga_ntwc_writing_credit.created_by                                    AS wga_ntwc_writing_credit_created_by,
           DATE_FORMAT(wga_ntwc_writing_credit.updated,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_writing_credit_updated,
           wga_ntwc_writing_credit.updated_by                                    AS wga_ntwc_writing_credit_updated_by,
           wga_ntwc_writing_credit.status                                        AS wga_ntwc_writing_credit_status
      FROM wga_ntwc_writing_credit AS wga_ntwc_writing_credit INNER JOIN contact AS contact ON contact.id = wga_ntwc_writing_credit.contact_id;

 CREATE OR REPLACE VIEW wga_ntwc_source_material_episode_get_list(
    wga_ntwc_source_material_episode_id,
    wga_ntwc_source_material_episode_wga_ntwc_id,
    wga_ntwc_source_material_episode_name,
    wga_ntwc_source_material_episode_created,
    wga_ntwc_source_material_episode_created_by,
    wga_ntwc_source_material_episode_updated,
    wga_ntwc_source_material_episode_updated_by,
    wga_ntwc_source_material_episode_status
) AS
    SELECT wga_ntwc_source_material_episode.id                                            AS wga_ntwc_source_material_episode_id,
           wga_ntwc_source_material_episode.wga_ntwc_id                                   AS wga_ntwc_source_material_episode_wga_ntwc_id,
           wga_ntwc_source_material_episode.name                                          AS wga_ntwc_source_material_episode_name,
           DATE_FORMAT(wga_ntwc_source_material_episode.created,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_source_material_episode_created,
           wga_ntwc_source_material_episode.created_by                                    AS wga_ntwc_source_material_episode_created_by,
           DATE_FORMAT(wga_ntwc_source_material_episode.updated,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_source_material_episode_updated,
           wga_ntwc_source_material_episode.updated_by                                    AS wga_ntwc_source_material_episode_updated_by,
           wga_ntwc_source_material_episode.status                                        AS wga_ntwc_source_material_episode_status
      FROM wga_ntwc_source_material_episode AS wga_ntwc_source_material_episode;

 CREATE OR REPLACE VIEW wga_ntwc_source_material_production_get_list(
    wga_ntwc_source_material_production_id,
    wga_ntwc_source_material_production_wga_ntwc_id,
    wga_ntwc_source_material_production_name,
    wga_ntwc_source_material_production_created,
    wga_ntwc_source_material_production_created_by,
    wga_ntwc_source_material_production_updated,
    wga_ntwc_source_material_production_updated_by,
    wga_ntwc_source_material_production_status
) AS
    SELECT wga_ntwc_source_material_production.id                                            AS wga_ntwc_source_material_production_id,
           wga_ntwc_source_material_production.wga_ntwc_id                                   AS wga_ntwc_source_material_production_wga_ntwc_id,
           wga_ntwc_source_material_production.name                                          AS wga_ntwc_source_material_production_name,
           DATE_FORMAT(wga_ntwc_source_material_production.created,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_source_material_production_created,
           wga_ntwc_source_material_production.created_by                                    AS wga_ntwc_source_material_production_created_by,
           DATE_FORMAT(wga_ntwc_source_material_production.updated,'%m/%d/%Y %H:%i:%S')      AS wga_ntwc_source_material_production_updated,
           wga_ntwc_source_material_production.updated_by                                    AS wga_ntwc_source_material_production_updated_by,
           wga_ntwc_source_material_production.status                                        AS wga_ntwc_source_material_production_status
      FROM wga_ntwc_source_material_production AS wga_ntwc_source_material_production;

 CREATE OR REPLACE VIEW sav_performer_type_get_list(
    sav_performer_type_id,
    sav_performer_type_code,
    sav_performer_type_title,
    sav_performer_type_full_title,
    sav_performer_type_created,
    sav_performer_type_created_by,
    sav_performer_type_updated,
    sav_performer_type_updated_by,
    sav_performer_type_status
) AS
    SELECT sav_performer_type.id                                                      AS sav_performer_type_id,
           sav_performer_type.code                                                    AS sav_performer_type_code,
           sav_performer_type.title                                                   AS sav_performer_type_title,
           CONCAT(TRIM(sav_performer_type.code),' - ',TRIM(sav_performer_type.title)) AS sav_performer_type_full_title,
           DATE_FORMAT(sav_performer_type.created,'%m/%d/%Y %H:%i:%S')                AS sav_performer_type_created,
           sav_performer_type.created_by                                              AS sav_performer_type_created_by,
           DATE_FORMAT(sav_performer_type.updated,'%m/%d/%Y %H:%i:%S')                AS sav_performer_type_updated,
           sav_performer_type.updated_by                                              AS sav_performer_type_updated_by,
           sav_performer_type.status                                                  AS sav_performer_type_status
      FROM sav_performer_type AS sav_performer_type;

 CREATE OR REPLACE VIEW sav_production_type_get_list(
    sav_production_type_id,
    sav_production_type_code,
    sav_production_type_title,
    sav_production_type_full_title,
    sav_production_type_created,
    sav_production_type_created_by,
    sav_production_type_updated,
    sav_production_type_updated_by,
    sav_production_type_status
) AS
    SELECT sav_production_type.id                                          AS sav_production_type_id,
           sav_production_type.code                                        AS sav_production_type_code,
           sav_production_type.title                                       AS sav_production_type_title,
           CASE WHEN TRIM(sav_production_type.code) IS NULL
                  OR TRIM(sav_production_type.code) = '' THEN
                  sav_production_type.title
           ELSE
                CONCAT(TRIM(sav_production_type.code), ' - ',TRIM(sav_production_type.title))
           END                                                             AS sav_production_type_full_title,
           DATE_FORMAT(sav_production_type.created,'%m/%d/%Y %H:%i:%S')    AS sav_production_type_created,
           sav_production_type.created_by                                  AS sav_production_type_created_by,
           DATE_FORMAT(sav_production_type.updated,'%m/%d/%Y %H:%i:%S')    AS sav_production_type_updated,
           sav_production_type.updated_by                                  AS sav_production_type_updated_by,
           sav_production_type.status                                      AS sav_production_type_status
      FROM sav_production_type AS sav_production_type;

 CREATE OR REPLACE VIEW sav_final_cast_list_info_get_list(
    sav_final_cast_list_info_id,
    sav_final_cast_list_info_production_title,
    sav_final_cast_list_info_date_filled,
    sav_final_cast_list_info_production_id,
    sav_final_cast_list_info_shooting_location,
    sav_final_cast_list_info_production_company_id,
    sav_final_cast_list_info_production_company_name,
    sav_final_cast_list_info_production_company_address,
    sav_final_cast_list_info_production_company_city,
    sav_final_cast_list_info_production_company_state_code,
    sav_final_cast_list_info_production_company_state_name,
    sav_final_cast_list_info_production_company_zipcode,
    sav_final_cast_list_info_production_company_phone,
    sav_final_cast_list_info_production_company_faxnumber,
    sav_final_cast_list_info_production_company_website,
    sav_final_cast_list_info_production_company_email,
    sav_final_cast_list_info_start_date,
    sav_final_cast_list_info_end_date,
    sav_final_cast_list_info_federal_id,
    sav_final_cast_list_info_state_id,
    sav_final_cast_list_info_picture_id,
    sav_final_cast_list_info_distribuitor_id,
    sav_final_cast_list_info_sav_production_type_id,
    sav_final_cast_list_info_sav_production_type_code,
    sav_final_cast_list_info_sav_production_type_title,
    sav_final_cast_list_info_sav_production_type_full_title,
    sav_final_cast_list_info_created,
    sav_final_cast_list_info_created_by,
    sav_final_cast_list_info_updated,
    sav_final_cast_list_info_updated_by,
    sav_final_cast_list_info_status
) AS
    SELECT sav_final_cast_list_info.id                                                      AS sav_final_cast_list_info_id,
           DATE_FORMAT(sav_final_cast_list_info.date_filled,'%m/%d/%Y')                     AS sav_final_cast_list_info_date_filled,
           sav_final_cast_list_info.production_id                                           AS sav_final_cast_list_info_production_id,
           production.title                                                                 AS sav_final_cast_list_info_production_title,
           sav_final_cast_list_info.shooting_location                                       AS sav_final_cast_list_info_shooting_location,
           sav_final_cast_list_info.production_company_id                                   AS sav_final_cast_list_info_production_company_id,
           production_company.name                                                          AS sav_final_cast_list_info_production_company_name,
           production_company.address                                                       AS sav_final_cast_list_info_production_company_address,
           production_company.city                                                          AS sav_final_cast_list_info_production_company_city,
           production_company.state_code                                                    AS sav_final_cast_list_info_production_company_state_code,
           production_company_state.name                                                    AS sav_final_cast_list_info_production_company_state_name,
           production_company.zipcode                                                       AS sav_final_cast_list_info_production_company_zipcode,
           production_company.phone                                                         AS sav_final_cast_list_info_production_company_phone,
           production_company.faxnumber                                                     AS sav_final_cast_list_info_production_company_faxnumber,
           production_company.website                                                       AS sav_final_cast_list_info_production_company_website,
           production_company.email                                                         AS sav_final_cast_list_info_production_company_email,
           DATE_FORMAT(sav_final_cast_list_info.start_date,'%m/%d/%Y')                      AS sav_final_cast_list_info_start_date,
           DATE_FORMAT(sav_final_cast_list_info.end_date,  '%m/%d/%Y')                      AS sav_final_cast_list_info_end_date,
           sav_final_cast_list_info.federal_id                                              AS sav_final_cast_list_info_federal_id,
           sav_final_cast_list_info.state_id                                                AS sav_final_cast_list_info_state_id,
           sav_final_cast_list_info.picture_id                                              AS sav_final_cast_list_info_picture_id,
           sav_final_cast_list_info.distribuitor_id                                         AS sav_final_cast_list_info_distribuitor_id,
           sav_final_cast_list_info.sav_production_type_id                                  AS sav_final_cast_list_info_sav_production_type_id,
           sav_production_type.code                                                         AS sav_final_cast_list_info_sav_production_type_code,
           sav_production_type.title                                                        AS sav_final_cast_list_info_sav_production_type_title,
           CASE WHEN TRIM(sav_production_type.code) IS NULL
                  OR TRIM(sav_production_type.code) = '' THEN
                  sav_production_type.title
           ELSE
                CONCAT(TRIM(sav_production_type.code), ' - ',TRIM(sav_production_type.title))
           END                                                                              AS sav_final_cast_list_info_sav_production_type_full_title,
           DATE_FORMAT(sav_final_cast_list_info.created,'%m/%d/%Y %H:%i:%S')                AS sav_final_cast_list_info_created,
           sav_final_cast_list_info.created_by                                              AS sav_final_cast_list_info_created_by,
           DATE_FORMAT(sav_final_cast_list_info.updated,'%m/%d/%Y %H:%i:%S')                AS sav_final_cast_list_info_updated,
           sav_final_cast_list_info.updated_by                                              AS sav_final_cast_list_info_updated_by,
           sav_final_cast_list_info.status                                                  AS sav_final_cast_list_info_status
      FROM sav_final_cast_list_info AS sav_final_cast_list_info INNER JOIN production          AS production               ON production.id                 = sav_final_cast_list_info.production_id
                                                                INNER JOIN company             AS production_company       ON production_company.id         = sav_final_cast_list_info.production_company_id
                                                                INNER JOIN state               AS production_company_state ON production_company_state.code = production_company.state_code
                                                                INNER JOIN sav_production_type AS sav_production_type      ON sav_production_type.id        = sav_final_cast_list_info.sav_production_type_id;


 CREATE OR REPLACE VIEW sav_final_cast_list_info_item_get_list(
    sav_final_cast_list_info_item_id,
    sav_final_cast_list_info_item_sav_final_cast_list_info_id,
    sav_final_cast_list_info_item_production_id,
    sav_final_cast_list_info_item_production_title,
    sav_final_cast_list_info_item_contact_id,
    sav_final_cast_list_info_item_contact_full_name,
    sav_final_cast_list_info_item_contact_address,
    sav_final_cast_list_info_item_contact_city,
    sav_final_cast_list_info_item_contact_state_code,
    sav_final_cast_list_info_item_contact_phone,
    sav_final_cast_list_info_item_contact_email,
    sav_final_cast_list_info_item_contact_ssn,
    sav_final_cast_list_info_item_contact_name_ssn,
    sav_final_cast_list_info_item_loan_out_corp,
    sav_final_cast_list_info_item_federal_id,
    sav_final_cast_list_info_item_loan_out_corp_federal_id,
    sav_final_cast_list_info_item_days_number,
    sav_final_cast_list_info_item_weeks_number,
    sav_final_cast_list_info_item_start_date,
    sav_final_cast_list_info_item_end_date,
    sav_final_cast_list_info_item_contract_type,
    sav_final_cast_list_info_item_sav_performer_type_id,
    sav_final_cast_list_info_item_sav_performer_type_code,
    sav_final_cast_list_info_item_sav_performer_type_title,
    sav_final_cast_list_info_item_sav_performer_type_full_title,
    sav_final_cast_list_info_item_salary_total_gross,
    sav_final_cast_list_info_item_salary_base,
    sav_final_cast_list_info_item_units_type,
    sav_final_cast_list_info_item_units_salary,
    sav_final_cast_list_info_item_units_total,
    sav_final_cast_list_info_item_created,
    sav_final_cast_list_info_item_created_by,
    sav_final_cast_list_info_item_updated,
    sav_final_cast_list_info_item_updated_by,
    sav_final_cast_list_info_item_status
) AS
    SELECT sav_final_cast_list_info_item.id                                                                               AS sav_final_cast_list_info_item_id,
           sav_final_cast_list_info_item.sav_final_cast_list_info_id                                                      AS sav_final_cast_list_info_item_sav_final_cast_list_info_id,
           sav_final_cast_list_info_item.production_id                                                                    AS sav_final_cast_list_info_item_production_id,
           production.title                                                                                               AS sav_final_cast_list_info_item_production_title,
           sav_final_cast_list_info_item.contact_id                                                                       AS sav_final_cast_list_info_item_contact_id,
           contact_get_full_name(contact.id)                                                                              AS sav_final_cast_list_info_item_contact_full_name,
           contact.address                                                                                                AS sav_final_cast_list_info_item_contact_address,
           contact.city                                                                                                   AS sav_final_cast_list_info_item_contact_city,
           contact.state_code                                                                                             AS sav_final_cast_list_info_item_contact_state_code,
           contact.phone                                                                                                  AS sav_final_cast_list_info_item_contact_phone,
           contact.email                                                                                                  AS sav_final_cast_list_info_item_contact_email,
           contact.ssn                                                                                                    AS sav_final_cast_list_info_item_contact_ssn,
           CONCAT(contact_get_full_name(contact.id), ' SSN# ', contact.ssn)                                               AS sav_final_cast_list_info_item_contact_name_ssn,
           sav_final_cast_list_info_item.loan_out_corp                                                                    AS sav_final_cast_list_info_item_loan_out_corp,
           sav_final_cast_list_info_item.federal_id                                                                       AS sav_final_cast_list_info_item_federal_id,
           CONCAT(sav_final_cast_list_info_item.loan_out_corp, ' Federal ID# ', sav_final_cast_list_info_item.federal_id) AS sav_final_cast_list_info_item_loan_out_corp_federal_id,
           sav_final_cast_list_info_item.days_number                                                                      AS sav_final_cast_list_info_item_days_number,
           sav_final_cast_list_info_item.weeks_number                                                                     AS sav_final_cast_list_info_item_weeks_number,
           DATE_FORMAT(sav_final_cast_list_info_item.start_date,'%m/%d/%Y')                                               AS sav_final_cast_list_info_item_start_date,
           DATE_FORMAT(sav_final_cast_list_info_item.end_date,'%m/%d/%Y')                                                 AS sav_final_cast_list_info_item_end_date,
           sav_final_cast_list_info_item.contract_type                                                                    AS sav_final_cast_list_info_item_contract_type,
           sav_final_cast_list_info_item.sav_performer_type_id                                                            AS sav_final_cast_list_info_item_sav_performer_type_id,
           sav_performer_type.code                                                                                        AS sav_final_cast_list_info_item_sav_performer_type_code,
           sav_performer_type.title                                                                                       AS sav_final_cast_list_info_item_sav_performer_type_title,
           CONCAT(TRIM(sav_performer_type.code),' - ',TRIM(sav_performer_type.title))                                     AS sav_final_cast_list_info_item_sav_performer_type_full_title,
           sav_final_cast_list_info_item.salary_total_gross                                                               AS sav_final_cast_list_info_item_salary_total_gross,
           sav_final_cast_list_info_item.salary_base                                                                      AS sav_final_cast_list_info_item_salary_base,
           sav_final_cast_list_info_item.units_type                                                                       AS sav_final_cast_list_info_item_units_type,
           sav_final_cast_list_info_item.units_salary                                                                     AS sav_final_cast_list_info_item_units_salary,
           sav_final_cast_list_info_item.units_total                                                                      AS sav_final_cast_list_info_item_units_total,
           DATE_FORMAT(sav_final_cast_list_info_item.created,'%m/%d/%Y %H:%i:%S')                                         AS sav_final_cast_list_info_item_created,
           sav_final_cast_list_info_item.created_by                                                                       AS sav_final_cast_list_info_item_created_by,
           DATE_FORMAT(sav_final_cast_list_info_item.updated,'%m/%d/%Y %H:%i:%S')                                         AS sav_final_cast_list_info_item_updated,
           sav_final_cast_list_info_item.updated_by                                                                       AS sav_final_cast_list_info_item_updated_by,
           sav_final_cast_list_info_item.status                                                                           AS sav_final_cast_list_info_item_status
      FROM sav_final_cast_list_info_item AS sav_final_cast_list_info_item INNER JOIN production         AS production         ON production.id         = sav_final_cast_list_info_item.production_id
                                                                          INNER JOIN contact            AS contact            ON contact.id            = sav_final_cast_list_info_item.contact_id
                                                                          INNER JOIN sav_performer_type AS sav_performer_type ON sav_performer_type.id = sav_final_cast_list_info_item.sav_performer_type_id;

 CREATE OR REPLACE VIEW sav_role_get_list(
    sav_role_id,
    sav_role_code,
    sav_role_title,
    sav_role_full_title,
    sav_role_created,
    sav_role_created_by,
    sav_role_updated,
    sav_role_updated_by,
    sav_role_status
) AS
    SELECT sav_role.id                                               AS sav_role_id,
           sav_role.code                                             AS sav_role_code,
           sav_role.title                                            AS sav_role_title,
           CONCAT(TRIM(sav_role.code), ' - ', TRIM(sav_role.title))  AS sav_role_full_title,
           DATE_FORMAT(sav_role.created,'%m/%d/%Y %H:%i:%S')         AS sav_role_created,
           sav_role.created_by                                       AS sav_role_created_by,
           DATE_FORMAT(sav_role.updated,'%m/%d/%Y %H:%i:%S')         AS sav_role_updated,
           sav_role.updated_by                                       AS sav_role_updated_by,
           sav_role.status                                           AS sav_role_status
      FROM sav_role AS sav_role;

 DELIMITER //
CREATE PROCEDURE company_set_list(
    IN  company_id                   INTEGER,
    IN  company_name                 VARCHAR(50),
    IN  company_address              VARCHAR(100),
    IN  company_city                 VARCHAR(100),
    IN  company_state_code           CHAR(2),
    IN  company_zipcode              VARCHAR(9),
    IN  company_phone                VARCHAR(20),
    IN  company_faxnumber            VARCHAR(20),
    IN  company_email                VARCHAR(100),
    IN  company_website              VARCHAR(100),
    IN  company_logo_path            VARCHAR(120),
    IN  company_wga_company_number   VARCHAR(50),
    IN  company_media_company        CHAR(1),
    IN  company_production_company   CHAR(1),
    IN  company_payroll_company      CHAR(1),
    IN  company_created_by           VARCHAR(30),
    IN  company_updated_by           VARCHAR(30),
    OUT return_value                 INTEGER
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
            zipcode,
            phone,
            faxnumber,
            email,
            website,
            logo_path,
            wga_company_number,
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
            company_zipcode,
            company_phone,
            company_faxnumber,
            company_email,
            company_website,
            company_logo_path,
            company_wga_company_number,
            company_media_company,
            company_production_company,
            company_payroll_company,
            company_created_by,
            company_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE company
           SET name               =  company_name,
               address            =  company_address,
               city               =  company_city,
               state_code         =  company_state_code,
               zipcode            =  company_zipcode,
               phone              =  company_phone,
               faxnumber          =  company_faxnumber,
               email              =  company_email,
               website            =  company_website,
               logo_path          =  company_logo_path,
               wga_company_number =  company_wga_company_number,
               media_company      =  company_media_company,
               production_company =  company_production_company,
               payroll_company    =  company_payroll_company,
               updated_by         =  company_updated_by,
               status             =  'UPDATED'
         WHERE id                 =  company_id;

         SET return_value = company_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE business_group_set_list(
    IN business_group_id            INT,
    IN business_group_name          VARCHAR(50),
    IN business_group_company_id    INT,
    IN business_group_created_by    VARCHAR(30),
    IN business_group_updated_by    VARCHAR(30),
    IN business_group_status        VARCHAR(30),
    OUT return_value                INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM business_group
     WHERE id = business_group_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO business_group
        (
            name,
            company_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            business_group_name,
            business_group_company_id,
            business_group_created,
            business_group_created_by,
            business_group_updated,
            business_group_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE business_group
           SET name         =  business_group_name,
               company_id   =  business_group_company_id,
               created_by   =  business_group_created_by,
               updated_by   =  business_group_updated_by,
               status       =  'UPDATED'
         WHERE id           =  business_group_id;

        SET return_value = business_group_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE network_set_list(
    IN  network_id                 INTEGER,
    IN  network_name               VARCHAR(50),
    IN  network_media_company_id   INTEGER,
    IN  network_business_group_id  INTEGER,
    IN  network_logo_path          VARCHAR(120),
    IN  network_created_by         VARCHAR(30),
    IN  network_updated_by         VARCHAR(30),
    OUT return_value               INTEGER
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
            business_group_id,
            name,
            logo_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            network_media_company_id,
            network_business_group_id,
            network_name,
            network_logo_path,
            network_created_by,
            network_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE network
           SET media_company_id  = network_media_company_id,
               business_group_id = network_business_group_id,
               name              = network_name,
               logo_path         = network_logo_path,
               updated_by        = network_updated_by,
               status            = 'UPDATED'
         WHERE id                = network_id;

         SET return_value = network_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_length_set_list(
    IN  production_length_id           INTEGER,
    IN  production_length_name         VARCHAR(50),
    IN  production_length_created_by   VARCHAR(30),
    IN  production_length_updated_by   VARCHAR(30),
    OUT return_value                   INTEGER
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

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_length
           SET name       = production_length_name,
               updated_by = production_length_updated_by,
               status     = 'UPDATED'
         WHERE id         = production_length_id;

         SET return_value = production_length_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_type_set_list(
    IN  production_type_id           INTEGER,
    IN  production_type_name         VARCHAR(50),
    IN  production_type_created_by   VARCHAR(30),
    IN  production_type_updated_by   VARCHAR(30),
    OUT return_value                 INTEGER
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

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_type
           SET name       = production_type_name,
               updated_by = production_type_updated_by,
               status     = 'UPDATED'
         WHERE id         = production_type_id;

         SET return_value = production_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_set_list(
    IN production_id                               INT,
    IN production_title                            VARCHAR(50),
    IN production_media_company_id                 INT,
    IN production_business_group_id                INT,
    IN production_network_id                       INT,
    IN production_pilot                            CHAR(1),
    IN production_production_stage_id              INT,
    IN production_season_number                    INT,
    IN production_episodes_number                  INT,
    IN production_budget                           DECIMAL,
    IN production_writing_start_date               DATE,
    IN production_writing_end_date                 DATE,
    IN production_pre_production_start_date        DATE,
    IN production_pre_production_end_date          DATE,
    IN production_photography_start_date           DATE,
    IN production_photography_end_date             DATE,
    IN production_post_production_start_date       DATE,
    IN production_post_production_end_date         DATE,
    IN production_network_production_start_date    DATE,
    IN production_network_production_end_date      DATE,
    IN production_production_length_id             INT,
    IN production_production_type_id               INT,
    IN production_production_company_id            INT,
    IN production_payroll_company_id               INT,
    IN production_logo_path                        VARCHAR(120),
    IN production_created_by                       VARCHAR(30),
    IN production_updated_by                       VARCHAR(30),
    IN production_status                           VARCHAR(30),
    OUT return_value                               INTEGER
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
            media_company_id,
            business_group_id,
            network_id,
            pilot,
            production_stage_id,
            season_number,
            episodes_number,
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
            production_media_company_id,
            production_business_group_id,
            production_network_id,
            production_pilot,
            production_production_stage_id,
            production_season_number,
            production_episodes_number,
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
            production_production_type_id,
            production_production_company_id,
            production_payroll_company_id,
            production_logo_path,
            production_created_by,
            production_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production
           SET title                         = production_title,
               media_company_id              = production_media_company_id,
               business_group_id             = production_business_group_id,
               network_id                    = production_network_id,
               pilot                         = production_pilot,
               production_stage_id           = production_production_stage_id,
               season_number                 = production_season_number,
               episodes_number               = production_episodes_number,
               budget                        = production_budget,
               writing_start_date            = production_writing_start_date,
               writing_end_date              = production_writing_end_date,
               pre_production_start_date     = production_pre_production_start_date,
               pre_production_end_date       = production_pre_production_end_date,
               photography_start_date        = production_photography_start_date,
               photography_end_date          = production_photography_end_date,
               post_production_start_date    = production_post_production_start_date,
               post_production_end_date      = production_post_production_end_date,
               network_production_start_date = production_network_production_start_date,
               network_production_end_date   = production_network_production_end_date,
               production_length_id          = production_production_length_id,
               production_type_id            = production_production_type_id,
               production_company_id         = production_production_company_id,
               payroll_company_id            = production_payroll_company_id,
               logo_path                     = production_logo_path,
               created_by                    = production_created_by,
               updated_by                    = production_updated_by,
               status                        = 'UPDATED'
         WHERE id                            = production_id;

         SET return_value = production_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_set_closed(
    IN  production_id                   INTEGER,
    IN  production_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE production
       SET status = 'CLOSED'
     WHERE id = production_id;

    COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_state_set_list(
    IN production_state_production_id    INT,
    IN production_state_state_code       CHAR(2),
    IN production_state_created_by       VARCHAR(30),
    IN production_state_updated_by       VARCHAR(30),
    IN production_state_status           VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_state
     WHERE production_id = production_state_production_id
       AND state_code    = production_state_state_code;

    IF (ROW_EXISTS = 0) THEN

        INSERT INTO production_state
        (
            production_id,
            state_code,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_state_production_id,
            production_state_state_code,
            production_state_created_by,
            production_state_updated_by,
            'CREATED'
        );

        COMMIT;

    END IF;

END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE season_set_list(
    IN  season_id                               INTEGER,
    IN  season_title                            VARCHAR(50),
    IN  season_season_number                    INTEGER,
    IN  season_media_company_id                 INTEGER,
    IN  season_business_group_id                INTEGER,
    IN  season_network_id                       INTEGER,
    IN  season_production_id                    INTEGER,
    IN  season_budget                           NUMERIC(15,2),
    IN  season_writing_start_date               DATE,
    IN  season_writing_end_date                 DATE,
    IN  season_pre_production_start_date        DATE,
    IN  season_pre_production_end_date          DATE,
    IN  season_photography_start_date           DATE,
    IN  season_photography_end_date             DATE,
    IN  season_post_production_start_date       DATE,
    IN  season_post_production_end_date         DATE,
    IN  season_network_production_start_date    DATE,
    IN  season_network_production_end_date      DATE,
    IN  season_logo_path                        VARCHAR(120),
    IN  season_created_by                       VARCHAR(30),
    IN  season_updated_by                       VARCHAR(30),
    OUT return_value                            INTEGER
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
            media_company_id,
            business_group_id,
            network_id,
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
            season_media_company_id,
            season_business_group_id,
            season_network_id,
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

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE season
           SET title                          =  season_title,
               season_number                  =  season_season_number,
               company_id                     =  season_media_company_id,
               business_group_id              =  season_business_group_id,
               network_id                     =  season_network_id,
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

         SET return_value = season_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE episode_set_list(
    IN  episode_id                               INTEGER,
    IN  episode_title                            VARCHAR(50),
    IN  episode_media_company_id                 INTEGER,
    IN  episode_business_group_id                INTEGER,
    IN  episode_network_id                       INTEGER,
    IN  episode_production_id                    INTEGER,
    IN  episode_season_id                        INTEGER,
    IN  episode_episode_number                   INTEGER,
    IN  episode_budget                           NUMERIC(15,2),
    IN  episode_writing_start_date               DATE,
    IN  episode_writing_end_date                 DATE,
    IN  episode_pre_production_start_date        DATE,
    IN  episode_pre_production_end_date          DATE,
    IN  episode_photography_start_date           DATE,
    IN  episode_photography_end_date             DATE,
    IN  episode_post_production_start_date       DATE,
    IN  episode_post_production_end_date         DATE,
    IN  episode_network_production_start_date    DATE,
    IN  episode_network_production_end_date      DATE,
    IN  episode_created_by                       VARCHAR(30),
    IN  episode_updated_by                       VARCHAR(30),
    OUT return_value                             INTEGER
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
            media_company_id,
            business_group_id,
            network_id,
            production_id,
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
            episode_media_company_id,
            episode_business_group_id,
            episode_network_id,
            episode_production_id,
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

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE episode
           SET title                          =  episode_title,
               episode_number                 =  episode_episode_number,
               media_company_id               =  episode_media_company_id,
               business_group_id              =  episode_business_group_id,
               network_id                     =  episode_network_id,
               production_id                  =  episode_production_id,
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

         SET return_value = episode_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE contact_set_list(
    IN contact_id              INT,
    IN contact_first_name      VARCHAR(50),
    IN contact_middle_name     VARCHAR(50),
    IN contact_last_name       VARCHAR(50),
    IN contact_suffix          VARCHAR(50),
    IN contact_address         VARCHAR(100),
    IN contact_city            VARCHAR(100),
    IN contact_state_code      CHAR(2),
    IN contact_phone           VARCHAR(20),
    IN contact_email           VARCHAR(100),
    IN contact_ssn             VARCHAR(11),
    IN contact_website         VARCHAR(100),
    IN contact_picture_path    VARCHAR(120),
    IN contact_created_by      VARCHAR(30),
    IN contact_updated_by      VARCHAR(30),
    IN contact_status          VARCHAR(30),
    OUT return_value           INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM contact
     WHERE id = contact_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO contact
        (
            first_name,
            middle_name,
            last_name,
            suffix,
            address,
            city,
            state_code,
            phone,
            email,
            ssn,
            website,
            picture_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            contact_id,
            contact_first_name,
            contact_middle_name,
            contact_last_name,
            contact_suffix,
            contact_address,
            contact_city,
            contact_state_code,
            contact_phone,
            contact_email,
            contact_ssn,
            contact_website,
            contact_picture_path,
            contact_created_by,
            contact_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE contact
           SET first_name   = contact_first_name,
               middle_name  = contact_middle_name,
               last_name    = contact_last_name,
               suffix       = contact_suffix,
               address      = contact_address,
               city         = contact_city,
               state_code   = contact_state_code,
               phone        = contact_phone,
               email        = contact_email,
               ssn          = contact_ssn,
               website      = contact_website,
               picture_path = contact_picture_path,
               created_by   = contact_created_by,
               updated_by   = contact_updated_by,
               status       = 'UPDATED'
         WHERE id           = contact_id;

         SET return_value = contact_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE company_contact_set_list(
    IN company_contact_company_id  INTEGER,
    IN company_contact_contact_id  INTEGER,
    IN company_contact_created_by  VARCHAR(30),
    IN company_contact_updated_by  VARCHAR(30),
    IN company_contact_status      VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM company_contact
     WHERE company_id = company_contact_company_id
       AND contact_id = company_contact_contact_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO company_contact
        (
            company_id,
            contact_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            company_contact_company_id,
            company_contact_contact_id,
            company_contact_created_by,
            company_contact_updated_by,
            'CREATED'
        );
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE company_contact
           SET created_by   =   company_contact_created_by,
               updated_by   =   company_contact_updated_by,
               status       =   'UPDATED'
         WHERE company_id   = company_contact_company_id
           AND contact_id   = company_contact_contact_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE guild_set_list(
    IN guild_id            INT,
    IN guild_acronym       VARCHAR(50),
    IN guild_name          VARCHAR(150),
    IN guild_logo_path     VARCHAR(120),
    IN guild_created_by    VARCHAR(30),
    IN guild_updated_by    VARCHAR(30),
    IN guild_status        VARCHAR(30),
    OUT return_value       INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM guild
     WHERE id = guild_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO guild
        (
            acronym,
            name,
            logo_path,
            created,
            created_by,
            updated,
            updated_by,
            status
        )
        VALUES
        (
            guild_acronym,
            guild_name,
            guild_logo_path,
            guild_created,
            guild_created_by,
            guild_updated,
            guild_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE guild
           SET acronym    = guild_acronym,
               name       = guild_name,
               logo_path  = guild_logo_path,
               created_by = guild_created_by,
               updated_by = guild_updated_by,
               status     = 'UPDATED'
         WHERE id         = guild_id;

        SET return_value = guild_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_contact_set_list(
    IN production_contact_production_id      INT,
    IN production_contact_contact_id         INT,
    IN production_contact_contact_role_id    INT,
    IN production_contact_created_by         VARCHAR(30),
    IN production_contact_updated_by         VARCHAR(30),
    IN production_contact_status             VARCHAR(30),
    OUT return_value                         INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_contact
     WHERE production_id = production_contact_production_id
       AND contact_id    = production_contact_contact_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_contact
        (
            production_id,
            contact_id,
            contact_role_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_contact_production_id,
            production_contact_contact_id,
            production_contact_contact_role_id,
            production_contact_created_by,
            production_contact_updated_by,
            'CREATED'
        );

        SET return_value = 0;
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_contact
           SET contact_role_id = production_contact_contact_role_id,
               created_by      = production_contact_created_by,
               updated_by      = production_contact_updated_by,
               status          = 'UPDATED'
         WHERE production_id   = production_contact_production_id
           AND contact_id      = production_contact_contact_id;

        SET return_value = 0;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_stage_set_list(
    IN  production_stage_id                   INTEGER,
    IN  production_stage_name                 VARCHAR(50),
    IN  production_stage_created_by           VARCHAR(30),
    IN  production_stage_updated_by           VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_stage
     WHERE id = production_stage_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_stage
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_stage_name,
            production_stage_created_by,
            production_stage_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_stage
           SET name               =    production_stage_name,
               updated_by         =    production_stage_updated_by,
               status             =    'UPDATED'
         WHERE id                 =    production_stage_id;
        SET return_value = production_stage_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_guild_set_list(
    IN production_guild_production_id        INT,
    IN production_guild_guild_id             INT,
    IN production_guild_document_name        VARCHAR(100),
    IN production_guild_dga_sideletter_six   CHAR(1),
    IN production_guild_dga_all_rights_media CHAR(1),
    IN production_guild_created_by           VARCHAR(30),
    IN production_guild_updated_by           VARCHAR(30),
    IN production_guild_status               VARCHAR(30),
    OUT return_value                         INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_guild
     WHERE production_id = production_guild_production_id
       AND guild_id      = production_guild_guild_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_guild
        (
            production_id,
            guild_id,
            document_name,
            dga_sideletter_six,
            dga_all_rights_media,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_guild_production_id,
            production_guild_guild_id,
            production_guild_document_name,
            production_guild_dga_sideletter_six,
            production_guild_dga_all_rights_media,
            production_guild_created_by,
            production_guild_updated_by,
            'CREATED'
        );

        SET return_value = 0;
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_guild
           SET document_name        = production_guild_document_name,
               dga_sideletter_six   = production_guild_dga_sideletter_six,
               dga_all_rights_media = production_guild_dga_all_rights_media,
               updated_by           = production_guild_updated_by,
               status               = 'UPDATED'
         WHERE production_id = production_guild_production_id
           AND guild_id      = production_guild_guild_id;

        SET return_value = 0;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE ledger_set_list(
    IN ledger_id                  INT,
    IN ledger_code                CHAR(10),
    IN ledger_title               VARCHAR(50),
    IN ledger_media_company_id    INT,
    IN ledger_business_group_id   INT,
    IN ledger_network_id          INT,
    IN ledger_production_id       INT,
    IN ledger_season_id           INT,
    IN ledger_episode_id          INT,
    IN ledger_created_by          VARCHAR(30),
    IN ledger_updated_by          VARCHAR(30),
    IN ledger_status              VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM ledger
     WHERE id = ledger_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO ledger
        (
            code,
            title,
            media_company_id,
            business_group_id,
            network_id,
            production_id,
            season_id,
            episode_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            ledger_code,
            ledger_title,
            ledger_media_company_id,
            ledger_business_group_id,
            ledger_network_id,
            ledger_production_id,
            ledger_season_id,
            ledger_episode_id,
            ledger_created_by,
            ledger_updated_by,
            'UPDATE'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE ledger
           SET code              = ledger_code,
               title             = ledger_title,
               media_company_id  = ledger_media_company_id,
               business_group_id = ledger_business_group_id,
               network_id        = ledger_network_id,
               production_id     = ledger_production_id,
               season_id         = ledger_season_id,
               episode_id        = ledger_episode_id,
               created_by        = ledger_created_by,
               updated_by        = ledger_updated_by,
               status            = 'UPDATED'
         WHERE id                = ledger_id;

        SET return_value = ledger_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE account_set_list(
    IN account_id                   INT,
    IN account_code                 CHAR(10),
    IN account_title                VARCHAR(50),
    IN account_media_company_id     INT,
    IN account_business_group_id    INT,
    IN account_network_id           INT,
    IN account_production_id        INT,
    IN account_season_id            INT,
    IN account_episode_id           INT,
    IN account_ledger_id            INT,
    IN account_created_by           VARCHAR(30),
    IN account_updated_by           VARCHAR(30),
    IN account_status               VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM account
     WHERE id = account_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO account
        (
            code,
            title,
            media_company_id,
            business_group_id,
            network_id,
            production_id,
            season_id,
            episode_id,
            ledger_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            account_id,
            account_code,
            account_title,
            account_media_company_id,
            account_business_group_id,
            account_network_id,
            account_production_id,
            account_season_id,
            account_episode_id,
            account_ledger_id,
            account_created_by,
            account_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE account
           SET code              = account_code,
               title             = account_title,
               media_company_id  = account_media_company_id,
               business_group_id = account_business_group_id,
               network_id        = account_network_id,
               production_id     = account_production_id,
               season_id         = account_season_id,
               episode_id        = account_episode_id,
               ledger_id         = account_ledger_id,
               created           = account_created,
               created_by        = account_created_by,
               updated           = account_updated,
               updated_by        = account_updated_by,
               status            = 'UPDATED'
         WHERE id                =    account_id;

        SET return_value = account_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE subaccount_set_list(
    IN subaccount_id                   INT,
    IN subaccount_code                 CHAR(10),
    IN subaccount_title                VARCHAR(50),
    IN subaccount_media_company_id     INT,
    IN subaccount_business_group_id    INT,
    IN subaccount_network_id           INT,
    IN subaccount_production_id        INT,
    IN subaccount_season_id            INT,
    IN subaccount_episode_id           INT,
    IN subaccount_ledger_id            INT,
    IN subaccount_account_id           INT,
    IN subaccount_created_by           VARCHAR(30),
    IN subaccount_updated_by           VARCHAR(30),
    IN subaccount_status               VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM subaccount
     WHERE id = subaccount_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO subaccount
        (
            code,
            title,
            media_company_id,
            business_group_id,
            network_id,
            production_id,
            season_id,
            episode_id,
            ledger_id,
            account_id,
            created,
            created_by,
            updated,
            updated_by,
            status
        )
        VALUES
        (
            subaccount_code,
            subaccount_title,
            subaccount_media_company_id,
            subaccount_business_group_id,
            subaccount_network_id,
            subaccount_production_id,
            subaccount_season_id,
            subaccount_episode_id,
            subaccount_ledger_id,
            subaccount_account_id,
            subaccount_created,
            subaccount_created_by,
            subaccount_updated,
            subaccount_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE subaccount
           SET code               = subaccount_code,
               title              = subaccount_title,
               media_company_id   = subaccount_media_company_id,
               business_group_id  = subaccount_business_group_id,
               network_id         = subaccount_network_id,
               production_id      = subaccount_production_id,
               season_id          = subaccount_season_id,
               episode_id         = subaccount_episode_id,
               ledger_id          = subaccount_ledger_id,
               account_id         = subaccount_account_id,
               created            = subaccount_created,
               created_by         = subaccount_created_by,
               updated            = subaccount_updated,
               updated_by         = subaccount_updated_by,
               status             = 'UPDATED'
         WHERE id                 = subaccount_id;

        SET return_value          = subaccount_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE transaction_set_list(
    IN transaction_id                   INT,
    IN transaction_media_company_id     INT,
    IN transaction_business_group_id    INT,
    IN transaction_network_id           INT,
    IN transaction_production_id        INT,
    IN transaction_season_id            INT,
    IN transaction_episode_id           INT,
    IN transaction_ledger_id            INT,
    IN transaction_account_id           INT,
    IN transaction_subaccount_id        INT,
    IN transaction_description          VARCHAR(50),
    IN transaction_budget               DECIMAL,
    IN transaction_total_budget         DECIMAL,
    IN transaction_guarantee            INT,
    IN transaction_period_id            INT,
    IN transaction_actual               DECIMAL,
    IN transaction_total_actual         DECIMAL,
    IN transaction_comment              VARCHAR(255),
    IN transaction_created_by           VARCHAR(30),
    IN transaction_updated_by           VARCHAR(30),
    IN transaction_status               VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM transaction
     WHERE id = transaction_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO transaction
        (
            media_company_id,
            business_group_id,
            network_id,
            production_id,
            season_id,
            episode_id,
            ledger_id,
            account_id,
            subaccount_id,
            description,
            budget,
            total_budget,
            guarantee,
            period_id,
            actual,
            total_actual,
            comment,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            transaction_media_company_id,
            transaction_business_group_id,
            transaction_network_id,
            transaction_production_id,
            transaction_season_id,
            transaction_episode_id,
            transaction_ledger_id,
            transaction_account_id,
            transaction_subaccount_id,
            transaction_description,
            transaction_budget,
            transaction_total_budget,
            transaction_guarantee,
            transaction_period_id,
            transaction_actual,
            transaction_total_actual,
            transaction_comment,
            transaction_created,
            transaction_created_by,
            transaction_updated,
            transaction_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE transaction
           SET media_company_id  =    transaction_media_company_id,
               business_group_id =    transaction_business_group_id,
               network_id        =    transaction_network_id,
               production_id     =    transaction_production_id,
               season_id         =    transaction_season_id,
               episode_id        =    transaction_episode_id,
               ledger_id         =    transaction_ledger_id,
               account_id        =    transaction_account_id,
               subaccount_id     =    transaction_subaccount_id,
               description       =    transaction_description,
               budget            =    transaction_budget,
               total_budget      =    transaction_total_budget,
               guarantee         =    transaction_guarantee,
               period_id         =    transaction_period_id,
               actual            =    transaction_actual,
               total_actual      =    transaction_total_actual,
               comment           =    transaction_comment,
               created           =    transaction_created,
               created_by        =    transaction_created_by,
               updated           =    transaction_updated,
               updated_by        =    transaction_updated_by,
               status            =    'UPDATED'
         WHERE id                =    transaction_id;

        SET return_value = transaction_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE production_show_type_set_list(
     IN production_show_type_id            INT,
     IN production_show_type_name          VARCHAR(50),
     IN production_show_type_created_by    VARCHAR(30),
     IN production_show_type_updated_by    VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM production_show_type
     WHERE id = production_show_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO production_show_type
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            production_show_type_name,
            production_show_type_created_by,
            production_show_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE production_show_type
           SET name               =    production_show_type_name,
               updated_by         =    production_show_type_updated_by,
               status             =    'UPDATED'
         WHERE id                 =    production_show_type_id;
        SET return_value = production_show_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_quarterly_earning_set_list(
    IN  dga_quarterly_earning_id                   INTEGER,
    IN  dga_quarterly_earning_quarter              VARCHAR(10),
    IN  dga_quarterly_earning_year                 YEAR,
    IN  dga_quarterly_earning_company_id           INTEGER,
    IN  dga_quarterly_earning_contact_id           INTEGER,
    IN  dga_quarterly_earning_prepared_by          VARCHAR(50),
    IN  dga_quarterly_earning_phone                VARCHAR(20),
    IN  dga_quarterly_earning_created_by           VARCHAR(30),
    IN  dga_quarterly_earning_updated_by           VARCHAR(30),
    -- IN  dga_quarterly_earning_status               VARCHAR(30),
    OUT return_value                               INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_quarterly_earning
     WHERE id = dga_quarterly_earning_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_quarterly_earning
        (
            quarter,
            year,
            company_id,
            contact_id,
            prepared_by,
            phone,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_quarterly_earning_quarter,
            dga_quarterly_earning_year,
            dga_quarterly_earning_company_id,
            dga_quarterly_earning_contact_id,
            dga_quarterly_earning_prepared_by,
            dga_quarterly_earning_phone,
            dga_quarterly_earning_created_by,
            dga_quarterly_earning_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_quarterly_earning
           SET quarter     = dga_quarterly_earning_quarter,
               year        = dga_quarterly_earning_year,
               company_id  = dga_quarterly_earning_company_id,
               contact_id  = dga_quarterly_earning_contact_id,
               prepared_by = dga_quarterly_earning_prepared_by,
               phone       = dga_quarterly_earning_phone,
               created_by  = dga_quarterly_earning_created_by,
               updated_by  = dga_quarterly_earning_updated_by,
               status      = 'UPDATED'
         WHERE id          = dga_quarterly_earning_id;

         SET return_value = dga_quarterly_earning_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_quarterly_earning_item_set_list(
    IN  dga_quarterly_earning_item_id                          INTEGER,
    IN  dga_quarterly_earning_item_dga_quarterly_earning_id    INTEGER,
    IN  dga_quarterly_earning_item_name                        VARCHAR(50),
    IN  dga_quarterly_earning_item_ssn                         VARCHAR(11),
    IN  dga_quarterly_earning_item_category                    VARCHAR(30),
    IN  dga_quarterly_earning_item_production_id               INTEGER,
    IN  dga_quarterly_earning_item_earnings                    NUMERIC(15,2),
    IN  dga_quarterly_earning_item_created_by                  VARCHAR(30),
    IN  dga_quarterly_earning_item_updated_by                  VARCHAR(30),
    OUT return_value                                          INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_quarterly_earning_item
     WHERE id = dga_quarterly_earning_item_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_quarterly_earning_item
        (
            dga_quarterly_earning_id,
            name,
            ssn,
            category,
            production_id,
            earnings,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_quarterly_earning_item_dga_quarterly_earning_id,
            dga_quarterly_earning_item_name,
            dga_quarterly_earning_item_ssn,
            dga_quarterly_earning_item_category,
            dga_quarterly_earning_item_production_id,
            dga_quarterly_earning_item_earnings,
            dga_quarterly_earning_item_created_by,
            dga_quarterly_earning_item_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_quarterly_earning_item
           SET dga_quarterly_earning_id =   dga_quarterly_earning_item_dga_quarterly_earning_id,
               name                     =   dga_quarterly_earning_item_name,
               ssn                      =   dga_quarterly_earning_item_ssn,
               category                 =   dga_quarterly_earning_item_category,
               production_id            =   dga_quarterly_earning_item_production_id,
               earnings                 =   dga_quarterly_earning_item_earnings,
               updated_by               =   dga_quarterly_earning_item_updated_by,
               status                   =   'UPDATED'
         WHERE id                       =   dga_quarterly_earning_item_id;
     END IF;

     SET return_value = dga_quarterly_earning_item_id;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_quarterly_earning_set_closed(
    IN dga_quarterly_earning_id          INTEGER,
    IN dga_quarterly_earning_updated_by  VARCHAR(30)
)
BEGIN

    UPDATE dga_quarterly_earning
       SET status     = 'CLOSED',
           updated_by = dga_quarterly_earning_updated_by
     WHERE id = dga_quarterly_earning_id;
     COMMIT;

     UPDATE dga_quarterly_earning_item
       SET status     = 'CLOSED',
           updated_by = dga_quarterly_earning_updated_by
     WHERE dga_quarterly_earning_id = dga_quarterly_earning_id
       AND status != 'DELETED';
     COMMIT;

END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_weekly_work_set_list(
    IN  dga_weekly_work_id                   INTEGER,
    IN  dga_weekly_work_production_id        INT,
    IN  dga_weekly_work_episode_id           INT,
    IN  dga_weekly_work_company_id           INT,
    IN  dga_weekly_work_contact_id           INT,
    IN  dga_weekly_work_week_start_date      DATE,
    IN  dga_weekly_work_week_end_date        DATE,
    IN  dga_weekly_work_created_by           VARCHAR(30),
    IN  dga_weekly_work_updated_by           VARCHAR(30),
    OUT return_value                         INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_weekly_work
     WHERE id = dga_weekly_work_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_weekly_work
        (
            production_id,
            episode_id,
            company_id,
            contact_id,
            week_start_date,
            week_end_date,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_weekly_work_production_id,
            dga_weekly_work_episode_id,
            dga_weekly_work_company_id,
            dga_weekly_work_contact_id,
            dga_weekly_work_week_start_date,
            dga_weekly_work_week_end_date,
            dga_weekly_work_created_by,
            dga_weekly_work_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_weekly_work
           SET production_id      =    dga_weekly_work_production_id,
               episode_id         =    dga_weekly_work_episode_id,
               company_id         =    dga_weekly_work_company_id,
               contact_id         =    dga_weekly_work_contact_id,
               week_start_date    =    dga_weekly_work_week_start_date,
               week_end_date      =    dga_weekly_work_week_end_date,
               updated_by         =    dga_weekly_work_updated_by,
               status             =    'UPDATED'
         WHERE id                 =    dga_weekly_work_id;

         SET return_value = dga_weekly_work_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_weekly_work_item_set_list(
    IN  dga_weekly_work_item_id                          INTEGER,
    IN  dga_weekly_work_item_dga_weekly_work_id          INTEGER,
    IN  dga_weekly_work_item_name                        VARCHAR(50),
    IN  dga_weekly_work_item_ssn                         VARCHAR(11),
    IN  dga_weekly_work_item_category                    VARCHAR(30),
    IN  dga_weekly_work_item_created_by                  VARCHAR(30),
    IN  dga_weekly_work_item_updated_by                  VARCHAR(30),
    OUT return_value                                     INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_weekly_work_item
     WHERE id = dga_weekly_work_item_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_weekly_work_item
        (
            dga_weekly_work_id,
            name,
            ssn,
            category,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_weekly_work_item_dga_weekly_work_id,
            dga_weekly_work_item_name,
            dga_weekly_work_item_ssn,
            dga_weekly_work_item_category,
            dga_weekly_work_item_created_by,
            dga_weekly_work_item_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_weekly_work_item
           SET dga_weekly_work_id  =  dga_weekly_work_item_dga_weekly_work_id,
               name                =  dga_weekly_work_item_name,
               ssn                 =  dga_weekly_work_item_ssn,
               category            =  dga_weekly_work_item_category,
               updated_by          =  dga_weekly_work_item_updated_by,
               status              =  'UPDATED'
         WHERE id                  =  dga_weekly_work_item_id;

         SET return_value = dga_weekly_work_item_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_weekly_work_set_closed(
    IN dga_weekly_work_item_id          INTEGER,
    IN dga_weekly_work_item_updated_by  VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    UPDATE dga_weekly_work
       SET status     = 'CLOSED',
           updated_by = dga_weekly_work_item_updated_by
     WHERE id         = dga_weekly_work_item_id;

    UPDATE dga_weekly_work_item
       SET status     = 'CLOSED',
           updated_by = dga_weekly_work_item_updated_by
     WHERE id         = dga_weekly_work_item_id
       AND status    != 'DELETED';

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_director_deal_memo_set_list(
    IN  dga_director_deal_memo_id                                 INT,
    IN  dga_director_deal_memo_contact_id                         INT,
    IN  dga_director_deal_memo_ssn                                VARCHAR(11),
    IN  dga_director_deal_memo_loanout                            VARCHAR(30),
    IN  dga_director_deal_memo_fid                                VARCHAR(30),
    IN  dga_director_deal_memo_salary                             DECIMAL,
    IN  dga_director_deal_memo_salary_period_id                   INT,
    IN  dga_director_deal_memo_aditional_time                     DECIMAL,
    IN  dga_director_deal_memo_aditional_time_period_id           INT,
    IN  dga_director_deal_memo_start_date                         DATE,
    IN  dga_director_deal_memo_guaranteed                         INT,
    IN  dga_director_deal_memo_guaranteed_period_id               INT,
    IN  dga_director_deal_memo_dga_covered                        CHAR(1),
    IN  dga_director_deal_memo_addition_terms                     VARCHAR(1024),
    IN  dga_director_deal_memo_production_id                      INT,
    IN  dga_director_deal_memo_episode_id                         INT,
    IN  dga_director_deal_memo_episode_specific_length            VARCHAR(50),
    IN  dga_director_deal_memo_segment                            CHAR(1),
    IN  dga_director_deal_memo_segment_specific_length            VARCHAR(50),
    IN  dga_director_deal_memo_pilot                              CHAR(1),
    IN  dga_director_deal_memo_dramatic_basic_cable_budget        DECIMAL,
    IN  dga_director_deal_memo_television_license_director        CHAR(1),
    IN  dga_director_deal_memo_television_license_budget          CHAR(1),
    IN  dga_director_deal_memo_produced_for_network               CHAR(1),
    IN  dga_director_deal_memo_produced_for_non_network           CHAR(1),
    IN  dga_director_deal_memo_produced_for_basic_cable           CHAR(1),
    IN  dga_director_deal_memo_produced_for_pay_tv                CHAR(1),
    IN  dga_director_deal_memo_produced_for_home_video            CHAR(1),
    IN  dga_director_deal_memo_show_type_dramatic                 CHAR(1),
    IN  dga_director_deal_memo_show_type_quiz_game                CHAR(1),
    IN  dga_director_deal_memo_show_type_variety                  CHAR(1),
    IN  dga_director_deal_memo_show_type_news_and_commentary      CHAR(1),
    IN  dga_director_deal_memo_show_type_local_freelance          CHAR(1),
    IN  dga_director_deal_memo_show_type_local_all_other          CHAR(1),
    IN  dga_director_deal_memo_show_type_sports_event             CHAR(1),
    IN  dga_director_deal_memo_show_type_sports_event_name        VARCHAR(50),
    IN  dga_director_deal_memo_show_type_series_after_02102002    CHAR(1),
    IN  dga_director_deal_memo_show_type_series_prior_02102002    CHAR(1),
    IN  dga_director_deal_memo_show_type_special                  CHAR(1),
    IN  dga_director_deal_memo_show_type_movie_mini_series        CHAR(1),
    IN  dga_director_deal_memo_show_type_strip                    CHAR(1),
    IN  dga_director_deal_memo_show_type_other                    CHAR(1),
    IN  dga_director_deal_memo_show_type_other_name               VARCHAR(50),
    IN  dga_director_deal_memo_show_type_high_budget              CHAR(1),
    IN  dga_director_deal_memo_show_type_low_budget               CHAR(1),
    IN  dga_director_deal_memo_show_type_prime_time               CHAR(1),
    IN  dga_director_deal_memo_show_type_non_prime_time           CHAR(1),
    IN  dga_director_deal_memo_show_type_live_broadcast           CHAR(1),
    IN  dga_director_deal_memo_employer_name                      VARCHAR(50),
    IN  dga_director_deal_memo_employee_name                      VARCHAR(50),
    IN  dga_director_deal_memo_employee_date                      DATE,
    IN  dga_director_deal_memo_signatory                          VARCHAR(50),
    IN  dga_director_deal_memo_signatory_by                       VARCHAR(50),
    IN  dga_director_deal_memo_signatory_date                     DATE,
    IN  dga_director_deal_memo_created_by                         VARCHAR(30),
    IN  dga_director_deal_memo_updated_by                         VARCHAR(30),
    IN  dga_director_deal_memo_status                             VARCHAR(30),
    OUT return_value                                              INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_director_deal_memo
     WHERE id = dga_director_deal_memo_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_director_deal_memo
        (
            contact_id,
            ssn,
            loanout,
            fid,
            salary,
            salary_period_id,
            aditional_time,
            aditional_time_period_id,
            start_date,
            guaranteed,
            guaranteed_period_id,
            dga_covered,
            addition_terms,
            production_id,
            episode_id,
            episode_specific_length,
            segment,
            segment_specific_length,
            pilot,
            dramatic_basic_cable_budget,
            television_license_director,
            television_license_budget,
            produced_for_network,
            produced_for_non_network,
            produced_for_basic_cable,
            produced_for_pay_tv,
            produced_for_home_video,
            show_type_dramatic,
            show_type_quiz_game,
            show_type_variety,
            show_type_news_and_commentary,
            show_type_local_freelance,
            show_type_local_all_other,
            show_type_sports_event,
            show_type_sports_event_name,
            show_type_series_after_02102002,
            show_type_series_prior_02102002,
            show_type_special,
            show_type_movie_mini_series,
            show_type_strip,
            show_type_other,
            show_type_other_name,
            show_type_high_budget,
            show_type_low_budget,
            show_type_prime_time,
            show_type_non_prime_time,
            show_type_live_broadcast,
            employer_name,
            employee_name,
            employee_date,
            signatory,
            signatory_by,
            signatory_date,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_director_deal_memo_contact_id,
            dga_director_deal_memo_ssn,
            dga_director_deal_memo_loanout,
            dga_director_deal_memo_fid,
            dga_director_deal_memo_salary,
            dga_director_deal_memo_salary_period_id,
            dga_director_deal_memo_aditional_time,
            dga_director_deal_memo_aditional_time_period_id,
            dga_director_deal_memo_start_date,
            dga_director_deal_memo_guaranteed,
            dga_director_deal_memo_guaranteed_period_id,
            dga_director_deal_memo_dga_covered,
            dga_director_deal_memo_addition_terms,
            dga_director_deal_memo_production_id,
            dga_director_deal_memo_episode_id,
            dga_director_deal_memo_episode_specific_length,
            dga_director_deal_memo_segment,
            dga_director_deal_memo_segment_specific_length,
            dga_director_deal_memo_pilot,
            dga_director_deal_memo_dramatic_basic_cable_budget,
            dga_director_deal_memo_television_license_director,
            dga_director_deal_memo_television_license_budget,
            dga_director_deal_memo_produced_for_network,
            dga_director_deal_memo_produced_for_non_network,
            dga_director_deal_memo_produced_for_basic_cable,
            dga_director_deal_memo_produced_for_pay_tv,
            dga_director_deal_memo_produced_for_home_video,
            dga_director_deal_memo_show_type_dramatic,
            dga_director_deal_memo_show_type_quiz_game,
            dga_director_deal_memo_show_type_variety,
            dga_director_deal_memo_show_type_news_and_commentary,
            dga_director_deal_memo_show_type_local_freelance,
            dga_director_deal_memo_show_type_local_all_other,
            dga_director_deal_memo_show_type_sports_event,
            dga_director_deal_memo_show_type_sports_event_name,
            dga_director_deal_memo_show_type_series_after_02102002,
            dga_director_deal_memo_show_type_series_prior_02102002,
            dga_director_deal_memo_show_type_special,
            dga_director_deal_memo_show_type_movie_mini_series,
            dga_director_deal_memo_show_type_strip,
            dga_director_deal_memo_show_type_other,
            dga_director_deal_memo_show_type_other_name,
            dga_director_deal_memo_show_type_high_budget,
            dga_director_deal_memo_show_type_low_budget,
            dga_director_deal_memo_show_type_prime_time,
            dga_director_deal_memo_show_type_non_prime_time,
            dga_director_deal_memo_show_type_live_broadcast,
            dga_director_deal_memo_employer_name,
            dga_director_deal_memo_employee_name,
            dga_director_deal_memo_employee_date,
            dga_director_deal_memo_signatory,
            dga_director_deal_memo_signatory_by,
            dga_director_deal_memo_signatory_date,
            dga_director_deal_memo_created_by,
            dga_director_deal_memo_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_director_deal_memo
           SET contact_id                      = dga_director_deal_memo_contact_id,
               ssn                             = dga_director_deal_memo_ssn,
               loanout                         = dga_director_deal_memo_loanout,
               fid                             = dga_director_deal_memo_fid,
               salary                          = dga_director_deal_memo_salary,
               salary_period_id                = dga_director_deal_memo_salary_period_id,
               aditional_time                  = dga_director_deal_memo_aditional_time,
               aditional_time_period_id        = dga_director_deal_memo_aditional_time_period_id,
               start_date                      = dga_director_deal_memo_start_date,
               guaranteed                      = dga_director_deal_memo_guaranteed,
               guaranteed_period_id            = dga_director_deal_memo_guaranteed_period_id,
               dga_covered                     = dga_director_deal_memo_dga_covered,
               addition_terms                  = dga_director_deal_memo_addition_terms,
               production_id                   = dga_director_deal_memo_production_id,
               episode_id                      = dga_director_deal_memo_episode_id,
               episode_specific_length         = dga_director_deal_memo_episode_specific_length,
               segment                         = dga_director_deal_memo_segment,
               segment_specific_length         = dga_director_deal_memo_segment_specific_length,
               pilot                           = dga_director_deal_memo_pilot,
               dramatic_basic_cable_budget     = dga_director_deal_memo_dramatic_basic_cable_budget,
               television_license_director     = dga_director_deal_memo_television_license_director,
               television_license_budget       = dga_director_deal_memo_television_license_budget,
               produced_for_network            = dga_director_deal_memo_produced_for_network,
               produced_for_non_network        = dga_director_deal_memo_produced_for_non_network,
               produced_for_basic_cable        = dga_director_deal_memo_produced_for_basic_cable,
               produced_for_pay_tv             = dga_director_deal_memo_produced_for_pay_tv,
               produced_for_home_video         = dga_director_deal_memo_produced_for_home_video,
               show_type_dramatic              = dga_director_deal_memo_show_type_dramatic,
               show_type_quiz_game             = dga_director_deal_memo_show_type_quiz_game,
               show_type_variety               = dga_director_deal_memo_show_type_variety,
               show_type_news_and_commentary   = dga_director_deal_memo_show_type_news_and_commentary,
               show_type_local_freelance       = dga_director_deal_memo_show_type_local_freelance,
               show_type_local_all_other       = dga_director_deal_memo_show_type_local_all_other,
               show_type_sports_event          = dga_director_deal_memo_show_type_sports_event,
               show_type_sports_event_name     = dga_director_deal_memo_show_type_sports_event_name,
               show_type_series_after_02102002 = dga_director_deal_memo_show_type_series_after_02102002,
               show_type_series_prior_02102002 = dga_director_deal_memo_show_type_series_prior_02102002,
               show_type_special               = dga_director_deal_memo_show_type_special,
               show_type_movie_mini_series     = dga_director_deal_memo_show_type_movie_mini_series,
               show_type_strip                 = dga_director_deal_memo_show_type_strip,
               show_type_other                 = dga_director_deal_memo_show_type_other,
               show_type_other_name            = dga_director_deal_memo_show_type_other_name,
               show_type_high_budget           = dga_director_deal_memo_show_type_high_budget,
               show_type_low_budget            = dga_director_deal_memo_show_type_low_budget,
               show_type_prime_time            = dga_director_deal_memo_show_type_prime_time,
               show_type_non_prime_time        = dga_director_deal_memo_show_type_non_prime_time,
               show_type_live_broadcast        = dga_director_deal_memo_show_type_live_broadcast,
               employer_name                   = dga_director_deal_memo_employer_name,
               employee_name                   = dga_director_deal_memo_employee_name,
               employee_date                   = dga_director_deal_memo_employee_date,
               signatory                       = dga_director_deal_memo_signatory,
               signatory_by                    = dga_director_deal_memo_signatory_by,
               signatory_date                  = dga_director_deal_memo_signatory_date,
               created_by                      = dga_director_deal_memo_created_by,
               updated_by                      = dga_director_deal_memo_updated_by,
               status                          = dga_director_deal_memo_status
         WHERE id                              = dga_director_deal_memo_id;

         SET return_value = dga_director_deal_memo_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_director_deal_memo_set_closed(
    IN dga_director_deal_memo_id                   INTEGER,
    IN dga_director_deal_memo_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE dga_director_deal_memo
       SET status     = 'CLOSED',
           updated_by = dga_director_deal_memo_updated_by
     WHERE id         = dga_director_deal_memo_id;
     COMMIT;

END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_employment_data_set_list(
    IN  dga_employment_data_id                                  INT,
    IN  dga_employment_data_report_date                         DATE,
    IN  dga_employment_data_prepared_by                         VARCHAR(50),
    IN  dga_employment_data_quarter                             VARCHAR(10),
    IN  dga_employment_data_year                                YEAR,
    IN  dga_employment_data_phone                               VARCHAR(20),
    IN  dga_employment_data_company_id                          INT,
    IN  dga_employment_data_production_id                       INT,
    IN  dga_employment_data_director_name                       VARCHAR(50),
    IN  dga_employment_data_director_first_number               INT,
    IN  dga_employment_data_director_gender                     CHAR(1),
    IN  dga_employment_data_director_caucasion                  CHAR(1),
    IN  dga_employment_data_director_afro_american              CHAR(1),
    IN  dga_employment_data_director_latino                     CHAR(1),
    IN  dga_employment_data_director_asian                      CHAR(1),
    IN  dga_employment_data_director_native                     CHAR(1),
    IN  dga_employment_data_director_unknown                    CHAR(1),
    IN  dga_employment_data_unit_production_name                VARCHAR(50),
    IN  dga_employment_data_unit_production_gender              CHAR(1),
    IN  dga_employment_data_unit_production_caucasion           CHAR(1),
    IN  dga_employment_data_unit_production_afro_american       CHAR(1),
    IN  dga_employment_data_unit_production_latino              CHAR(1),
    IN  dga_employment_data_unit_production_asian               CHAR(1),
    IN  dga_employment_data_unit_production_native              CHAR(1),
    IN  dga_employment_data_unit_production_unknown             CHAR(1),
    IN  dga_employment_data_first_assistant_name                VARCHAR(50),
    IN  dga_employment_data_first_assistant_gender              CHAR(1),
    IN  dga_employment_data_first_assistant_caucasion           CHAR(1),
    IN  dga_employment_data_first_assistant_afro_american       CHAR(1),
    IN  dga_employment_data_first_assistant_latino              CHAR(1),
    IN  dga_employment_data_first_assistant_asian               CHAR(1),
    IN  dga_employment_data_first_assistant_native              CHAR(1),
    IN  dga_employment_data_first_assistant_unknown             CHAR(1),
    IN  dga_employment_data_second_assistant_name               VARCHAR(50),
    IN  dga_employment_data_second_assistant_gender             CHAR(1),
    IN  dga_employment_data_second_assistant_caucasion          CHAR(1),
    IN  dga_employment_data_second_assistant_afro_american      CHAR(1),
    IN  dga_employment_data_second_assistant_latino             CHAR(1),
    IN  dga_employment_data_second_assistant_asian              CHAR(1),
    IN  dga_employment_data_second_assistant_native             CHAR(1),
    IN  dga_employment_data_second_assistant_unknown            CHAR(1),
    IN  dga_employment_data_technical_coordinator_name          VARCHAR(50),
    IN  dga_employment_data_technical_coordinator_gender        CHAR(1),
    IN  dga_employment_data_technical_coordinator_caucasion     CHAR(1),
    IN  dga_employment_data_technical_coordinator_afro_american CHAR(1),
    IN  dga_employment_data_technical_coordinator_latino        CHAR(1),
    IN  dga_employment_data_technical_coordinator_asian         CHAR(1),
    IN  dga_employment_data_technical_coordinator_native        CHAR(1),
    IN  dga_employment_data_technical_coordinator_unknown       CHAR(1),
    IN  dga_employment_data_associate_director_name             VARCHAR(50),
    IN  dga_employment_data_associate_director_gender           CHAR(1),
    IN  dga_employment_data_associate_director_caucasion        CHAR(1),
    IN  dga_employment_data_associate_director_afro_american    CHAR(1),
    IN  dga_employment_data_associate_director_latino           CHAR(1),
    IN  dga_employment_data_associate_director_asian            CHAR(1),
    IN  dga_employment_data_associate_director_native           CHAR(1),
    IN  dga_employment_data_associate_director_unknown          CHAR(1),
    IN  dga_employment_data_stage_manager_name                  VARCHAR(50),
    IN  dga_employment_data_stage_manager_gender                CHAR(1),
    IN  dga_employment_data_stage_manager_caucasion             CHAR(1),
    IN  dga_employment_data_stage_manager_afro_american         CHAR(1),
    IN  dga_employment_data_stage_manager_latino                CHAR(1),
    IN  dga_employment_data_stage_manager_asian                 CHAR(1),
    IN  dga_employment_data_stage_manager_native                CHAR(1),
    IN  dga_employment_data_stage_manager_unknown               CHAR(1),
    IN  dga_employment_data_created_by                          VARCHAR(30),
    IN  dga_employment_data_updated_by                          VARCHAR(30),
    OUT return_value                                            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_employment_data
     WHERE id = dga_employment_data_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_employment_data
        (
            report_date,
            prepared_by,
            quarter,
            year,
            phone,
            company_id,
            production_id,
            director_name,
            director_first_number,
            director_gender,
            director_caucasion,
            director_afro_american,
            director_latino,
            director_asian,
            director_native,
            director_unknown,
            unit_production_name,
            unit_production_gender,
            unit_production_caucasion,
            unit_production_afro_american,
            unit_production_latino,
            unit_production_asian,
            unit_production_native,
            unit_production_unknown,
            first_assistant_name,
            first_assistant_gender,
            first_assistant_caucasion,
            first_assistant_afro_american,
            first_assistant_latino,
            first_assistant_asian,
            first_assistant_native,
            first_assistant_unknown,
            second_assistant_name,
            second_assistant_gender,
            second_assistant_caucasion,
            second_assistant_afro_american,
            second_assistant_latino,
            second_assistant_asian,
            second_assistant_native,
            second_assistant_unknown,
            technical_coordinator_name,
            technical_coordinator_gender,
            technical_coordinator_caucasion,
            technical_coordinator_afro_american,
            technical_coordinator_latino,
            technical_coordinator_asian,
            technical_coordinator_native,
            technical_coordinator_unknown,
            associate_director_name,
            associate_director_gender,
            associate_director_caucasion,
            associate_director_afro_american,
            associate_director_latino,
            associate_director_asian,
            associate_director_native,
            associate_director_unknown,
            stage_manager_name,
            stage_manager_gender,
            stage_manager_caucasion,
            stage_manager_afro_american,
            stage_manager_latino,
            stage_manager_asian,
            stage_manager_native,
            stage_manager_unknown,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_employment_data_report_date,
            dga_employment_data_prepared_by,
            dga_employment_data_quarter,
            dga_employment_data_year,
            dga_employment_data_phone,
            dga_employment_data_company_id,
            dga_employment_data_production_id,
            dga_employment_data_director_name,
            dga_employment_data_director_first_number,
            dga_employment_data_director_gender,
            dga_employment_data_director_caucasion,
            dga_employment_data_director_afro_american,
            dga_employment_data_director_latino,
            dga_employment_data_director_asian,
            dga_employment_data_director_native,
            dga_employment_data_director_unknown,
            dga_employment_data_unit_production_name,
            dga_employment_data_unit_production_gender,
            dga_employment_data_unit_production_caucasion,
            dga_employment_data_unit_production_afro_american,
            dga_employment_data_unit_production_latino,
            dga_employment_data_unit_production_asian,
            dga_employment_data_unit_production_native,
            dga_employment_data_unit_production_unknown,
            dga_employment_data_first_assistant_name,
            dga_employment_data_first_assistant_gender,
            dga_employment_data_first_assistant_caucasion,
            dga_employment_data_first_assistant_afro_american,
            dga_employment_data_first_assistant_latino,
            dga_employment_data_first_assistant_asian,
            dga_employment_data_first_assistant_native,
            dga_employment_data_first_assistant_unknown,
            dga_employment_data_second_assistant_name,
            dga_employment_data_second_assistant_gender,
            dga_employment_data_second_assistant_caucasion,
            dga_employment_data_second_assistant_afro_american,
            dga_employment_data_second_assistant_latino,
            dga_employment_data_second_assistant_asian,
            dga_employment_data_second_assistant_native,
            dga_employment_data_second_assistant_unknown,
            dga_employment_data_technical_coordinator_name,
            dga_employment_data_technical_coordinator_gender,
            dga_employment_data_technical_coordinator_caucasion,
            dga_employment_data_technical_coordinator_afro_american,
            dga_employment_data_technical_coordinator_latino,
            dga_employment_data_technical_coordinator_asian,
            dga_employment_data_technical_coordinator_native,
            dga_employment_data_technical_coordinator_unknown,
            dga_employment_data_associate_director_name,
            dga_employment_data_associate_director_gender,
            dga_employment_data_associate_director_caucasion,
            dga_employment_data_associate_director_afro_american,
            dga_employment_data_associate_director_latino,
            dga_employment_data_associate_director_asian,
            dga_employment_data_associate_director_native,
            dga_employment_data_associate_director_unknown,
            dga_employment_data_stage_manager_name,
            dga_employment_data_stage_manager_gender,
            dga_employment_data_stage_manager_caucasion,
            dga_employment_data_stage_manager_afro_american,
            dga_employment_data_stage_manager_latino,
            dga_employment_data_stage_manager_asian,
            dga_employment_data_stage_manager_native,
            dga_employment_data_stage_manager_unknown,
            dga_employment_data_created_by,
            dga_employment_data_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_employment_data
           SET report_date                         = dga_employment_data_report_date,
               prepared_by                         = dga_employment_data_prepared_by,
               quarter                             = dga_employment_data_quarter,
               year                                = dga_employment_data_year,
               phone                               = dga_employment_data_phone,
               company_id                          = dga_employment_data_company_id,
               production_id                       = dga_employment_data_production_id,
               director_name                       = dga_employment_data_director_name,
               director_first_number               = dga_employment_data_director_first_number,
               director_gender                     = dga_employment_data_director_gender,
               director_caucasion                  = dga_employment_data_director_caucasion,
               director_afro_american              = dga_employment_data_director_afro_american,
               director_latino                     = dga_employment_data_director_latino,
               director_asian                      = dga_employment_data_director_asian,
               director_native                     = dga_employment_data_director_native,
               director_unknown                    = dga_employment_data_director_unknown,
               unit_production_name                = dga_employment_data_unit_production_name,
               unit_production_gender              = dga_employment_data_unit_production_gender,
               unit_production_caucasion           = dga_employment_data_unit_production_caucasion,
               unit_production_afro_american       = dga_employment_data_unit_production_afro_american,
               unit_production_latino              = dga_employment_data_unit_production_latino,
               unit_production_asian               = dga_employment_data_unit_production_asian,
               unit_production_native              = dga_employment_data_unit_production_native,
               unit_production_unknown             = dga_employment_data_unit_production_unknown,
               first_assistant_name                = dga_employment_data_first_assistant_name,
               first_assistant_gender              = dga_employment_data_first_assistant_gender,
               first_assistant_caucasion           = dga_employment_data_first_assistant_caucasion,
               first_assistant_afro_american       = dga_employment_data_first_assistant_afro_american,
               first_assistant_latino              = dga_employment_data_first_assistant_latino,
               first_assistant_asian               = dga_employment_data_first_assistant_asian,
               first_assistant_native              = dga_employment_data_first_assistant_native,
               first_assistant_unknown             = dga_employment_data_first_assistant_unknown,
               second_assistant_name               = dga_employment_data_second_assistant_name,
               second_assistant_gender             = dga_employment_data_second_assistant_gender,
               second_assistant_caucasion          = dga_employment_data_second_assistant_caucasion,
               second_assistant_afro_american      = dga_employment_data_second_assistant_afro_american,
               second_assistant_latino             = dga_employment_data_second_assistant_latino,
               second_assistant_asian              = dga_employment_data_second_assistant_asian,
               second_assistant_native             = dga_employment_data_second_assistant_native,
               second_assistant_unknown            = dga_employment_data_second_assistant_unknown,
               technical_coordinator_name          = dga_employment_data_technical_coordinator_name,
               technical_coordinator_gender        = dga_employment_data_technical_coordinator_gender,
               technical_coordinator_caucasion     = dga_employment_data_technical_coordinator_caucasion,
               technical_coordinator_afro_american = dga_employment_data_technical_coordinator_afro_american,
               technical_coordinator_latino        = dga_employment_data_technical_coordinator_latino,
               technical_coordinator_asian         = dga_employment_data_technical_coordinator_asian,
               technical_coordinator_native        = dga_employment_data_technical_coordinator_native,
               technical_coordinator_unknown       = dga_employment_data_technical_coordinator_unknown,
               associate_director_name             = dga_employment_data_associate_director_name,
               associate_director_gender           = dga_employment_data_associate_director_gender,
               associate_director_caucasion        = dga_employment_data_associate_director_caucasion,
               associate_director_afro_american    = dga_employment_data_associate_director_afro_american,
               associate_director_latino           = dga_employment_data_associate_director_latino,
               associate_director_asian            = dga_employment_data_associate_director_asian,
               associate_director_native           = dga_employment_data_associate_director_native,
               associate_director_unknown          = dga_employment_data_associate_director_unknown,
               stage_manager_name                  = dga_employment_data_stage_manager_name,
               stage_manager_gender                = dga_employment_data_stage_manager_gender,
               stage_manager_caucasion             = dga_employment_data_stage_manager_caucasion,
               stage_manager_afro_american         = dga_employment_data_stage_manager_afro_american,
               stage_manager_latino                = dga_employment_data_stage_manager_latino,
               stage_manager_asian                 = dga_employment_data_stage_manager_asian,
               stage_manager_native                = dga_employment_data_stage_manager_native,
               stage_manager_unknown               = dga_employment_data_stage_manager_unknown,
               created_by                          = dga_employment_data_created_by,
               updated_by                          = dga_employment_data_updated_by,
               status                              = 'UPDATED'
         WHERE id                                  = dga_employment_data_id;

         SET return_value = dga_employment_data_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_employment_data_set_closed_set_closed(
    IN dga_employment_data_set_closed_id                   INTEGER,
    IN dga_employment_data_set_closed_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE dga_employment_data
       SET status     = 'CLOSED',
           updated_by = dga_employment_data_set_closed_updated_by
     WHERE id         = dga_employment_data_set_closed_id;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_stage_manager_deal_memo_set_list(
    IN  dga_stage_manager_deal_memo_id                                  INT,
    IN  dga_stage_manager_deal_memo_contact_id                          INT,
    IN  dga_stage_manager_deal_memo_ssn                                 VARCHAR(11),
    IN  dga_stage_manager_deal_memo_loanout                             VARCHAR(30),
    IN  dga_stage_manager_deal_memo_fid                                 VARCHAR(30),
    IN  dga_stage_manager_deal_memo_salary                              DECIMAL,
    IN  dga_stage_manager_deal_memo_salary_period_id                    INT,
    IN  dga_stage_manager_deal_memo_aditional_time                      DECIMAL,
    IN  dga_stage_manager_deal_memo_aditional_time_period_id            INT,
    IN  dga_stage_manager_deal_memo_start_date                          DATE,
    IN  dga_stage_manager_deal_memo_guaranteed                          INT,
    IN  dga_stage_manager_deal_memo_guaranteed_period_id                INT,
    IN  dga_stage_manager_deal_memo_production_id                       INT,
    IN  dga_stage_manager_deal_memo_episode_id                          INT,
    IN  dga_stage_manager_deal_memo_category_associate_director         CHAR(1),
    IN  dga_stage_manager_deal_memo_category_stage_manager              CHAR(1),
    IN  dga_stage_manager_deal_memo_category_aditional_stage_manager    CHAR(1),
    IN  dga_stage_manager_deal_memo_prime_time_per_week_studio          CHAR(1),
    IN  dga_stage_manager_deal_memo_prime_time_per_week_location        CHAR(1),
    IN  dga_stage_manager_deal_memo_prime_time_per_day_studio           CHAR(1),
    IN  dga_stage_manager_deal_memo_prime_time_per_day_location         CHAR(1),
    IN  dga_stage_manager_deal_memo_other_per_week_40                   CHAR(1),
    IN  dga_stage_manager_deal_memo_other_per_week_flat_60              CHAR(1),
    IN  dga_stage_manager_deal_memo_other_per_day_8                     CHAR(1),
    IN  dga_stage_manager_deal_memo_other_per_day_flat_12               CHAR(1),
    IN  dga_stage_manager_deal_memo_project_info_30_lower               CHAR(1),
    IN  dga_stage_manager_deal_memo_project_info_30_between             CHAR(1),
    IN  dga_stage_manager_deal_memo_project_info_30_higher              CHAR(1),
    IN  dga_stage_manager_deal_memo_project_info_60_lower               CHAR(1),
    IN  dga_stage_manager_deal_memo_project_info_60_between             CHAR(1),
    IN  dga_stage_manager_deal_memo_project_info_60_higher              CHAR(1),
    IN  dga_stage_manager_deal_memo_project_info_120_lower              CHAR(1),
    IN  dga_stage_manager_deal_memo_project_info_120_between            CHAR(1),
    IN  dga_stage_manager_deal_memo_project_info_120_higher             CHAR(1),
    IN  dga_stage_manager_deal_memo_other_conditions                    VARCHAR(255),
    -- IN  dga_stage_manager_deal_memo_employer_name                       VARCHAR(50),
    IN  dga_stage_manager_deal_memo_employee_name                       VARCHAR(50),
    IN  dga_stage_manager_deal_memo_employee_date                       DATE,
    IN  dga_stage_manager_deal_memo_signatory                           VARCHAR(50),
    IN  dga_stage_manager_deal_memo_signatory_by                        VARCHAR(50),
    IN  dga_stage_manager_deal_memo_signatory_date                      DATE,
    IN  dga_stage_manager_deal_memo_created_by                          VARCHAR(30),
    IN  dga_stage_manager_deal_memo_updated_by                          VARCHAR(30),
    IN  dga_stage_manager_deal_memo_status                              VARCHAR(30),
    OUT return_value                                                   INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_stage_manager_deal_memo
     WHERE id = dga_stage_manager_deal_memo_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_stage_manager_deal_memo
        (
            contact_id,
            ssn,
            loanout,
            fid,
            salary,
            salary_period_id,
            aditional_time,
            aditional_time_period_id,
            start_date,
            guaranteed,
            guaranteed_period_id,
            production_id,
            episode_id,
            category_associate_director,
            category_stage_manager,
            category_aditional_stage_manager,
            prime_time_per_week_studio,
            prime_time_per_week_location,
            prime_time_per_day_studio,
            prime_time_per_day_location,
            other_per_week_40,
            other_per_week_flat_60,
            other_per_day_8,
            other_per_day_flat_12,
            project_info_30_lower,
            project_info_30_between,
            project_info_30_higher,
            project_info_60_lower,
            project_info_60_between,
            project_info_60_higher,
            project_info_120_lower,
            project_info_120_between,
            project_info_120_higher,
            other_conditions,
            -- employer_name,
            employee_name,
            employee_date,
            signatory,
            signatory_by,
            signatory_date,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_stage_manager_deal_memo_contact_id,
            dga_stage_manager_deal_memo_ssn,
            dga_stage_manager_deal_memo_loanout,
            dga_stage_manager_deal_memo_fid,
            dga_stage_manager_deal_memo_salary,
            dga_stage_manager_deal_memo_salary_period_id,
            dga_stage_manager_deal_memo_aditional_time,
            dga_stage_manager_deal_memo_aditional_time_period_id,
            dga_stage_manager_deal_memo_start_date,
            dga_stage_manager_deal_memo_guaranteed,
            dga_stage_manager_deal_memo_guaranteed_period_id,
            dga_stage_manager_deal_memo_production_id,
            dga_stage_manager_deal_memo_episode_id,
            dga_stage_manager_deal_memo_category_associate_director,
            dga_stage_manager_deal_memo_category_stage_manager,
            dga_stage_manager_deal_memo_category_aditional_stage_manager,
            dga_stage_manager_deal_memo_prime_time_per_week_studio,
            dga_stage_manager_deal_memo_prime_time_per_week_location,
            dga_stage_manager_deal_memo_prime_time_per_day_studio,
            dga_stage_manager_deal_memo_prime_time_per_day_location,
            dga_stage_manager_deal_memo_other_per_week_40,
            dga_stage_manager_deal_memo_other_per_week_flat_60,
            dga_stage_manager_deal_memo_other_per_day_8,
            dga_stage_manager_deal_memo_other_per_day_flat_12,
            dga_stage_manager_deal_memo_project_info_30_lower,
            dga_stage_manager_deal_memo_project_info_30_between,
            dga_stage_manager_deal_memo_project_info_30_higher,
            dga_stage_manager_deal_memo_project_info_60_lower,
            dga_stage_manager_deal_memo_project_info_60_between,
            dga_stage_manager_deal_memo_project_info_60_higher,
            dga_stage_manager_deal_memo_project_info_120_lower,
            dga_stage_manager_deal_memo_project_info_120_between,
            dga_stage_manager_deal_memo_project_info_120_higher,
            dga_stage_manager_deal_memo_other_conditions,
            -- dga_stage_manager_deal_memo_employer_name,
            dga_stage_manager_deal_memo_employee_name,
            dga_stage_manager_deal_memo_employee_date,
            dga_stage_manager_deal_memo_signatory,
            dga_stage_manager_deal_memo_signatory_by,
            dga_stage_manager_deal_memo_signatory_date,
            dga_stage_manager_deal_memo_created_by,
            dga_stage_manager_deal_memo_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_stage_manager_deal_memo
           SET id                               = dga_stage_manager_deal_memo_id,
               contact_id                       = dga_stage_manager_deal_memo_contact_id,
               ssn                              = dga_stage_manager_deal_memo_ssn,
               loanout                          = dga_stage_manager_deal_memo_loanout,
               fid                              = dga_stage_manager_deal_memo_fid,
               salary                           = dga_stage_manager_deal_memo_salary,
               salary_period_id                 = dga_stage_manager_deal_memo_salary_period_id,
               aditional_time                   = dga_stage_manager_deal_memo_aditional_time,
               aditional_time_period_id         = dga_stage_manager_deal_memo_aditional_time_period_id,
               start_date                       = dga_stage_manager_deal_memo_start_date,
               guaranteed                       = dga_stage_manager_deal_memo_guaranteed,
               guaranteed_period_id             = dga_stage_manager_deal_memo_guaranteed_period_id,
               production_id                    = dga_stage_manager_deal_memo_production_id,
               episode_id                       = dga_stage_manager_deal_memo_episode_id,
               category_associate_director      = dga_stage_manager_deal_memo_category_associate_director,
               category_stage_manager           = dga_stage_manager_deal_memo_category_stage_manager,
               category_aditional_stage_manager = dga_stage_manager_deal_memo_category_aditional_stage_manager,
               prime_time_per_week_studio       = dga_stage_manager_deal_memo_prime_time_per_week_studio,
               prime_time_per_week_location     = dga_stage_manager_deal_memo_prime_time_per_week_location,
               prime_time_per_day_studio        = dga_stage_manager_deal_memo_prime_time_per_day_studio,
               prime_time_per_day_location      = dga_stage_manager_deal_memo_prime_time_per_day_location,
               other_per_week_40                = dga_stage_manager_deal_memo_other_per_week_40,
               other_per_week_flat_60           = dga_stage_manager_deal_memo_other_per_week_flat_60,
               other_per_day_8                  = dga_stage_manager_deal_memo_other_per_day_8,
               other_per_day_flat_12            = dga_stage_manager_deal_memo_other_per_day_flat_12,
               project_info_30_lower            = dga_stage_manager_deal_memo_project_info_30_lower,
               project_info_30_between          = dga_stage_manager_deal_memo_project_info_30_between,
               project_info_30_higher           = dga_stage_manager_deal_memo_project_info_30_higher,
               project_info_60_lower            = dga_stage_manager_deal_memo_project_info_60_lower,
               project_info_60_between          = dga_stage_manager_deal_memo_project_info_60_between,
               project_info_60_higher           = dga_stage_manager_deal_memo_project_info_60_higher,
               project_info_120_lower           = dga_stage_manager_deal_memo_project_info_120_lower,
               project_info_120_between         = dga_stage_manager_deal_memo_project_info_120_between,
               project_info_120_higher          = dga_stage_manager_deal_memo_project_info_120_higher,
               other_conditions                 = dga_stage_manager_deal_memo_other_conditions,
            --    employer_name                    = dga_stage_manager_deal_memo_employer_name,
               employee_name                    = dga_stage_manager_deal_memo_employee_name,
               employee_date                    = dga_stage_manager_deal_memo_employee_date,
               signatory                        = dga_stage_manager_deal_memo_signatory,
               signatory_by                     = dga_stage_manager_deal_memo_signatory_by,
               signatory_date                   = dga_stage_manager_deal_memo_signatory_date,
               created_by                       = dga_stage_manager_deal_memo_created_by,
               updated_by                       = dga_stage_manager_deal_memo_updated_by,
               status = 'UPDATED'
         WHERE id                 =    dga_stage_manager_deal_memo_id;

         SET return_value = dga_stage_manager_deal_memo_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_stage_manager_deal_memo_set_closed(
    IN dga_stage_manager_deal_memo_id                   INTEGER,
    IN dga_stage_manager_deal_memo_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE dga_stage_manager_deal_memo
       SET status     = 'CLOSED',
           updated_by = dga_stage_manager_deal_memo_updated_by
     WHERE id         = dga_stage_manager_deal_memo_id;
     COMMIT;

END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_director_scripted_deal_memo_set_list(
    IN  dga_director_scripted_deal_memo_id                                       INT,
    IN  dga_director_scripted_deal_memo_contact_id                               INT,
    IN  dga_director_scripted_deal_memo_ssn                                      VARCHAR(11),
    IN  dga_director_scripted_deal_memo_loanout                                  VARCHAR(30),
    IN  dga_director_scripted_deal_memo_fid                                      VARCHAR(30),
    IN  dga_director_scripted_deal_memo_salary                                   DECIMAL,
    IN  dga_director_scripted_deal_memo_salary_period_id                         INT,
    IN  dga_director_scripted_deal_memo_aditional_time                           DECIMAL,
    IN  dga_director_scripted_deal_memo_aditional_time_period_id                 INT,
    IN  dga_director_scripted_deal_memo_start_date                               DATE,
    IN  dga_director_scripted_deal_memo_guaranteed                               INT,
    IN  dga_director_scripted_deal_memo_guaranteed_period_id                     INT,
    IN  dga_director_scripted_deal_memo_dga_covered                              CHAR(1),
    IN  dga_director_scripted_deal_memo_addition_terms                           VARCHAR(1024),
    IN  dga_director_scripted_deal_memo_production_id                            INT,
    IN  dga_director_scripted_deal_memo_project_number                           VARCHAR(30),
    IN  dga_director_scripted_deal_memo_episode_id                               INT,
    IN  dga_director_scripted_deal_memo_episode_specific_length                  VARCHAR(50),
    IN  dga_director_scripted_deal_memo_segment                                  CHAR(1),
    IN  dga_director_scripted_deal_memo_segment_specific_length                  VARCHAR(50),
    IN  dga_director_scripted_deal_memo_length_30                                CHAR(1),
    IN  dga_director_scripted_deal_memo_length_60                                CHAR(1),
    IN  dga_director_scripted_deal_memo_length_90                                CHAR(1),
    IN  dga_director_scripted_deal_memo_length_120                               CHAR(1),
    IN  dga_director_scripted_deal_memo_length_other                             CHAR(1),
    IN  dga_director_scripted_deal_memo_pilot                                    CHAR(1),
    IN  dga_director_scripted_deal_memo_dramatic_basic_cable_budget              DECIMAL,
    IN  dga_director_scripted_deal_memo_type_production_multi_camera             CHAR(1),
    IN  dga_director_scripted_deal_memo_type_production_single_camera            CHAR(1),
    -- IN  dga_director_scripted_deal_memo_television_license_director    CHAR(1),
    -- IN  dga_director_scripted_deal_memo_television_license_budget      CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_network                     CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_non_network                 CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_basic_cable                 CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_pay_tv                      CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_home_video                  CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_non_network_prime_time          CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_nnetwork_nprime_time            CHAR(1),
    IN  dga_director_scripted_deal_memo_project_budget_more                      CHAR(1),
    IN  dga_director_scripted_deal_memo_project_budget_less                      CHAR(1),
    IN  dga_director_scripted_deal_memo_second_unit_director                     CHAR(1),
    IN  dga_director_scripted_deal_memo_segment_applicable                       CHAR(1),
    IN  dga_director_scripted_deal_memo_individual_final_cut_authority           VARCHAR(50),
    IN  dga_director_scripted_deal_memo_other_conditions                         VARCHAR(50),
    IN  dga_director_scripted_deal_memo_employer_name                            VARCHAR(50),
    IN  dga_director_scripted_deal_memo_employee_name                            VARCHAR(50),
    IN  dga_director_scripted_deal_memo_employee_date                            DATE,
    IN  dga_director_scripted_deal_memo_signatory                                VARCHAR(50),
    IN  dga_director_scripted_deal_memo_signatory_by                             VARCHAR(50),
    IN  dga_director_scripted_deal_memo_signatory_date                           DATE,
    IN  dga_director_scripted_deal_memo_created_by                               VARCHAR(30),
    IN  dga_director_scripted_deal_memo_updated_by                               VARCHAR(30),
    IN  dga_director_scripted_deal_memo_status                                   VARCHAR(30),
    OUT return_value                                                             INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_director_scripted_deal_memo
     WHERE id = dga_director_scripted_deal_memo_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_director_scripted_deal_memo
        (
            contact_id,
            ssn,
            loanout,
            fid,
            salary,
            salary_period_id,
            aditional_time,
            aditional_time_period_id,
            start_date,
            guaranteed,
            guaranteed_period_id,
            dga_covered,
            addition_terms,
            production_id,
            project_number,
            episode_id,
            episode_specific_length,
            segment,
            segment_specific_length,
            length_30,
            length_60,
            length_90,
            length_120,
            length_other,
            pilot,
            dramatic_basic_cable_budget,
            type_production_multi_camera,
            type_production_single_camera,
            -- television_license_director,
            -- television_license_budget,
            produced_for_network,
            produced_for_non_network,
            produced_for_basic_cable,
            produced_for_pay_tv,
            produced_for_home_video,
            produced_non_network_prime_time,
            produced_non_network_non_prime_time,
            project_budget_more,
            project_budget_less,
            second_unit_director,
            segment_applicable,
            individual_final_cut_authority,
            other_conditions,
            employer_name,
            employee_name,
            employee_date,
            signatory,
            signatory_by,
            signatory_date,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_director_scripted_deal_memo_contact_id,
            dga_director_scripted_deal_memo_ssn,
            dga_director_scripted_deal_memo_loanout,
            dga_director_scripted_deal_memo_fid,
            dga_director_scripted_deal_memo_salary,
            dga_director_scripted_deal_memo_salary_period_id,
            dga_director_scripted_deal_memo_aditional_time,
            dga_director_scripted_deal_memo_aditional_time_period_id,
            dga_director_scripted_deal_memo_start_date,
            dga_director_scripted_deal_memo_guaranteed,
            dga_director_scripted_deal_memo_guaranteed_period_id,
            dga_director_scripted_deal_memo_dga_covered,
            dga_director_scripted_deal_memo_addition_terms,
            dga_director_scripted_deal_memo_production_id,
            dga_director_scripted_deal_memo_project_number,
            dga_director_scripted_deal_memo_episode_id,
            dga_director_scripted_deal_memo_episode_specific_length,
            dga_director_scripted_deal_memo_segment,
            dga_director_scripted_deal_memo_segment_specific_length,
            dga_director_scripted_deal_memo_length_30,
            dga_director_scripted_deal_memo_length_60,
            dga_director_scripted_deal_memo_length_90,
            dga_director_scripted_deal_memo_length_120,
            dga_director_scripted_deal_memo_length_other,
            dga_director_scripted_deal_memo_pilot,
            dga_director_scripted_deal_memo_dramatic_basic_cable_budget,
            dga_director_scripted_deal_memo_type_production_multi_camera,
            dga_director_scripted_deal_memo_type_production_single_camera,
            -- dga_director_scripted_deal_memo_television_license_director,
            -- dga_director_scripted_deal_memo_television_license_budget,
            dga_director_scripted_deal_memo_produced_for_network,
            dga_director_scripted_deal_memo_produced_for_non_network,
            dga_director_scripted_deal_memo_produced_for_basic_cable,
            dga_director_scripted_deal_memo_produced_for_pay_tv,
            dga_director_scripted_deal_memo_produced_for_home_video,
            dga_director_scripted_deal_memo_produced_non_network_prime_time,
            dga_director_scripted_deal_memo_produced_nnetwork_nprime_time,
            dga_director_scripted_deal_memo_project_budget_more,
            dga_director_scripted_deal_memo_project_budget_less,
            dga_director_scripted_deal_memo_second_unit_director,
            dga_director_scripted_deal_memo_segment_applicable,
            dga_director_scripted_deal_memo_individual_final_cut_authority,
            dga_director_scripted_deal_memo_other_conditions,
            dga_director_scripted_deal_memo_employer_name,
            dga_director_scripted_deal_memo_employee_name,
            dga_director_scripted_deal_memo_employee_date,
            dga_director_scripted_deal_memo_signatory,
            dga_director_scripted_deal_memo_signatory_by,
            dga_director_scripted_deal_memo_signatory_date,
            dga_director_scripted_deal_memo_created_by,
            dga_director_scripted_deal_memo_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_director_scripted_deal_memo
           SET contact_id                            = dga_director_scripted_deal_memo_contact_id,
               ssn                                   = dga_director_scripted_deal_memo_ssn,
               loanout                               = dga_director_scripted_deal_memo_loanout,
               fid                                   = dga_director_scripted_deal_memo_fid,
               salary                                = dga_director_scripted_deal_memo_salary,
               salary_period_id                      = dga_director_scripted_deal_memo_salary_period_id,
               aditional_time                        = dga_director_scripted_deal_memo_aditional_time,
               aditional_time_period_id              = dga_director_scripted_deal_memo_aditional_time_period_id,
               start_date                            = dga_director_scripted_deal_memo_start_date,
               guaranteed                            = dga_director_scripted_deal_memo_guaranteed,
               guaranteed_period_id                  = dga_director_scripted_deal_memo_guaranteed_period_id,
               dga_covered                           = dga_director_scripted_deal_memo_dga_covered,
               addition_terms                        = dga_director_scripted_deal_memo_addition_terms,
               production_id                         = dga_director_scripted_deal_memo_production_id,
               project_number                        = dga_director_scripted_deal_memo_project_number,
               episode_id                            = dga_director_scripted_deal_memo_episode_id,
               episode_specific_length               = dga_director_scripted_deal_memo_episode_specific_length,
               segment                               = dga_director_scripted_deal_memo_segment,
               segment_specific_length               = dga_director_scripted_deal_memo_segment_specific_length,
               length_30                             = dga_director_scripted_deal_memo_length_30,
               length_60                             = dga_director_scripted_deal_memo_length_60,
               length_90                             = dga_director_scripted_deal_memo_length_90,
               length_120                            = dga_director_scripted_deal_memo_length_120,
               length_other                          = dga_director_scripted_deal_memo_length_other,
               pilot                                 = dga_director_scripted_deal_memo_pilot,
               dramatic_basic_cable_budget           = dga_director_scripted_deal_memo_dramatic_basic_cable_budget,
               type_production_multi_camera          = dga_director_scripted_deal_memo_type_production_multi_camera,
               type_production_single_camera         = dga_director_scripted_deal_memo_type_production_single_camera,
            --    television_license_director   = dga_director_scripted_deal_memo_television_license_director,
            --    television_license_budget     = dga_director_scripted_deal_memo_television_license_budget,
               produced_for_network                  = dga_director_scripted_deal_memo_produced_for_network,
               produced_for_non_network              = dga_director_scripted_deal_memo_produced_for_non_network,
               produced_for_basic_cable              = dga_director_scripted_deal_memo_produced_for_basic_cable,
               produced_for_pay_tv                   = dga_director_scripted_deal_memo_produced_for_pay_tv,
               produced_for_home_video               = dga_director_scripted_deal_memo_produced_for_home_video,
               produced_non_network_prime_time       = dga_director_scripted_deal_memo_produced_non_network_prime_time,
               produced_non_network_non_prime_time   = dga_director_scripted_deal_memo_produced_nnetwork_nprime_time,
               project_budget_more                   = dga_director_scripted_deal_memo_project_budget_more,
               project_budget_less                   = dga_director_scripted_deal_memo_project_budget_less,
               second_unit_director                  = dga_director_scripted_deal_memo_second_unit_director,
               segment_applicable                    = dga_director_scripted_deal_memo_segment_applicable,
               individual_final_cut_authority        = dga_director_scripted_deal_memo_individual_final_cut_authority,
               other_conditions                      = dga_director_scripted_deal_memo_other_conditions,
               employer_name                         = dga_director_scripted_deal_memo_employer_name,
               employee_name                         = dga_director_scripted_deal_memo_employee_name,
               employee_date                         = dga_director_scripted_deal_memo_employee_date,
               signatory                             = dga_director_scripted_deal_memo_signatory,
               signatory_by                          = dga_director_scripted_deal_memo_signatory_by,
               signatory_date                        = dga_director_scripted_deal_memo_signatory_date,
            --    created                               = dga_director_scripted_deal_memo_created,
               created_by                            = dga_director_scripted_deal_memo_created_by,
            --    updated                               = dga_director_scripted_deal_memo_updated,
               updated_by                            = dga_director_scripted_deal_memo_updated_by,
               status                                = 'UPDATED'
         WHERE id                                    = dga_director_scripted_deal_memo_id;

         SET return_value = dga_director_scripted_deal_memo_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_director_scripted_deal_memo_set_closed(
    IN dga_director_scripted_deal_memo_id                   INTEGER,
    IN dga_director_scripted_deal_memo_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE dga_director_scripted_deal_memo
       SET status     = 'CLOSED',
           updated_by = dga_director_scripted_deal_memo_updated_by
     WHERE id         = dga_director_scripted_deal_memo_id;
     COMMIT;

END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_upm_deal_memo_set_list(
    IN dga_upm_deal_memo_id                                              INT,
    IN dga_upm_deal_memo_contact_id                                      INT,
    IN dga_upm_deal_memo_ssn                                             VARCHAR(11),
    IN dga_upm_deal_memo_loanout                                         VARCHAR(30),
    IN dga_upm_deal_memo_fid                                             VARCHAR(30),
    IN dga_upm_deal_memo_category_unit_production_manager                CHAR(1),
    IN dga_upm_deal_memo_category_additional_second_assistant_director   CHAR(1),
    IN dga_upm_deal_memo_category_first_assistant_director               CHAR(1),
    IN dga_upm_deal_memo_category_associate_director                     CHAR(1),
    IN dga_upm_deal_memo_category_key_second_assistant_director          CHAR(1),
    IN dga_upm_deal_memo_category_associate_director_line_cut            CHAR(1),
    IN dga_upm_deal_memo_category_second_assistant_director              CHAR(1),
    IN dga_upm_deal_memo_salary_studio                                   DECIMAL,
    IN dga_upm_deal_memo_salary_studio_period_id                         INT,
    IN dga_upm_deal_memo_salary_location                                 DECIMAL,
    IN dga_upm_deal_memo_salary_location_period_id                       INT,
    IN dga_upm_deal_memo_start_date                                      DATE,
    IN dga_upm_deal_memo_guaranteed_period_1                             CHAR(1),
    IN dga_upm_deal_memo_guaranteed_period_3                             CHAR(1),
    IN dga_upm_deal_memo_guaranteed_period_7                             CHAR(1),
    IN dga_upm_deal_memo_production_id                                   INT,
    IN dga_upm_deal_memo_episode_id                                      INT,
    IN dga_upm_deal_memo_type_production_feature                         CHAR(1),
    IN dga_upm_deal_memo_type_production_multi_camera_prime_time         CHAR(1),
    IN dga_upm_deal_memo_type_production_single_camera                   CHAR(1),
    IN dga_upm_deal_memo_type_production_other_television                CHAR(1),
    IN dga_upm_deal_memo_project_info_30_lower                           CHAR(1),
    IN dga_upm_deal_memo_project_info_30_between                         CHAR(1),
    IN dga_upm_deal_memo_project_info_30_higher                          CHAR(1),
    IN dga_upm_deal_memo_project_info_60_lower                           CHAR(1),
    IN dga_upm_deal_memo_project_info_60_between                         CHAR(1),
    IN dga_upm_deal_memo_project_info_60_higher                          CHAR(1),
    IN dga_upm_deal_memo_project_info_120_lower                          CHAR(1),
    IN dga_upm_deal_memo_project_info_120_between                        CHAR(1),
    IN dga_upm_deal_memo_project_info_120_higher                         CHAR(1),
    IN dga_upm_deal_memo_location_studio                                 CHAR(1),
    IN dga_upm_deal_memo_location_distant                                CHAR(1),
    IN dga_upm_deal_memo_location_distant_specific                       VARCHAR(50),
    IN dga_upm_deal_memo_location_both                                   CHAR(1),
    IN dga_upm_deal_memo_location_both_specific                          VARCHAR(50),
    IN dga_upm_deal_memo_other_conditions                                VARCHAR(50),
    IN dga_upm_deal_memo_employer_name                                   VARCHAR(50),
    IN dga_upm_deal_memo_employee_name                                   VARCHAR(50),
    IN dga_upm_deal_memo_employee_date                                   DATE,
    IN dga_upm_deal_memo_signatory                                       VARCHAR(50),
    IN dga_upm_deal_memo_signatory_by                                    VARCHAR(50),
    IN dga_upm_deal_memo_signatory_date                                  DATE,
    IN dga_upm_deal_memo_created_by                                      VARCHAR(30),
    IN dga_upm_deal_memo_updated_by                                      VARCHAR(30),
    IN dga_upm_deal_memo_status                                          VARCHAR(30),
    OUT return_value                                                     INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_upm_deal_memo
     WHERE id = dga_upm_deal_memo_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_upm_deal_memo
        (
            contact_id,
            ssn,
            loanout,
            fid,
            category_unit_production_manager,
            category_additional_second_assistant_director,
            category_first_assistant_director,
            category_associate_director,
            category_key_second_assistant_director,
            category_associate_director_line_cut,
            category_second_assistant_director,
            salary_studio,
            salary_studio_period_id,
            salary_location,
            salary_location_period_id,
            start_date,
            guaranteed_period_1,
            guaranteed_period_3,
            guaranteed_period_7,
            production_id,
            episode_id,
            type_production_feature,
            type_production_multi_camera_prime_time,
            type_production_single_camera,
            type_production_other_television,
            project_info_30_lower,
            project_info_30_between,
            project_info_30_higher,
            project_info_60_lower,
            project_info_60_between,
            project_info_60_higher,
            project_info_120_lower,
            project_info_120_between,
            project_info_120_higher,
            location_studio,
            location_distant,
            location_distant_specific,
            location_both,
            location_both_specific,
            other_conditions,
            employer_name,
            employee_name,
            employee_date,
            signatory,
            signatory_by,
            signatory_date,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_upm_deal_memo_contact_id,
            dga_upm_deal_memo_ssn,
            dga_upm_deal_memo_loanout,
            dga_upm_deal_memo_fid,
            dga_upm_deal_memo_category_unit_production_manager,
            dga_upm_deal_memo_category_additional_second_assistant_director,
            dga_upm_deal_memo_category_first_assistant_director,
            dga_upm_deal_memo_category_associate_director,
            dga_upm_deal_memo_category_key_second_assistant_director,
            dga_upm_deal_memo_category_associate_director_line_cut,
            dga_upm_deal_memo_category_second_assistant_director,
            dga_upm_deal_memo_salary_studio,
            dga_upm_deal_memo_salary_studio_period_id,
            dga_upm_deal_memo_salary_location,
            dga_upm_deal_memo_salary_location_period_id,
            dga_upm_deal_memo_start_date,
            dga_upm_deal_memo_guaranteed_period_1,
            dga_upm_deal_memo_guaranteed_period_3,
            dga_upm_deal_memo_guaranteed_period_7,
            dga_upm_deal_memo_production_id,
            dga_upm_deal_memo_episode_id,
            dga_upm_deal_memo_type_production_feature,
            dga_upm_deal_memo_type_production_multi_camera_prime_time,
            dga_upm_deal_memo_type_production_single_camera,
            dga_upm_deal_memo_type_production_other_television,
            dga_upm_deal_memo_project_info_30_lower,
            dga_upm_deal_memo_project_info_30_between,
            dga_upm_deal_memo_project_info_30_higher,
            dga_upm_deal_memo_project_info_60_lower,
            dga_upm_deal_memo_project_info_60_between,
            dga_upm_deal_memo_project_info_60_higher,
            dga_upm_deal_memo_project_info_120_lower,
            dga_upm_deal_memo_project_info_120_between,
            dga_upm_deal_memo_project_info_120_higher,
            dga_upm_deal_memo_location_studio,
            dga_upm_deal_memo_location_distant,
            dga_upm_deal_memo_location_distant_specific,
            dga_upm_deal_memo_location_both,
            dga_upm_deal_memo_location_both_specific,
            dga_upm_deal_memo_other_conditions,
            dga_upm_deal_memo_employer_name,
            dga_upm_deal_memo_employee_name,
            dga_upm_deal_memo_employee_date,
            dga_upm_deal_memo_signatory,
            dga_upm_deal_memo_signatory_by,
            dga_upm_deal_memo_signatory_date,
            dga_upm_deal_memo_created_by,
            dga_upm_deal_memo_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_upm_deal_memo
           SET contact_id                                    = dga_upm_deal_memo_contact_id,
               ssn                                           = dga_upm_deal_memo_ssn,
               loanout                                       = dga_upm_deal_memo_loanout,
               fid                                           = dga_upm_deal_memo_fid,
               category_unit_production_manager              = dga_upm_deal_memo_category_unit_production_manager,
               category_additional_second_assistant_director = dga_upm_deal_memo_category_additional_second_assistant_director,
               category_first_assistant_director             = dga_upm_deal_memo_category_first_assistant_director,
               category_associate_director                   = dga_upm_deal_memo_category_associate_director,
               category_key_second_assistant_director        = dga_upm_deal_memo_category_key_second_assistant_director,
               category_associate_director_line_cut          = dga_upm_deal_memo_category_associate_director_line_cut,
               category_second_assistant_director            = dga_upm_deal_memo_category_second_assistant_director,
               salary_studio                                 = dga_upm_deal_memo_salary_studio,
               salary_studio_period_id                       = dga_upm_deal_memo_salary_studio_period_id,
               salary_location                               = dga_upm_deal_memo_salary_location,
               salary_location_period_id                     = dga_upm_deal_memo_salary_location_period_id,
               start_date                                    = dga_upm_deal_memo_start_date,
               guaranteed_period_1                           = dga_upm_deal_memo_guaranteed_period_1,
               guaranteed_period_3                           = dga_upm_deal_memo_guaranteed_period_3,
               guaranteed_period_7                           = dga_upm_deal_memo_guaranteed_period_7,
               production_id                                 = dga_upm_deal_memo_production_id,
               episode_id                                    = dga_upm_deal_memo_episode_id,
               type_production_feature                       = dga_upm_deal_memo_type_production_feature,
               type_production_multi_camera_prime_time       = dga_upm_deal_memo_type_production_multi_camera_prime_time,
               type_production_single_camera                 = dga_upm_deal_memo_type_production_single_camera,
               type_production_other_television              = dga_upm_deal_memo_type_production_other_television,
               project_info_30_lower                         = dga_upm_deal_memo_project_info_30_lower,
               project_info_30_between                       = dga_upm_deal_memo_project_info_30_between,
               project_info_30_higher                        = dga_upm_deal_memo_project_info_30_higher,
               project_info_60_lower                         = dga_upm_deal_memo_project_info_60_lower,
               project_info_60_between                       = dga_upm_deal_memo_project_info_60_between,
               project_info_60_higher                        = dga_upm_deal_memo_project_info_60_higher,
               project_info_120_lower                        = dga_upm_deal_memo_project_info_120_lower,
               project_info_120_between                      = dga_upm_deal_memo_project_info_120_between,
               project_info_120_higher                       = dga_upm_deal_memo_project_info_120_higher,
               location_studio                               = dga_upm_deal_memo_location_studio,
               location_distant                              = dga_upm_deal_memo_location_distant,
               location_distant_specific                     = dga_upm_deal_memo_location_distant_specific,
               location_both                                 = dga_upm_deal_memo_location_both,
               location_both_specific                        = dga_upm_deal_memo_location_both_specific,
               other_conditions                              = dga_upm_deal_memo_other_conditions,
               employer_name                                 = dga_upm_deal_memo_employer_name,
               employee_name                                 = dga_upm_deal_memo_employee_name,
               employee_date                                 = dga_upm_deal_memo_employee_date,
               signatory                                     = dga_upm_deal_memo_signatory,
               signatory_by                                  = dga_upm_deal_memo_signatory_by,
               signatory_date                                = dga_upm_deal_memo_signatory_date,
               created_by                                    = dga_upm_deal_memo_created_by,
               updated_by                                    = dga_upm_deal_memo_updated_by,
               status                                        = 'UPDATED'
         WHERE id                 =    dga_upm_deal_memo_id;
        SET return_value = dga_upm_deal_memo_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_upm_deal_memo_set_closed(
    IN dga_upm_deal_memo_id                   INTEGER,
    IN dga_upm_deal_memo_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE dga_upm_deal_memo
       SET status     = 'CLOSED',
           updated_by = dga_upm_deal_memo_updated_by
     WHERE id         = dga_upm_deal_memo_id;
     COMMIT;

END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_pif_tv_set_list(
    IN dga_pif_tv_id                                             INT,
    IN dga_pif_tv_company_id                                     INT,
    IN dga_pif_tv_contact_id                                     INT,
    IN dga_pif_tv_production_id                                  INT,
    IN dga_pif_tv_copyright_holder                               VARCHAR(50),
    IN dga_pif_tv_copyright_holder_name                          VARCHAR(50),
    IN dga_pif_tv_copyright_holder_phone                         VARCHAR(20),
    IN dga_pif_tv_writers                                        VARCHAR(255),
    IN dga_pif_tv_budget                                         DECIMAL,
    IN dga_pif_tv_locations                                      VARCHAR(255),
    IN dga_pif_tv_date_pre_production                            DATE,
    IN dga_pif_tv_date_principal_photography                     DATE,
    IN dga_pif_tv_date_wrap                                      DATE,
    IN dga_pif_tv_format_multi_camera                            CHAR(1),
    IN dga_pif_tv_format_single_camera                           CHAR(1),
    IN dga_pif_tv_produced_digital                               CHAR(1),
    IN dga_pif_tv_produced_film                                  CHAR(1),
    IN dga_pif_tv_produced_tape                                  CHAR(1),
    IN dga_pif_tv_produced_live                                  CHAR(1),
    IN dga_pif_tv_produced_other                                 CHAR(1),
    IN dga_pif_tv_produced_other_description                     VARCHAR(50),
    IN dga_pif_tv_program_type_dramatic                          CHAR(1),
    IN dga_pif_tv_program_type_sitcom                            CHAR(1),
    IN dga_pif_tv_program_type_reality                           CHAR(1),
    IN dga_pif_tv_program_type_variety                           CHAR(1),
    IN dga_pif_tv_program_type_other                             CHAR(1),
    IN dga_pif_tv_program_type_other_description                 VARCHAR(50),
    IN dga_pif_tv_program_length_30                              CHAR(1),
    IN dga_pif_tv_program_length_60                              CHAR(1),
    IN dga_pif_tv_program_length_90                              CHAR(1),
    IN dga_pif_tv_program_length_120                             CHAR(1),
    IN dga_pif_tv_program_length_other                           CHAR(1),
    IN dga_pif_tv_program_length_other_description               VARCHAR(50),
    IN dga_pif_tv_network                                        CHAR(1),
    IN dga_pif_tv_network_abc                                    CHAR(1),
    IN dga_pif_tv_network_cbs                                    CHAR(1),
    IN dga_pif_tv_network_fox                                    CHAR(1),
    IN dga_pif_tv_network_nbc                                    CHAR(1),
    IN dga_pif_tv_network_pbs                                    CHAR(1),
    IN dga_pif_tv_network_upn                                    CHAR(1),
    IN dga_pif_tv_network_wb                                     CHAR(1),
    IN dga_pif_tv_network_syndication                            CHAR(1),
    IN dga_pif_tv_network_syndication_description                VARCHAR(50),
    IN dga_pif_tv_basic_cable                                    CHAR(1),
    IN dga_pif_tv_basic_cable_a_and_e                            CHAR(1),
    IN dga_pif_tv_basic_cable_disney                             CHAR(1),
    IN dga_pif_tv_basic_cable_lifetime                           CHAR(1),
    IN dga_pif_tv_basic_cable_mtv                                CHAR(1),
    IN dga_pif_tv_basic_cable_nickelodeon                        CHAR(1),
    IN dga_pif_tv_basic_cable_tnt                                CHAR(1),
    IN dga_pif_tv_basic_cable_usa                                CHAR(1),
    IN dga_pif_tv_basic_cable_other                              CHAR(1),
    IN dga_pif_tv_basic_cable_other_description                  VARCHAR(50),
    IN dga_pif_tv_pay_tv                                         CHAR(1),
    IN dga_pif_tv_pay_tv_hbo                                     CHAR(1),
    IN dga_pif_tv_pay_tv_showtime                                CHAR(1),
    IN dga_pif_tv_pay_tv_tmc                                     CHAR(1),
    IN dga_pif_tv_pay_tv_starz                                   CHAR(1),
    IN dga_pif_tv_pay_tv_cinemax                                 CHAR(1),
    IN dga_pif_tv_pay_tv_other                                   CHAR(1),
    IN dga_pif_tv_pay_tv_other_description                       VARCHAR(50),
    IN dga_pif_tv_pilot                                          CHAR(1),
    IN dga_pif_tv_direct_to_video                                CHAR(1),
    IN dga_pif_tv_other                                          CHAR(1),
    IN dga_pif_tv_other_description                              VARCHAR(50),
    IN dga_pif_tv_employee_info_director_name                    VARCHAR(100),
    IN dga_pif_tv_employee_info_1_name                           VARCHAR(100),
    IN dga_pif_tv_employee_info_1_upm                            CHAR(1),
    IN dga_pif_tv_employee_info_1_associate_director             CHAR(1),
    IN dga_pif_tv_employee_info_2_name                           VARCHAR(100),
    IN dga_pif_tv_employee_info_2_first_assistant_director       CHAR(1),
    IN dga_pif_tv_employee_info_2_stage_manager                  CHAR(1),
    IN dga_pif_tv_employee_info_3_name                           VARCHAR(100),
    IN dga_pif_tv_employee_info_3_key_second_assistant_director  CHAR(1),
    IN dga_pif_tv_employee_info_3_second_stage_manager           CHAR(1),
    IN dga_pif_tv_employee_info_4_name                           VARCHAR(100),
    IN dga_pif_tv_employee_info_4_second_assistant_director      CHAR(1),
    IN dga_pif_tv_employee_info_4_third_stage_manager            CHAR(1),
    IN dga_pif_tv_employee_info_5_name                           VARCHAR(100),
    IN dga_pif_tv_employee_info_5_add_second_assistant_director  CHAR(1),
    IN dga_pif_tv_employee_info_5_production_associate           CHAR(1),
    IN dga_pif_tv_employee_info_6_name                           VARCHAR(100),
    IN dga_pif_tv_employee_info_6_associate_director             CHAR(1),
    IN dga_pif_tv_employee_info_7_name                           VARCHAR(100),
    IN dga_pif_tv_employee_info_7_associate_director_line_cut    CHAR(1),
    IN dga_pif_tv_employee_info_other_description                VARCHAR(50),
    IN dga_pif_tv_affiliations_sav                               CHAR(1),
    IN dga_pif_tv_affiliations_wga                               CHAR(1),
    IN dga_pif_tv_affiliations_dcg                               CHAR(1),
    IN dga_pif_tv_affiliations_aftra                             CHAR(1),
    IN dga_pif_tv_affiliations_iatse                             CHAR(1),
    IN dga_pif_tv_affiliations_nabet                             CHAR(1),
    IN dga_pif_tv_affiliations_afm                               CHAR(1),
    IN dga_pif_tv_affiliations_actra                             CHAR(1),
    IN dga_pif_tv_affiliations_other                             CHAR(1),
    IN dga_pif_tv_affiliations_other_description                 VARCHAR(50),
    IN dga_pif_tv_employment_contact_name                        VARCHAR(100),
    IN dga_pif_tv_employment_contacr_phone                       VARCHAR(20),
    IN dga_pif_tv_residuals_contact_name                         VARCHAR(100),
    IN dga_pif_tv_residuals_contacr_phone                        VARCHAR(20),
    IN dga_pif_tv_primary_finance_source                         VARCHAR(100),
    IN dga_pif_tv_primary_finance_contact                        VARCHAR(100),
    IN dga_pif_tv_primary_finance_phone                          VARCHAR(20),
    IN dga_pif_tv_completion_bond_company                        VARCHAR(100),
    IN dga_pif_tv_completion_bond_contact                        VARCHAR(100),
    IN dga_pif_tv_completion_bond_phone                          VARCHAR(20),
    IN dga_pif_tv_payroll_company                                VARCHAR(100),
    IN dga_pif_tv_payroll_contact                                VARCHAR(100),
    IN dga_pif_tv_payroll_phone                                  VARCHAR(20),
    IN dga_pif_tv_credit_line                                    CHAR(1),
    IN dga_pif_tv_credit_line_bank                               VARCHAR(100),
    IN dga_pif_tv_credit_line_contact                            VARCHAR(100),
    IN dga_pif_tv_credit_line_phone                              VARCHAR(20),
    IN dga_pif_tv_foreign_distribuitors                          VARCHAR(255),
    IN dga_pif_tv_domestic_distribuitors                         VARCHAR(255),
    IN dga_pif_tv_signature                                      VARCHAR(100),
    IN dga_pif_tv_signature_title                                VARCHAR(100),
    IN dga_pif_tv_signature_print_name                           VARCHAR(100),
    IN dga_pif_tv_signature_phone                                VARCHAR(20),
    IN dga_pif_tv_signature_date                                 DATE,
    IN dga_pif_tv_created_by                                     VARCHAR(30),
    IN dga_pif_tv_updated_by                                     VARCHAR(30),
    IN dga_pif_tv_status                                         VARCHAR(30),
    OUT return_value                                             INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_pif_tv
     WHERE id = dga_pif_tv_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_pif_tv
        (
            company_id,
            contact_id,
            production_id,
            copyright_holder,
            copyright_holder_name,
            copyright_holder_phone,
            writers,
            budget,
            locations,
            date_pre_production,
            date_principal_photography,
            date_wrap,
            format_multi_camera,
            format_single_camera,
            produced_digital,
            produced_film,
            produced_tape,
            produced_live,
            produced_other,
            produced_other_description,
            program_type_dramatic,
            program_type_sitcom,
            program_type_reality,
            program_type_variety,
            program_type_other,
            program_type_other_description,
            program_length_30,
            program_length_60,
            program_length_90,
            program_length_120,
            program_length_other,
            program_length_other_description,
            network,
            network_abc,
            network_cbs,
            network_fox,
            network_nbc,
            network_pbs,
            network_upn,
            network_wb,
            network_syndication,
            network_syndication_description,
            basic_cable,
            basic_cable_a_and_e,
            basic_cable_disney,
            basic_cable_lifetime,
            basic_cable_mtv,
            basic_cable_nickelodeon,
            basic_cable_tnt,
            basic_cable_usa,
            basic_cable_other,
            basic_cable_other_description,
            pay_tv,
            pay_tv_hbo,
            pay_tv_showtime,
            pay_tv_tmc,
            pay_tv_starz,
            pay_tv_cinemax,
            pay_tv_other,
            pay_tv_other_description,
            pilot,
            direct_to_video,
            other,
            other_description,
            employee_info_director_name,
            employee_info_1_name,
            employee_info_1_upm,
            employee_info_1_associate_director,
            employee_info_2_name,
            employee_info_2_first_assistant_director,
            employee_info_2_stage_manager,
            employee_info_3_name,
            employee_info_3_key_second_assistant_director,
            employee_info_3_second_stage_manager,
            employee_info_4_name,
            employee_info_4_second_assistant_director,
            employee_info_4_third_stage_manager,
            employee_info_5_name,
            employee_info_5_add_second_assistant_director,
            employee_info_5_production_associate,
            employee_info_6_name,
            employee_info_6_associate_director,
            employee_info_7_name,
            employee_info_7_associate_director_line_cut,
            employee_info_other_description,
            affiliations_sav,
            affiliations_wga,
            affiliations_dcg,
            affiliations_aftra,
            affiliations_iatse,
            affiliations_nabet,
            affiliations_afm,
            affiliations_actra,
            affiliations_other,
            affiliations_other_description,
            employment_contact_name,
            employment_contacr_phone,
            residuals_contact_name,
            residuals_contacr_phone,
            primary_finance_source,
            primary_finance_contact,
            primary_finance_phone,
            completion_bond_company,
            completion_bond_contact,
            completion_bond_phone,
            payroll_company,
            payroll_contact,
            payroll_phone,
            credit_line,
            credit_line_bank,
            credit_line_contact,
            credit_line_phone,
            foreign_distribuitors,
            domestic_distribuitors,
            signature,
            signature_title,
            signature_print_name,
            signature_phone,
            signature_date,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_pif_tv_company_id,
            dga_pif_tv_contact_id,
            dga_pif_tv_production_id,
            dga_pif_tv_copyright_holder,
            dga_pif_tv_copyright_holder_name,
            dga_pif_tv_copyright_holder_phone,
            dga_pif_tv_writers,
            dga_pif_tv_budget,
            dga_pif_tv_locations,
            dga_pif_tv_date_pre_production,
            dga_pif_tv_date_principal_photography,
            dga_pif_tv_date_wrap,
            dga_pif_tv_format_multi_camera,
            dga_pif_tv_format_single_camera,
            dga_pif_tv_produced_digital,
            dga_pif_tv_produced_film,
            dga_pif_tv_produced_tape,
            dga_pif_tv_produced_live,
            dga_pif_tv_produced_other,
            dga_pif_tv_produced_other_description,
            dga_pif_tv_program_type_dramatic,
            dga_pif_tv_program_type_sitcom,
            dga_pif_tv_program_type_reality,
            dga_pif_tv_program_type_variety,
            dga_pif_tv_program_type_other,
            dga_pif_tv_program_type_other_description,
            dga_pif_tv_program_length_30,
            dga_pif_tv_program_length_60,
            dga_pif_tv_program_length_90,
            dga_pif_tv_program_length_120,
            dga_pif_tv_program_length_other,
            dga_pif_tv_program_length_other_description,
            dga_pif_tv_network,
            dga_pif_tv_network_abc,
            dga_pif_tv_network_cbs,
            dga_pif_tv_network_fox,
            dga_pif_tv_network_nbc,
            dga_pif_tv_network_pbs,
            dga_pif_tv_network_upn,
            dga_pif_tv_network_wb,
            dga_pif_tv_network_syndication,
            dga_pif_tv_network_syndication_description,
            dga_pif_tv_basic_cable,
            dga_pif_tv_basic_cable_a_and_e,
            dga_pif_tv_basic_cable_disney,
            dga_pif_tv_basic_cable_lifetime,
            dga_pif_tv_basic_cable_mtv,
            dga_pif_tv_basic_cable_nickelodeon,
            dga_pif_tv_basic_cable_tnt,
            dga_pif_tv_basic_cable_usa,
            dga_pif_tv_basic_cable_other,
            dga_pif_tv_basic_cable_other_description,
            dga_pif_tv_pay_tv,
            dga_pif_tv_pay_tv_hbo,
            dga_pif_tv_pay_tv_showtime,
            dga_pif_tv_pay_tv_tmc,
            dga_pif_tv_pay_tv_starz,
            dga_pif_tv_pay_tv_cinemax,
            dga_pif_tv_pay_tv_other,
            dga_pif_tv_pay_tv_other_description,
            dga_pif_tv_pilot,
            dga_pif_tv_direct_to_video,
            dga_pif_tv_other,
            dga_pif_tv_other_description,
            dga_pif_tv_employee_info_director_name,
            dga_pif_tv_employee_info_1_name,
            dga_pif_tv_employee_info_1_upm,
            dga_pif_tv_employee_info_1_associate_director,
            dga_pif_tv_employee_info_2_name,
            dga_pif_tv_employee_info_2_first_assistant_director,
            dga_pif_tv_employee_info_2_stage_manager,
            dga_pif_tv_employee_info_3_name,
            dga_pif_tv_employee_info_3_key_second_assistant_director,
            dga_pif_tv_employee_info_3_second_stage_manager,
            dga_pif_tv_employee_info_4_name,
            dga_pif_tv_employee_info_4_second_assistant_director,
            dga_pif_tv_employee_info_4_third_stage_manager,
            dga_pif_tv_employee_info_5_name,
            dga_pif_tv_employee_info_5_add_second_assistant_director,
            dga_pif_tv_employee_info_5_production_associate,
            dga_pif_tv_employee_info_6_name,
            dga_pif_tv_employee_info_6_associate_director,
            dga_pif_tv_employee_info_7_name,
            dga_pif_tv_employee_info_7_associate_director_line_cut,
            dga_pif_tv_employee_info_other_description,
            dga_pif_tv_affiliations_sav,
            dga_pif_tv_affiliations_wga,
            dga_pif_tv_affiliations_dcg,
            dga_pif_tv_affiliations_aftra,
            dga_pif_tv_affiliations_iatse,
            dga_pif_tv_affiliations_nabet,
            dga_pif_tv_affiliations_afm,
            dga_pif_tv_affiliations_actra,
            dga_pif_tv_affiliations_other,
            dga_pif_tv_affiliations_other_description,
            dga_pif_tv_employment_contact_name,
            dga_pif_tv_employment_contacr_phone,
            dga_pif_tv_residuals_contact_name,
            dga_pif_tv_residuals_contacr_phone,
            dga_pif_tv_primary_finance_source,
            dga_pif_tv_primary_finance_contact,
            dga_pif_tv_primary_finance_phone,
            dga_pif_tv_completion_bond_company,
            dga_pif_tv_completion_bond_contact,
            dga_pif_tv_completion_bond_phone,
            dga_pif_tv_payroll_company,
            dga_pif_tv_payroll_contact,
            dga_pif_tv_payroll_phone,
            dga_pif_tv_credit_line,
            dga_pif_tv_credit_line_bank,
            dga_pif_tv_credit_line_contact,
            dga_pif_tv_credit_line_phone,
            dga_pif_tv_foreign_distribuitors,
            dga_pif_tv_domestic_distribuitors,
            dga_pif_tv_signature,
            dga_pif_tv_signature_title,
            dga_pif_tv_signature_print_name,
            dga_pif_tv_signature_phone,
            dga_pif_tv_signature_date,
            dga_pif_tv_created_by,
            dga_pif_tv_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_pif_tv
           SET company_id                                    = dga_pif_tv_company_id,
               contact_id                                    = dga_pif_tv_contact_id,
               production_id                                 = dga_pif_tv_production_id,
               copyright_holder                              = dga_pif_tv_copyright_holder,
               copyright_holder_name                         = dga_pif_tv_copyright_holder_name,
               copyright_holder_phone                        = dga_pif_tv_copyright_holder_phone,
               writers                                       = dga_pif_tv_writers,
               budget                                        = dga_pif_tv_budget,
               locations                                     = dga_pif_tv_locations,
               date_pre_production                           = dga_pif_tv_date_pre_production,
               date_principal_photography                    = dga_pif_tv_date_principal_photography,
               date_wrap                                     = dga_pif_tv_date_wrap,
               format_multi_camera                           = dga_pif_tv_format_multi_camera,
               format_single_camera                          = dga_pif_tv_format_single_camera,
               produced_digital                              = dga_pif_tv_produced_digital,
               produced_film                                 = dga_pif_tv_produced_film,
               produced_tape                                 = dga_pif_tv_produced_tape,
               produced_live                                 = dga_pif_tv_produced_live,
               produced_other                                = dga_pif_tv_produced_other,
               produced_other_description                    = dga_pif_tv_produced_other_description,
               program_type_dramatic                         = dga_pif_tv_program_type_dramatic,
               program_type_sitcom                           = dga_pif_tv_program_type_sitcom,
               program_type_reality                          = dga_pif_tv_program_type_reality,
               program_type_variety                          = dga_pif_tv_program_type_variety,
               program_type_other                            = dga_pif_tv_program_type_other,
               program_type_other_description                = dga_pif_tv_program_type_other_description,
               program_length_30                             = dga_pif_tv_program_length_30,
               program_length_60                             = dga_pif_tv_program_length_60,
               program_length_90                             = dga_pif_tv_program_length_90,
               program_length_120                            = dga_pif_tv_program_length_120,
               program_length_other                          = dga_pif_tv_program_length_other,
               program_length_other_description              = dga_pif_tv_program_length_other_description,
               network                                       = dga_pif_tv_network,
               network_abc                                   = dga_pif_tv_network_abc,
               network_cbs                                   = dga_pif_tv_network_cbs,
               network_fox                                   = dga_pif_tv_network_fox,
               network_nbc                                   = dga_pif_tv_network_nbc,
               network_pbs                                   = dga_pif_tv_network_pbs,
               network_upn                                   = dga_pif_tv_network_upn,
               network_wb                                    = dga_pif_tv_network_wb,
               network_syndication                           = dga_pif_tv_network_syndication,
               network_syndication_description               = dga_pif_tv_network_syndication_description,
               basic_cable                                   = dga_pif_tv_basic_cable,
               basic_cable_a_and_e                           = dga_pif_tv_basic_cable_a_and_e,
               basic_cable_disney                            = dga_pif_tv_basic_cable_disney,
               basic_cable_lifetime                          = dga_pif_tv_basic_cable_lifetime,
               basic_cable_mtv                               = dga_pif_tv_basic_cable_mtv,
               basic_cable_nickelodeon                       = dga_pif_tv_basic_cable_nickelodeon,
               basic_cable_tnt                               = dga_pif_tv_basic_cable_tnt,
               basic_cable_usa                               = dga_pif_tv_basic_cable_usa,
               basic_cable_other                             = dga_pif_tv_basic_cable_other,
               basic_cable_other_description                 = dga_pif_tv_basic_cable_other_description,
               pay_tv                                        = dga_pif_tv_pay_tv,
               pay_tv_hbo                                    = dga_pif_tv_pay_tv_hbo,
               pay_tv_showtime                               = dga_pif_tv_pay_tv_showtime,
               pay_tv_tmc                                    = dga_pif_tv_pay_tv_tmc,
               pay_tv_starz                                  = dga_pif_tv_pay_tv_starz,
               pay_tv_cinemax                                = dga_pif_tv_pay_tv_cinemax,
               pay_tv_other                                  = dga_pif_tv_pay_tv_other,
               pay_tv_other_description                      = dga_pif_tv_pay_tv_other_description,
               pilot                                         = dga_pif_tv_pilot,
               direct_to_video                               = dga_pif_tv_direct_to_video,
               other                                         = dga_pif_tv_other,
               other_description                             = dga_pif_tv_other_description,
               employee_info_director_name                   = dga_pif_tv_employee_info_director_name,
               employee_info_1_name                          = dga_pif_tv_employee_info_1_name,
               employee_info_1_upm                           = dga_pif_tv_employee_info_1_upm,
               employee_info_1_associate_director            = dga_pif_tv_employee_info_1_associate_director,
               employee_info_2_name                          = dga_pif_tv_employee_info_2_name,
               employee_info_2_first_assistant_director      = dga_pif_tv_employee_info_2_first_assistant_director,
               employee_info_2_stage_manager                 = dga_pif_tv_employee_info_2_stage_manager,
               employee_info_3_name                          = dga_pif_tv_employee_info_3_name,
               employee_info_3_key_second_assistant_director = dga_pif_tv_employee_info_3_key_second_assistant_director,
               employee_info_3_second_stage_manager          = dga_pif_tv_employee_info_3_second_stage_manager,
               employee_info_4_name                          = dga_pif_tv_employee_info_4_name,
               employee_info_4_second_assistant_director     = dga_pif_tv_employee_info_4_second_assistant_director,
               employee_info_4_third_stage_manager           = dga_pif_tv_employee_info_4_third_stage_manager,
               employee_info_5_name                          = dga_pif_tv_employee_info_5_name,
               employee_info_5_add_second_assistant_director = dga_pif_tv_employee_info_5_add_second_assistant_director,
               employee_info_5_production_associate          = dga_pif_tv_employee_info_5_production_associate,
               employee_info_6_name                          = dga_pif_tv_employee_info_6_name,
               employee_info_6_associate_director            = dga_pif_tv_employee_info_6_associate_director,
               employee_info_7_name                          = dga_pif_tv_employee_info_7_name,
               employee_info_7_associate_director_line_cut   = dga_pif_tv_employee_info_7_associate_director_line_cut,
               employee_info_other_description               = dga_pif_tv_employee_info_other_description,
               affiliations_sav                              = dga_pif_tv_affiliations_sav,
               affiliations_wga                              = dga_pif_tv_affiliations_wga,
               affiliations_dcg                              = dga_pif_tv_affiliations_dcg,
               affiliations_aftra                            = dga_pif_tv_affiliations_aftra,
               affiliations_iatse                            = dga_pif_tv_affiliations_iatse,
               affiliations_nabet                            = dga_pif_tv_affiliations_nabet,
               affiliations_afm                              = dga_pif_tv_affiliations_afm,
               affiliations_actra                            = dga_pif_tv_affiliations_actra,
               affiliations_other                            = dga_pif_tv_affiliations_other,
               affiliations_other_description                = dga_pif_tv_affiliations_other_description,
               employment_contact_name                       = dga_pif_tv_employment_contact_name,
               employment_contacr_phone                      = dga_pif_tv_employment_contacr_phone,
               residuals_contact_name                        = dga_pif_tv_residuals_contact_name,
               residuals_contacr_phone                       = dga_pif_tv_residuals_contacr_phone,
               primary_finance_source                        = dga_pif_tv_primary_finance_source,
               primary_finance_contact                       = dga_pif_tv_primary_finance_contact,
               primary_finance_phone                         = dga_pif_tv_primary_finance_phone,
               completion_bond_company                       = dga_pif_tv_completion_bond_company,
               completion_bond_contact                       = dga_pif_tv_completion_bond_contact,
               completion_bond_phone                         = dga_pif_tv_completion_bond_phone,
               payroll_company                               = dga_pif_tv_payroll_company,
               payroll_contact                               = dga_pif_tv_payroll_contact,
               payroll_phone                                 = dga_pif_tv_payroll_phone,
               credit_line                                   = dga_pif_tv_credit_line,
               credit_line_bank                              = dga_pif_tv_credit_line_bank,
               credit_line_contact                           = dga_pif_tv_credit_line_contact,
               credit_line_phone                             = dga_pif_tv_credit_line_phone,
               foreign_distribuitors                         = dga_pif_tv_foreign_distribuitors,
               domestic_distribuitors                        = dga_pif_tv_domestic_distribuitors,
               signature                                     = dga_pif_tv_signature,
               signature_title                               = dga_pif_tv_signature_title,
               signature_print_name                          = dga_pif_tv_signature_print_name,
               signature_phone                               = dga_pif_tv_signature_phone,
               signature_date                                = dga_pif_tv_signature_date,
               created_by                                    = dga_pif_tv_created_by,
               updated_by                                    = dga_pif_tv_updated_by,
               status                                        = "UPDATED"
         WHERE id                                            = dga_pif_tv_id;
        SET return_value = dga_pif_tv_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_pif_tv_company_set_list(
    IN dga_pif_tv_company_id              INT,
    IN dga_pif_tv_company_dga_pif_tv_id   INT,
    IN dga_pif_tv_company_company_name    VARCHAR(50),
    IN dga_pif_tv_company_company_phone   VARCHAR(20),
    IN dga_pif_tv_company_created_by      VARCHAR(30),
    IN dga_pif_tv_company_updated_by      VARCHAR(30),
    OUT return_value                      INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_pif_tv_company
     WHERE id = dga_pif_tv_company_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_pif_tv_company
        (
            dga_pif_tv_id,
            company_name,
            company_phone,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_pif_tv_company_dga_pif_tv_id,
            dga_pif_tv_company_company_name,
            dga_pif_tv_company_company_phone,
            dga_pif_tv_company_created_by,
            dga_pif_tv_company_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_pif_tv_company
           SET dga_pif_tv_id = dga_pif_tv_company_dga_pif_tv_id,
               company_name  = dga_pif_tv_company_company_name,
               company_phone = dga_pif_tv_company_company_phone,
               created_by    = dga_pif_tv_company_created_by,
               updated_by    = dga_pif_tv_company_updated_by,
               status        = 'UPDATED'
         WHERE id            =  dga_pif_tv_company_id;

        SET return_value = dga_pif_tv_company_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_pif_tv_set_closed(
    IN dga_pif_tv_id          INTEGER,
    IN dga_pif_tv_updated_by  VARCHAR(30)
)
BEGIN

    UPDATE dga_pif_tv
       SET status     = 'CLOSED',
           updated_by = dga_pif_tv_updated_by
     WHERE id = dga_pif_tv_id;
     COMMIT;

     UPDATE dga_pif_tv_company
       SET status     = 'CLOSED',
           updated_by = dga_pif_tv_updated_by
     WHERE dga_pif_tv_id = dga_pif_tv_id
       AND status != 'DELETED';
     COMMIT;

END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_work_list_set_list(
    IN  wga_work_list_id                INT,
    IN  wga_work_list_company_id        INT,
    IN  wga_work_list_week_ending       INT,
    IN  wga_work_list_contact_id        INT,
    IN  wga_work_list_created_by        VARCHAR(30),
    IN  wga_work_list_updated_by        VARCHAR(30),
    OUT return_value                    INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_work_list
     WHERE id = wga_work_list_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_work_list
        (
            company_id,
            week_ending,
            contact_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_work_list_company_id,
            wga_work_list_week_ending,
            wga_work_list_contact_id,
            wga_work_list_created_by,
            wga_work_list_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_work_list
           SET company_id     = wga_work_list_company_id,
               week_ending    = wga_work_list_week_ending,
               contact_id     = wga_work_list_contact_id,
               created_by     = wga_work_list_created_by,
               updated_by     = wga_work_list_updated_by,
               status         = 'UPDATED'
         WHERE id             = wga_work_list_id;

         SET return_value = wga_work_list_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_deal_type_set_list(
    IN wga_deal_type_id          INT,
    IN wga_deal_type_code        CHAR(2),
    IN wga_deal_type_title       VARCHAR(30),
    IN wga_deal_type_created_by  VARCHAR(30),
    IN wga_deal_type_updated_by  VARCHAR(30),
    IN wga_deal_type_status      VARCHAR(30),
    OUT return_value             INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_deal_type
     WHERE id = wga_deal_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_deal_type
        (
            code,
            title,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_deal_type_code,
            wga_deal_type_title,
            wga_deal_type_created,
            wga_deal_type_created_by,
            wga_deal_type_updated,
            wga_deal_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_deal_type
           SET code       = wga_deal_type_code,
               title      = wga_deal_type_title,
               created    = wga_deal_type_created,
               created_by = wga_deal_type_created_by,
               updated    = wga_deal_type_updated,
               updated_by = wga_deal_type_updated_by,
               status     = 'UPDATED'
         WHERE id         = wga_deal_type_id;
        SET return_value = wga_deal_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_work_list_set_closed(
    IN wga_work_list_id                INT,
    IN wga_work_list_updated_by        VARCHAR(30)
)
BEGIN

    UPDATE wga_work_list
       SET updated_by     = wga_work_list_updated_by,
           status         = 'CLOSED'
     WHERE id             = wga_work_list_id;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_work_list_item_set_list(
    IN wga_work_list_item_id                  INT,
    IN wga_work_list_item_wga_work_list_id    INT,
    IN wga_work_list_item_contact_id          INT,
    IN wga_work_list_item_episode_id          INT,
    IN wga_work_list_item_deal_type_id        INT,
    IN wga_work_list_item_field_of_work_id    INT,
    IN wga_work_list_item_date_start          DATE,
    IN wga_work_list_item_date_end            DATE,
    IN wga_work_list_item_additional_data     VARCHAR(100),
    IN wga_work_list_item_created_by          VARCHAR(30),
    IN wga_work_list_item_updated_by          VARCHAR(30),
    IN wga_work_list_item_status              VARCHAR(30),
    OUT return_value                          INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_work_list_item
     WHERE id = wga_work_list_item_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_work_list_item
        (
            wga_work_list_id,
            contact_id,
            episode_id,
            deal_type_id,
            field_of_work_id,
            date_start,
            date_end,
            additional_data,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_work_list_item_wga_work_list_id,
            wga_work_list_item_contact_id,
            wga_work_list_item_episode_id,
            wga_work_list_item_deal_type_id,
            wga_work_list_item_field_of_work_id,
            wga_work_list_item_date_start,
            wga_work_list_item_date_end,
            wga_work_list_item_additional_data,
            wga_work_list_item_created_by,
            wga_work_list_item_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_work_list_item
           SET wga_work_list_id   = wga_work_list_item_wga_work_list_id,
               contact_id         = wga_work_list_item_contact_id,
               episode_id         = wga_work_list_item_episode_id,
               deal_type_id       = wga_work_list_item_deal_type_id,
               field_of_work_id   = wga_work_list_item_field_of_work_id,
               date_start         = wga_work_list_item_date_start,
               date_end           = wga_work_list_item_date_end,
               additional_data    = wga_work_list_item_additional_data,
               created_by         = wga_work_list_item_created_by,
               updated_by         = wga_work_list_item_updated_by,
               status             = 'UPDATED'
         WHERE id                 = wga_work_list_item_id;

        SET return_value = wga_work_list_item_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_ntwc_set_list(
    IN wga_ntwc_id                                     INT,
    IN wga_ntwc_date                                   DATE,
    IN wga_ntwc_production_id                          INT,
    IN wga_ntwc_production_number                      VARCHAR(30),
    IN wga_ntwc_episode_id                             INT,
    IN wga_ntwc_pilot                                  CHAR(1),
    IN wga_ntwc_pilot_network_id                       INT,
    IN wga_ntwc_pilot_production_lenght_id             INT,
    IN wga_ntwc_executive_producer_contact_id          INT,
    IN wga_ntwc_director_contact_id                    INT,
    IN wga_ntwc_story_editor_contact_id                INT,
    IN wga_ntwc_other_executive_producer_contact_id    INT,
    IN wga_ntwc_producer_contact_id                    INT,
    IN wga_ntwc_supervising_producer_contact_id        INT,
    IN wga_ntwc_sent_to_writers                        DATE,
    IN wga_ntwc_protest_communicated                   DATE,
    IN wga_ntwc_by_contact_id                          INT,
    IN wga_ntwc_created_by                             VARCHAR(30),
    IN wga_ntwc_updated_by                             VARCHAR(30),
    IN wga_ntwc_status                                 VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_ntwc
     WHERE id = wga_ntwc_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_ntwc
        (
            date,
            production_id,
            production_number,
            episode_id,
            pilot,
            pilot_network_id,
            pilot_production_lenght_id,
            executive_producer_contact_id,
            director_contact_id,
            story_editor_contact_id,
            other_executive_producer_contact_id,
            producer_contact_id,
            supervising_producer_contact_id,
            sent_to_writers,
            protest_communicated,
            by_contact_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_ntwc_date,
            wga_ntwc_production_id,
            wga_ntwc_production_number,
            wga_ntwc_episode_id,
            wga_ntwc_pilot,
            wga_ntwc_pilot_network_id,
            wga_ntwc_pilot_production_lenght_id,
            wga_ntwc_executive_producer_contact_id,
            wga_ntwc_director_contact_id,
            wga_ntwc_story_editor_contact_id,
            wga_ntwc_other_executive_producer_contact_id,
            wga_ntwc_producer_contact_id,
            wga_ntwc_supervising_producer_contact_id,
            wga_ntwc_sent_to_writers,
            wga_ntwc_protest_communicated,
            wga_ntwc_by_contact_id,
            wga_ntwc_created_by,
            wga_ntwc_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_ntwc
           SET date                                = wga_ntwc_date,
               production_id                       = wga_ntwc_production_id,
               production_number                   = wga_ntwc_production_number,
               episode_id                          = wga_ntwc_episode_id,
               pilot                               = wga_ntwc_pilot,
               pilot_network_id                    = wga_ntwc_pilot_network_id,
               pilot_production_lenght_id          = wga_ntwc_pilot_production_lenght_id,
               executive_producer_contact_id       = wga_ntwc_executive_producer_contact_id,
               director_contact_id                 = wga_ntwc_director_contact_id,
               story_editor_contact_id             = wga_ntwc_story_editor_contact_id,
               other_executive_producer_contact_id = wga_ntwc_other_executive_producer_contact_id,
               producer_contact_id                 = wga_ntwc_producer_contact_id,
               supervising_producer_contact_id     = wga_ntwc_supervising_producer_contact_id,
               sent_to_writers                     = wga_ntwc_sent_to_writers,
               protest_communicated                = wga_ntwc_protest_communicated,
               by_contact_id                       = wga_ntwc_by_contact_id,
               created                             = wga_ntwc_created,
               created_by                          = wga_ntwc_created_by,
               updated                             = wga_ntwc_updated,
               updated_by                          = wga_ntwc_updated_by,
               status                              = 'UPDATED'
         WHERE id                                  = wga_ntwc_id;

        SET return_value = wga_ntwc_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_ntwc_participant_writer_set_list(
    IN wga_ntwc_participant_writer_wga_ntwc_id    INT,
    IN wga_ntwc_participant_writer_contact_id     INT,
    IN wga_ntwc_participant_writer_created_by     VARCHAR(30),
    IN wga_ntwc_participant_writer_updated_by     VARCHAR(30),
    IN wga_ntwc_participant_writer_status         VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN

    INSERT INTO wga_ntwc_participant_writer
    (
        wga_ntwc_id,
        contact_id,
        created_by,
        updated_by,
        status
    )
    VALUES
    (
        wga_ntwc_participant_writer_wga_ntwc_id,
        wga_ntwc_participant_writer_contact_id,
        wga_ntwc_participant_writer_created_by,
        wga_ntwc_participant_writer_updated_by,
        'CREATED'
    );

    SET return_value = 1;

    COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_ntwc_participant_writer_delete(
    IN wga_ntwc_participant_writer_wga_ntwc_id    INT,
    IN wga_ntwc_participant_writer_contact_id     INT,
    OUT return_value            INTEGER
)
BEGIN

    DELETE
      FROM wga_ntwc_participant_writer
     WHERE wga_ntwc_id = wga_ntwc_participant_writer_wga_ntwc_id
       AND contact_id  = wga_ntwc_participant_writer_contact_id;

    SET return_value = 0;

    COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_ntwc_writing_credit_set_list(
    IN wga_ntwc_writing_credit_wga_ntwc_id    INT,
    IN wga_ntwc_writing_credit_contact_id     INT,
    IN wga_ntwc_writing_credit_created_by     VARCHAR(30),
    IN wga_ntwc_writing_credit_updated_by     VARCHAR(30),
    IN wga_ntwc_writing_credit_status         VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN

    INSERT INTO wga_ntwc_writing_credit
    (
        wga_ntwc_id,
        contact_id,
        created_by,
        updated_by,
        status
    )
    VALUES
    (
        wga_ntwc_writing_credit_wga_ntwc_id,
        wga_ntwc_writing_credit_contact_id,
        wga_ntwc_writing_credit_created_by,
        wga_ntwc_writing_credit_updated_by,
        'CREATED'
    );

    SET return_value = 1;

    COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_ntwc_writing_credit_delete(
    IN wga_ntwc_writing_credit_wga_ntwc_id    INT,
    IN wga_ntwc_writing_credit_contact_id     INT,
    OUT return_value            INTEGER
)
BEGIN

    DELETE
      FROM wga_ntwc_writing_credit
     WHERE wga_ntwc_id = wga_ntwc_writing_credit_wga_ntwc_id
       AND contact_id  = wga_ntwc_writing_credit_contact_id;

    SET return_value = 0;

    COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_ntwc_source_material_episode_set_list(
    IN wga_ntwc_source_material_episode_id             INT,
    IN wga_ntwc_source_material_episode_wga_ntwc_id    INT,
    IN wga_ntwc_source_material_episode_name           VARCHAR(50),
    IN wga_ntwc_source_material_episode_created_by     VARCHAR(30),
    IN wga_ntwc_source_material_episode_updated_by     VARCHAR(30),
    IN wga_ntwc_source_material_episode_status         VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_ntwc_source_material_episode
     WHERE id = wga_ntwc_source_material_episode_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_ntwc_source_material_episode
        (
            wga_ntwc_id,
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_ntwc_source_material_episode_wga_ntwc_id,
            wga_ntwc_source_material_episode_name,
            wga_ntwc_source_material_episode_created_by,
            wga_ntwc_source_material_episode_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_ntwc_source_material_episode
           SET wga_ntwc_id = wga_ntwc_source_material_episode_wga_ntwc_id,
               name        = wga_ntwc_source_material_episode_name,
               created_by  = wga_ntwc_source_material_episode_created_by,
               updated_by  = wga_ntwc_source_material_episode_updated_by,
               status      = 'UPDATED'
         WHERE id          = wga_ntwc_source_material_episode_id;

        SET return_value = wga_ntwc_source_material_episode_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_ntwc_source_material_episode_delete(
    IN  wga_ntwc_source_material_episode_id INTEGER
)
BEGIN
    DELETE
      FROM wga_ntwc_source_material_episode
     WHERE id = wga_ntwc_source_material_episode_id;

    COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_ntwc_source_material_production_set_list(
    IN wga_ntwc_source_material_production_id             INT,
    IN wga_ntwc_source_material_production_wga_ntwc_id    INT,
    IN wga_ntwc_source_material_production_name           VARCHAR(50),
    IN wga_ntwc_source_material_production_created_by     VARCHAR(30),
    IN wga_ntwc_source_material_production_updated_by     VARCHAR(30),
    IN wga_ntwc_source_material_production_status         VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_ntwc_source_material_production
     WHERE id = wga_ntwc_source_material_production_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_ntwc_source_material_production
        (
            wga_ntwc_id,
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_ntwc_source_material_production_wga_ntwc_id,
            wga_ntwc_source_material_production_name,
            wga_ntwc_source_material_production_created_by,
            wga_ntwc_source_material_production_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_ntwc_source_material_production
           SET wga_ntwc_id = wga_ntwc_source_material_production_wga_ntwc_id,
               name        = wga_ntwc_source_material_production_name,
               created_by  = wga_ntwc_source_material_production_created_by,
               updated_by  = wga_ntwc_source_material_production_updated_by,
               status      = 'UPDATED'
         WHERE id          = wga_ntwc_source_material_production_id;

        SET return_value = wga_ntwc_source_material_production_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_ntwc_source_material_production_delete(
    IN  wga_ntwc_source_material_production_id INTEGER
)
BEGIN
    DELETE
      FROM wga_ntwc_source_material_production
     WHERE id = wga_ntwc_source_material_production_id;

    COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE sav_performer_type_set_list(
    IN sav_performer_type_id            INT,
    IN sav_performer_type_code          CHAR(3),
    IN sav_performer_type_title         VARCHAR(50),
    IN sav_performer_type_created_by    VARCHAR(30),
    IN sav_performer_type_updated_by    VARCHAR(30),
    IN sav_performer_type_status        VARCHAR(30),
    OUT return_value                INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM sav_performer_type
     WHERE id = sav_performer_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO sav_performer_type
        (
            code,
            title,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            sav_performer_type_id,
            sav_performer_type_code,
            sav_performer_type_title,
            sav_performer_type_created_by,
            sav_performer_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE sav_performer_type
           SET code       = sav_performer_type_code,
               title      = sav_performer_type_title,
               created_by = sav_performer_type_created_by,
               updated_by = sav_performer_type_updated_by,
               status     = 'UPDATED'
         WHERE id         = sav_performer_type_id;

        SET return_value  = sav_performer_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE sav_production_type_set_list(
    IN sav_production_type_id            INT,
    IN sav_production_type_code          VARCHAR(10),
    IN sav_production_type_title         VARCHAR(50),
    IN sav_production_type_created_by    VARCHAR(30),
    IN sav_production_type_updated_by    VARCHAR(30),
    IN sav_production_type_status        VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM sav_production_type
     WHERE id = sav_production_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO sav_production_type
        (
            code,
            title,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            sav_production_type_code,
            sav_production_type_title,
            sav_production_type_created,
            sav_production_type_created_by,
            sav_production_type_updated,
            sav_production_type_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE sav_production_type
           SET code       = sav_production_type_code,
               title      = sav_production_type_title,
               created_by = sav_production_type_created_by,
               updated_by = sav_production_type_updated_by,
               status     = 'UPDATED'
         WHERE id         = sav_production_type_id;

        SET return_value = sav_production_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE sav_final_cast_list_info_set_list(
    IN sav_final_cast_list_info_id                        INT,
    IN sav_final_cast_list_info_date_filled               DATE,
    IN sav_final_cast_list_info_production_id             INT,
    IN sav_final_cast_list_info_shooting_location         VARCHAR(400),
    IN sav_final_cast_list_info_production_company_id     INT,
    IN sav_final_cast_list_info_start_date                DATE,
    IN sav_final_cast_list_info_end_date                  DATE,
    IN sav_final_cast_list_info_federal_id                VARCHAR(50),
    IN sav_final_cast_list_info_state_id                  VARCHAR(50),
    IN sav_final_cast_list_info_picture_id                VARCHAR(50),
    IN sav_final_cast_list_info_distribuitor_id           VARCHAR(50),
    IN sav_final_cast_list_info_sav_production_type_id    INT,
    IN sav_final_cast_list_info_created_by                VARCHAR(30),
    IN sav_final_cast_list_info_updated_by                VARCHAR(30),
    IN sav_final_cast_list_info_status                    VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM sav_final_cast_list_info
     WHERE id = sav_final_cast_list_info_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO sav_final_cast_list_info
        (
            date_filled,
            production_id,
            shooting_location,
            production_company_id,
            start_date,
            end_date,
            federal_id,
            state_id,
            picture_id,
            distribuitor_id,
            sav_production_type_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            sav_final_cast_list_info_date_filled,
            sav_final_cast_list_info_production_id,
            sav_final_cast_list_info_shooting_location,
            sav_final_cast_list_info_production_company_id,
            sav_final_cast_list_info_start_date,
            sav_final_cast_list_info_end_date,
            sav_final_cast_list_info_federal_id,
            sav_final_cast_list_info_state_id,
            sav_final_cast_list_info_picture_id,
            sav_final_cast_list_info_distribuitor_id,
            sav_final_cast_list_info_sav_production_type_id,
            sav_final_cast_list_info_created_by,
            sav_final_cast_list_info_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE sav_final_cast_list_info
           SET date_filled            = sav_final_cast_list_info_date_filled,
               production_id          = sav_final_cast_list_info_production_id,
               shooting_location      = sav_final_cast_list_info_shooting_location,
               production_company_id  = sav_final_cast_list_info_production_company_id,
               start_date             = sav_final_cast_list_info_start_date,
               end_date               = sav_final_cast_list_info_end_date,
               federal_id             = sav_final_cast_list_info_federal_id,
               state_id               = sav_final_cast_list_info_state_id,
               picture_id             = sav_final_cast_list_info_picture_id,
               distribuitor_id        = sav_final_cast_list_info_distribuitor_id,
               sav_production_type_id = sav_final_cast_list_info_sav_production_type_id,
               created_by             = sav_final_cast_list_info_created_by,
               updated_by             = sav_final_cast_list_info_updated_by,
               status                 = 'UPDATED'
         WHERE id                     = sav_final_cast_list_info_id;

        SET return_value = sav_final_cast_list_info_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE sav_final_cast_list_info_item_set_list(
    IN sav_final_cast_list_info_item_id                             INT,
    IN sav_final_cast_list_info_item_sav_final_cast_list_info_id    INT,
    IN sav_final_cast_list_info_item_production_id                  INT,
    IN sav_final_cast_list_info_item_contact_id                     INT,
    IN sav_final_cast_list_info_item_loan_out_corp                  VARCHAR(50),
    IN sav_final_cast_list_info_item_federal_id                     VARCHAR(30),
    IN sav_final_cast_list_info_item_days_number                    INT,
    IN sav_final_cast_list_info_item_weeks_number                   INT,
    IN sav_final_cast_list_info_item_start_date                     DATE,
    IN sav_final_cast_list_info_item_end_date                       DATE,
    IN sav_final_cast_list_info_item_contract_type                  CHAR(1),
    IN sav_final_cast_list_info_item_sav_performer_type_id          INT,
    IN sav_final_cast_list_info_item_salary_total_gross             DECIMAL,
    IN sav_final_cast_list_info_item_salary_base                    DECIMAL,
    IN sav_final_cast_list_info_item_units_type                     INT,
    IN sav_final_cast_list_info_item_units_salary                   INT,
    IN sav_final_cast_list_info_item_units_total                    INT,
    IN sav_final_cast_list_info_item_created_by                     VARCHAR(30),
    IN sav_final_cast_list_info_item_updated_by                     VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM sav_final_cast_list_info_item
     WHERE id = sav_final_cast_list_info_item_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO sav_final_cast_list_info_item
        (
            sav_final_cast_list_info_id,
            production_id,
            contact_id,
            loan_out_corp,
            federal_id,
            days_number,
            weeks_number,
            start_date,
            end_date,
            contract_type,
            sav_performer_type_id,
            salary_total_gross,
            salary_base,
            units_type,
            units_salary,
            units_total,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            sav_final_cast_list_info_item_sav_final_cast_list_info_id,
            sav_final_cast_list_info_item_production_id,
            sav_final_cast_list_info_item_contact_id,
            sav_final_cast_list_info_item_loan_out_corp,
            sav_final_cast_list_info_item_federal_id,
            sav_final_cast_list_info_item_days_number,
            sav_final_cast_list_info_item_weeks_number,
            sav_final_cast_list_info_item_start_date,
            sav_final_cast_list_info_item_end_date,
            sav_final_cast_list_info_item_contract_type,
            sav_final_cast_list_info_item_sav_performer_type_id,
            sav_final_cast_list_info_item_salary_total_gross,
            sav_final_cast_list_info_item_salary_base,
            sav_final_cast_list_info_item_units_type,
            sav_final_cast_list_info_item_units_salary,
            sav_final_cast_list_info_item_units_total,
            sav_final_cast_list_info_item_created_by,
            sav_final_cast_list_info_item_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE sav_final_cast_list_info_item
           SET sav_final_cast_list_info_id = sav_final_cast_list_info_item_sav_final_cast_list_info_id,
               production_id               = sav_final_cast_list_info_item_production_id,
               contact_id                  = sav_final_cast_list_info_item_contact_id,
               loan_out_corp               = sav_final_cast_list_info_item_loan_out_corp,
               federal_id                  = sav_final_cast_list_info_item_federal_id,
               days_number                 = sav_final_cast_list_info_item_days_number,
               weeks_number                = sav_final_cast_list_info_item_weeks_number,
               start_date                  = sav_final_cast_list_info_item_start_date,
               end_date                    = sav_final_cast_list_info_item_end_date,
               contract_type               = sav_final_cast_list_info_item_contract_type,
               sav_performer_type_id       = sav_final_cast_list_info_item_sav_performer_type_id,
               salary_total_gross          = sav_final_cast_list_info_item_salary_total_gross,
               salary_base                 = sav_final_cast_list_info_item_salary_base,
               units_type                  = sav_final_cast_list_info_item_units_type,
               units_salary                = sav_final_cast_list_info_item_units_salary,
               units_total                 = sav_final_cast_list_info_item_units_total,
               created_by                  = sav_final_cast_list_info_item_created_by,
               updated_by                  = sav_final_cast_list_info_item_updated_by,
               status                      = 'UPDATED'
         WHERE id                 =    sav_final_cast_list_info_item_id;
        SET return_value = sav_final_cast_list_info_item_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE sav_role_set_list(
    IN sav_role_id            INT,
    IN sav_role_code          CHAR(10),
    IN sav_role_title         VARCHAR(50),
    IN sav_role_created_by    VARCHAR(30),
    IN sav_role_updated_by    VARCHAR(30),
    OUT return_value          INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM sav_role
     WHERE id = sav_role_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO sav_role
        (
            code,
            title,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            sav_role_code,
            sav_role_title,
            sav_role_created_by,
            sav_role_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE sav_role
           SET code       = sav_role_code,
               title      = sav_role_title,
               created_by = sav_role_created_by,
               updated_by = sav_role_updated_by,
               status     = 'UPDATED'
         WHERE id                 =    sav_role_id;
        SET return_value = sav_role_id;
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


-- INSERT INTO deal_type
-- (abreviation, name, created_by, updated_by, status)
-- VALUES
-- ('FD', 'Flat Deal',                 'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('ST', 'Staff',                     'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('SL', 'Sale of Literary Material', 'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('OP', 'Option',                    'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('',   'Unknown',                   'RKAMMER', 'RKAMMER', 'CREATED');


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

-- INSERT INTO dga_quarter
-- (name, description, created_by, updated_by, status)
-- VALUES
-- ('1st', 'First Quarter',   'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('2nd', 'Second Quarter',  'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('3rd', 'Third  Quarter',  'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('4st', 'Fourth Quarter',  'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO contact
(first_name, middle_name, last_name, suffix, address, city, state_code, phone, email, website, picture_path, created_by, updated_by, status)
VALUES
('James',     'J.', 'Zavala',    '',    '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Lois',      'L.', 'Mera',      'Jr.', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_two@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Nina',      '',   'Blanchard', '',    '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_three@level.com', NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Blanchard', 'J.', 'Layman',    'Sr.', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_for@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO company_contact
(company_id, contact_id, created_by, updated_by, status)
VALUES
(1, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(1, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(1, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(1, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4, 3, 'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO period
(name, period, plural, created_by, updated_by, status)
VALUES
('day',   'daily',   'days',   'RKAMMER', 'RKAMMER', 'CREATED'),
('week',  'weekly',  'weeks',  'RKAMMER', 'RKAMMER', 'CREATED'),
('month', 'monthly', 'months', 'RKAMMER', 'RKAMMER', 'CREATED'),
('year',  'yearly',  'years',  'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO media_type
(name, created_by, updated_by, status)
VALUES
('Network or FBC', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Non-Network',    'RKAMMER', 'RKAMMER', 'CREATED'),
('Basic Cable',    'RKAMMER', 'RKAMMER', 'CREATED'),
('Pay TV',         'RKAMMER', 'RKAMMER', 'CREATED'),
('Videodisc/Videocassete', 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO wga_deal_type
(code, title, created_by, updated_by, status)
VALUES
('FD', 'Flat Deal',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('ST', 'Staff',                     'RKAMMER', 'RKAMMER', 'CREATED'),
('SL', 'Sale of Literary Material', 'RKAMMER', 'RKAMMER', 'CREATED'),
('OP', 'Option',                    'RKAMMER', 'RKAMMER', 'CREATED'),
(NULL, 'Unknown',                   'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO wga_field_of_work
(code, title, created_by, updated_by, status)
VALUES
('S',  'Screen',                'RKAMMER', 'RKAMMER', 'CREATED'),
('T',  'Television',            'RKAMMER', 'RKAMMER', 'CREATED'),
('R',  'Radio',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('Z',  'TV News/Promo',         'RKAMMER', 'RKAMMER', 'CREATED'),
('P',  'Pay TV/VD/VC',          'RKAMMER', 'RKAMMER', 'CREATED'),
('W',  'New Media',             'RKAMMER', 'RKAMMER', 'CREATED'),
('A',  'Animation Television',  'RKAMMER', 'RKAMMER', 'CREATED'),
('B',  'Animation Screen',      'RKAMMER', 'RKAMMER', 'CREATED'),
('I',  'Informational',         'RKAMMER', 'RKAMMER', 'CREATED'),
('N',  'Interactive',           'RKAMMER', 'RKAMMER', 'CREATED'),
(NULL, 'Unknown',               'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO guild
(acronym, name, created_by, updated_by, status)
VALUES
('SAG-AFTRA', 'Screen Actors Guild‐American Federation of Television and Radio Artists', 'RKAMMER', 'RKAMMER', 'CREATED'),
('WGA',       'Writers Guild of America',                                                'RKAMMER', 'RKAMMER', 'CREATED'),
('IATSE',     'The International Alliance of Theatrical Stage Employees',                'RKAMMER', 'RKAMMER', 'CREATED'),
('AFM',       'American Federations of Musicians',                                       'RKAMMER', 'RKAMMER', 'CREATED'),
('Teamsters', 'Teamsters',                                                               'RKAMMER', 'RKAMMER', 'CREATED'),
('DGA',       'Directors Guild of America',                                              'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO user
(user_name, email, first_name, middle_name, last_name, suffix, address, city, state_code, phone, website, picture_path, created_by, updated_by, status)
VALUES
('RKAMMER', 'rodrigo@ccsitconsultants.com', 'Rodrigo', NULL, 'Kammer', NULL, '821, Paseo Camarillo', 'Camarillo', 'CA', '805 405 8071', NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO contact_role
(name, created_by, updated_by, status)
VALUES
('Finance',        'RKAMMER', 'RKAMMER', 'CREATED'),
('Business Legal', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Production',     'RKAMMER', 'RKAMMER', 'CREATED'),
('Labor',          'RKAMMER', 'RKAMMER', 'CREATED'),
('Residuals',      'RKAMMER', 'RKAMMER', 'CREATED'),
('Third Party',    'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO production_stage
(name, created_by, updated_by, status)
VALUES
('Pre-Production',  'RKAMMER', 'RKAMMER', 'CREATED'),
('Production',      'RKAMMER', 'RKAMMER', 'CREATED'),
('Post-Production', 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO business_group
(name, company_id, created_by, updated_by, status)
VALUES
('Global Enterteniment Group', 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Business Unit One',          1, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Business Unit Two',          1, 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO sav_performer_type
(code, title, created_by, updated_by, status)
VALUES
('A',   'Actor',                          'RKAMMER', 'RKAMMER', 'CREATED'),
('ST',  'Stunt',                          'RKAMMER', 'RKAMMER', 'CREATED'),
('P',   'Pilot',                          'RKAMMER', 'RKAMMER', 'CREATED'),
('SG',  'Singer',                         'RKAMMER', 'RKAMMER', 'CREATED'),
('ADR', 'Automated Dialogue Replacement', 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO sav_production_type
(code, title, created_by, updated_by, status)
VALUES
('MP',  'Motion Picture',    'RKAMMER', 'RKAMMER', 'CREATED'),
('TV',  'Television',        'RKAMMER', 'RKAMMER', 'CREATED'),
('MOW', 'Movie of the Week', 'RKAMMER', 'RKAMMER', 'CREATED'),
(NULL,  'Industrial',        'RKAMMER', 'RKAMMER', 'CREATED'),
(NULL,  'Other',             'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO sav_role
(code, title, created_by, updated_by, status)
VALUES
('B',  'Background',     'RKAMMER', 'RKAMMER', 'CREATED'),
('DA', 'Dancer',         'RKAMMER', 'RKAMMER', 'CREATED'),
('D',  'Dubbing',        'RKAMMER', 'RKAMMER', 'CREATED'),
('G',  'Guest Star',     'RKAMMER', 'RKAMMER', 'CREATED'),
('L',  'Looping',        'RKAMMER', 'RKAMMER', 'CREATED'),
('P',  'Principal',      'RKAMMER', 'RKAMMER', 'CREATED'),
('SR', 'Series Regular', 'RKAMMER', 'RKAMMER', 'CREATED'),
('S',  'Singer',         'RKAMMER', 'RKAMMER', 'CREATED'),
('ST', 'Stunt',          'RKAMMER', 'RKAMMER', 'CREATED'),
('V',  'Voice-Over',     'RKAMMER', 'RKAMMER', 'CREATED'),
('A',  'Announcer',      'RKAMMER', 'RKAMMER', 'CREATED'),
('GD', 'Group Dancer',   'RKAMMER', 'RKAMMER', 'CREATED'),
('GS', 'Group Singer',   'RKAMMER', 'RKAMMER', 'CREATED'),
('SA', 'Specialty Act',  'RKAMMER', 'RKAMMER', 'CREATED'),
('SI', 'Stand-In',       'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO contact
(first_name, middle_name, last_name, suffix, address, city, state_code, phone, email, website, picture_path, created_by, updated_by, status)
VALUES
('Stephanie', 'G.', 'Hilton',     '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Evelyn',    'C.', 'McAllister', '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Ira',       'K.', 'Walton',     '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Ileen',     'C.', 'Coleman',    '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Sandra',    'B.', 'Weber',      '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Judith',    'W.', 'Ford',       '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Kevin',     'J.', 'Laflamme',   '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Florence',  'K.', 'Osborn',     '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Jon',       'C.', 'Fouts',      '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Arthur',    'T.', 'Barrett',    '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Michael',   'D.', 'Morrison',   '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Krystal',   'E.', 'Gee',        '', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO production_contact
(production_id, contact_id, contact_role_id, created_by, updated_by, status)
VALUES
(3,  6, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3,  7, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3,  8, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3,  9, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3, 10, 5, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3, 11, 6, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3, 12, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3, 13, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3, 14, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3, 15, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3, 16, 5, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4,  6, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4,  7, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4,  8, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4,  9, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4, 10, 5, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4, 11, 6, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4, 12, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4, 13, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4, 14, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4, 15, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4, 16, 5, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5,  6, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5,  7, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5,  8, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5,  9, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5, 10, 5, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5, 11, 6, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5, 12, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5, 13, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5, 14, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5, 15, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(5, 16, 5, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6,  6, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6,  7, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6,  8, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6,  9, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6, 10, 5, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6, 11, 6, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6, 12, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6, 13, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6, 14, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6, 15, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(6, 16, 5, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7,  6, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7,  7, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7,  8, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7,  9, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7, 10, 5, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7, 11, 6, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7, 12, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7, 13, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7, 14, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7, 15, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(7, 16, 5, 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO production_show_type
(name, created_by, updated_by, status)
VALUES
('Pilot',        'RKAMMER', 'RKAMMER', 'CREATED'),
('Presentation', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Series',       'RKAMMER', 'RKAMMER', 'CREATED'),
('Special',      'RKAMMER', 'RKAMMER', 'CREATED');
