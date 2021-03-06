Create database Airbnb_Booking
use Airbnb_Booking
CREATE TABLE ROOM_TYPE
(
ID INT PRIMARY KEY,
NAME NVARCHAR(100),
ICON_IMAGE varchar(max),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE CATEGORIES
(
ID INT PRIMARY KEY,
NAME NVARCHAR(500),
DESCRIPTION NVARCHAR(MAX),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE SUBCATEGORIES
(
ID INT PRIMARY KEY,
CATEGORY_ID INT,
NAME NVARCHAR(500),
DESCRIPTION VARCHAR(MAX),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT,
	CONSTRAINT FK_CATEGORY FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORIES(ID)
)

CREATE TABLE CMS_PAGES
(
ID INT PRIMARY KEY,
UNIQUE_NAME NVARCHAR(500),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE PROPERTY_TYPE
(
ID INT PRIMARY KEY,
NAME NVARCHAR(500),
ICON_IMAGE varchar(max),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE COUNTRIES
(
ID INT PRIMARY KEY,
NAME NVARCHAR(200),
CODE NVARCHAR(10),
STATUS TINYINT
)

CREATE TABLE AMENITIES
(
ID INT PRIMARY KEY,
NAME NVARCHAR(200),
ICON_IMAGE VARCHAR(MAX),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE STATES
(
ID INT PRIMARY KEY,
COUNTRY_ID INT,
NAME NVARCHAR(200),
CODE NVARCHAR(20),
STATUS TINYINT,
	CONSTRAINT FK_COUNTRY FOREIGN KEY(COUNTRY_ID) REFERENCES COUNTRIES(ID)
)

CREATE TABLE LANGUAGE
(
ID INT PRIMARY KEY,
NAME NVARCHAR(200),
CODE NVARCHAR(20),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE CURRENCIES
(
ID INT PRIMARY KEY,
NAME VARCHAR(200),
ICON_IMAGE VARCHAR(MAX),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE CITIES
(
ID INT PRIMARY KEY,
STATE_ID INT,
NAME NVARCHAR(200),
STATUS TINYINT,
	CONSTRAINT FK_STATE FOREIGN KEY(STATE_ID) REFERENCES STATES(ID)
)

CREATE TABLE EMAIL_CONTENT
(
ID INT PRIMARY KEY,
UNIQUE_NAME NVARCHAR(200),
KEYWORDS NVARCHAR(MAX),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE EMAIL_CONTENT_LANGUAGES
(
ID INT PRIMARY KEY,
EMAIL_CONTENT_ID INT,
LANGUGE_ID INT,
TITLE NVARCHAR(100),
SUBJECT NVARCHAR(100),
MESSAGE NVARCHAR(500),
	CONSTRAINT FK_EMAIL_CONTENT FOREIGN KEY(EMAIL_CONTENT_ID) REFERENCES EMAIL_CONTENT(ID),
	CONSTRAINT FK_LANGUAGE FOREIGN KEY(LANGUGE_ID) REFERENCES LANGUAGE(ID)
)

CREATE TABLE ADDRESS
(
ID INT PRIMARY KEY,
ADDRESS NVARCHAR(500),
LATITUDE NVARCHAR(200),
LONGTITUDE NVARCHAR(200),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE PROMO_CODES
(
ID INT PRIMARY KEY,
NAME NVARCHAR(200),
DESCRIPTION NVARCHAR(MAX),
CODE VARCHAR(10),
DISCOUNT FLOAT,
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
)

CREATE TABLE ROOM_DETAIL
(
ID INT PRIMARY KEY,
BEDROOM_COUNT INT,
BED_COUNT INT,
BATHROOM_COUNT INT,
ACCOMODATES_COUNT INT,
CREATED DATETIME,
MODIFIED DATETIME
)

CREATE TABLE LOGIN_WITH
(
ID TINYINT PRIMARY KEY,
NAME VARCHAR(50)
)

CREATE TABLE USER_TYPE
(
ID TINYINT PRIMARY KEY,
NAME VARCHAR(50)
)

CREATE TABLE PRICE_TYPE
(
ID TINYINT PRIMARY KEY,
NAME VARCHAR(50)
)

CREATE TABLE USERS
(
ID INT PRIMARY KEY,
FIRST_NAME NVARCHAR(200),
LAST_NAME NVARCHAR(200),
EMAIL NVARCHAR(200),
PASSWORD NVARCHAR(10),
USER_TYPE_ID TINYINT,
BIRTHDAY DATE,
GENDER CHAR(5),
LOGIN_WITH_ID TINYINT,
PHONE CHAR(12),
RECEIVE_COUPON INT,
COUNTRY_ID INT,
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT,
LANGUAGE_ID INT
	CONSTRAINT FK_USER_TYPE FOREIGN KEY(USER_TYPE_ID) REFERENCES USER_TYPE(ID),
	CONSTRAINT FK_LOGIN_WITH FOREIGN KEY(LOGIN_WITH_ID) REFERENCES LOGIN_WITH(ID),
	CONSTRAINT FK_COUNTRY_2 FOREIGN KEY(COUNTRY_ID) REFERENCES COUNTRIES(ID),
	CONSTRAINT FK_LANGUAGE_2 FOREIGN KEY(LANGUAGE_ID) REFERENCES LANGUAGE(ID)
)

CREATE TABLE PROPERTIES
(
ID INT PRIMARY KEY,
NAME NVARCHAR(200),
DESCRIPTION NVARCHAR(MAX),
USERID INT,
PROPERTY_TYPE_ID INT,
ROOM_TYPE_ID INT,
CATEGORY_ID INT,
SUBCATEGORY_ID INT,
COUNTRY_ID INT,
STATE_ID INT,
CITY_ID INT,
CURRENCY_ID INT,
ROOM_DETAIL_ID INT,
ADDRESS_ID INT,
AVAILABILTY_TYPE TINYINT,
START_DATE DATE,
END_DATE DATE,
PRICE FLOAT,
PRICE_TYPE_ID TINYINT,
REFUND_TYPE TINYINT,
MINUMUM_STAY INT,
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT

	CONSTRAINT FK_USER FOREIGN KEY(USERID) REFERENCES USERS(ID),
	CONSTRAINT FK_PROPERTY_TYPE FOREIGN KEY(PROPERTY_TYPE_ID) REFERENCES PROPERTY_TYPE(ID),
	CONSTRAINT FK_ROOM_TYPE FOREIGN KEY(ROOM_TYPE_ID) REFERENCES ROOM_TYPE(ID),
	CONSTRAINT FK_CATEGORY_2 FOREIGN KEY(CATEGORY_ID) REFERENCES CATEGORIES(ID),
	CONSTRAINT FK_SUBCATEGORIES FOREIGN KEY(SUBCATEGORY_ID) REFERENCES SUBCATEGORIES(ID),
	CONSTRAINT FK_COUNTRY_3 FOREIGN KEY(COUNTRY_ID) REFERENCES COUNTRIES(ID),
	CONSTRAINT FK_STATE_2 FOREIGN KEY(STATE_ID) REFERENCES STATES(ID),
	CONSTRAINT FK_CITY FOREIGN KEY(CITY_ID) REFERENCES CITIES(ID),
	CONSTRAINT FK_CURRENCY FOREIGN KEY(CURRENCY_ID) REFERENCES CURRENCIES(ID),
	--CONSTRAINT FK_ROOM_DETAILS FOREIGN KEY(ROOM_DETAIL_ID) REFERENCES ROOM_DETAIL(ID),
	CONSTRAINT FK_ADDRESS FOREIGN KEY(ADDRESS_ID) REFERENCES ADDRESS(ID),
	CONSTRAINT FK_PRICE_TYPE FOREIGN KEY(PRICE_TYPE_ID) REFERENCES PRICE_TYPE(ID)
)

ALTER TABLE PROPERTIES
ADD FOREIGN KEY (ROOM_DETAIL_ID) 
REFERENCES dbo.ROOM_DETAIL(ID)


CREATE TABLE CMS_PAGE_LANGUAGES
(
ID INT PRIMARY KEY,
CMS_PAGE_ID INT,
LANGUAGE_ID INT,
DESCRIPTION VARCHAR(MAX),
	CONSTRAINT FK_CMS_PAGE FOREIGN KEY(CMS_PAGE_ID) REFERENCES CMS_PAGES(ID),
	CONSTRAINT FK_LANGUAGE_3 FOREIGN KEY(LANGUAGE_ID) REFERENCES LANGUAGE(ID)
)

CREATE TABLE PROPERTY_IMAGES
(
ID INT PRIMARY KEY,
PROPERTY_ID INT,
ADDED_BY_USER INT,
IMAGE VARCHAR(MAX),
CREATED DATETIME,
STATUS TINYINT,
	CONSTRAINT FK_PROPERTY FOREIGN KEY(PROPERTY_ID) REFERENCES PROPERTIES(ID)
)

CREATE TABLE TRANSACTIONS
(
ID INT PRIMARY KEY,
PROPERTY_ID INT,
USERID INT,
SITE_FEES FLOAT,
AMOUNT FLOAT,
TRANSFER_ON DATETIME,
CURRENCY_ID INT,
PROMO_CODE_ID INT,
DISCOUNT_AMOUNT FLOAT,
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT
	CONSTRAINT FK_PROPERTY_2 FOREIGN KEY(PROPERTY_ID) REFERENCES PROPERTIES(ID),
	CONSTRAINT FK_USER_2 FOREIGN KEY(USERID) REFERENCES USERS(ID),
	CONSTRAINT FK_CURRENCY_2 FOREIGN KEY(CURRENCY_ID) REFERENCES CURRENCIES(ID),
	CONSTRAINT FK_PROMO_CODE FOREIGN KEY(PROMO_CODE_ID) REFERENCES PROMO_CODES(ID)
)

CREATE TABLE BOOKINGS
(
ID INT PRIMARY KEY,
PROPERTY_ID INT,
USERID INT,
CHECK_IN_DATE DATETIME,
CHECK_OUT_DATE DATETIME,
PRICE_FOR_STAY FLOAT,
TAX_PAID FLOAT,
SITE_FEES FLOAT,
AMOUNT_PAID FLOAT,
IS_REFUND BIT,
CANCAL_DATE DATETIME,
REFUND_PAID FLOAT,
TRANSACTION_ID INT,
BOOKING_DATE DATETIME,
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT,
	CONSTRAINT FK_PROPERTY_3 FOREIGN KEY(PROPERTY_ID) REFERENCES PROPERTIES(ID),
	CONSTRAINT FK_USER_3 FOREIGN KEY(USERID) REFERENCES USERS(ID),
	CONSTRAINT FK_TRANSACTION FOREIGN KEY(TRANSACTION_ID) REFERENCES TRANSACTIONS(ID)
)

CREATE TABLE PROPERTY_REVIEWS
(
ID INT PRIMARY KEY,
PROPERTY_ID INT,
REVIEW_BY_USER INT,
BOOKING_ID INT,
COMMENT NVARCHAR(MAX),
RATING TINYINT,
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT,
	CONSTRAINT FK_PROPERTY_4 FOREIGN KEY(PROPERTY_ID) REFERENCES PROPERTIES(ID),
	CONSTRAINT FK_BOOKING FOREIGN KEY(BOOKING_ID) REFERENCES BOOKINGS(ID)
)

CREATE TABLE DISPUTES
(
ID INT PRIMARY KEY,
USERID INT,
PROPERTY_ID INT,
BOOKING_ID INT,
NAME NVARCHAR(200),
DESCRIPTION NVARCHAR(MAX),
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT,
	CONSTRAINT FK_PROPERTY_5 FOREIGN KEY(PROPERTY_ID) REFERENCES PROPERTIES(ID),
	CONSTRAINT FK_USER_5 FOREIGN KEY(USERID) REFERENCES USERS(ID),
	CONSTRAINT FK_BOOKING_2 FOREIGN KEY(BOOKING_ID) REFERENCES BOOKINGS(ID)
)

CREATE TABLE PROPERTY_AMENITIES(
ID INT PRIMARY KEY,
PROPERTY_ID INT,
AMENITY_ID INT,
CREATED DATETIME,
MODIFIED DATETIME,
STATUS TINYINT,
	CONSTRAINT FK_PROPERTY_6 FOREIGN KEY(PROPERTY_ID) REFERENCES PROPERTIES(ID),
	CONSTRAINT FK_AMENTIES FOREIGN KEY(AMENITY_ID) REFERENCES AMENITIES(ID)
)




