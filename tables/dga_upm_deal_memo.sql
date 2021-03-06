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