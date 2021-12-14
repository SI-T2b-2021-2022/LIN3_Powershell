w32tm /config /manualpeerlist: "SRV-WIN-1",0x8 /syncfromflags:MANUAL /update


w32tm /resync

w32tm /query /source

w32tm /query /status

netstat -a
Get-NetTCPConnection
Get-Service -Name W32Time 
start-Service -Name W32Time


netsh advfirewall firewall add rule name="Open Port 123" dir=in action=allow protocol=udp localport=123
New-NetFirewallRule -DisplayName "Disabling Port 123" -Action Block -Direction Inbound -Protocol udp -LocalPort 123 -Profile any
remove-NetFirewallRule -DisplayName "Disabling Port 123"

----------------

Pour aller vérifier/modifier les adresses des serveurs NTP :

regedit > HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers

(Default) = 0     : Le serveur séléctioné par défaut est le "0" dans la liste

0 = 10.0.2.11
1 = time.windows.com
2 = time.nist.gov

----------------
