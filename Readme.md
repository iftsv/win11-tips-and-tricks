#### 1. How to Update and Find Your Windows Experience Index Score
1.1. I prefer to first delete all of the files in `C:\Windows\Performance\WinSAT\DataStore` to get new data.

1.2. Open the __Command Prompt__ with admin privileges (not PowerShell). Type in `winsat formal` and expect to wait at least a few minutes.

1.3. Open __PowerShell__ and run `Get-CimInstance Win32_WinSat`. Your results will be displayed.

Example of the report:
``` cmd
PS C:\WINDOWS\system32> Get-CimInstance Win32_WinSat

CPUScore              : 8.9
D3DScore              : 9.9
DiskScore             : 7.9
GraphicsScore         : 6.3
MemoryScore           : 8.9
TimeTaken             : MostRecentAssessment
WinSATAssessmentState : 1
WinSPRLevel           : 6.3
PSComputerName        :
```
