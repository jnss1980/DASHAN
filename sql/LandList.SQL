
Create Table LandList(
		Pid int identity(1,1) Not Null,						--�Ǹ�
		City Nvarchar(50) Not Null,							--����
		Area Nvarchar(50) Not Null,							--�m������
		ObjSubject Nvarchar(50) Not Null,					-- ����Ъ�
		AreaLocation Nvarchar(500) Not Null,				-- �g�a�Ϭq��m�Ϋت��Ϫ��P
		TransactionDateTime Nvarchar(50) Not Null,			--����~��
		LocationWorkFinishDateTime Nvarchar(50) Not Null,	--�ؿv�����~��
		LocationAreaTotal Nvarchar(50) Not Null,			-- �g�a�����`���n���褽��
		TotalSell Nvarchar(50) Not Null,					--�`����
		SingArea Nvarchar(50) Not Null,						-- ����C���褽��
		CateTime Nvarchar(50) Not Null
)