CREATE TABLE dim_account AS 
SELECT 
	`account_id`,
	`frequency`,
	`date`
FROM account;

CREATE TABLE dim_card AS
SELECT 
	`card_id`,
	`type`,
	`issued`
FROM card;

CREATE TABLE dim_client AS
SELECT 
	`client_id`,
	`birth_number`
FROM client;

CREATE TABLE dim_district AS
SELECT 
	`a1` as disctrict_id,
	`a2`,
	`a3`,
	`a4`,
	`a5`,
	`a6`,
	`a7`,
	`a8`,
	`a9`,
	`a10`,
	`a11`,
	`a12`,
	`a13`,
	`a14`,
	`a15`,
	`a16`
FROM district;

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

CREATE TABLE fact_trans AS 
SELECT 
	trans.trans_id,
	account.account_id,
	client.client_id,
	card.card_id ,
	client.district_id
FROM trans
JOIN account ON account.account_id = trans.account_id
JOIN disp ON trans.account_id = disp.account_id AND disp.type = 'OWNER'
JOIN client ON client.client_id = disp.client_id
JOIN card ON disp.disp_id = card.disp_id;