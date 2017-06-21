DELIMITER //
CREATE PROCEDURE deal_type_set_list(
    INOUT deal_type_id              INTEGER,
    IN    deal_type_abreviation     CHAR(2),
    IN    deal_type_name            CHAR(50),
    IN    deal_type_created_by      VARCHAR(30),
    IN    deal_type_updated_by      VARCHAR(30),
    IN    deal_type_status          VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM deal_type
     WHERE id = deal_type_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO deal_type
        (
            abreviation,
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            deal_type_abreviation,
            deal_type_name,
            deal_type_created_by,
            deal_type_updated_by,
            'CREATED'
        );

        SET deal_type_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE deal_type
           SET abreviation   = abreviation,
               name          = name,
               updated_by    = updated_by,
               status        = 'UPDATED'
         WHERE id            = deal_type_id;
     END IF;

     COMMIT;
END //
DELIMITER ;