INSERT INTO production
(
    title,
    budget,
    writing_start_date,
    writing_end_date,
    pre_production_start_date,
    pre_production_end_date,
    photography_start_date,
    photography_end_date,
    post_production_start_date,
    post_production_end_date,
    network_production_start_date,
    network_production_end_date,
    production_length_id,
    network_id,
    production_type_id,
    production_company_id,
    payroll_company_id,
    logo_path,
    created_by,
    updated_by,
    status
)
VALUES
(
    'Production One',
    10000000.00,
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    3,
    1,
    3,
    2,
    4,
    NULL,
    'RKAMMER',
    'RKAMMER',
    'CREATED'
);

INSERT INTO season
(
    title,
    season_number,
    production_id,
    budget,
    writing_start_date,
    writing_end_date,
    pre_production_start_date,
    pre_production_end_date,
    photography_start_date,
    photography_end_date,
    post_production_start_date,
    post_production_end_date,
    network_production_start_date,
    network_production_end_date,
    logo_path,
    created_by,
    updated_by,
    status
)
VALUES
(
    'The First Season',
    1,
    1,
    10000000.00,
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    NULL,
    'RKAMMER',
    'RKAMMER',
    'CREATED'
);

INSERT INTO episode
(
    title,
    season_id,
    episode_number,
    budget,
    writing_start_date,
    writing_end_date,
    pre_production_start_date,
    pre_production_end_date,
    photography_start_date,
    photography_end_date,
    post_production_start_date,
    post_production_end_date,
    network_production_start_date,
    network_production_end_date,
    created_by,
    updated_by,
    status
)
VALUES
(
    'Pilot',
    1,
    1,
    10000000.00,
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    CURDATE(),
    DATE_ADD(CURDATE(), INTERVAL +7 DAY),
    'RKAMMER',
    'RKAMMER',
    'CREATED'
);

INSERT INTO dga_quarterly_earning
(quarter,
year,
company_id,
contact_id,
prepared_by,
phone,
created_by,
updated_by,
status)
VALUES
('First',
 2017,
 1,
 1,
 'Rodrigo Kammer',
 '805 405 8071',
 'RKAMMER',
 'RKAMMER',
 'CREATED');

INSERT INTO dga_quarterly_earning_item
(
    dga_quarterly_earning_id,
    name,
    ssn,
    category,
    production_id,
    earnings,
    created_by,
    updated_by,
    status
)
VALUES
(1,
 'Albert Melgoza',
 '615-75-8888',
 'Category II',
 1,
 1200000.00,
 'RKAMMER',
 'RKAMMER',
 'CREATED'
 );


 INSERT INTO dga_quarterly_earning
(quarter,
year,
company_id,
contact_id,
prepared_by,
phone,
created_by,
updated_by,
status)
VALUES
('Second',
 '2017',
 4,
 3,
 'Rodrigo Kammer',
 '805 405 8071',
 'RKAMMER',
 'RKAMMER',
 'CREATED');

 INSERT INTO dga_quarterly_earning_item
(
    dga_quarterly_earning_id,
    name,
    ssn,
    category,
    production_id,
    earnings,
    created_by,
    updated_by,
    status
)
VALUES
(2,
 'Albert Melgoza',
 '615-75-8888',
 'Category II',
 1,
 1200000.00,
 'RKAMMER',
 'RKAMMER',
 'CREATED'
 );

INSERT INTO dga_weekly_work
(
    production_id,
    episode_id,
    company_id,
    contact_id,
    week_start_date,
    week_end_date,
    created_by,
    updated_by,
    status
)
VALUES
(1,
 1,
 1,
 1,
 CURDATE(),
 DATE_ADD(CURDATE(), INTERVAL +7 DAY),
 'RKAMMER',
 'RKAMMER',
 'CREATED'
 );

 INSERT INTO dga_weekly_work_item
 (
    dga_weekly_work_id,
    name,
    ssn,
    category,
    created_by,
    updated_by,
    status
 )
 VALUES
 (
 1,
 'Rodrigo Kammer',
 '615-75-5698',
 'Category I',
 'RKAMMER',
 'RKAMMER',
 'CREATED'
 );