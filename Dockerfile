FROM mcr.microsoft.com/windows:20H2
LABEL maintainer="jimmy.briggs@jimbrig.com"

RUN powershell.exe -executionpolicy bypass iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Sets a command or process that will run each time a container is run from the new image.
CMD [ "powershell.exe -RunAsAdministrator -executionpolicy bypass" ]
