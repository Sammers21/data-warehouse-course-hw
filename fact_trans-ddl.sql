CREATE TABLE fact_trans AS (
	SELECT 
		trans.trans_id,
		account.account_id,
		client.client_id,
		disp.disp_id,
		card.card_id 
	FROM trans
	JOIN account ON account.account_id = trans.account_id
	JOIN disp ON trans.account_id = disp.account_id AND disp.type = 'OWNER'
	JOIN client ON client.client_id = disp.client_id
	JOIN card ON disp.disp_id = card.disp_id
)