DELIMITER //
CREATE PROCEDURE wga_ntwc_set_list(
    IN wga_ntwc_id                                     INT,
    IN wga_ntwc_date                                   DATE,
    IN wga_ntwc_production_id                          INT,
    IN wga_ntwc_production_number                      VARCHAR(30),
    IN wga_ntwc_episode_id                             INT,
    IN wga_ntwc_pilot                                  CHAR(1),
    IN wga_ntwc_pilot_network_id                       INT,
    IN wga_ntwc_pilot_production_lenght_id             INT,
    IN wga_ntwc_executive_producer_contact_id          INT,
    IN wga_ntwc_director_contact_id                    INT,
    IN wga_ntwc_story_editor_contact_id                INT,
    IN wga_ntwc_other_executive_producer_contact_id    INT,
    IN wga_ntwc_producer_contact_id                    INT,
    IN wga_ntwc_supervising_producer_contact_id        INT,
    IN wga_ntwc_sent_to_writers                        DATE,
    IN wga_ntwc_protest_communicated                   DATE,
    IN wga_ntwc_by_contact_id                          INT,
    IN wga_ntwc_created_by                             VARCHAR(30),
    IN wga_ntwc_updated_by                             VARCHAR(30),
    IN wga_ntwc_status                                 VARCHAR(30),
    OUT return_value            INTEGER
)
BEGIN
    DECLARE ROW_EXISTS INTEGER;

    SELECT COUNT(*)
      INTO ROW_EXISTS
      FROM wga_ntwc
     WHERE id = wga_ntwc_id;

     IF (ROW_EXISTS = 0) THEN
        INSERT INTO wga_ntwc
        (
            date,
            production_id,
            production_number,
            episode_id,
            pilot,
            pilot_network_id,
            pilot_production_lenght_id,
            executive_producer_contact_id,
            director_contact_id,
            story_editor_contact_id,
            other_executive_producer_contact_id,
            producer_contact_id,
            supervising_producer_contact_id,
            sent_to_writers,
            protest_communicated,
            by_contact_id,
            created_by,
            updated_by,
            status
        )
        VALUES
        (
            wga_ntwc_date,
            wga_ntwc_production_id,
            wga_ntwc_production_number,
            wga_ntwc_episode_id,
            wga_ntwc_pilot,
            wga_ntwc_pilot_network_id,
            wga_ntwc_pilot_production_lenght_id,
            wga_ntwc_executive_producer_contact_id,
            wga_ntwc_director_contact_id,
            wga_ntwc_story_editor_contact_id,
            wga_ntwc_other_executive_producer_contact_id,
            wga_ntwc_producer_contact_id,
            wga_ntwc_supervising_producer_contact_id,
            wga_ntwc_sent_to_writers,
            wga_ntwc_protest_communicated,
            wga_ntwc_by_contact_id,
            wga_ntwc_created_by,
            wga_ntwc_updated_by,
            'CREATED'
        );

        SET return_value = LAST_INSERT_ID();
     END IF;

     IF (ROW_EXISTS >= 1) THEN
        UPDATE wga_ntwc
           SET date                                = wga_ntwc_date,
               production_id                       = wga_ntwc_production_id,
               production_number                   = wga_ntwc_production_number,
               episode_id                          = wga_ntwc_episode_id,
               pilot                               = wga_ntwc_pilot,
               pilot_network_id                    = wga_ntwc_pilot_network_id,
               pilot_production_lenght_id          = wga_ntwc_pilot_production_lenght_id,
               executive_producer_contact_id       = wga_ntwc_executive_producer_contact_id,
               director_contact_id                 = wga_ntwc_director_contact_id,
               story_editor_contact_id             = wga_ntwc_story_editor_contact_id,
               other_executive_producer_contact_id = wga_ntwc_other_executive_producer_contact_id,
               producer_contact_id                 = wga_ntwc_producer_contact_id,
               supervising_producer_contact_id     = wga_ntwc_supervising_producer_contact_id,
               sent_to_writers                     = wga_ntwc_sent_to_writers,
               protest_communicated                = wga_ntwc_protest_communicated,
               by_contact_id                       = wga_ntwc_by_contact_id,
               created                             = wga_ntwc_created,
               created_by                          = wga_ntwc_created_by,
               updated                             = wga_ntwc_updated,
               updated_by                          = wga_ntwc_updated_by,
               status                              = 'UPDATED'
         WHERE id                                  = wga_ntwc_id;

        SET return_value = wga_ntwc_id;
     END IF;

     COMMIT;
END //
DELIMITER ;