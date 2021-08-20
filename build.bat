@ECHO OFF

ECHO WEBSITE SCRIPT
ECHO ==================================
ECHO Activating the virtual environment
CALL .venv/Scripts/activate.bat
ECHO Done.
ECHO ===================================
ECHO Building the output site...
CALL pelican content -s pelicanconf.py
ECHO Done.
ECHO ==================================
