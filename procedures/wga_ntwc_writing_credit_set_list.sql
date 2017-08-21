DELIMITER //
CREATE PROCEDURE wga_ntwc_writing_credit_set_list(
    IN wga_ntwc_writing_credit_wga_ntwc_id    INT,
    IN wga_ntwc_writing_credit_contact_id     INT,
    IN wga_ntwc_writing_credit_created_by     VARCHAR(30),
    IN wga_ntwc_writing_credit_updated_by     VARCHAR(30),
    IN wga_ntwc_writing_credit_status         VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN

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

    SET return_value = 1;

    COMMIT;
END //
DELIMITER ;