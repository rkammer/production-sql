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
    show_type_name                            VARCHAR(50),
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