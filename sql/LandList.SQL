
Create Table LandList(
		Pid int identity(1,1) Not Null,						--序號
		City Nvarchar(50) Not Null,							--城式
		Area Nvarchar(50) Not Null,							--鄉鎮市區
		ObjSubject Nvarchar(50) Not Null,					-- 交易標的
		AreaLocation Nvarchar(500) Not Null,				-- 土地區段位置或建物區門牌
		TransactionDateTime Nvarchar(50) Not Null,			--交易年月
		LocationWorkFinishDateTime Nvarchar(50) Not Null,	--建築完成年月
		LocationAreaTotal Nvarchar(50) Not Null,			-- 土地移轉總面積平方公尺
		TotalSell Nvarchar(50) Not Null,					--總價元
		SingArea Nvarchar(50) Not Null,						-- 單價每平方公尺
		CateTime Nvarchar(50) Not Null
)
