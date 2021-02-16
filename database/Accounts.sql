CREATE TABLE CLIENT
(
CLIENT_ID VARCHAR (20) CONSTRAINT PK_CLIENT_ID PRIMARY KEY,
FIRST_NAME VARCHAR (20),
LAST_NAME VARCHAR (20),
SOCIAL_SN BIGINT

);

CREATE TABLE ACCOUNT
(
CLIENT_ID VARCHAR (20) ,
ACCOUNT_ID VARCHAR (20) CONSTRAINT PK_ACCOUNT_ID PRIMARY KEY,
CREATEDATE DATE,

CONSTRAINT FK_CLIENT_ID_ACCOUNT
      FOREIGN KEY(CLIENT_ID)
	  REFERENCES CLIENT(CLIENT_ID)
);




INSERT INTO CLIENT(CLIENT_ID, FIRST_NAME, LAST_NAME, SOCIAL_SN)
VALUES
( 'B12456'	,'Brandi'	    ,'Savage'   ,'7854'    ),
( 'C22466'	,'Christopher'	,'Arnold'   ,'3049'    ),
( 'J12578'  ,'Jerry'        ,'Miranda'  , '4164'   ),
( 'D90606'  ,'Dustin'       ,'Castillo' , '5084'   ),
( 'J23334'  ,'Jack'         ,'Jones'    ,'5903'    ),
( 'E14559'	,'Emily'        ,'Young'    ,'2060'     ),
( 'L34355'  ,'Linda'        ,'Andrews'  ,'8742'	    ),
( 'W40699'	,'Wayne'        ,'Montoya'  ,'1936'     ),
( 'B58493'  ,'Brian'        ,'Howe'     ,'9693'	    ),
( 'M97368'	,'Mark'         ,'Morgan'   , '779'     );

INSERT INTO ACCOUNT(CLIENT_ID, ACCOUNT_ID,CREATEDATE)
VALUES
( 'B12456'	,'12286356'	    ,'2001-11-18'   ),
( 'C22466'	,'00000356'	    ,'1980-07-08'   ),
( 'D90606'  ,'00286356'     ,'1990-01-19'   ),
( 'J23334'  ,'00638932'     ,'1995-02-10'   ),
( 'L34355'  ,'02286356'     ,'2019-08-01'   ),
( 'W40699'	,'00000635'     ,'1972-03-27'   ),
( 'M97368'	,'22286356'     ,'2013-03-27'   );


