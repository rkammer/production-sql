DELIMITER //
CREATE PROCEDURE guild_set_list(
    IN guild_id            INT,
    IN guild_acronym       VARCHAR(50),
    IN guild_name          VARCHAR(150),
    IN guild_logo_path     VARCHAR(120),
    IN guild_created_by    VARCHAR(30),
    IN guild_updated_by    VARCHAR(30),
    IN guild_status        VARCHAR(30),
    OUT return_value       INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM guild
     WHERE id = guild_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO guild
        (
            acronym,
            name,
            logo_path,
            created,
            created_by,
            updated,
            updated_by,
            status
        )
        VALUES
        (
            guild_acronym,
            guild_name,
            guild_logo_path,
            guild_created,
            guild_created_by,
            guild_updated,
            guild_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE guild
           SET acronym    = guild_acronym,
               name       = guild_name,
               logo_path  = guild_logo_path,
               created_by = guild_created_by,
               updated_by = guild_updated_by,
               status     = 'UPDATED'
         WHERE id         = guild_id;

        SET return_value = guild_id;
     END IF;

     COMMIT;
END //
DELIMITER ;