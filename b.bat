@echo off

:: Source Files
set SRC_DIR=.
set SOURCE_FILES=%SRC_DIR%\main.cpp

:: Include Directory (Compilation Stage)
set INCLUDE_DIRS=^
    /I".\include"

:: Library Directory (Linking Stage)
set LIB_DIRS=^
    /LIBPATH:".\lib"

:: Libraries from LIB_DIRS
set LIBS=SDL3.lib

:: Output Directory
set BIN_DIR=.
set BUILD_DIR=./misc
set EXECUTABLE_NAME=main.exe

:: Compile & Link
:: /nologo hides "Microsoft (R) ... Copyright (C)
:: /EHsc - Standard Exception Handling
:: /Zi Generate Debug information (.pdb)
:: /MD multi-threaded DLL C/C++ runtime library or /MT static link version
:: /W4 Warning Level 4
:: /WX Treat Warnings as Errors
:: /Fo Moves .obj files to BUILD_DIR
:: /wd<warning number> hides specific warning
:: /w1<warning number> downgrades warning level 1
:: /wd4100 - Unused parameter
set CXXFLAGS=/nologo /EHsc /Zi /MD /W4 /wd4100
:: /Fe .exe file location
:: SUBSYSTEM:WINDOWS or SUBSYSTEM:Console (Linker Flags have to be after /link)
set LDFLAGS=/Fe"%BIN_DIR%\%EXECUTABLE_NAME%" /link /SUBSYSTEM:WINDOWS

:: Final oneline build command
cl %CXXFLAGS% %INCLUDE_DIRS% %SOURCE_FILES% %LDFLAGS% %LIB_DIRS% %LIBS%
mv *.obj %BUILD_DIR% > nul 2>&1
mv *.ilk %BUILD_DIR% > nul 2>&1
