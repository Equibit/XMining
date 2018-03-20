call :_2017_x64
if "%VISUAL_STUDIO_VERSION%" == "2017" if "%PLATFORM%" == "x32" call :_2017_x32
if "%VISUAL_STUDIO_VERSION%" == "2015" call :_2015_x64
if "%VISUAL_STUDIO_VERSION%" == "2015" if "%PLATFORM%" == "x32" call :_2015_x32
if "%VISUAL_STUDIO_VERSION%" == "2013" call :_2013_x64
if "%VISUAL_STUDIO_VERSION%" == "2013" if "%PLATFORM%" == "x32" call :_2013_x32

exit /b

:_2013_x64
set VISUAL_STUDIO_BOOST=msvc-12.0
set VISUAL_STUDIO_QT=win32-msvc2013
set VISUAL_STUDIO_CMAKE=Visual Studio 12 2013 Win64
set VISUAL_STUDIO_PLATFORM=amd64
set VISUAL_STUDIO=C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat
exit /b

:_2013_x32
set VISUAL_STUDIO_BOOST=msvc-12.0
set VISUAL_STUDIO_QT=win32-msvc2013
set VISUAL_STUDIO_CMAKE=Visual Studio 12 2013
set VISUAL_STUDIO_PLATFORM=x86
set VISUAL_STUDIO=C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat
exit /b

:_2015_x64
set VISUAL_STUDIO_BOOST=msvc-14.0
set VISUAL_STUDIO_QT=win32-msvc2015
set VISUAL_STUDIO_CMAKE=Visual Studio 14 2015 Win64
set VISUAL_STUDIO_PLATFORM=amd64
set VISUAL_STUDIO=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat
exit /b

:_2015_x32
set VISUAL_STUDIO_BOOST=msvc-14.0
set VISUAL_STUDIO_QT=win32-msvc2015
set VISUAL_STUDIO_CMAKE=Visual Studio 14 2015
set VISUAL_STUDIO_PLATFORM=x86
set VISUAL_STUDIO=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat
exit /b

:_2017_x64
set VISUAL_STUDIO_BOOST=msvc-14.1
set VISUAL_STUDIO_QT=win32-msvc2017
set VISUAL_STUDIO_CMAKE=Visual Studio 15 2017 Win64
set VISUAL_STUDIO_PLATFORM=amd64
set VISUAL_STUDIO=C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvarsall.bat
exit /b

:_2017_x32
set VISUAL_STUDIO_BOOST=msvc-14.1
set VISUAL_STUDIO_QT=win32-msvc2017
set VISUAL_STUDIO_CMAKE=Visual Studio 15 2017
set VISUAL_STUDIO_PLATFORM=x86
set VISUAL_STUDIO=C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvarsall.bat
exit /b
