@echo off

rem -------------------------------------------
rem �g�p���邽�߂ɂ́APostgreSQL��bin�t�H���_��PATH�ɓo�^����Ă���K�v������
rem �܂��A���L��userName�ϐ��̒l�ɂ��Ă̓C���X�g�[�����ɐݒ肵���A
rem �X�[�p�[���[�U���L�q���邱��
rem -------------------------------------------

rem -------------------------------------------
rem DB�ڑ��p�����[�^
rem -------------------------------------------
set hostName=localhost
set portNum=5432
rem >>>>> ���[�U�� >>>>>
set userName=postgres
rem >>>>> �f�[�^�x�[�X�� >>>>>
set databaseName=postgres

rem -------------------------------------------
rem psql �̎��s �f�[�^�x�[�X�̍폜�E�쐬
rem -------------------------------------------
psql -h %hostName% -p %portNum% -d %databaseName% -U %userName% -f sql/init_database.sql
