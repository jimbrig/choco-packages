$chocoPack = 'backblaze'
$source = 'https://github.com/jimbrig/choco-packages'
$waitTime=20 # [int] in seconds as estimate of how long package install takes
$waitUrl='https://raw.githubusercontent.com/Microsoft/Virtualization-Documentation/master/windows-server-container-tools/Wait-Service/Wait-Service.ps1'
$ps="iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));choco install $chocoPack -s $source -y;Invoke-WebRequest -Uri '$waitUrl' -OutFile 'c:\Wait-Service.ps1';c:\Wait-Service.ps1 -ServiceName WinRm -AllowServiceRestart"

($cid = docker run -d $dockerArgs mcr.microsoft.com/windows:20H2 powershell.exe -executionpolicy bypass $ps )
Start-Sleep -Seconds $waitTime
Invoke-Command -ContainerId $cid -RunAsAdministrator -ScriptBlock{
Get-Content C:\choco\logs\choco.summary.log
#Get-Content C:\choco\logs\chocolatey.log
choco list --local-only ## list install packages
}
Enter-PSSession -ContainerId $cid -RunAsAdministrator
