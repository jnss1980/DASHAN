Create Table LandProject(
Pid int IDENTITY(1,1) Not Null,
Overall decimal(18,2) Null,
Planning decimal(18,2) Null,
Both  decimal(18,2) Null,
Single_floor_price decimal(18,2) Null,
land_profits decimal(18,2) Null,
Single_floor decimal(18,2) Null,
Land_costs decimal(18,2) Null,
Floor_space decimal(18,2) Null,
Singlefloor decimal(18,2) Null,
Management decimal(18,2) Null,
Building_costs decimal(18,2) Null,
Single_family_costs decimal(18,6) Null,
Single_family_costs2 decimal(18,6) Null,
Maori_groups_Chu decimal(18,6) Null,
Address NvarChar(500) Null,
lat decimal(18,18) Null,
lng decimal(18,18) Null,
CreateTime NvarChar(25) Null
)

Drop Table LandProject
Select * From LandProject