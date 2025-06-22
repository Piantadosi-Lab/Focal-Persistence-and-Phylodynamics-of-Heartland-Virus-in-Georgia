@echo off
setlocal enabledelayedexpansion

REM Set paths
set ROOT_DIR=C:\tmp_L_het\rln\steppt4_final_gamma_iso
set JAVA_EXE="C:\Users\tysha\OneDrive\Desktop\Phylodynamic programs\BEAST.v2.7.6.Windows\BEAST\jre\bin\java.exe"
set JAR_PATH="C:/Users/tysha/OneDrive/Desktop/Phylodynamic programs/BEAST.v2.7.6.Windows/BEAST/lib/launcher.jar"
set SEED=103316267190152289

REM Run step 0 normally
cd "%ROOT_DIR%\step0"
%JAVA_EXE% -cp %JAR_PATH% beast.pkgmgmt.launcher.BeastLauncher -overwrite -seed %SEED% beast.xml

REM Loop through steps 1 to 199
for /L %%i in (1,1,199) do (
    echo Running step %%i...

    set /A prev=%%i-1
    set PREV_DIR=%ROOT_DIR%\step!prev!
    set CUR_DIR=%ROOT_DIR%\step%%i

    copy "!PREV_DIR!\beast.xml.state" "!CUR_DIR!" >nul

    cd "!CUR_DIR!"
    %JAVA_EXE% -cp %JAR_PATH% beast.pkgmgmt.launcher.BeastLauncher -resume -seed %SEED% beast.xml
)

echo All 200 steps completed.
pause

    
        
        

    
    
