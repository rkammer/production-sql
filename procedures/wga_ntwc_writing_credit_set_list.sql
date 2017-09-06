DELIMITER //
CREATE PROCEDURE wga_ntwc_writing_credit_set_list(
    IN wga_ntwc_writing_credit_id            INT,
    IN wga_ntwc_writing_credit_wga_ntwc_id   INT,
    IN wga_ntwc_writing_credit_contact_id    INT,
    IN wga_ntwc_writing_credit_created_by    VARCHAR(30),
    IN wga_ntwc_writing_credit_updated_by    VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_ntwc_writing_credit
     WHERE id = wga_ntwc_writing_credit_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_ntwc_writing_credit
        (
            wga_ntwc_id,
            contact_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_ntwc_writing_credit_wga_ntwc_id,
            wga_ntwc_writing_credit_contact_id,
            wga_ntwc_writing_credit_created_by,
            wga_ntwc_writing_credit_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_ntwc_writing_credit
           SET wga_ntwc_id = wga_ntwc_writing_credit_wga_ntwc_id,
               contact_id  = wga_ntwc_writing_credit_contact_id,
               created_by  = wga_ntwc_writing_credit_created_by,
               updated_by  = wga_ntwc_writing_credit_updated_by,
               status      = 'UPDATED'
         WHERE id          = wga_ntwc_writing_credit_id;

        SET return_value = wga_ntwc_writing_credit_id;
     END IF;

     COMMIT;
END //
DELIMITER ;