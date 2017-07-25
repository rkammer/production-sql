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