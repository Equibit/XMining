@echo off

call project.bat || (exit /b 1)

if not exist "%PROJECT_BUILD%" (
echo Create a new solution folder "%PROJECT_BUILD%"
mkdir "%PROJECT_BUILD%" || (exit /b 1)
echo.
)

echo Change a working folder to "%PROJECT_BUILD%"
pushd "%PROJECT_BUILD%" || (exit /b 1)
echo.

echo Initialize solution with CMake && echo.
echo   VISUAL_STUDIO_PLATFORM = %VISUAL_STUDIO_PLATFORM%      && echo.
echo   VISUAL_STUDIO_CMAKE    = %VISUAL_STUDIO_CMAKE%         && echo.
echo   PROJECT_SOURCE         = %PROJECT_SOURCE%              && echo.

cmake ^
    -G "%VISUAL_STUDIO_CMAKE%" ^
    "%PROJECT_SOURCE%" ^
    || (exit /b 1)

msbuild /p:Configuration=Release INSTALL.vcxproj

exit /b
