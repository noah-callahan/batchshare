$global:Password = $null

function Get-Input(){
    "Enter d for default password 'Scanner#1', or p to enter a password: "
    $input = Read-Host
    If ($input -eq 'd'){
        $global:Password = ConvertTo-SecureString "Scanner#1" -AsPlainText -Force
    } elseif ($input -eq 'p') {
        "Enter a password: "
        $global:Password = Read-Host -AsSecureString
    } else {
        "Invalid input"
        Get-Input
    }
}

Get-Input

New-LocalUser -Name "scans" -Password $Password -Description "account for scanning" -PasswordNeverExpires -AccountNeverExpires

$Destination = $Env:userprofile
$main_dir = ($Destination[0..2] -join "")

$scan_folder = $main_dir + "scans"

mkdir $scan_folder

New-SmbShare -Name "scans" -path $scan_folder -FullAccess scans, $env:UserName, Everyone

Read-Host -Prompt "Press Enter to exit"

