FROM mcr.microsoft.com/powershell:nanoserver-2004

EXPOSE 6379

RUN mkdir C:\data

WORKDIR C:/redis

RUN pwsh -Command \
    $ErrorActionPreference = 'Stop'; \
    Invoke-WebRequest -Method Get -Uri https://github.com/MicrosoftArchive/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.zip -OutFile redis.zip ; \
    Expand-Archive redis.zip . ; \
    Invoke-WebRequest -Method Get -Uri http://wks-jrong/redis.windows.txt -OutFile redis.conf ; \
    Remove-Item redis.zip -Force

ENTRYPOINT redis-server redis.conf