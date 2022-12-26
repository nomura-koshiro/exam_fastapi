@echo off

rem -------------------------------------------
rem 使用するためには、PostgreSQLのbinフォルダがPATHに登録されている必要がある
rem また、下記のuserName変数の値についてはインストール時に設定した、
rem スーパーユーザを記述すること
rem -------------------------------------------

rem -------------------------------------------
rem DB接続パラメータ
rem -------------------------------------------
set hostName=localhost
set portNum=5432
rem >>>>> ユーザ名 >>>>>
set userName=postgres
rem >>>>> データベース名 >>>>>
set databaseName=postgres

rem -------------------------------------------
rem psql の実行 データベースの削除・作成
rem -------------------------------------------
psql -h %hostName% -p %portNum% -d %databaseName% -U %userName% -f sql/init_database.sql
