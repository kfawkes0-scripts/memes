:metastr:n:'catwrn';c:'niknils@github.com';l:'GPLv3'
  @call :rm[WORK]
:PROGRAM
  @set ".nkcata.fs.s_f=%~f0"
  @set ".nkcata.task=cmd.exe"
  @set ".nkcata.args=%*"
  @set ".nkcata.sign=%UserName%"
    @call :catwrn_aprs
  @call :MAIN
@goto END.


:catwrn_aprs
@goto EXIT

:init.colorize
@set "ESC="
@goto EXIT




  :colorize
  @call :colorize.%~2 %~1&@goto EXIT
  :colorize.black
    @set ".nkcata.colorize%~1=%ESC%[30m"
  @goto EXIT
  :colorize.red
   @set ".nkcata.colorize%~1=%ESC%[31m"
  @goto EXIT
  :colorize.green
    @set ".nkcata.colorize%~1=%ESC%[32m"
  @goto EXIT
  :colorize.yellow
    @set ".nkcata.colorize%~1=%ESC%[33m"
  @goto EXIT
  :colorize.blue
    @set ".nkcata.colorize%~1=%ESC%[34m"
  @goto EXIT
  :colorize.magenta
    @set ".nkcata.colorize%~1=%ESC%[35m"
  @goto EXIT
  :colorize.cyan
    @set ".nkcata.colorize%~1=%ESC%[36m"
  @goto EXIT
  :colorize.white
    @set ".nkcata.colorize%~1=%ESC%[37m"
  @goto EXIT
  :colorize.null
    @set ".nkcata.colorize%~1=%ESC%[0m"
  @goto EXIT


:printf
@rem escape \red \white... colors...
@rem escape \n

:MAIN
@call :init.colorize
  @echo                                 ,----.
  @echo                                ( %.nkcata.colorizeMessage%WOW!%.nkcata.colorizeNull% )                         .-.
  @echo                                 `----' _                         \ \
  @echo                                       (_)                         \ \
  @echo                                           O                       ^| ^|
  @echo                                             o                     ^| ^|
  @echo                     ^|\ /\                     . /\---/\   _,---._ ^| ^|
  @echo     __              ^|,\(_\_                    /^^   ^^  \,'       `. ;
  @echo    ( (              ^|\,`   `-^.                ( %.nkcata.colorizeEyes%O%.nkcata.colorizeNull%   %.nkcata.colorizeEyes%O%.nkcata.colorizeNull%   )           ;
  @echo     \ \             :    `-'   )               `.=o=__,'            \
  @echo      \ \             \        ;                 /         _,--.__   \
  @echo       \ \             `-.   ,'                 /  _ )   ,'   `-. `-. \
  @echo        \ \ ____________,'  (                  / ,' /  ,'        \ \ \ \
  @echo         ; '                ;                 / /  / ,'          (,_)(,_)
  @echo         \                 /___,-.           (,;  (,,)      %.nkcata.colorizeTask%%.nkcata.task%%.nkcata.colorizeNull%
  @echo          `,    ,_____^|  ;'_____,' %.nkcata.colorizeArgs%%.nkcata.args%%.nkcata.colorizeNull%
  @echo        ,-" \  :      | :
  @echo       ( .-" \ `.__   | |
  @echo        \__)  `.__,'  ^|__)  %.nkcata.colorizeSign%%.nkcata.sign%%.nkcata.colorizeNull%
  @call :writeln
@goto EXIT

:writeln
@echo. &@goto EXIT

  :envrion.rmobjs
  @set "%~1.clearenv=True"
    @for /f "tokens=* delims=" %%I IN ('@set "%~1"') do @call :envrion.rmobj %%I
  @goto EXIT
    :envrion.rmobj
    @set "%~1="&@goto EXIT

:rm[VARS]
  @call :envrion.rmobjs .nkcata
@goto EXIT

:rm[WORK]
  @call :rm[VARS]
@goto EXIT

:END.
  @call :rm[WORK]
:RETURN
  @call "%WinDir%\System32\cmd.exe" /K @exit /B 0 >NUL 2>NUL.
:EXIT