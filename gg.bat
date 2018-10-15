@echo off
if %1 equ "git stash"(
  echo gotit
  exit /b
)
REM git stash pop stash@{%1} 

