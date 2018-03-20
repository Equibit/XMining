set PLATFORM=x32
set VISUAL_STUDIO_VERSION=2017

call visual_studio.bat

call :ABSOLUTE_PATH    PROJECT_ROOT         %~dp0\..\..\..
call :ABSOLUTE_PATH    PROJECT_SOURCE       %~dp0\..\..
call :FILENAME         PROJECT_NAME         %PROJECT_SOURCE%
call :ABSOLUTE_PATH    PROJECT_BUILD        %PROJECT_ROOT%\%PROJECT_NAME%.visual_studio
call :FILENAME         PROJECT_SOLUTION     %PROJECT_NAME%.visual_studio
call :ABSOLUTE_PATH    PROJECT_BLOCKCHAIN   %PROJECT_SOURCE%.blockchain

echo.
echo PROJECT_NAME       = %PROJECT_NAME%
echo PROJECT_ROOT       = %PROJECT_ROOT%
echo PROJECT_SOURCE     = %PROJECT_SOURCE%
echo PROJECT_BUILD      = %PROJECT_BUILD%
echo PROJECT_SOLUTION   = %PROJECT_SOLUTION%
echo PROJECT_BLOCKCHAIN = %PROJECT_BLOCKCHAIN%
echo.

echo Initialize Visual Studio environment && echo.
call "%VISUAL_STUDIO%" %VISUAL_STUDIO_PLATFORM% || (exit /b 1)
echo.

exit /b

:ABSOLUTE_PATH
set %1=%~f2
exit /b

:FILENAME
set %1=%~n2%~x2
exit /b
