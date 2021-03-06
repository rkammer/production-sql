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