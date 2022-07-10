$sccm_server = ""
$site = ""
$machine = ""

Get-WmiObject -ComputerName $sccm_server -Namespace $site -Query `
   ("select InstalledLocation,ProductVersion,ProductName
      from 
          SMS_R_System
      join 
          SMS_G_SYSTEM_Installed_Software on SMS_R_System.ResourceID = 
          SMS_G_SYSTEM_Installed_Software.ResourceID
      where
          SMS_R_SYSTEM.Name= '$machine'") | Select-Object ProductName, ProductVersion, InstalledLocation
