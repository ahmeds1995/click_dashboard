// Data Cleaning

// Replace the INR with INR\r in currency column in transactions table
set SQL_SAFE_UPDATES = 0;
update transactions
set currency = "INR\r"
where currency = "INR";

// Replace the USD with USD\r in currency column in transactions table
set SQL_SAFE_UPDATES = 0;
update transactions
set currency = "USD\r"
where currency = "USD";

// Normalize the sales_amount column in transactions table to INR
set SQL_SAFE_UPDATES = 0;
update transactions
set sales_amount = sales_amount * 75
where currency = "USD\r";

// Normalize the currency column in transactions table to INR
set SQL_SAFE_UPDATES = 0;
update transactions
set currency = "INR\r"
where currency = "USD\r";

// Delete sales_amount that are less than or equal to 0, since it do not make sense
delete from transactions
where sales_amount <= 0;

