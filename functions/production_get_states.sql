DROP FUNCTION production_get_states;

DELIMITER //
CREATE FUNCTION production_get_states(production_id INT)
RETURNS VARCHAR(1024)
BEGIN
    DECLARE wk_finished INTEGER       DEFAULT 0;
    DECLARE wk_states   VARCHAR(1024) DEFAULT '';
    DECLARE wk_state    VARCHAR(50);

    DECLARE cr_states
     CURSOR FOR
     SELECT state.name
       FROM production_state AS production_state INNER JOIN state AS state ON state.code = production_state.state_code
      WHERE production_state.production_id = production_id;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET wk_finished = 1;

    OPEN cr_states;
    getStates: LOOP
        FETCH cr_states INTO wk_state;

        IF wk_finished = 1 THEN
            LEAVE getStates;
        END IF;

        IF wk_states = '' THEN
            SET wk_states = wk_state;
        ELSE
            SET wk_states = CONCAT(wk_states, ', ', wk_state);
        END IF ;

    END LOOP getStates;
    CLOSE cr_states;


    RETURN wk_states;

END //
DELIMITER ;