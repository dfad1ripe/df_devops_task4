Write-Host "copying postunattend file"

mkdir C:\Windows\setup\scripts
copy-item a:\SetupComplete.cmd C:\Windows\setup\scripts\SetupComplete.cmd -Force

mkdir C:\Windows\Panther\Unattend
copy-item a:\postunattend.xml C:\Windows\Panther\Unattend\unattend.xml

Write-Host "Recreate pagefile after sysprep"
$System = GWMI Win32_ComputerSystem -EnableAllPrivileges
if ($system -ne $null) {
  $System.AutomaticManagedPagefile = $true
  $System.Put()
}
