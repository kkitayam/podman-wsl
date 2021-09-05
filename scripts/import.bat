@echo off
setlocal
where /q 7z
if errorlevel 1 (
  echo 7z is needed to import
  exit /b 1
)
if not exist podman.tar.xz (
  echo podman.tar.xz is not found
  exit /b 1
)
echo 7z x podman.tar.xz -so ^| wsl --import podman %CD% -
7z x podman.tar.xz -so | wsl --import podman %CD% -
exit /b %errorlevel%
