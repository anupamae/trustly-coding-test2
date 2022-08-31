BEGIN;

\i schema.sql

INSERT INTO Users (UserID) SELECT 100+i*10 FROM generate_series(0, 5) i;

INSERT INTO BankAccounts
VALUES
    (50, 100, 100.0),
    (51, 110, 50.0),
    (52, 110, 40.0),
    (53, 140, -20.0),
    (54, 130, 20.0),
    (55, 130, 0.0)
    ;

INSERT INTO BankDeposits
VALUES
    (1, 50, 100, 50.0, now() - interval '1 day'),
    (2, 51, 100, 55.0, now() - interval '3 days'),
    (3, 52, 100, 51.0, now() - interval '3 days 1 hour'),
    (4, 54, 100, 52.0, now() - interval '3 days 2 hours'),
    (5, 54, 100, 53.0, now() - interval '3 days 3 hours'),
    (6, 53, 110, 101.0, now() - interval '2 weeks'),
    (7, 53, 110, 120.0, now() - interval '2 weeks 1 day'),
    (8, 51, 110, 130.0, now() - interval '2 weeks 1 hour'),
    (9, 52, 140, 61.0, now() - interval '2 weeks 3 hours'),
    (10, 52, 140, 67.0, now() - interval '2 weeks 2 hours'),
    (11, 54, 140, 64.0, now() - interval '2 weeks 15 minutes'),
    (12, 51, 140, 62.0, now() - interval '2 weeks 90 minutes'),
    (13, 50, 130, 23.0, now() - interval '7 hours 15 minutes'),
    (14, 52, 130, 21.0, now() - interval '7 hours 1 minute'),
    (15, 52, 130, 29.0, now() - interval '7 hours 12 minutes'),
    (16, 53, 130, 24.0, now() - interval '7 hours 9 minutes'),
    (17, 54, 130, 25.0, now() - interval '7 hours 10 minutes')
    ;

COMMIT;
