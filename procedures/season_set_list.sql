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