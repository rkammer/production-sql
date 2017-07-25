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