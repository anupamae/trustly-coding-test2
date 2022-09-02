WITH T4 AS (
	SELECT *
	FROM (
		SELECT T1.bankaccountid, T1.userid, T1.balance, COALESCE(T2.cnt, 0) ndeposits
		FROM public.bankaccounts T1
		LEFT JOIN (
			SELECT bankaccountid,
			COUNT(*) cnt
			FROM public.bankdeposits
			GROUP BY bankaccountid
		) T2
		ON T2.bankaccountid = T1.bankaccountid
		GROUP BY T1.bankaccountid, ndeposits
	) T3
	GROUP BY T3.bankaccountid, T3.userid, T3.balance, T3.ndeposits
)
(SELECT * FROM T4 ORDER BY T4.ndeposits DESC LIMIT 1)
UNION ALL
(SELECT * FROM T4 ORDER BY T4.ndeposits ASC LIMIT 1);
