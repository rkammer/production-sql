DELIMITER //
CREATE PROCEDURE dga_employment_data_set_list(
    INOUT dga_employment_data_id                                  INT,
    IN    dga_employment_data_report_date                         DATE,
    IN    dga_employment_data_prepared_by                         VARCHAR(50),
    IN    dga_employment_data_quarter                             VARCHAR(10),
    IN    dga_employment_data_year                                YEAR,
    IN    dga_employment_data_company_id                          INT,
    IN    dga_employment_data_production_id                       INT,
    IN    dga_employment_data_director_name                       VARCHAR(50),
    IN    dga_employment_data_director_first_number               INT,
    IN    dga_employment_data_director_gender                     CHAR(1),
    IN    dga_employment_data_director_caucasion                  CHAR(1),
    IN    dga_employment_data_director_afro_american              CHAR(1),
    IN    dga_employment_data_director_latino                     CHAR(1),
    IN    dga_employment_data_director_native                     CHAR(1),
    IN    dga_employment_data_director_unknown                    CHAR(1),
    IN    dga_employment_data_unit_production_name                VARCHAR(50),
    IN    dga_employment_data_unit_production_gender              CHAR(1),
    IN    dga_employment_data_unit_production_caucasion           CHAR(1),
    IN    dga_employment_data_unit_production_afro_american       CHAR(1),
    IN    dga_employment_data_unit_production_latino              CHAR(1),
    IN    dga_employment_data_unit_production_native              CHAR(1),
    IN    dga_employment_data_unit_production_unknown             CHAR(1),
    IN    dga_employment_data_first_assistant_name                VARCHAR(50),
    IN    dga_employment_data_first_assistant_gender              CHAR(1),
    IN    dga_employment_data_first_assistant_caucasion           CHAR(1),
    IN    dga_employment_data_first_assistant_afro_american       CHAR(1),
    IN    dga_employment_data_first_assistant_latino              CHAR(1),
    IN    dga_employment_data_first_assistant_native              CHAR(1),
    IN    dga_employment_data_first_assistant_unknown             CHAR(1),
    IN    dga_employment_data_second_assistant_name               VARCHAR(50),
    IN    dga_employment_data_second_assistant_gender             CHAR(1),
    IN    dga_employment_data_second_assistant_caucasion          CHAR(1),
    IN    dga_employment_data_second_assistant_afro_american      CHAR(1),
    IN    dga_employment_data_second_assistant_latino             CHAR(1),
    IN    dga_employment_data_second_assistant_native             CHAR(1),
    IN    dga_employment_data_second_assistant_unknown            CHAR(1),
    IN    dga_employment_data_associate_assistant_name            VARCHAR(50),
    IN    dga_employment_data_associate_assistant_gender          CHAR(1),
    IN    dga_employment_data_associate_assistant_caucasion       CHAR(1),
    IN    dga_employment_data_associate_assistant_afro_american   CHAR(1),
    IN    dga_employment_data_associate_assistant_latino          CHAR(1),
    IN    dga_employment_data_associate_assistant_native          CHAR(1),
    IN    dga_employment_data_associate_assistant_unknown         CHAR(1),
    IN    dga_employment_data_stage_assistant_name                VARCHAR(50),
    IN    dga_employment_data_stage_assistant_gender              CHAR(1),
    IN    dga_employment_data_stage_assistant_caucasion           CHAR(1),
    IN    dga_employment_data_stage_assistant_afro_american       CHAR(1),
    IN    dga_employment_data_stage_assistant_latino              CHAR(1),
    IN    dga_employment_data_stage_assistant_native              CHAR(1),
    IN    dga_employment_data_stage_assistant_unknown             CHAR(1),
    IN    dga_employment_data_created_by                          VARCHAR(30),
    IN    dga_employment_data_updated_by                          VARCHAR(30)
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

        SET dga_employment_data_id = LAST_INSERT_ID();
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
     END IF;

     COMMIT;
END //
DELIMITER ;