CREATE TABLE Users
(
    UserID integer,

    PRIMARY KEY (userid)
);

CREATE TABLE BankAccounts
(
    BankAccountID integer,
    -- the owner of this bank account
    UserID integer NOT NULL REFERENCES Users,
    Balance numeric NOT NULL,

    PRIMARY KEY (BankAccountID)
);

CREATE TABLE BankDeposits
(
    BankDepositID integer,
    -- bank account the money was deposited to
    BankAccountID integer NOT NULL REFERENCES BankAccounts,
    -- user who deposited the money
    UserID integer NOT NULL REFERENCES Users,
    Amount numeric NOT NULL,
    Datestamp timestamp with time zone NOT NULL DEFAULT now(),

    PRIMARY KEY (BankDepositID)
);


COMMENT ON COLUMN BankAccounts.UserID IS 'the owner of this bank account';
COMMENT ON COLUMN BankDeposits.BankAccountID IS 'bank account the money was deposited to';
COMMENT ON COLUMN BankDeposits.UserID IS 'user who deposited the money';

