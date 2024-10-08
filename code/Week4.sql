CREATE TABLE char_date_types(
	char_column char(10),
	varchar_column varchar(10),
	text_column text
);
INSERT INTO char_date_types
VALUES
	('abc', 'abc','abc'),
	('dafgij','dafgij','dafgij');

SELECT * FROM char_date_types;


CREATE TABLE num_date_types(
	numeric_column numeric (20,5),
	real_column real,
	double_column double precision
);

INSERT INTO num_date_types
VALUES
	(.7, .7, .7),
	(2.13579, 2.13579, 2.13579),
	(2.1357987654321,2.1357987654321,2.1357987654321);

SELECT * FROM num_date_types;



CREATE TABLE date_time_types(
	timestamp_col timestamp with time zone, 
	interval_col interval
);

INSERT INTO date_time_types
VALUES
	('2024-09-24 12:10 KST','2day'),
	('2024-10-01 08:00 +9 ', '1 month'),
	('2024-10-31 00:00 Australia/Melbourne', '1 century'),
	(now(), '1 week');

SELECT 
	timestamp_col,
	interval_col,
	timestamp_col - interval_col AS new_date

FROM date_time_types;

--CAST 함수()
SELECT timestamp_col, CAST(timestamp_col AS varchar(10))
FROM date_time_types;

SELECT numeric_column,
	CAST(numeric_column AS intager),
	CAST(numeric_column AS text)
FROM num_date_types;
