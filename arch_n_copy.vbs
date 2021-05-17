dim I 
dim objArgs
dim filepath
dim archpath
dim Dest
dim Sourc
dim param
dim SrcLabel

Dest = "e:\mssql\arch\"
Sourc = ":\mssql\backup\"

dim CurrDate
CurrDate= Date()


Set objArgs = WScript.Arguments 

if  objArgs.Count > 0 then 
  param = objArgs(0)
  SrcLabel = objArgs(1)
  Sourc =   SrcLabel  & Sourc
  WScript.Echo "Архивирование и перенос:    " & param
  WriteLog param ," Начата обработка "
  
  filepath = Sourc & param
  archpath = Dest & param
  
' print `start /belownormal winrar  a -m1 -ep -ibck v:\\backup\\base\\$curr_r_dir.rar uni*.*`;
  
	Set Archer = CreateObject ("WScript.Shell")

	Archer.Run "winrar  a -m1 -ep -ibck "& filepath &".rar "& filepath,0,true 

  WriteLog param, "   " & " winrar  a -m1 -ep -ibck "& filepath &".rar "& filepath
  WriteLog param," Завершено архивирование " & param
'  WScript.Echo archpath & year(CurrDate) & month(CurrDate) & day (CurrDate)
  Move2Archive filepath, archpath & "_" & year(CurrDate) & month(CurrDate) & day (CurrDate)
  WriteLog param," Завершено копирование " & param



  
end if

sub WriteLog( param , logstr)
	Dim fso, ts
	Const ForAppe  = 8
	Set fso = CreateObject("Scripting.FileSystemObject")
	Set ts = fso.OpenTextFile("e:\mssql\backup\arch.log", ForAppe, True)
	
	ts.Write(Now  & "   " & param & "  "& logstr & chr(13) )
	ts.Close
end sub 

function  Move2Archive (src, dest)
	
	Dim fso, ts , fg
  
  on error resume next 
  
  ts = dest & ".rar" 

	'Set fso = CreateObject("Scripting.FileSystemObject")
	'Set ts = fso.OpenTextFile(ts, 2, True)
	
'	ts.Write(Now  & "   " & param & "  "& logstr & chr(13) )
'	ts.Close

	Set fso = CreateObject("Scripting.FileSystemObject")
    Set fg = fso.GetFile(ts)
    if fg then
    fg.Delete true
    end if

	Set fso = CreateObject("Scripting.FileSystemObject")
    Set fg = fso.GetFile(src & ".rar")

  fg.Move ts


end function





