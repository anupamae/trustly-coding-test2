SELECT DISTINCT T1.bankaccountid, COALESCE(T2.cnt1, 0) count, COALESCE(T2.cnt2, 0) count
FROM public.bankaccounts T1
LEFT JOIN (
    SELECT bankaccountid,
    COUNT(*) cnt1,
    COUNT(DISTINCT CASE WHEN amount > 50 THEN amount END) cnt2
    FROM public.bankdeposits
    GROUP BY bankaccountid
) T2
ON T2.bankaccountid = T1.bankaccountid
ORDER BY bankaccountid;
