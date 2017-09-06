DELIMITER //
CREATE PROCEDURE wga_ntwc_writing_credit_delete(
    IN wga_ntwc_writing_credit_id  INT,
    OUT return_value               INTEGER
)
BEGIN

    DELETE
      FROM wga_ntwc_writing_credit
     WHERE id = wga_ntwc_writing_credit_id;

    SET return_value = 0;

    COMMIT;
END //
DELIMITER ;