mkdir installer
mkdir installer\bin
copy src\*.exe installer\bin
copy src\libmecab.dll installer\bin
mkdir installer\sdk
copy src\*.lib installer\sdk
copy src\mecab.h installer\sdk
mkdir installer\etc
copy mecabrc.in installer\etc\mecabrc
mkdir installer\dic
xcopy ..\mecab-ipadic installer\dic\mecab-ipadic