LOAD DATA
INFILE 'cookies.dat'
TRUNCATE
INTO TABLE COOKIES
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
    Id          ,
    Name        TERMINATED BY WHITESPACE "UPPER(:Name)",
    Mark        POSITION(19:27) DECIMAL EXTERNAL "ROUND(:Mark, 2)",
    Production    POSITION(33) DATE "dd-mm-yyyy"
)