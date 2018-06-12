CREATE TABLE pdrankov.fact_trans AS (
	SELECT 
		trans.trans_id,
		account.account_id,
		client.client_id,
		disp.disp_id,
		card.card_id 
	FROM pdrankov.trans
	JOIN pdrankov.account ON account.account_id = trans.account_id
	JOIN pdrankov.disp ON trans.account_id = disp.account_id AND disp.type = 'OWNER'
	JOIN pdrankov.client ON client.client_id = disp.client_id
	JOIN pdrankov.card ON disp.disp_id = card.disp_id
);


/* DIFFERENT WAY TO DO THE SAME: */
INSERT INTO pdrankov.fact_trans (trans_id, account_id, client_id, disp_id, card_id)
SELECT 
	trans.trans_id,
	account.account_id,
	client.client_id,
	disp.disp_id,
	card.card_id 
FROM pdrankov.trans
JOIN pdrankov.account ON account.account_id = trans.account_id
JOIN pdrankov.disp ON trans.account_id = disp.account_id AND disp.type = 'OWNER'
JOIN pdrankov.client ON client.client_id = disp.client_id
JOIN pdrankov.card ON disp.disp_id = card.disp_id;