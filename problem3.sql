SELECT T1.bankaccountid, T1.bankdepositid, T1.amount
FROM (SELECT bankdeposits.*,
	  RANK() OVER (PARTITION BY bankaccountid ORDER BY amount DESC)
	  FROM public.bankdeposits) T1
WHERE RANK <=3;
