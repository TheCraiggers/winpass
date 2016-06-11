@ECHO OFF
call %~dp0\config.bat

IF [%1]==[] (
	echo Password Store
	for %%f in (%pass_dir%\*.gpg) do (
		echo ^|-- %%~nf
	)
	exit /B 0
) ELSE (
	gpg -d --no-verbose --quiet --batch %pass_dir%/%1.gpg
	exit /B 0
)