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