
CREATE PROC SP_KULLANICI_GIRIS_KONTROLU (@FIRSTNAME nvarchar(200), @sifre INT, @var INT output)
AS
BEGIN
	IF EXISTS (SELECT FIRST_NAME,PASSWORD FROM USERS WHERE FIRST_NAME=@FIRSTNAME AND PASSWORD=@sifre)
	BEGIN
	SELECT @var=ID FROM USERS WHERE FIRST_NAME=@FIRSTNAME
	END
	ELSE
	BEGIN
	SET @var=-1
	END
END
