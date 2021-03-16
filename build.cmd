@echo off
REM Build and push to Azure Container Registry
REM Usage: build.cmd acr_name
az login
az acr login --name %1
docker build . -t %1.azurecr.io/redis-windows
docker push %1.azurecr.io/redis-windows:latest