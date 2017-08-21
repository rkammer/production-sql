CREATE OR REPLACE VIEW production_state_get_list(
    production_state_production_id,
    production_state_state_code,
    production_state_state_name,
    production_state_created,
    production_state_created_by,
    production_state_updated,
    production_state_updated_by,
    production_state_status
) AS
SELECT production_state.production_id                                  AS production_state_production_id,
       production_state.state_code                                     AS production_state_state_code,
       state.name                                                      AS production_state_state_name,
       DATE_FORMAT(production_state.created,'%m/%d/%Y %H:%i:%S')       AS production_state_created,
       production_state.created_by                                     AS production_state_created_by,
       DATE_FORMAT(production_state.updated,'%m/%d/%Y %H:%i:%S')       AS production_state_updated,
       production_state.updated_by                                     AS production_state_updated_by,
       production_state.status                                         AS production_state_status
  FROM production_state AS production_state INNER JOIN state AS state ON state.code = production_state.state_code;