### 1. How to Update and Find Your Windows Experience Index Score
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

### 2. Optimize WSL distr sizes with Optimize-VHD cmdlet
Once `df -h` shows that your free space is out, you can try to optimize the size of .vhdx file

2.1. Stop wsl
```cmd
wsl --shutdown
```
2.2. Locate image file using PowerShell
```cmd
(Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss | Where-Object { $_.GetValue("DistributionName") -eq '<distribution-name>' }).GetValue("BasePath") + "\ext4.vhdx"
```
2.3. Run size optimization, for example:
```cmd
Optimize-VHD -mode full -path C:\Users\Ilya\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79rhkp1fndgsc\LocalState\ext4.vhdx
```
2.4. If Optimize-VHD is missing, you can try an alternative way

2.4.1. Install missing tool set:
  - Go to Control Panel | Programs and features | Turn windows features on or off
  - Tick Hyper-V (Hyper-V Management tools | Hyper-V Platform)
  - When installed, reboot if asked. After reboot, try again step 2.3.

2.4.2. Try to use diskpart to optimized the size of image
```cmd
diskpart
# open window Diskpart
select vdisk file="C:\Users\…\ext4.vhdx"
attach vdisk readonly
compact vdisk
detach vdisk
exit
```

[Read more](https://learn.microsoft.com/en-us/windows/wsl/disk-space)

### 3. Event-Driven Task Automation Without Task Scheduler PowerShell
Real-time event monitoring in Windows Logs, Applications, and Services. [Read more](https://www.outsidethebox.ms/22879/)
