@echo off
net user scans $can$#1 /add /comment:"account for scanning" /passwordchg:NO
wmic useraccount where "name='scans'" set passwordexpires=FALSE
REM net localgroup "GROUP" USERNAME/add
mkdir C:\scans
net share scans="c:\scans" /grant:%ComputerName%\scans,FULL
exit
