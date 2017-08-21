DELIMITER //
CREATE PROCEDURE wga_ntwc_participant_writer_delete(
    IN wga_ntwc_participant_writer_wga_ntwc_id    INT,
    IN wga_ntwc_participant_writer_contact_id     INT,
    OUT return_value            INTEGER
)
BEGIN

    DELETE
      FROM wga_ntwc_participant_writer
     WHERE wga_ntwc_id = wga_ntwc_participant_writer_wga_ntwc_id
       AND contact_id  = wga_ntwc_participant_writer_contact_id;

    SET return_value = 0;

    COMMIT;
END //
DELIMITER ;