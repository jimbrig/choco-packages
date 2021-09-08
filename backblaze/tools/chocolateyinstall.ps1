
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://secure.backblaze.com/win32/install_backblaze.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Backblaze'

  checksum      = 'EBF1739CC2BF49B16B79C81AD3BC5729'
  checksumType  = 'md5'

}

Install-ChocolateyPackage @packageArgs



















