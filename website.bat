@::!/dos/rocks
@echo off
goto :init
goto :venv_activate


:header
    echo %__NAME% v%__VERSION%
    echo Un petit programme pour permettre de gerer facilement
    echo un site web fait avec Pelican.
    echo.
    goto :eof

:usage
    echo UTILISATION:
    @REM echo   %__BAT_NAME% [flags] "required argument" "optional argument" 
    echo   %__BAT_NAME% [--options]
    echo.
    echo.  /?, --help           shows this help
    echo.  /v, --version        shows the version
    echo.  /e, --verbose        shows detailed output
    echo.  -i, --init           prepare the folder and the python stuff
    echo.  -b, --build          builds the website
    echo.  -l, --listen         starts a local pelican server 
    echo.  -p, --publish        publish the updated website
    @REM echo.  -f, --flag value     specifies a named parameter value
    goto :eof

:version
    if "%~1"=="full" call :header & goto :eof
    echo %__VERSION%
    goto :eof

:missing_argument
    call :header
    call :usage
    echo.
    echo **********                                   **********
    echo **********    MISSING "REQUIRED ARGUMENT"    **********
    echo **********                                   **********
    echo.
    goto :eof

:prepare
    echo.
    echo Creating git repo AND installing python requirements
    call git init
    call git add --all
    call git commit -m "First commit"
    call pip install -r requirements.txt
    echo.
    goto :eof

:build
    echo.
    echo Building the website
    call pelican content -s pelicanconf.py
    echo.
    goto :eof

:preview
    echo.
    echo Starting the local server
    call pelican --listen
    echo.
    goto :eof

:publish
    echo.
    echo Publishing the website
    call git add --all
    call git commit -m "Updated website"
    call git push origin master
    
    call ghp-import output
    call git push origin gh-pages
    echo.
    goto :eof

:init
    set "__NAME=%~n0"
    set "__VERSION=1.0"
    set "__YEAR=2021"

    set "__BAT_FILE=%~0"
    set "__BAT_PATH=%~dp0"
    set "__BAT_NAME=%~nx0"

    set "OptHelp="
    set "OptVersion="
    set "OptVerbose="

    set "UnNamedArgument="
    set "UnNamedOptionalArg="
    set "NamedFlag="


:venv_activate
    call .venv/Scripts/activate.bat

:parse
    if "%~1"=="" goto :validate

    if /i "%~1"=="/?"         call :header & call :usage "%~2" & goto :end
    if /i "%~1"=="-?"         call :header & call :usage "%~2" & goto :end
    if /i "%~1"=="--help"     call :header & call :usage "%~2" & goto :end

    if /i "%~1"=="/v"         call :version      & goto :end
    if /i "%~1"=="-v"         call :version      & goto :end
    if /i "%~1"=="--version"  call :version full & goto :end

    if /i "%~1"=="/e"         set "OptVerbose=yes"  & shift & goto :parse
    if /i "%~1"=="-e"         set "OptVerbose=yes"  & shift & goto :parse
    if /i "%~1"=="--verbose"  set "OptVerbose=yes"  & shift & goto :parse

    if /i "%~1"=="-i"         call :prepare        & goto :end
    if /i "%~1"=="--init"     call :prepare        & goto :end

    if /i "%~1"=="-b"         call :build        & goto :end
    if /i "%~1"=="--build"    call :build        & goto :end

    if /i "%~1"=="-l"         call :preview      & goto :end
    if /i "%~1"=="--listen"   call :preview      & goto :end

    if /i "%~1"=="-p"         call :publish      & goto :end
    if /i "%~1"=="--publish"  call :publish      & goto :end

    if /i "%~1"=="-f"     set "NamedFlag=%~2"   & shift & shift & goto :parse
    if /i "%~1"=="--flag"     set "NamedFlag=%~2"   & shift & shift & goto :parse

    if not defined UnNamedArgument     set "UnNamedArgument=%~1"     & shift & goto :parse
    if not defined UnNamedOptionalArg  set "UnNamedOptionalArg=%~1"  & shift & goto :parse

    shift
    goto :parse

:validate
    if not defined UnNamedArgument call :missing_argument & goto :end

:main
    if defined OptVerbose (
        echo **** DEBUG IS ON
    )

    echo UnNamedArgument:    "%UnNamedArgument%"

    if defined UnNamedOptionalArg      echo UnNamedOptionalArg: "%UnNamedOptionalArg%"
    if not defined UnNamedOptionalArg  echo UnNamedOptionalArg: not provided

    if defined NamedFlag               echo NamedFlag:          "%NamedFlag%"
    if not defined NamedFlag           echo NamedFlag:          not provided

:end
    call :cleanup
    exit /B

:cleanup
    REM The cleanup function is only really necessary if you
    REM are _not_ using SETLOCAL.
    set "__NAME="
    set "__VERSION="
    set "__YEAR="

    set "__BAT_FILE="
    set "__BAT_PATH="
    set "__BAT_NAME="

    set "OptHelp="
    set "OptVersion="
    set "OptVerbose="

    set "UnNamedArgument="
    set "UnNamedArgument2="
    set "NamedFlag="
    
    call deactivate

    goto :eof