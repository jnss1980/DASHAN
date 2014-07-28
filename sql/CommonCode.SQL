
Create Table CommonCode (
	Pid Int Identity(1,1) Not Null,
	PCode Nvarchar(50) Not Null,
	PNam Nvarchar(50) Not Null,
	PTyp Nvarchar(50) Not Null,
	CreateTime Nvarchar(30) Not Null DEFAULT (Convert(Nvarchar(10),getdate(),111))
)