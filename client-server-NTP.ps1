#=======================================================
#
# Scripts install client VTP created by Ashraf Alkheroo and Jonas 
#
# =======================================================
### Pour lancer le script: le nom du script plus l'addresse ip du serveur NTP principal 
### plus le nom ou l'address IP dU serveur secondaire.
### EXemple: .\client-server-NTP 10.0.1.10 pool.ntp.org

# Variables
$NTPServer = $args[0]
$NTPfallback = $args[1]

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\w32time\TimeProviders\NtpServer" -Name "Enabled" -Value 1

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\W32Time\Config" -Name "AnnounceFlags" -Value 5 

netsh advfirewall firewall add rule name="Open Port 123" dir=in action=allow protocol=udp localport=123

w32tm /config /manualpeerlist:"$NTPServer,0xa $NTPfallback,0xa" /syncfromflags:manual /update

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\W32Time\Config" -Name "MinPollInterval" -Value 3

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\W32Time\Config" -Name "MaxPollInterval" -Value 6

Restart-Service w32Time
