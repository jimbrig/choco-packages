$pp = Get-PackageParameters

if (!$pp['UserEmail']) { $pp['UserEmail'] = Read-Host "Enter email address for your backblaze account:" }
if (!$pp['Password']) { $pp['Password'] = Read-Host "Enter password for $($pp['UserEmail']):"}

$silentArgs = "-nogui -installdir 'C:\Program Files\Backblaze' -signinaccount $($pp['UserEmail']) $($pp['Password'])"

if (!$pp['Password']) { 
  Write-Debug "Package needs parameter 'Password' to install, that must be provided in params or in prompt. Defaulting to GUI installation.." 
  $silentArgs = ''
}

$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://secure.backblaze.com/win32/install_backblaze.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'backblaze*'
  checksum      = '67C1927B9B6217E98FC03C91DFF241834DC735C31C77C2EE88FD48324746FC22'
  checksumType  = 'sha256'
  silentArgs    = $silentArgs
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 