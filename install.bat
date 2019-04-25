rem vimrc script for windows
where /Q git
if %ERRORLEVEL% neq 0 goto GIT_NOT_INSTALLED
if not DEFINED HOME goto NO_ENV_HOME
mkdir %HOME%\vim-backup
copy .vimrc %HOME%\_vimrc
copy .gvimrc %HOME%\_gvimrc
copy .vsvimrc %HOME%\_vsvimrc
copy .vrapperrc %USERPROFILE%\_vrapperrc
copy ideavimrc\init\.ideavimrc %USERPROFILE%\.ideavimrc

git clone https://github.com/Shougo/dein.vim C:\vim\dein\repos\github.com\Shougo\dein.vim
copy %HOME%\vimrcs\myvim\vimproc_win64.dll C:\vim\dein\repos\github.com\Shougo\vimproc.vim\lib
goto END

:GIT_NOT_INSTALLED
echo "Install git!!"
goto END

:NO_ENV_HOME
echo "Set HOME environment variable!!"
goto END

:END
