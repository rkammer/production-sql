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