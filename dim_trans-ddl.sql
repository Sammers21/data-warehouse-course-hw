CREATE TABLE dim_trans as 
SELECT 
	`trans_id`,
	`date`,
	`type`,
	`operation`,
	`amount`,
	`balance`,
	`k_symbol`,
	`bank`,
	`account`
FROM trans;