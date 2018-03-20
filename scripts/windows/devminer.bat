@echo off

call project.bat

devenv %PROJECT_BUILD%/%PROJECT_SOLUTION%.sln
