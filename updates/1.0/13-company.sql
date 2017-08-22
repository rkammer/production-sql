ALTER TABLE company ADD COLUMN wga_company_number VARCHAR(50) AFTER logo_path;

UPDATE company
   SET wga_company_number = 'AAA12345'
 WHERE media_company      = 'T';