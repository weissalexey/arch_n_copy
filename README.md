# arch_n_copy
Kopieren und Übertragen der Datenbank nach Parametern

### Die Datenbank wird in das Arbeitsverzeichnis kopiert.

![Arbeitsverzeichnis](https://github.com/weissalexey/arch_n_copy/blob/main/assets/S1.png)

### Das Skript wird mit Parametern ausgeführt. 1 zu kopierende Datei. 2 Disk , wo kopiert werden soll.

![Arbeitsverzeichnis](https://github.com/weissalexey/arch_n_copy/blob/main/assets/S2.png)

### Nach Abschluss checken wir in der arch ein

![Arbeitsverzeichnis](https://github.com/weissalexey/arch_n_copy/blob/main/assets/S3.png)



USE [WebSped_Account]





GO
BACKUP DATABASE [WebSped_Account] TO  DISK = N'F:\WinSped_Backup\WebSpead_Account.bak' WITH NOFORMAT, NOINIT,  NAME = N'WebSped_Account_backup_2022_04_19_140236_6521736', SKIP, REWIND, NOUNLOAD, COMPRESSION,  STATS = 10

WAITFOR DELAY '00:00:01'

DECLARE @cmd varchar(100)
SET @cmd = 'C:\work\arj.bat'
EXEC WebSped_Account..xp_cmdshell @cmd

GO
