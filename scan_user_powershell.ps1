"Enter password for scans user. Enter d for default 'Scanner#1' password: "
$Password = Read-Host -AsSecureString

New-LocalUser -Name "scans" -Password $Password -Description "account for scanning" -PasswordNeverExpires -AccountNeverExpires

$Destination = $Env:userprofile
$main_dir = ($Destination[0..2] -join "")

$scan_folder = $main_dir + "scans"

mkdir $scan_folder

New-SmbShare -Name "scans" -path $scan_folder -FullAccess scans

Read-Host -Prompt "Press Enter to exit"

