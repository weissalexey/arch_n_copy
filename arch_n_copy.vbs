Dest = "d:\SQL_Data\"
Sourc = "d:\SQL_Data\arj\"

dim CurrDate
CurrDate= Date()


Set objArgs = WScript.Arguments 

if  objArgs.Count > 0 then 
  param = objArgs(0)
  
  
  filepath = Sourc & param
  archpath = Dest & param
  M = month(CurrDate)
  d = day (CurrDate)

	IF len(M)=1 then m = "0" & M
	if len(d)=1 then d = "0" & d

	Set Archer = CreateObject ("WScript.Shell")
	Archer.Run "winrar a -m1 -ep -ibck "& filepath & year(CurrDate) & m & d & ".rar " & archpath ,0,true 
	MoveARJ archpath 
 end if

function  MoveARJ (src)
  on error resume next 
  ts = src
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set fg = fso.GetFile(ts)
    if fg then fg.Delete true
end function