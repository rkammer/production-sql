DELIMITER //
CREATE PROCEDURE contact_role_set_list(
    IN  contact_role_id            INTEGER,
    IN  contact_role_name          VARCHAR(50),
    IN  contact_role_created_by    VARCHAR(30),
    IN  contact_role_updated_by    VARCHAR(30),
    OUT return_value               INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM contact_role
     WHERE id = contact_role_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO contact_role
        (
            name,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            contact_role_name,
            contact_role_created_by,
            contact_role_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE contact_role
           SET name       = contact_role_name,
               updated_by = contact_role_updated_by,
               status     = 'UPDATED'
         WHERE id         = contact_role_id;

        SET return_value = contact_role_id;
     END IF;

     COMMIT;
END //
DELIMITER ;