
where /Q git
if %ERRORLEVEL% neq 0 goto GIT_NOT_INSTALLED
mkdir %HOME%\vim-backup
copy .vimrc %HOME%\_vimrc
copy .gvimrc %HOME%\_gvimrc

git clone https://github.com/Shougo/dein.vim C:\vim\dein\repos\github.com\Shougo\dein.vim

:GIT_NOT_INSTALLED
echo "install git!!"
goto END

:END
