INSERT INTO production_type
(name,created_by,updated_by,status)
VALUES
('Fully Scripted',   'RKAMMER', 'RKAMMER', 'CREATED'),
('Comedy-Variety',   'RKAMMER', 'RKAMMER', 'CREATED'),
('Scripted',         'RKAMMER', 'RKAMMER', 'CREATED'),
('Semi-Scripted',    'RKAMMER', 'RKAMMER', 'CREATED'),
('Reality',          'RKAMMER', 'RKAMMER', 'CREATED'),
('Non-Dramatic',     'RKAMMER', 'RKAMMER', 'CREATED'),
('Stand-Up Special', 'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO production_length
(name, created_by, updated_by, status)
VALUES
('15 Mins or Less', 'RKAMMER', 'RKAMMER', 'CREATED'),
('15-30 Mins',      'RKAMMER', 'RKAMMER', 'CREATED'),
('31-60 Mins',      'RKAMMER', 'RKAMMER', 'CREATED'),
('61-75 Mins',      'RKAMMER', 'RKAMMER', 'CREATED'),
('76-90 Mins',      'RKAMMER', 'RKAMMER', 'CREATED'),
('91-120 Mins',     'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO state
(code, name, created_by, updated_by, status)
VALUES
('AL', 'Alabama',              'RKAMMER', 'RKAMMER', 'CREATED'),
('AK', 'Alaska',               'RKAMMER', 'RKAMMER', 'CREATED'),
('AZ', 'Arizona',              'RKAMMER', 'RKAMMER', 'CREATED'),
('AR', 'Arkansas',             'RKAMMER', 'RKAMMER', 'CREATED'),
('CA', 'California',           'RKAMMER', 'RKAMMER', 'CREATED'),
('CO', 'Colorado',             'RKAMMER', 'RKAMMER', 'CREATED'),
('CT', 'Connecticut',          'RKAMMER', 'RKAMMER', 'CREATED'),
('DE', 'Delaware',             'RKAMMER', 'RKAMMER', 'CREATED'),
('DC', 'District of Columbia', 'RKAMMER', 'RKAMMER', 'CREATED'),
('FL', 'Florida',              'RKAMMER', 'RKAMMER', 'CREATED'),
('GA', 'Georgia',              'RKAMMER', 'RKAMMER', 'CREATED'),
('HI', 'Hawaii',               'RKAMMER', 'RKAMMER', 'CREATED'),
('ID', 'Idaho',                'RKAMMER', 'RKAMMER', 'CREATED'),
('IL', 'Illinois',             'RKAMMER', 'RKAMMER', 'CREATED'),
('IN', 'Indiana',              'RKAMMER', 'RKAMMER', 'CREATED'),
('IA', 'Iowa',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('KS', 'Kansas',               'RKAMMER', 'RKAMMER', 'CREATED'),
('KY', 'Kentucky',             'RKAMMER', 'RKAMMER', 'CREATED'),
('LA', 'Louisiana',            'RKAMMER', 'RKAMMER', 'CREATED'),
('ME', 'Maine',                'RKAMMER', 'RKAMMER', 'CREATED'),
('MD', 'Maryland',             'RKAMMER', 'RKAMMER', 'CREATED'),
('MA', 'Massachusetts',        'RKAMMER', 'RKAMMER', 'CREATED'),
('MI', 'Michigan',             'RKAMMER', 'RKAMMER', 'CREATED'),
('MN', 'Minnesota',            'RKAMMER', 'RKAMMER', 'CREATED'),
('MS', 'Mississippi',          'RKAMMER', 'RKAMMER', 'CREATED'),
('MO', 'Missouri',             'RKAMMER', 'RKAMMER', 'CREATED'),
('MT', 'Montana',              'RKAMMER', 'RKAMMER', 'CREATED'),
('NE', 'Nebraska',             'RKAMMER', 'RKAMMER', 'CREATED'),
('NV', 'Nevada',               'RKAMMER', 'RKAMMER', 'CREATED'),
('NH', 'New Hampshire',        'RKAMMER', 'RKAMMER', 'CREATED'),
('NJ', 'New Jersey',           'RKAMMER', 'RKAMMER', 'CREATED'),
('NM', 'New Mexico',           'RKAMMER', 'RKAMMER', 'CREATED'),
('NY', 'New York',             'RKAMMER', 'RKAMMER', 'CREATED'),
('NC', 'North Carolina',       'RKAMMER', 'RKAMMER', 'CREATED'),
('ND', 'North Dakota',         'RKAMMER', 'RKAMMER', 'CREATED'),
('OH', 'Ohio',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('OK', 'Oklahoma',             'RKAMMER', 'RKAMMER', 'CREATED'),
('OR', 'Oregon',               'RKAMMER', 'RKAMMER', 'CREATED'),
('PA', 'Pennsylvania',         'RKAMMER', 'RKAMMER', 'CREATED'),
('PR', 'Puerto Rico',          'RKAMMER', 'RKAMMER', 'CREATED'),
('RI', 'Rhode Island',         'RKAMMER', 'RKAMMER', 'CREATED'),
('SC', 'South Carolina',       'RKAMMER', 'RKAMMER', 'CREATED'),
('SD', 'South Dakota',         'RKAMMER', 'RKAMMER', 'CREATED'),
('TN', 'Tennessee',            'RKAMMER', 'RKAMMER', 'CREATED'),
('TX', 'Texas',                'RKAMMER', 'RKAMMER', 'CREATED'),
('UT', 'Utah',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('VT', 'Vermont',              'RKAMMER', 'RKAMMER', 'CREATED'),
('VA', 'Virginia',             'RKAMMER', 'RKAMMER', 'CREATED'),
('VI', 'Virgin Islands',       'RKAMMER', 'RKAMMER', 'CREATED'),
('WA', 'Washington',           'RKAMMER', 'RKAMMER', 'CREATED'),
('WV', 'West Virginia',        'RKAMMER', 'RKAMMER', 'CREATED'),
('WI', 'Wisconsin',            'RKAMMER', 'RKAMMER', 'CREATED'),
('WY', 'Wyoming',              'RKAMMER', 'RKAMMER', 'CREATED');


-- INSERT INTO deal_type
-- (abreviation, name, created_by, updated_by, status)
-- VALUES
-- ('FD', 'Flat Deal',                 'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('ST', 'Staff',                     'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('SL', 'Sale of Literary Material', 'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('OP', 'Option',                    'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('',   'Unknown',                   'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO company
(name, address, city, state_code, phone, website, logo_path, media_company, production_company, payroll_company, created_by, updated_by, status)
VALUES
('Media Company I',       NULL, NULL, 'CA', NULL, NULL, NULL, 'T', 'F', 'F', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Production Company I',  NULL, NULL, 'CA', NULL, NULL, NULL, 'F', 'T', 'F', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Production Company II', NULL, NULL, 'CA', NULL, NULL, NULL, 'F', 'T', 'F', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Payroll Company I',     NULL, NULL, 'CA', NULL, NULL, NULL, 'F', 'F', 'T', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Payroll Company II',    NULL, NULL, 'CA', NULL, NULL, NULL, 'F', 'F', 'T', 'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO network
(name, media_company_id, logo_path, created_by, updated_by, status)
VALUES
('Network One',   1, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Network Two',   1, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Network Three', 1, NULL, 'RKAMMER', 'RKAMMER', 'CREATED');

-- INSERT INTO dga_quarter
-- (name, description, created_by, updated_by, status)
-- VALUES
-- ('1st', 'First Quarter',   'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('2nd', 'Second Quarter',  'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('3rd', 'Third  Quarter',  'RKAMMER', 'RKAMMER', 'CREATED'),
-- ('4st', 'Fourth Quarter',  'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO contact
(first_name, middle_name, last_name, suffix, address, city, state_code, phone, email, website, picture_path, created_by, updated_by, status)
VALUES
('James',     'J.', 'Zavala',    '',    '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_one@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Lois',      'L.', 'Mera',      'Jr.', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_two@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Nina',      '',   'Blanchard', '',    '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_three@level.com', NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED'),
('Blanchard', 'J.', 'Layman',    'Sr.', '341 Hyram St.', 'Oxnard', 'CA', '805 555 8080', 'person_for@level.com',   NULL, NULL, 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO company_contact
(company_id, contact_id, created_by, updated_by, status)
VALUES
(1, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(1, 2, 'RKAMMER', 'RKAMMER', 'CREATED'),
(1, 3, 'RKAMMER', 'RKAMMER', 'CREATED'),
(1, 4, 'RKAMMER', 'RKAMMER', 'CREATED'),
(3, 1, 'RKAMMER', 'RKAMMER', 'CREATED'),
(4, 3, 'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO period
(name, period, plural, created_by, updated_by, status)
VALUES
('day',   'daily',   'days',   'RKAMMER', 'RKAMMER', 'CREATED'),
('week',  'weekly',  'weeks',  'RKAMMER', 'RKAMMER', 'CREATED'),
('month', 'monthly', 'months', 'RKAMMER', 'RKAMMER', 'CREATED'),
('year',  'yearly',  'years',  'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO media_type
(name, created_by, updated_by, status)
VALUES
('Network or FBC', 'RKAMMER', 'RKAMMER', 'CREATED'),
('Non-Network',    'RKAMMER', 'RKAMMER', 'CREATED'),
('Basic Cable',    'RKAMMER', 'RKAMMER', 'CREATED'),
('Pay TV',         'RKAMMER', 'RKAMMER', 'CREATED'),
('Videodisc/Videocassete', 'RKAMMER', 'RKAMMER', 'CREATED');

INSERT INTO wga_deal_type
(code, title, created_by, updated_by, status)
VALUES
('FD', 'Flat Deal',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('ST', 'Staff',                     'RKAMMER', 'RKAMMER', 'CREATED'),
('SL', 'Sale of Literary Material', 'RKAMMER', 'RKAMMER', 'CREATED'),
('OP', 'Option',                    'RKAMMER', 'RKAMMER', 'CREATED'),
(NULL, 'Unknown',                   'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO wga_field_of_work
(code, title, created_by, updated_by, status)
VALUES
('S',  'Screen',                'RKAMMER', 'RKAMMER', 'CREATED'),
('T',  'Television',            'RKAMMER', 'RKAMMER', 'CREATED'),
('R',  'Radio',                 'RKAMMER', 'RKAMMER', 'CREATED'),
('Z',  'TV News/Promo',         'RKAMMER', 'RKAMMER', 'CREATED'),
('P',  'Pay TV/VD/VC',          'RKAMMER', 'RKAMMER', 'CREATED'),
('W',  'New Media',             'RKAMMER', 'RKAMMER', 'CREATED'),
('A',  'Animation Television',  'RKAMMER', 'RKAMMER', 'CREATED'),
('B',  'Animation Screen',      'RKAMMER', 'RKAMMER', 'CREATED'),
('I',  'Informational',         'RKAMMER', 'RKAMMER', 'CREATED'),
('N',  'Interactive',           'RKAMMER', 'RKAMMER', 'CREATED'),
(NULL, 'Unknown',               'RKAMMER', 'RKAMMER', 'CREATED');


INSERT INTO guild
(acronym, name, created_by, updated_by, status)
VALUES
('SAG-AFTRA', 'Screen Actors Guild‐American Federation of Television and Radio Artists', 'RKAMMER', 'RKAMMER', 'CREATED'),
('WGA',       'Writers Guild of America',                                                'RKAMMER', 'RKAMMER', 'CREATED'),
('IATSE',     'The International Alliance of Theatrical Stage Employees',                'RKAMMER', 'RKAMMER', 'CREATED'),
('AFM',       'American Federations of Musicians',                                       'RKAMMER', 'RKAMMER', 'CREATED'),
('Teamsters', 'Teamsters',                                                               'RKAMMER', 'RKAMMER', 'CREATED'),
('DGA',       'Directors Guild of America',                                              'RKAMMER', 'RKAMMER', 'CREATED');