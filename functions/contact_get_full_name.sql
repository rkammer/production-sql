DELIMITER //
CREATE FUNCTION contact_get_full_name(contact_id INT)
RETURNS VARCHAR(255)
BEGIN
    DECLARE wk_full_name VARCHAR(255);

    SELECT CASE WHEN TRIM(contact.middle_name) IS NULL
                  OR TRIM(contact.middle_name) = '' THEN
                  CASE WHEN TRIM(contact.suffix) IS NULL OR TRIM(contact.suffix) = '' THEN
                        CONCAT(TRIM(contact.first_name), ' ', TRIM(contact.last_name))
                  ELSE
                        CONCAT(TRIM(contact.first_name), ' ', TRIM(contact.last_name), ' ', TRIM(contact.suffix))
                  END
           ELSE
                  CASE WHEN TRIM(contact.suffix) IS NULL OR TRIM(contact.suffix) = '' THEN
                        CONCAT(TRIM(contact.first_name), ' ', TRIM(contact.middle_name), ' ', TRIM(contact.last_name))
                  ELSE
                        CONCAT(TRIM(contact.first_name), ' ', TRIM(contact.middle_name), ' ', TRIM(contact.last_name), ' ', TRIM(contact.suffix))

                  END
           END
           INTO wk_full_name
      FROM contact AS contact
     WHERE contact.id = contact_id;

     RETURN wk_full_name;

END //
DELIMITER ;