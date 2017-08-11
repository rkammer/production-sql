ALTER TABLE dga_director_scripted_deal_memo DROP COLUMN television_license_director;
ALTER TABLE dga_director_scripted_deal_memo DROP COLUMN television_license_budget;

ALTER TABLE dga_director_scripted_deal_memo ADD COLUMN produced_non_network_prime_time       CHAR(1) DEFAULT 'F' AFTER produced_for_home_video;
ALTER TABLE dga_director_scripted_deal_memo ADD COLUMN produced_non_network_non_prime_time   CHAR(1) DEFAULT 'F' AFTER produced_non_network_prime_time;

ALTER TABLE dga_director_scripted_deal_memo ADD COLUMN individual_final_cut_authority VARCHAR(50) AFTER segment_applicable;
ALTER TABLE dga_director_scripted_deal_memo ADD COLUMN other_conditions               VARCHAR(50) AFTER individual_final_cut_authority;

