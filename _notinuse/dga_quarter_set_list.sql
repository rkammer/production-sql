DELIMITER //
CREATE PROCEDURE dga_quarter_set_list(
    INOUT dga_quarter_id                   INTEGER,
    IN    dga_quarter_name                 CHAR(3),
    IN    dga_quarter_description          VARCHAR(30),
    IN    dga_quarter_created_by           VARCHAR(30),
    IN    dga_quarter_updated_by           VARCHAR(30)
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM dga_quarter
     WHERE id = dga_quarter_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO dga_quarter
        (
            name,
            description,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            dga_quarter_name,
            dga_quarter_description,
            dga_quarter_created_by,
            dga_quarter_updated_by,
            'CREATED'
        );

        SET dga_quarter_id = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE dga_quarter
           SET name               =    dga_quarter_name,
               description        =    dga_quarter_description,
               updated_by         =    dga_quarter_updated_by,
               status             =    'UPDATED'
         WHERE id                 =    dga_quarter_id;
     END IF;

     COMMIT;
END //
DELIMITER ;