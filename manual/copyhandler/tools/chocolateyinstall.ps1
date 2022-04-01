
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.fosshub.com/Protected/expiretime=1631176251;badurl=aHR0cHM6Ly93d3cuZm9zc2h1Yi5jb20vQ29weS1IYW5kbGVyLmh0bWw=/d2457a48843729e4dd1feac56721d4ff6e66679646b9505890ac95e3ae8a236e/5b86ebe3f9ee5a5c3e97a252/5fe50d507374bc3a1191bbed/chsetup-1.46.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'copyhandler*'
  checksum      = '7D3B88C49E4D85A28362A3D193C44D79'
  checksumType  = 'md5'
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs



















