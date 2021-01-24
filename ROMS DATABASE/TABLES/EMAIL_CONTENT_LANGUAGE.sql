CREATE TABLE EMAIL_CONTENT_LANGUAGES
(
ID INT PRIMARY KEY,
EMAIL_CONTENT_ID INT,
LANGUGE_ID INT,
TITLE VARCHAR(100),
SUBJECT VARCHAR(100),
MESSAGE VARCHAR(500),
	CONSTRAINT FK_EMAIL_CONTENT FOREIGN KEY(EMAIL_CONTENT_ID) REFERENCES EMAIL_CONTENT(ID),
	CONSTRAINT FK_LANGUAGE FOREIGN KEY(LANGUGE_ID) REFERENCES LANGUAGE(ID)
)