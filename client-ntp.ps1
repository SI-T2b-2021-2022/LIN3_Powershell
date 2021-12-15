#=======================================================
#
# Scripts install client VTP created by Ashraf Alkheroo
#
# =======================================================
### Pour lancer le script: le nom du script plus l'addresse ip du serveur NTP principal 
### plus le nom ou l'address IP dU serveur secondaire.
### EXemple: .\client-ntp.ps1 10.0.1.10 www.apple.com

# Variables
$NTPServer = $args[0]
$NTPfallback = $args[1]

# Configure NTP and restart service


Push-Location
Set-Location HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers
Set-ItemProperty . 0 $NTPServer
Set-ItemProperty . "(Default)" "0"
Set-ItemProperty . 1 $NTPfallback
Set-Location HKLM:\SYSTEM\CurrentControlSet\services\W32Time\Parameters
Set-ItemProperty . NtpServer $NTPServer, $NTPfallback
Pop-Location
Stop-Service w32time
Start-Service w32time