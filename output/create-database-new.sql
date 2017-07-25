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
) ENGINE = InnoDB;

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
) ENGINE = InnoDB;

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
    show_type_series_after_02102002           CHAR(1) DEFAULT 'F',
    show_type_series_prior_02102002           CHAR(1) DEFAULT 'F',
    show_type_special                         CHAR(1) DEFAULT 'F',
    show_type_movie_mini_series               CHAR(1) DEFAULT 'F',
    show_type_strip                           CHAR(1) DEFAULT 'F',
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
    company_id                             INTEGER      NOT NULL,
    production_id                          INTEGER      NOT NULL,
    director_name                          VARCHAR(50),
    director_first_number                  INTEGER,
    director_gender                        CHAR(1),
    director_caucasion                     CHAR(1),
    director_afro_american                 CHAR(1),
    director_latino                        CHAR(1),
    director_native                        CHAR(1),
    director_unknown                       CHAR(1),
    unit_production_name                   VARCHAR(50),
    unit_production_gender                 CHAR(1),
    unit_production_caucasion              CHAR(1),
    unit_production_afro_american          CHAR(1),
    unit_production_latino                 CHAR(1),
    unit_production_native                 CHAR(1),
    unit_production_unknown                CHAR(1),
    first_assistant_name                   VARCHAR(50),
    first_assistant_gender                 CHAR(1),
    first_assistant_caucasion              CHAR(1),
    first_assistant_afro_american          CHAR(1),
    first_assistant_latino                 CHAR(1),
    first_assistant_native                 CHAR(1),
    first_assistant_unknown                CHAR(1),
    second_assistant_name                  VARCHAR(50),
    second_assistant_gender                CHAR(1),
    second_assistant_caucasion             CHAR(1),
    second_assistant_afro_american         CHAR(1),
    second_assistant_latino                CHAR(1),
    second_assistant_native                CHAR(1),
    second_assistant_unknown               CHAR(1),
    associate_assistant_name               VARCHAR(50),
    associate_assistant_gender             CHAR(1),
    associate_assistant_caucasion          CHAR(1),
    associate_assistant_afro_american      CHAR(1),
    associate_assistant_latino             CHAR(1),
    associate_assistant_native             CHAR(1),
    associate_assistant_unknown            CHAR(1),
    stage_assistant_name                   VARCHAR(50),
    stage_assistant_gender                 CHAR(1),
    stage_assistant_caucasion              CHAR(1),
    stage_assistant_afro_american          CHAR(1),
    stage_assistant_latino                 CHAR(1),
    stage_assistant_native                 CHAR(1),
    stage_assistant_unknown                CHAR(1),
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
    episode_id                                INT            NOT NULL,
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
    television_license_director               CHAR(1) DEFAULT 'F',
    television_license_budget                 CHAR(1) DEFAULT 'F',
    produced_for_network                      CHAR(1) DEFAULT 'F',
    produced_for_non_network                  CHAR(1) DEFAULT 'F',
    produced_for_basic_cable                  CHAR(1) DEFAULT 'F',
    produced_for_pay_tv                       CHAR(1) DEFAULT 'F',
    produced_for_home_video                   CHAR(1) DEFAULT 'F',
    project_budget_more                       CHAR(1) DEFAULT 'F',
    project_budget_less                       CHAR(1) DEFAULT 'F',
    second_unit_director                      CHAR(1) DEFAULT 'F',
    segment_applicable                        CHAR(1) DEFAULT 'F',
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

 CREATE TABLE wga_work_list(
    id                   INTEGER      NOT NULL AUTO_INCREMENT,
    company_id           INTEGER      NOT NULL,
    company_number       INTEGER      NOT NULL,
    week_ending          INT          NOT NULL,
    contact_id           INTEGER      NOT NULL,
    name                 VARCHAR(50)  NOT NULL,
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
    title                VARCHAR(50)  NOT NULL,
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_wga_field_of_work_id    PRIMARY KEY (id)
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
    production_state_state_code,
    production_state_created,
    production_state_created_by,
    production_state_updated,
    production_state_updated_by,
    production_state_status
) AS
SELECT production_state.production_id                                  AS production_state_production_id,
       production_state.state_code                                     AS production_state_state_code,
       DATE_FORMAT(production_state.created,'%m/%d/%Y %H:%i:%S')       AS production_state_created,
       production_state.created_by                                     AS production_state_created_by,
       DATE_FORMAT(production_state.updated,'%m/%d/%Y %H:%i:%S')       AS production_state_updated,
       production_state.updated_by                                     AS production_state_updated_by,
       production_state.status                                         AS production_state_status
  FROM production_state AS production_state;

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

 CREATE OR REPLACE VIEW contact_get_list(
    contact_id,
    contact_first_name,
    contact_middle_name,
    contact_last_name,
    contact_suffix,
    contact_address,
    contact_full_name,
    contact_city,
    contact_state_code,
    contact_state_name,
    contact_phone,
    contact_email,
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
           dga_quarterly_earning_item.earnings                                                   AS  dga_quarterly_earning_item_earnings,
           DATE_FORMAT(dga_quarterly_earning_item.created,'%m/%d/%Y %H:%i:%S')                   AS  dga_quarterly_earning_item_created,
           dga_quarterly_earning_item.created_by                                                 AS  dga_quarterly_earning_item_created_by,
           DATE_FORMAT(dga_quarterly_earning_item.updated,'%m/%d/%Y %H:%i:%S')                   AS  dga_quarterly_earning_item_updated,
           dga_quarterly_earning_item.updated_by                                                 AS  dga_quarterly_earning_item_updated_by,
           dga_quarterly_earning_item.status                                                     AS  dga_quarterly_earning_item_status
      FROM dga_quarterly_earning_item AS dga_quarterly_earning_item INNER JOIN dga_quarterly_earning AS dga_quarterly_earning ON dga_quarterly_earning.id = dga_quarterly_earning_item.dga_quarterly_earning_id;

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
    dga_weekly_work_company_phone,
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
           company.phone                                                          AS dga_weekly_work_company_phone,
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
    dga_director_deal_memo_contact_address,
    dga_director_deal_memo_contact_city,
    dga_director_deal_memo_contact_state_code,
    dga_director_deal_memo_contact_state_name,
    dga_director_deal_memo_contact_phone,
    dga_director_deal_memo_contact_email,
    -- dga_director_deal_memo_contact_name,
    dga_director_deal_memo_contact_first_name,
    dga_director_deal_memo_contact_middle_name,
    dga_director_deal_memo_contact_last_name,
    dga_director_deal_memo_contact_suffix,
    dga_director_deal_memo_contact_full_name,
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
    dga_director_deal_memo_show_type_sports_event,
    dga_director_deal_memo_show_type_sports_event_name,
    dga_director_deal_memo_show_type_series_after_02102002,
    dga_director_deal_memo_show_type_series_prior_02102002,
    dga_director_deal_memo_show_type_special,
    dga_director_deal_memo_show_type_movie_mini_series,
    dga_director_deal_memo_show_type_strip,
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
        --    contact.name                                                                             AS dga_director_deal_memo_contact_name,
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
           dga_director_deal_memo.show_type_sports_event                                            AS dga_director_deal_memo_show_type_sports_event,
           dga_director_deal_memo.show_type_sports_event_name                                       AS dga_director_deal_memo_show_type_sports_event_name,
           dga_director_deal_memo.show_type_series_after_02102002                                   AS dga_director_deal_memo_show_type_series_after_02102002,
           dga_director_deal_memo.show_type_series_prior_02102002                                   AS dga_director_deal_memo_show_type_series_prior_02102002,
           dga_director_deal_memo.show_type_special                                                 AS dga_director_deal_memo_show_type_special,
           dga_director_deal_memo.show_type_movie_mini_series                                       AS dga_director_deal_memo_show_type_movie_mini_series,
           dga_director_deal_memo.show_type_strip                                                   AS dga_director_deal_memo_show_type_strip,
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
    dga_employment_data_director_native,
    dga_employment_data_director_unknown,
    dga_employment_data_unit_production_name,
    dga_employment_data_unit_production_gender,
    dga_employment_data_unit_production_caucasion,
    dga_employment_data_unit_production_afro_american,
    dga_employment_data_unit_production_latino,
    dga_employment_data_unit_production_native,
    dga_employment_data_unit_production_unknown,
    dga_employment_data_first_assistant_name,
    dga_employment_data_first_assistant_gender,
    dga_employment_data_first_assistant_caucasion,
    dga_employment_data_first_assistant_afro_american,
    dga_employment_data_first_assistant_latino,
    dga_employment_data_first_assistant_native,
    dga_employment_data_first_assistant_unknown,
    dga_employment_data_second_assistant_name,
    dga_employment_data_second_assistant_gender,
    dga_employment_data_second_assistant_caucasion,
    dga_employment_data_second_assistant_afro_american,
    dga_employment_data_second_assistant_latino,
    dga_employment_data_second_assistant_native,
    dga_employment_data_second_assistant_unknown,
    dga_employment_data_associate_assistant_name,
    dga_employment_data_associate_assistant_gender,
    dga_employment_data_associate_assistant_caucasion,
    dga_employment_data_associate_assistant_afro_american,
    dga_employment_data_associate_assistant_latino,
    dga_employment_data_associate_assistant_native,
    dga_employment_data_associate_assistant_unknown,
    dga_employment_data_stage_assistant_name,
    dga_employment_data_stage_assistant_gender,
    dga_employment_data_stage_assistant_caucasion,
    dga_employment_data_stage_assistant_afro_american,
    dga_employment_data_stage_assistant_latino,
    dga_employment_data_stage_assistant_native,
    dga_employment_data_stage_assistant_unknown,
    dga_employment_data_created,
    dga_employment_data_created_by,
    dga_employment_data_updated,
    dga_employment_data_updated_by,
    dga_employment_data_status
) AS
    SELECT dga_employment_data.id                                                             AS dga_employment_data_id,
           dga_employment_data.report_date                                                    AS dga_employment_data_report_date,
           dga_employment_data.prepared_by                                                    AS dga_employment_data_prepared_by,
           dga_employment_data.quarter                                                        AS dga_employment_data_quarter,
           dga_employment_data.year                                                           AS dga_employment_data_year,
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
           dga_employment_data.director_native                                                AS dga_employment_data_director_native,
           dga_employment_data.director_unknown                                               AS dga_employment_data_director_unknown,
           dga_employment_data.unit_production_name                                           AS dga_employment_data_unit_production_name,
           dga_employment_data.unit_production_gender                                         AS dga_employment_data_unit_production_gender,
           dga_employment_data.unit_production_caucasion                                      AS dga_employment_data_unit_production_caucasion,
           dga_employment_data.unit_production_afro_american                                  AS dga_employment_data_unit_production_afro_american,
           dga_employment_data.unit_production_latino                                         AS dga_employment_data_unit_production_latino,
           dga_employment_data.unit_production_native                                         AS dga_employment_data_unit_production_native,
           dga_employment_data.unit_production_unknown                                        AS dga_employment_data_unit_production_unknown,
           dga_employment_data.first_assistant_name                                           AS dga_employment_data_first_assistant_name,
           dga_employment_data.first_assistant_gender                                         AS dga_employment_data_first_assistant_gender,
           dga_employment_data.first_assistant_caucasion                                      AS dga_employment_data_first_assistant_caucasion,
           dga_employment_data.first_assistant_afro_american                                  AS dga_employment_data_first_assistant_afro_american,
           dga_employment_data.first_assistant_latino                                         AS dga_employment_data_first_assistant_latino,
           dga_employment_data.first_assistant_native                                         AS dga_employment_data_first_assistant_native,
           dga_employment_data.first_assistant_unknown                                        AS dga_employment_data_first_assistant_unknown,
           dga_employment_data.second_assistant_name                                          AS dga_employment_data_second_assistant_name,
           dga_employment_data.second_assistant_gender                                        AS dga_employment_data_second_assistant_gender,
           dga_employment_data.second_assistant_caucasion                                     AS dga_employment_data_second_assistant_caucasion,
           dga_employment_data.second_assistant_afro_american                                 AS dga_employment_data_second_assistant_afro_american,
           dga_employment_data.second_assistant_latino                                        AS dga_employment_data_second_assistant_latino,
           dga_employment_data.second_assistant_native                                        AS dga_employment_data_second_assistant_native,
           dga_employment_data.second_assistant_unknown                                       AS dga_employment_data_second_assistant_unknown,
           dga_employment_data.associate_assistant_name                                       AS dga_employment_data_associate_assistant_name,
           dga_employment_data.associate_assistant_gender                                     AS dga_employment_data_associate_assistant_gender,
           dga_employment_data.associate_assistant_caucasion                                  AS dga_employment_data_associate_assistant_caucasion,
           dga_employment_data.associate_assistant_afro_american                              AS dga_employment_data_associate_assistant_afro_american,
           dga_employment_data.associate_assistant_latino                                     AS dga_employment_data_associate_assistant_latino,
           dga_employment_data.associate_assistant_native                                     AS dga_employment_data_associate_assistant_native,
           dga_employment_data.associate_assistant_unknown                                    AS dga_employment_data_associate_assistant_unknown,
           dga_employment_data.stage_assistant_name                                           AS dga_employment_data_stage_assistant_name,
           dga_employment_data.stage_assistant_gender                                         AS dga_employment_data_stage_assistant_gender,
           dga_employment_data.stage_assistant_caucasion                                      AS dga_employment_data_stage_assistant_caucasion,
           dga_employment_data.stage_assistant_afro_american                                  AS dga_employment_data_stage_assistant_afro_american,
           dga_employment_data.stage_assistant_latino                                         AS dga_employment_data_stage_assistant_latino,
           dga_employment_data.stage_assistant_native                                         AS dga_employment_data_stage_assistant_native,
           dga_employment_data.stage_assistant_unknown                                        AS dga_employment_data_stage_assistant_unknown,
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
    dga_stage_manager_deal_memo_employer_name,
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
           dga_stage_manager_deal_memo.employer_name                                                 AS dga_stage_manager_deal_memo_employer_name,
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
                                                                      INNER JOIN season     AS season                ON episode.season_id        = season.id;;

 CREATE OR REPLACE VIEW dga_director_scripted_deal_memo_get_list(
    dga_director_scripted_deal_memo_id,
    dga_director_scripted_deal_memo_contact_id,
    -- dga_director_scripted_deal_memo_contact_name,
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
    dga_director_scripted_deal_memo_television_license_director,
    dga_director_scripted_deal_memo_television_license_budget,
    dga_director_scripted_deal_memo_produced_for_network,
    dga_director_scripted_deal_memo_produced_for_non_network,
    dga_director_scripted_deal_memo_produced_for_basic_cable,
    dga_director_scripted_deal_memo_produced_for_pay_tv,
    dga_director_scripted_deal_memo_produced_for_home_video,
    dga_director_scripted_deal_memo_project_budget_more,
    dga_director_scripted_deal_memo_project_budget_less,
    dga_director_scripted_deal_memo_second_unit_director,
    dga_director_scripted_deal_memo_segment_applicable,
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
           dga_director_scripted_deal_memo.television_license_director                                              AS dga_director_scripted_deal_memo_television_license_director,
           dga_director_scripted_deal_memo.television_license_budget                                                AS dga_director_scripted_deal_memo_television_license_budget,
           dga_director_scripted_deal_memo.produced_for_network                                                     AS dga_director_scripted_deal_memo_produced_for_network,
           dga_director_scripted_deal_memo.produced_for_non_network                                                 AS dga_director_scripted_deal_memo_produced_for_non_network,
           dga_director_scripted_deal_memo.produced_for_basic_cable                                                 AS dga_director_scripted_deal_memo_produced_for_basic_cable,
           dga_director_scripted_deal_memo.produced_for_pay_tv                                                      AS dga_director_scripted_deal_memo_produced_for_pay_tv,
           dga_director_scripted_deal_memo.produced_for_home_video                                                  AS dga_director_scripted_deal_memo_produced_for_home_video,
           dga_director_scripted_deal_memo.project_budget_more                                                      AS dga_director_scripted_deal_memo_project_budget_more,
           dga_director_scripted_deal_memo.project_budget_less                                                      AS dga_director_scripted_deal_memo_project_budget_less,
           dga_director_scripted_deal_memo.second_unit_director                                                     AS dga_director_scripted_deal_memo_second_unit_director,
           dga_director_scripted_deal_memo.segment_applicable                                                       AS dga_director_scripted_deal_memo_segment_applicable,
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
    -- wga_work_list_contact_name,
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
    wga_work_list_name,
    wga_work_list_created,
    wga_work_list_created_by,
    wga_work_list_updated,
    wga_work_list_updated_by,
    wga_work_list_status
) AS
    SELECT wga_work_list.id                                              AS wga_work_list_id,
           wga_work_list.company_id                                      AS wga_work_list_company_id,
           wga_work_list.company_number                                  AS wga_work_list_company_number,
           company.name                                                  AS wga_work_list_company_name,
           company.address                                               AS wga_work_list_company_address,
           company.city                                                  AS wga_work_list_company_city,
           company.state_code                                            AS wga_work_list_company_state_code,
           company_state.name                                            AS wga_work_list_company_state_name,
           company.phone                                                 AS wga_work_list_company_phone,
           company.website                                               AS wga_work_list_company_website,
           wga_work_list.week_ending                                     AS wga_work_list_week_ending,
           wga_work_list.contact_id                                      AS wga_work_list_contact_id,
        --    contact.name                                                  AS wga_work_list_contact_name,
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
           wga_work_list.name                                            AS wga_work_list_name,
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

 DELIMITER //
CREATE PROCEDURE company_set_list(
    IN  company_id                   INTEGER,
    IN  company_name                 VARCHAR(50),
    IN  company_address              VARCHAR(100),
    IN  company_city                 VARCHAR(100),
    IN  company_state_code           CHAR(2),
    IN  company_phone                VARCHAR(20),
    IN  company_website              VARCHAR(100),
    IN  company_logo_path            VARCHAR(120),
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

        SET return_value = LAST_INSERT_ID();
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

         SET return_value = company_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE network_set_list(
    IN  network_id                 INTEGER,
    IN  network_name               VARCHAR(50),
    IN  network_media_company_id   INTEGER,
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

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE network
           SET media_company_id = network_media_company_id,
               name             = network_name,
               logo_path        = network_logo_path,
               updated_by       = network_updated_by,
               status           = 'UPDATED'
         WHERE id               = network_id;

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
    IN  production_id                               INTEGER,
    IN  production_title                            VARCHAR(50),
    IN  production_budget                           NUMERIC(15,2),
    IN  production_writing_start_date               DATE,
    IN  production_writing_end_date                 DATE,
    IN  production_pre_production_start_date        DATE,
    IN  production_pre_production_end_date          DATE,
    IN  production_photography_start_date           DATE,
    IN  production_photography_end_date             DATE,
    IN  production_post_production_start_date       DATE,
    IN  production_post_production_end_date         DATE,
    IN  production_network_production_start_date    DATE,
    IN  production_network_production_end_date      DATE,
    IN  production_production_length_id             INTEGER,
    IN  production_network_id                       INTEGER,
    IN  production_production_type_id               INTEGER,
    IN  production_production_company_id            INTEGER,
    IN  production_payroll_company_id               INTEGER,
    IN  production_logo_path                        VARCHAR(120),
    IN  production_created_by                       VARCHAR(30),
    IN  production_updated_by                       VARCHAR(30),
    IN  production_status                           VARCHAR(30),
    OUT return_value                                INTEGER
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

        SET return_value = LAST_INSERT_ID();
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

         SET return_value = production_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 

 DELIMITER //
CREATE PROCEDURE season_set_list(
    IN  season_id                               INTEGER,
    IN  season_title                            VARCHAR(50),
    IN  season_season_number                    INTEGER,
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

        SET return_value = LAST_INSERT_ID();
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

         SET return_value = season_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE episode_set_list(
    IN  episode_id                               INTEGER,
    IN  episode_title                            VARCHAR(50),
    IN  episode_episode_number                   INTEGER,
    IN  episode_season_id                        INTEGER,
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

        SET return_value = LAST_INSERT_ID();
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

         SET return_value = episode_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE contact_set_list(
    IN  contact_id                   INTEGER,
    IN  contact_name                 VARCHAR(100),
    IN  contact_address              VARCHAR(100),
    IN  contact_city                 VARCHAR(100),
    IN  contact_state_code           CHAR(2),
    IN  contact_phone                VARCHAR(20),
    IN  contact_email                VARCHAR(100),
    IN  contact_website              VARCHAR(100),
    IN  contact_picture_path         VARCHAR(120),
    IN  contact_created_by           VARCHAR(30),
    IN  contact_updated_by           VARCHAR(30),
    IN  contact_status               VARCHAR(30),
    OUT return_value                 INTEGER
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
            name,
            address,
            city,
            state_code,
            phone,
            email,
            website,
            picture_path,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            contact_name,
            contact_address,
            contact_city,
            contact_state_code,
            contact_phone,
            contact_email,
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
           SET name         = name,
               address      = address,
               city         = city,
               state_code   = state_code,
               phone        = phone,
               email        = email,
               website      = website,
               picture_path = picture_path,
               created_by   = created_by,
               updated_by   = updated_by,
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
CREATE PROCEDURE dga_quarterly_earning_set_list(
    IN  dga_quarterly_earning_id                   INTEGER,
    IN  dga_quarterly_earning_quarterly            VARCHAR(10),
    IN  dga_quarterly_earning_year                 YEAR,
    IN  dga_quarterly_earning_company_id           INTEGER,
    IN  dga_quarterly_earning_contact_id           INTEGER,
    IN  dga_quarterly_earning_prepared_by          VARCHAR(50),
    IN  dga_quarterly_earning_phone                VARCHAR(20),
    IN  dga_quarterly_earning_created_by           VARCHAR(30),
    IN  dga_quarterly_earning_updated_by           VARCHAR(30),
    IN  dga_quarterly_earning_status               VARCHAR(30),
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
CREATE PROCEDURE dga_quartely_earning_item_set_list(
    IN  dga_quartely_earning_item_id                          INTEGER,
    IN  dga_quartely_earning_item_dga_quarterly_earning_id    INTEGER,
    IN  dga_quartely_earning_item_name                        VARCHAR(50),
    IN  dga_quartely_earning_item_ssn                         VARCHAR(11),
    IN  dga_quartely_earning_item_category                    VARCHAR(30),
    IN  dga_quartely_earning_item_production_id               INTEGER,
    IN  dga_quartely_earning_item_earnings                    NUMERIC(15,2),
    IN  dga_quartely_earning_item_created_by                  VARCHAR(30),
    IN  dga_quartely_earning_item_updated_by                  VARCHAR(30),
    OUT return_value                                          INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_quartely_earning_item
     WHERE id = dga_quartely_earning_item_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_quartely_earning_item
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
            dga_quartely_earning_item_dga_quarterly_earning_id,
            dga_quartely_earning_item_name,
            dga_quartely_earning_item_ssn,
            dga_quartely_earning_item_category,
            dga_quartely_earning_item_production_id,
            dga_quartely_earning_item_earnings,
            dga_quartely_earning_item_created_by,
            dga_quartely_earning_item_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_quartely_earning_item
           SET dga_quarterly_earning_id =   dga_quartely_earning_item_dga_quarterly_earning_id,
               name                     =   dga_quartely_earning_item_name,
               ssn                      =   dga_quartely_earning_item_ssn,
               category                 =   dga_quartely_earning_item_category,
               production_id            =   dga_quartely_earning_item_production_id,
               earnings                 =   dga_quartely_earning_item_earnings,
               updated_by               =   dga_quartely_earning_item_updated_by,
               status                   =   'UPDATED'
         WHERE id                       =   dga_quartely_earning_item_id;
     END IF;

     SET return_value = dga_quartely_earning_item_id;

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
    IN  dga_director_deal_memo_show_type_sports_event             CHAR(1),
    IN  dga_director_deal_memo_show_type_sports_event_name        VARCHAR(50),
    IN  dga_director_deal_memo_show_type_series_after_02102002    CHAR(1),
    IN  dga_director_deal_memo_show_type_series_prior_02102002    CHAR(1),
    IN  dga_director_deal_memo_show_type_special                  CHAR(1),
    IN  dga_director_deal_memo_show_type_movie_mini_series        CHAR(1),
    IN  dga_director_deal_memo_show_type_strip                    CHAR(1),
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
            show_type_sports_event,
            show_type_sports_event_name,
            show_type_series_after_02102002,
            show_type_series_prior_02102002,
            show_type_special,
            show_type_movie_mini_series,
            show_type_strip,
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
            dga_director_deal_memo_show_type_sports_event,
            dga_director_deal_memo_show_type_sports_event_name,
            dga_director_deal_memo_show_type_series_after_02102002,
            dga_director_deal_memo_show_type_series_prior_02102002,
            dga_director_deal_memo_show_type_special,
            dga_director_deal_memo_show_type_movie_mini_series,
            dga_director_deal_memo_show_type_strip,
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
               show_type_sports_event          = dga_director_deal_memo_show_type_sports_event,
               show_type_sports_event_name     = dga_director_deal_memo_show_type_sports_event_name,
               show_type_series_after_02102002 = dga_director_deal_memo_show_type_series_after_02102002,
               show_type_series_prior_02102002 = dga_director_deal_memo_show_type_series_prior_02102002,
               show_type_special               = dga_director_deal_memo_show_type_special,
               show_type_movie_mini_series     = dga_director_deal_memo_show_type_movie_mini_series,
               show_type_strip                 = dga_director_deal_memo_show_type_strip,
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
    IN  dga_employment_data_company_id                          INT,
    IN  dga_employment_data_production_id                       INT,
    IN  dga_employment_data_director_name                       VARCHAR(50),
    IN  dga_employment_data_director_first_number               INT,
    IN  dga_employment_data_director_gender                     CHAR(1),
    IN  dga_employment_data_director_caucasion                  CHAR(1),
    IN  dga_employment_data_director_afro_american              CHAR(1),
    IN  dga_employment_data_director_latino                     CHAR(1),
    IN  dga_employment_data_director_native                     CHAR(1),
    IN  dga_employment_data_director_unknown                    CHAR(1),
    IN  dga_employment_data_unit_production_name                VARCHAR(50),
    IN  dga_employment_data_unit_production_gender              CHAR(1),
    IN  dga_employment_data_unit_production_caucasion           CHAR(1),
    IN  dga_employment_data_unit_production_afro_american       CHAR(1),
    IN  dga_employment_data_unit_production_latino              CHAR(1),
    IN  dga_employment_data_unit_production_native              CHAR(1),
    IN  dga_employment_data_unit_production_unknown             CHAR(1),
    IN  dga_employment_data_first_assistant_name                VARCHAR(50),
    IN  dga_employment_data_first_assistant_gender              CHAR(1),
    IN  dga_employment_data_first_assistant_caucasion           CHAR(1),
    IN  dga_employment_data_first_assistant_afro_american       CHAR(1),
    IN  dga_employment_data_first_assistant_latino              CHAR(1),
    IN  dga_employment_data_first_assistant_native              CHAR(1),
    IN  dga_employment_data_first_assistant_unknown             CHAR(1),
    IN  dga_employment_data_second_assistant_name               VARCHAR(50),
    IN  dga_employment_data_second_assistant_gender             CHAR(1),
    IN  dga_employment_data_second_assistant_caucasion          CHAR(1),
    IN  dga_employment_data_second_assistant_afro_american      CHAR(1),
    IN  dga_employment_data_second_assistant_latino             CHAR(1),
    IN  dga_employment_data_second_assistant_native             CHAR(1),
    IN  dga_employment_data_second_assistant_unknown            CHAR(1),
    IN  dga_employment_data_associate_assistant_name            VARCHAR(50),
    IN  dga_employment_data_associate_assistant_gender          CHAR(1),
    IN  dga_employment_data_associate_assistant_caucasion       CHAR(1),
    IN  dga_employment_data_associate_assistant_afro_american   CHAR(1),
    IN  dga_employment_data_associate_assistant_latino          CHAR(1),
    IN  dga_employment_data_associate_assistant_native          CHAR(1),
    IN  dga_employment_data_associate_assistant_unknown         CHAR(1),
    IN  dga_employment_data_stage_assistant_name                VARCHAR(50),
    IN  dga_employment_data_stage_assistant_gender              CHAR(1),
    IN  dga_employment_data_stage_assistant_caucasion           CHAR(1),
    IN  dga_employment_data_stage_assistant_afro_american       CHAR(1),
    IN  dga_employment_data_stage_assistant_latino              CHAR(1),
    IN  dga_employment_data_stage_assistant_native              CHAR(1),
    IN  dga_employment_data_stage_assistant_unknown             CHAR(1),
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
            company_id,
            production_id,
            director_name,
            director_first_number,
            director_gender,
            director_caucasion,
            director_afro_american,
            director_latino,
            director_native,
            director_unknown,
            unit_production_name,
            unit_production_gender,
            unit_production_caucasion,
            unit_production_afro_american,
            unit_production_latino,
            unit_production_native,
            unit_production_unknown,
            first_assistant_name,
            first_assistant_gender,
            first_assistant_caucasion,
            first_assistant_afro_american,
            first_assistant_latino,
            first_assistant_native,
            first_assistant_unknown,
            second_assistant_name,
            second_assistant_gender,
            second_assistant_caucasion,
            second_assistant_afro_american,
            second_assistant_latino,
            second_assistant_native,
            second_assistant_unknown,
            associate_assistant_name,
            associate_assistant_gender,
            associate_assistant_caucasion,
            associate_assistant_afro_american,
            associate_assistant_latino,
            associate_assistant_native,
            associate_assistant_unknown,
            stage_assistant_name,
            stage_assistant_gender,
            stage_assistant_caucasion,
            stage_assistant_afro_american,
            stage_assistant_latino,
            stage_assistant_native,
            stage_assistant_unknown,
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
            dga_employment_data_company_id,
            dga_employment_data_production_id,
            dga_employment_data_director_name,
            dga_employment_data_director_first_number,
            dga_employment_data_director_gender,
            dga_employment_data_director_caucasion,
            dga_employment_data_director_afro_american,
            dga_employment_data_director_latino,
            dga_employment_data_director_native,
            dga_employment_data_director_unknown,
            dga_employment_data_unit_production_name,
            dga_employment_data_unit_production_gender,
            dga_employment_data_unit_production_caucasion,
            dga_employment_data_unit_production_afro_american,
            dga_employment_data_unit_production_latino,
            dga_employment_data_unit_production_native,
            dga_employment_data_unit_production_unknown,
            dga_employment_data_first_assistant_name,
            dga_employment_data_first_assistant_gender,
            dga_employment_data_first_assistant_caucasion,
            dga_employment_data_first_assistant_afro_american,
            dga_employment_data_first_assistant_latino,
            dga_employment_data_first_assistant_native,
            dga_employment_data_first_assistant_unknown,
            dga_employment_data_second_assistant_name,
            dga_employment_data_second_assistant_gender,
            dga_employment_data_second_assistant_caucasion,
            dga_employment_data_second_assistant_afro_american,
            dga_employment_data_second_assistant_latino,
            dga_employment_data_second_assistant_native,
            dga_employment_data_second_assistant_unknown,
            dga_employment_data_associate_assistant_name,
            dga_employment_data_associate_assistant_gender,
            dga_employment_data_associate_assistant_caucasion,
            dga_employment_data_associate_assistant_afro_american,
            dga_employment_data_associate_assistant_latino,
            dga_employment_data_associate_assistant_native,
            dga_employment_data_associate_assistant_unknown,
            dga_employment_data_stage_assistant_name,
            dga_employment_data_stage_assistant_gender,
            dga_employment_data_stage_assistant_caucasion,
            dga_employment_data_stage_assistant_afro_american,
            dga_employment_data_stage_assistant_latino,
            dga_employment_data_stage_assistant_native,
            dga_employment_data_stage_assistant_unknown,
            dga_employment_data_created_by,
            dga_employment_data_updated_by,
            dga_employment_data_status,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_employment_data
           SET report_date                       = dga_employment_data_report_date,
               prepared_by                       = dga_employment_data_prepared_by,
               quarter                           = dga_employment_data_quarter,
               year                              = dga_employment_data_year,
               company_id                        = dga_employment_data_company_id,
               production_id                     = dga_employment_data_production_id,
               director_name                     = dga_employment_data_director_name,
               director_first_number             = dga_employment_data_director_first_number,
               director_gender                   = dga_employment_data_director_gender,
               director_caucasion                = dga_employment_data_director_caucasion,
               director_afro_american            = dga_employment_data_director_afro_american,
               director_latino                   = dga_employment_data_director_latino,
               director_native                   = dga_employment_data_director_native,
               director_unknown                  = dga_employment_data_director_unknown,
               unit_production_name              = dga_employment_data_unit_production_name,
               unit_production_gender            = dga_employment_data_unit_production_gender,
               unit_production_caucasion         = dga_employment_data_unit_production_caucasion,
               unit_production_afro_american     = dga_employment_data_unit_production_afro_american,
               unit_production_latino            = dga_employment_data_unit_production_latino,
               unit_production_native            = dga_employment_data_unit_production_native,
               unit_production_unknown           = dga_employment_data_unit_production_unknown,
               first_assistant_name              = dga_employment_data_first_assistant_name,
               first_assistant_gender            = dga_employment_data_first_assistant_gender,
               first_assistant_caucasion         = dga_employment_data_first_assistant_caucasion,
               first_assistant_afro_american     = dga_employment_data_first_assistant_afro_american,
               first_assistant_latino            = dga_employment_data_first_assistant_latino,
               first_assistant_native            = dga_employment_data_first_assistant_native,
               first_assistant_unknown           = dga_employment_data_first_assistant_unknown,
               second_assistant_name             = dga_employment_data_second_assistant_name,
               second_assistant_gender           = dga_employment_data_second_assistant_gender,
               second_assistant_caucasion        = dga_employment_data_second_assistant_caucasion,
               second_assistant_afro_american    = dga_employment_data_second_assistant_afro_american,
               second_assistant_latino           = dga_employment_data_second_assistant_latino,
               second_assistant_native           = dga_employment_data_second_assistant_native,
               second_assistant_unknown          = dga_employment_data_second_assistant_unknown,
               associate_assistant_name          = dga_employment_data_associate_assistant_name,
               associate_assistant_gender        = dga_employment_data_associate_assistant_gender,
               associate_assistant_caucasion     = dga_employment_data_associate_assistant_caucasion,
               associate_assistant_afro_american = dga_employment_data_associate_assistant_afro_american,
               associate_assistant_latino        = dga_employment_data_associate_assistant_latino,
               associate_assistant_native        = dga_employment_data_associate_assistant_native,
               associate_assistant_unknown       = dga_employment_data_associate_assistant_unknown,
               stage_assistant_name              = dga_employment_data_stage_assistant_name,
               stage_assistant_gender            = dga_employment_data_stage_assistant_gender,
               stage_assistant_caucasion         = dga_employment_data_stage_assistant_caucasion,
               stage_assistant_afro_american     = dga_employment_data_stage_assistant_afro_american,
               stage_assistant_latino            = dga_employment_data_stage_assistant_latino,
               stage_assistant_native            = dga_employment_data_stage_assistant_native,
               stage_assistant_unknown           = dga_employment_data_stage_assistant_unknown,
               updated_by                        = dga_employment_data_updated_by,
               status                            = 'UPDATED'
         WHERE id =    dga_employment_data_id;

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
    IN  dga_stage_manager_deal_memo_employer_name                       VARCHAR(50),
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
            dga_stage_manager_deal_memo_employer_name,
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
               employer_name                    = dga_stage_manager_deal_memo_employer_name,
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
    IN  dga_director_scripted_deal_memo_id                             INT,
    IN  dga_director_scripted_deal_memo_contact_id                     INT,
    IN  dga_director_scripted_deal_memo_ssn                            VARCHAR(11),
    IN  dga_director_scripted_deal_memo_loanout                        VARCHAR(30),
    IN  dga_director_scripted_deal_memo_fid                            VARCHAR(30),
    IN  dga_director_scripted_deal_memo_salary                         DECIMAL,
    IN  dga_director_scripted_deal_memo_salary_period_id               INT,
    IN  dga_director_scripted_deal_memo_aditional_time                 DECIMAL,
    IN  dga_director_scripted_deal_memo_aditional_time_period_id       INT,
    IN  dga_director_scripted_deal_memo_start_date                     DATE,
    IN  dga_director_scripted_deal_memo_guaranteed                     INT,
    IN  dga_director_scripted_deal_memo_guaranteed_period_id           INT,
    IN  dga_director_scripted_deal_memo_dga_covered                    CHAR(1),
    IN  dga_director_scripted_deal_memo_addition_terms                 VARCHAR(1024),
    IN  dga_director_scripted_deal_memo_production_id                  INT,
    IN  dga_director_scripted_deal_memo_project_number                 VARCHAR(30),
    IN  dga_director_scripted_deal_memo_episode_id                     INT,
    IN  dga_director_scripted_deal_memo_episode_specific_length        VARCHAR(50),
    IN  dga_director_scripted_deal_memo_segment                        CHAR(1),
    IN  dga_director_scripted_deal_memo_segment_specific_length        VARCHAR(50),
    IN  dga_director_scripted_deal_memo_length_30                      CHAR(1),
    IN  dga_director_scripted_deal_memo_length_60                      CHAR(1),
    IN  dga_director_scripted_deal_memo_length_90                      CHAR(1),
    IN  dga_director_scripted_deal_memo_length_120                     CHAR(1),
    IN  dga_director_scripted_deal_memo_length_other                   CHAR(1),
    IN  dga_director_scripted_deal_memo_pilot                          CHAR(1),
    IN  dga_director_scripted_deal_memo_dramatic_basic_cable_budget    DECIMAL,
    IN  dga_director_scripted_deal_memo_type_production_multi_camera   CHAR(1),
    IN  dga_director_scripted_deal_memo_type_production_single_camera  CHAR(1),
    IN  dga_director_scripted_deal_memo_television_license_director    CHAR(1),
    IN  dga_director_scripted_deal_memo_television_license_budget      CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_network           CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_non_network       CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_basic_cable       CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_pay_tv            CHAR(1),
    IN  dga_director_scripted_deal_memo_produced_for_home_video        CHAR(1),
    IN  dga_director_scripted_deal_memo_project_budget_more            CHAR(1),
    IN  dga_director_scripted_deal_memo_project_budget_less            CHAR(1),
    IN  dga_director_scripted_deal_memo_second_unit_director           CHAR(1),
    IN  dga_director_scripted_deal_memo_segment_applicable             CHAR(1),
    IN  dga_director_scripted_deal_memo_employer_name                  VARCHAR(50),
    IN  dga_director_scripted_deal_memo_employee_name                  VARCHAR(50),
    IN  dga_director_scripted_deal_memo_employee_date                  DATE,
    IN  dga_director_scripted_deal_memo_signatory                      VARCHAR(50),
    IN  dga_director_scripted_deal_memo_signatory_by                   VARCHAR(50),
    IN  dga_director_scripted_deal_memo_signatory_date                 DATE,
    IN  dga_director_scripted_deal_memo_created_by                     VARCHAR(30),
    IN  dga_director_scripted_deal_memo_updated_by                     VARCHAR(30),
    IN  dga_director_scripted_deal_memo_status                         VARCHAR(30),
    OUT return_value                                                   INTEGER
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
            television_license_director,
            television_license_budget,
            produced_for_network,
            produced_for_non_network,
            produced_for_basic_cable,
            produced_for_pay_tv,
            produced_for_home_video,
            project_budget_more,
            project_budget_less,
            second_unit_director,
            segment_applicable,
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
            dga_director_scripted_deal_memo_television_license_director,
            dga_director_scripted_deal_memo_television_license_budget,
            dga_director_scripted_deal_memo_produced_for_network,
            dga_director_scripted_deal_memo_produced_for_non_network,
            dga_director_scripted_deal_memo_produced_for_basic_cable,
            dga_director_scripted_deal_memo_produced_for_pay_tv,
            dga_director_scripted_deal_memo_produced_for_home_video,
            dga_director_scripted_deal_memo_project_budget_more,
            dga_director_scripted_deal_memo_project_budget_less,
            dga_director_scripted_deal_memo_second_unit_director,
            dga_director_scripted_deal_memo_segment_applicable,
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
           SET contact_id                    = dga_director_scripted_deal_memo_contact_id,
               ssn                           = dga_director_scripted_deal_memo_ssn,
               loanout                       = dga_director_scripted_deal_memo_loanout,
               fid                           = dga_director_scripted_deal_memo_fid,
               salary                        = dga_director_scripted_deal_memo_salary,
               salary_period_id              = dga_director_scripted_deal_memo_salary_period_id,
               aditional_time                = dga_director_scripted_deal_memo_aditional_time,
               aditional_time_period_id      = dga_director_scripted_deal_memo_aditional_time_period_id,
               start_date                    = dga_director_scripted_deal_memo_start_date,
               guaranteed                    = dga_director_scripted_deal_memo_guaranteed,
               guaranteed_period_id          = dga_director_scripted_deal_memo_guaranteed_period_id,
               dga_covered                   = dga_director_scripted_deal_memo_dga_covered,
               addition_terms                = dga_director_scripted_deal_memo_addition_terms,
               production_id                 = dga_director_scripted_deal_memo_production_id,
               project_number                = dga_director_scripted_deal_memo_project_number,
               episode_id                    = dga_director_scripted_deal_memo_episode_id,
               episode_specific_length       = dga_director_scripted_deal_memo_episode_specific_length,
               segment                       = dga_director_scripted_deal_memo_segment,
               segment_specific_length       = dga_director_scripted_deal_memo_segment_specific_length,
               length_30                     = dga_director_scripted_deal_memo_length_30,
               length_60                     = dga_director_scripted_deal_memo_length_60,
               length_90                     = dga_director_scripted_deal_memo_length_90,
               length_120                    = dga_director_scripted_deal_memo_length_120,
               length_other                  = dga_director_scripted_deal_memo_length_other,
               pilot                         = dga_director_scripted_deal_memo_pilot,
               dramatic_basic_cable_budget   = dga_director_scripted_deal_memo_dramatic_basic_cable_budget,
               type_production_multi_camera  = dga_director_scripted_deal_memo_type_production_multi_camera,
               type_production_single_camera = dga_director_scripted_deal_memo_type_production_single_camera,
               television_license_director   = dga_director_scripted_deal_memo_television_license_director,
               television_license_budget     = dga_director_scripted_deal_memo_television_license_budget,
               produced_for_network          = dga_director_scripted_deal_memo_produced_for_network,
               produced_for_non_network      = dga_director_scripted_deal_memo_produced_for_non_network,
               produced_for_basic_cable      = dga_director_scripted_deal_memo_produced_for_basic_cable,
               produced_for_pay_tv           = dga_director_scripted_deal_memo_produced_for_pay_tv,
               produced_for_home_video       = dga_director_scripted_deal_memo_produced_for_home_video,
               project_budget_more           = dga_director_scripted_deal_memo_project_budget_more,
               project_budget_less           = dga_director_scripted_deal_memo_project_budget_less,
               second_unit_director          = dga_director_scripted_deal_memo_second_unit_director,
               segment_applicable            = dga_director_scripted_deal_memo_segment_applicable,
               employer_name                 = dga_director_scripted_deal_memo_employer_name,
               employee_name                 = dga_director_scripted_deal_memo_employee_name,
               employee_date                 = dga_director_scripted_deal_memo_employee_date,
               signatory                     = dga_director_scripted_deal_memo_signatory,
               signatory_by                  = dga_director_scripted_deal_memo_signatory_by,
               signatory_date                = dga_director_scripted_deal_memo_signatory_date,
               created                       = dga_director_scripted_deal_memo_created,
               created_by                    = dga_director_scripted_deal_memo_created_by,
               updated                       = dga_director_scripted_deal_memo_updated,
               updated_by                    = dga_director_scripted_deal_memo_updated_by,
               status                        = 'UPDATED'
         WHERE id                            = dga_director_scripted_deal_memo_id;

         SET return_value = dga_director_scripted_deal_memo_id;
     END IF;

     COMMIT;
END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE dga_director_scripteddeal_memo_set_closed(
    IN dga_director_scripteddeal_memo_id                   INTEGER,
    IN dga_director_scripteddeal_memo_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE dga_director_scripteddeal_memo
       SET status     = 'CLOSED',
           updated_by = dga_director_scripteddeal_memo_updated_by
     WHERE id         = dga_director_scripteddeal_memo_id;
     COMMIT;

END //
DELIMITER ;

 DELIMITER //
CREATE PROCEDURE wga_work_list_set_list(
    IN  wga_work_list_id                INT,
    IN  wga_work_list_company_id        INT,
    IN  wga_work_list_company_number    INT,
    IN  wga_work_list_week_ending       INT,
    IN  wga_work_list_contact_id        INT,
    IN  wga_work_list_name              VARCHAR(50),
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
            company_number,
            week_ending,
            contact_id,
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_work_list_company_id,
            wga_work_list_company_number,
            wga_work_list_week_ending,
            wga_work_list_contact_id,
            wga_work_list_name,
            wga_work_list_created_by,
            wga_work_list_updated_by,
            wga_work_list_status,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_work_list
           SET company_id     = wga_work_list_company_id,
               company_number = wga_work_list_company_number,
               week_ending    = wga_work_list_week_ending,
               contact_id     = wga_work_list_contact_id,
               name           = wga_work_list_name,
               created        = wga_work_list_created,
               created_by     = wga_work_list_created_by,
               updated        = wga_work_list_updated,
               updated_by     = wga_work_list_updated_by,
               status         = 'UPDATED'
         WHERE id             = wga_work_list_id;

         SET return_value = wga_work_list_id;
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