WITH T1 AS (
	SELECT DISTINCT ON (bankdepositid) bankdepositid, 
	bankaccountid, 
	userid, 
	ABS(EXTRACT(EPOCH FROM (datestamp - LAG(datestamp, 1) OVER (PARTITION BY bankaccountid ORDER BY userid ASC)))) AS delta 
	FROM public.bankdeposits
	ORDER BY bankdepositid, delta DESC
)
(SELECT bankdepositid, bankaccountid, userid FROM T1 WHERE delta < 1800)
