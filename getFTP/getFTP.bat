@ECHO OFF

REM Specify global variables
set user=[[username]]
set server=[[FTP Server]]
set dest=[[Destination folder]]

REM Specify the username
echo user %user%        > getftp.dat

REM Ask for the user password
set /p password=Enter your password: 
echo %password%         >> getftp.dat


REM Specify the transfer method
echo binary        >> getftp.dat


REM Move to the root path
echo cd "''"       >> getftp.dat


REM Specify the destination folder
echo lcd %dest% >> getftp.dat


REM Make the loop to get all the files
for /F "tokens=*" %%A in (toGet.txt) do echo get %%A >> getftp.dat


REM Say good bye!
echo bye >> getftp.dat


REM Excecute the ftp command with the parameters
ftp -n -s:getftp.dat %server%


del getftp.dat
