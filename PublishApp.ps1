$Servicetier="BC150"
$Path="C:\Users\Admin\Desktop\D. E. Veloper_SD Seminar_1.0.0.0.app"
$AppName="SD Seminar"

Set-ExecutionPolicy RemoteSigned
# Import the module for the  cmdLet
Import-Module 'C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\NavAdminTool.ps1'
# Get infoemation of Apps
Get-NAVAppInfo -ServerInstance $Servicetier
# Publish app to database
Publish-NAVApp -ServerInstance $Servicetier -Path $Path -SkipVerification
# Install in tenant
Install-NAVApp -ServerInstance $Servicetier -Name $AppName
# Uninstall the app - Delete the data
Uninstall-NAVApp  -ServerInstance $Servicetier -Name $AppName -DoNotSaveData 
# Remove the app from the database - but keep the tables
Unpublish-NAVApp -ServerInstance $Servicetier -Name @AppName 
# Synchronize the objekts in theh tenant
Sync-NAVTenant -ServerInstance $Servicetier
# Remove the tables if the app is gone
Sync-NAVApp -ServerInstance $Servicetier -Name $AppName -Mode Clean

