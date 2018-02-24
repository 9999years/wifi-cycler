Import-Module ~\Documents\PowerShellModules\device-managment\DeviceManagement.psd1

function Cycle-Device {
	[CmdletBinding()]
	Param(
		[Parameter(
			ValueFromPipeline=$True
		)]
		[String]$Name,
		[Int]$WaitSeconds=3
	)

	Process {
		$Device = Get-Device | Where-Object -Property Name -EQ $Name
		$Device | Disable-Device | Out-Null
		Start-Sleep $WaitSeconds
		$Device | Enable-Device | Out-Null
	}
}

$Name = 'Qualcomm Atheros AR922X Wireless Network Adapter'

Cycle-Device $Name
