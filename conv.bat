@REM @echo off
echo [This file encoding = EUC-KR]
echo ==MKV/MP4 SRT ���� ��ũ��Ʈ==
echo ==Kamilake ����==
setlocal


IF "%~1" == "" GOTO NOFILE_HELP
IF "%~2" == "" GOTO ONEFILE
IF "%~3" == "" GOTO TWOFILE
IF "%~4" == "" GOTO THREEFILE
GOTO NOFILE_HELP
:NOFILE_HELP
echo ====����====
echo ����: conv ^<���� �Ǵ� ����^> [����] [���] [/R]
echo.
echo         conv ^<����^> ^<�ڸ�^> [^<^����� ���ϸ�^>.^<Ȯ����^>]
echo         �Ǵ�
echo         conv ^<����^> [/R]
echo         �Ǵ�
echo         conv ^<����^>
echo         (^* ������ �����Ѵٸ� �ڸ��� ���� �̸��� ������ .srt .ko.srt .kor.srt .ko.kor.srt .smi.srt .smi.ko.srt .smi.kor.srt .smi.ko.kor.srt Ȯ���ڸ� ������ �־�� �մϴ�.)
echo.
GOTO END


============================================
============================================
============================================
============================================

:ONEFILE
IF EXIST %1\* GOTO ONEFILE_ONEDIR
echo ���� 1�� ���õ�
 IF EXIST "%~p1%~n1.srt" (ffmpeg -i "%~1" -f srt -i "%~p1%~n1.srt" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=kor "%~p1%~n1_subs%~x1")
 IF EXIST "%~p1%~n1.ko.srt" (ffmpeg -i "%~1" -f srt -i "%~p1%~n1.kor.srt" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=kor "%~p1%~n1_subs%~x1")
 IF EXIST "%~p1%~n1.kor.srt" (ffmpeg -i "%~1" -f srt -i "%~p1%~n1.kor.srt" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=kor "%~p1%~n1_subs%~x1")
 IF EXIST "%~p1%~n1.ko.kor.srt" (ffmpeg -i "%~1" -f srt -i "%~p1%~n1.ko.kor.srt" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=kor "%~p1%~n1_subs%~x1")

GOTO END
:ONEFILE_ONEDIR
echo ���� 1�� ���õ�
@REM ������ϸ� "%%~pX%%~nX_subs%%~xX"
@REM not recursive walk�� ���Ѵٸ� /r %1�� �����ϰ� cd %1�� ������ ���� �Ѵ�.
FOR /R %1 %%X IN (*.mp4 *.mkv) DO (
 IF EXIST "%%~pX%%~nX.srt" (ffmpeg -i "%%X" -f srt -i "%%~pX%%~nX.srt" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=kor "%%~pX%%~nX_subs%%~xX")
 IF EXIST "%%~pX%%~nX.ko.srt" (ffmpeg -i "%%X" -f srt -i "%%~pX%%~nX.kor.srt" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=kor "%%~pX%%~nX_subs%%~xX")
 IF EXIST "%%~pX%%~nX.kor.srt" (ffmpeg -i "%%X" -f srt -i "%%~pX%%~nX.kor.srt" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=kor "%%~pX%%~nX_subs%%~xX")
 IF EXIST "%%~pX%%~nX.ko.kor.srt" (ffmpeg -i "%%X" -f srt -i "%%~pX%%~nX.ko.kor.srt" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=kor "%%~pX%%~nX_subs%%~xX")
 echo .
)




GOTO END


:TWOFILE
echo ���� 2�� ���õ� (���� ���� ���߾��)
GOTO END

:THREEFILE
echo ���� 3�� ���õ� (���� ���� ���߾��)
GOTO END



%~xI
:END
pause
exit
�� �Ʒ��� �������� �޸����Դϴ�
ffmpeg -i input.mp4 -f srt -i input.srt \
 -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy \
 -c:s srt  output.mkv
 ffmpeg -i "input"\
 -f srt -i "srt"\
 -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt\
 -metadata:s:s:0 language=kor output.mkv


�ذ�å
Ư�� ���� �����ڸ� ����ؾ��մϴ�. ������ �۵��ϴ� ���Դϴ�.

if "%~x1" == ".ext" (echo File extension matches.)
��� ������ ������
%~I         - expands %I removing any surrounding quotes (")
%~fI        - expands %I to a fully qualified path name
%~dI        - expands %I to a drive letter only
%~pI        - expands %I to a path only
%~nI        - expands %I to a file name only
%~xI        - expands %I to a file extension only
%~sI        - expanded path contains short names only
%~aI        - expands %I to file attributes of file
%~tI        - expands %I to date/time of file
%~zI        - expands %I to size of file
%~$PATH:I   - searches the directories listed in the PATH
               environment variable and expands %I to the
               fully qualified name of the first one found.
               If the environment variable name is not
               defined or the file is not found by the
               search, then this modifier expands to the
               empty string


               FOR /R [���] %%���� IN (����) DO ���ɾ�