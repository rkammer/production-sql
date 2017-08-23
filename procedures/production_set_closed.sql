DELIMITER //
CREATE PROCEDURE production_set_closed(
    IN  production_id                   INTEGER,
    IN  production_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE production
       SET status = 'CLOSED'
     WHERE id = production_id;

    COMMIT;
END //
DELIMITER ;