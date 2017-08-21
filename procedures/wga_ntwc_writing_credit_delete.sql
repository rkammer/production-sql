DELIMITER //
CREATE PROCEDURE wga_ntwc_writing_credit_delete(
    IN wga_ntwc_writing_credit_wga_ntwc_id    INT,
    IN wga_ntwc_writing_credit_contact_id     INT,
    OUT return_value            INTEGER
)
BEGIN

    DELETE
      FROM wga_ntwc_writing_credit
     WHERE wga_ntwc_id = wga_ntwc_writing_credit_wga_ntwc_id
       AND contact_id  = wga_ntwc_writing_credit_contact_id;

    SET return_value = 0;

    COMMIT;
END //
DELIMITER ;