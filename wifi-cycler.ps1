function Cycle-Device {
	[CmdletBinding()]
	Param(
		[Parameter(
			ValueFromPipeline=$True
		)]
		[String]$HardwareId,
		[Int]$WaitSeconds=3,
		[String]$DevCon='devcon64.exe'
	)

	Process {
		& $DevCon disable $HardwareId
		Start-Sleep $WaitSeconds
		& $DevCon enable $HardwareId
	}
}

$HardwareId = 'PCI\VEN_168C&DEV_0029&CC_0280'

Cycle-Device $HardwareId
