@echo off
echo Stopping any existing deployment...
taskkill /F /IM node.exe >nul 2>&1

echo Copying files to deployment folder...
xcopy /E /I /Y src deployed_app

echo Starting new deployment on port 8081...
start "CalcApp" cmd /c "npx http-server deployed_app -p 8081"

echo Deployment successful! Visit http://localhost:8081
