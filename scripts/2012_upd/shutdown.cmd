@echo off

echo Blocking WinRM for next startup.
netsh advfirewall firewall set rule name="In 5985" new action=block

echo Time to generalize and shutdown.
C:\Windows\System32\Sysprep\sysprep.exe /generalize /oobe /unattend:C:/Windows/Panther/Unattend/unattend.xml /quiet /shutdown

echo Shutdown was invoked. The system will go down.