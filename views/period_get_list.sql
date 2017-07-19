CREATE OR REPLACE VIEW period_get_list(
    period_id,
    period_name,
    period_period,
    period_plural,
    period_created,
    period_created_by,
    period_updated,
    period_updated_by,
    period_status
) AS
    SELECT period.id                                            AS period_id,
           period.name                                          AS period_name,
           period.period                                        AS period_period,
           period.plural                                        AS period_plural,
           DATE_FORMAT(period.created,'%m/%d/%Y %H:%i:%S')      AS period_created,
           period.created_by                                    AS period_created_by,
           DATE_FORMAT(period.updated,'%m/%d/%Y %H:%i:%S')      AS period_updated,
           period.updated_by                                    AS period_updated_by,
           period.status                                        AS period_status
      FROM period AS period;