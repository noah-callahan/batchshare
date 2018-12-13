"Enter password for scans user: "
$Password = Read-Host -AsSecureString

New-LocalUser -Name "scans" -Password $Password -Description "account for scanning" -PasswordNeverExpires -AccountNeverExpires

md C:\scans

New-SmbShare -Name "scans" -path "C:\scans" -FullAccess scans

Read-Host -Prompt "Press Enter to exit"
