DELIMITER //
CREATE PROCEDURE wga_ntwc_participant_writer_delete(
    IN wga_ntwc_participant_writer_id INT,
    OUT return_value                  INTEGER
)
BEGIN

    DELETE
      FROM wga_ntwc_participant_writer
     WHERE id = wga_ntwc_participant_writer_id;

    SET return_value = 0;

    COMMIT;
END //
DELIMITER ;