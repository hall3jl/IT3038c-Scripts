function getIP{
    (Get-NetIPAddress).IPv4address | Select-String "192*"
}

$IP = $("{2}" -f $(getIP))
$User = $env:UserName
$Hostname = $env:ComputerName
$PSVersion = $HOST.Version.Major
$Date = Get-Date -Format "dddd, MMMM dd, yyyy"

$BODY = "This machine's IP is $IP. The user is $User. The hostname is $Hostname. Powershell Version $PSVersion. Today's date is $Date."
Write-Host ("$BODY")

Send-MailMessage -To "hall3jl@mail.uc.edu" -From "hall3jl@mail.uc.edu" -Subject "IT3038C Windows SysInfo" -Body $BODY -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential)