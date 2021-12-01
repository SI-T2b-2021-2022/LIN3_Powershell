
# =======================================================
#
# Scripts install client VTP created by Ashraf Alkheroo
#
# =======================================================


# Variables
$NTPServer = $args[0]

# Configure NTP and restart service


Push-Location
Set-Location HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers
Set-ItemProperty . 0 $NTPServer
Set-ItemProperty . "(Default)" "0"
Set-Location HKLM:\SYSTEM\CurrentControlSet\services\W32Time\Parameters
Set-ItemProperty . NtpServer $NTPServer
Pop-Location
Stop-Service w32time
Start-Service w32time