Write-Host "******************************************************************************"
Write-Host "ONLINE/OFFLINE STATUS OF THE SERVERS" -ForegroundColor red -BackgroundColor yellow
Write-Host "******************************************************************************"
$servers = "servername_1","servername_2","servername_3","servername_4"

foreach ($server in $servers)
	{    
	if (Test-Connection -ComputerName $server -Count 1 -Quiet)
		{        
			Write-Host "$server is online"     
		} 

	else    
		{        
			Write-Host "$server is offline" #MadeByKoulA807812    
		}

}
Write-Host "******************************************************************************" 
Write-Host "WDS SERVICE STATUS OF THE SERVERS" -ForegroundColor red -BackgroundColor yellow
Write-Host "******************************************************************************"
foreach ($server in $servers)
	{    
	$service = Get-Service -ComputerName $server -Name "WDSServer" -ErrorAction SilentlyContinue 
	if ($service.Status -eq "Running") 
		 {        
		Write-Host "The WDSServer service is running on $server."    
		 }    
	else {        
		Write-Host "The WDSServer service is not running on $server."    
	     }

 
     }
Write-Host "******************************************************************************"
Write-Host "PXE RESPONDER STATUS OF THE SERVERS" -ForegroundColor red -BackgroundColor yellow
Write-Host "******************************************************************************"
foreach ($server in $servers)
	{    
	$service = Get-Service -ComputerName $server -Name "SccmPxe" -ErrorAction SilentlyContinue     
	if ($service.Status -eq "Running") 
		 {        
		Write-Host "The PXE RESPONDER service is running on $server."    
		 }    
	else {        
		Write-Host "The PXE RESPONDER service is not running on $server."    
	     }

 
     }
Write-Host "******************************************************************************"
Write-Host "THE END. Visit www.koulinc.xyz" -ForegroundColor Red -BackgroundColor yellow
Write-Host "******************************************************************************"
Write-Host "NOTE: Either one of the above two services should have the status as ''Running'' on the above servers. If not kindly check the status of the server manually." -ForegroundColor red -BackgroundColor yellow
Write-Host "******************************************************************************"