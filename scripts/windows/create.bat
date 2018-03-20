@echo off

call project.bat || (pause && exit /b 1)

if exist "%PROJECT_BUILD%" (
echo Remove a solution folder "%PROJECT_BUILD%"
rmdir /Q /S "%PROJECT_BUILD%" || (pause && exit /b 1)
echo.
)

if not exist "%PROJECT_BUILD%" (
echo Create a solution folder "%PROJECT_BUILD%"
mkdir "%PROJECT_BUILD%" || (pause && exit /b 1)
echo.
)

echo Change a working folder to "%PROJECT_BUILD%"
pushd "%PROJECT_BUILD%" || (pause && exit /b 1)
echo.

echo Initialize solution with CMake && echo.
echo   VISUAL_STUDIO_PLATFORM = %VISUAL_STUDIO_PLATFORM%      && echo.
echo   VISUAL_STUDIO_CMAKE    = %VISUAL_STUDIO_CMAKE%         && echo.
echo   PROJECT_SOURCE         = %PROJECT_SOURCE%              && echo.

cmake ^
    -G "%VISUAL_STUDIO_CMAKE%" ^
    "%PROJECT_SOURCE%" ^
    || (pause && exit /b 1)

pause

explorer "%PROJECT_BUILD%"

exit /b
