DELIMITER //
CREATE PROCEDURE dga_director_scripteddeal_memo_set_closed(
    IN dga_director_scripteddeal_memo_id                   INTEGER,
    IN dga_director_scripteddeal_memo_updated_by           VARCHAR(30)
)
BEGIN

    UPDATE dga_director_scripteddeal_memo
       SET status     = 'CLOSED',
           updated_by = dga_director_scripteddeal_memo_updated_by
     WHERE id         = dga_director_scripteddeal_memo_id;
     COMMIT;

END //
DELIMITER ;