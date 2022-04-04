:: Xoreos' Batch Actions [XBA] for K1/TSL
:: Version      	: 1.1.0 [April 01, 2022]
:: Created By   	: ebmar
:: Created On   	: February 24, 2022 [v1.0.0]
:: Streamlined By       : DarthParametric & ebmar
:: Streamlined On       : April 01, 2022
:: Based On     	: ReiKaz, of Resident Evil Modding Forum [https://residentevilmodding.boards.net/thread/12359/wem-ogg-wav-converter-batch]
::              	: Flachzangen, of Nexus Mods [https://www.nexusmods.com/kotor/mods/1384]
::              	: DarthParametric, of Deadly Stream [https://deadlystream.com/profile/15735-darthparametric/]

@echo off
setlocal EnableDelayedExpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
title [K1/TSL] X B A v1.1.0
echo.
echo.
echo.
echo.
echo           ---------------------------------------------------
echo                      [K1/TSL] Xoreos Batch Actions
echo                                 by ebmar
::echo                        (Streamlined test version)
echo           ---------------------------------------------------
echo.
echo.
echo.
echo.
pause

Rem 10: gamelist
:gamelist
cls
rem Grab and store the version of the game the source files are from/for.
echo           ---------------------------------------------------
echo                          Step 1: Game Version
echo           ---------------------------------------------------
echo.
echo   1: Knights of the Old Republic [K1]
echo.
echo   2: Knights of the Old Republic II: The Sith Lords [TSL]
echo.
echo.

set /p gametype= Please select the game version you are converting from/to : 

if /i "%gametype%"=="1" (set "gametype=kotor") & (GOTO :convertlist)
if /i "%gametype%"=="2" (set "gametype=kotor2") & (GOTO :convertlist)

echo.
echo.
echo   [Statement] Error: Invalid input! Try again, meatbag.
echo.
echo.
pause
goto :gamelist

Rem 12: convertlist
:convertlist
cls

if "%gametype%"=="kotor" set "gametext=K1"
if "%gametype%"=="kotor2" set "gametext=TSL"

echo           ---------------------------------------------------
echo                        Step 2: Conversion Actions
echo.
echo                       Selected Game Version is %gametext%
echo           ---------------------------------------------------
echo.
echo   1: GFF to XML
echo   2: TLK to XML
echo   3: NCS to NSS [bytecode]
echo.
echo   4: XML to GFF
echo   5: XML to TLK
echo.
echo   6: SFF to XML [redundant]
echo   7: XML to SFF [redundant]
echo.
echo   8: Remove game version prefixes [skips XMLs]
echo.
echo   9: Run Convert2DA and exit
echo.
echo   10: Return to game version selection
echo.
echo   11: Exit
echo.
echo.

set /p _inputtype= [Statement] Which of the above actions do you want to execute, meatbag? [1 - 10] : 

if /i "%_inputtype%"=="1" GOTO :gff2xml
if /i "%_inputtype%"=="2" GOTO :tlk2xml
if /i "%_inputtype%"=="3" GOTO :ncs2nss
if /i "%_inputtype%"=="4" GOTO :xml2gff
if /i "%_inputtype%"=="5" GOTO :xml2tlk
if /i "%_inputtype%"=="6" GOTO :sff2xml
if /i "%_inputtype%"=="7" GOTO :xml2sff
if /i "%_inputtype%"=="8" GOTO :k_rem
if /i "%_inputtype%"=="9" GOTO :convert2da
if /i "%_inputtype%"=="10" GOTO :gamelist
if /i "%_inputtype%"=="11" GOTO :EOF

echo.
echo   [Statement] Error: Invalid input! Abort terminal...
echo.
echo.
pause
::goto :convertlist
goto :EOF

Rem 1: gff2xml
:gff2xml
:: GFF2XML Batch Script
cls
echo.
echo           ---------------------------------------------------
echo                       Converting GFFs with GFF2XML
echo           ---------------------------------------------------
echo.
echo.
Rem For files in GFF format, convert them to XML using gff2xml --
for %%F in (*.are *.dlg *.fac *.git *.gui *.ifo *.jrl *.res *.utc *.uti *.utm *.utp *.uts *.utt *.utw) do gff2xml --%gametype% %%F %gametype%_%%F.xml

echo.
pause
goto :convertlist

Rem 2: tlk2xml
:tlk2xml
:: TLK2XML Batch Script
cls
echo.
echo           ---------------------------------------------------
echo                      Converting TLKs with TLK2XML
echo           ---------------------------------------------------
echo.
echo.
Rem For files in TLK format, convert them to XML using tlk2xml --
for %%F in (*.tlk) do  tlk2xml.exe --%gametype% %%F %gametype%_%%~nF.tlk.xml

echo.
pause
goto :convertlist

Rem 3: ncs2nss
:ncs2nss
:: NCS2NSS Batch Script
cls
echo.
echo           ---------------------------------------------------
echo                  Converting NCS to bytecode with NCSDIS
echo           ---------------------------------------------------
echo.
echo.
Rem For files in NCS format, decompile them to bytecode using ncsdis --
for %%F in (*.ncs) do ncsdis.exe --%gametype% %%F %gametype%_%%~nF_BYTECODE.nss

echo.
pause
goto :convertlist

Rem 4: xml2gff
:xml2gff
:: XML2GFF Batch Script
cls
echo.
echo           ---------------------------------------------------
echo                  Converting XML to GFF with XML2GFF
echo           ---------------------------------------------------
echo.
echo.
Rem For files in XML format, convert them to GFF using xml2gff --
if exist "*.xml" (
	if exist "kotor_*.*.xml" (
		for %%F in (kotor_*.are.xml kotor_*.dlg.xml kotor_*.fac.xml kotor_*.git.xml kotor_*.gui.xml kotor_*.ifo.xml kotor_*.jrl.xml kotor_*.res.xml kotor_*.utc.xml kotor_*.uti.xml kotor_*.utm.xml kotor_*.utp.xml kotor_*.uts.xml kotor_*.utt.xml kotor_*.utw.xml) do xml2gff.exe --kotor %%~nF.xml %%~nF
		echo    Converting K1 XMLs . . .
	)
	if exist "kotor2_*.*.xml" (
		for %%F in (kotor2_*.are.xml kotor2_*.dlg.xml kotor2_*.fac.xml kotor2_*.git.xml kotor2_*.gui.xml kotor2_*.ifo.xml kotor2_*.jrl.xml kotor2_*.res.xml kotor2_*.utc.xml kotor2_*.uti.xml kotor2_*.utm.xml kotor2_*.utp.xml kotor2_*.uts.xml kotor2_*.utt.xml kotor2_*.utw.xml) do xml2gff.exe --kotor2 %%~nF.xml %%~nF
		echo    Converting TSL XMLs . . .
	)
) else (
		echo    No valid XMLs present, skipping . . .
)

echo.
pause
goto :convertlist

Rem 5: xml2tlk
:xml2tlk
:: XML2TLK Batch Script
cls
echo.
echo           ---------------------------------------------------
echo                  Converting XML to TLK with XML2TLK
echo           ---------------------------------------------------
echo.
echo.
Rem For files in XML format, convert them to TLK using xml2tlk --
if exist "*.xml" (
	if exist "kotor_*.*.xml" (
		for %%F in (kotor_*.tlk.xml) do xml2tlk.exe --kotor %%F %%~nF
		echo    Converting K1 XMLs . . .
	)
	if exist "kotor2_*.*.xml" (
		for %%F in (kotor2_*.tlk.xml) do xml2tlk.exe --kotor2 %%F %%~nF
		echo    Converting TSL XMLs . . .
	)
) else (
		echo    No valid XMLs present, skipping . . .
)

echo.
pause
goto :convertlist

Rem 6: sff2xml
:sff2xml
:: SFF2XML Batch Script
cls
echo.
echo           ---------------------------------------------------
echo                  Converting SFFs to XML with SFF2XML
echo           ---------------------------------------------------
echo.
echo.
Rem For files in SFF format, convert them to XML using ssf2xml --
for %%F in (*.sff) do ssf2xml.exe --%gametype% %%F %gametype%_%%~nF.sff.xml

echo.
pause
goto :convertlist

Rem 7: xml2sff
:xml2sff
:: XML2SFF Batch Script
cls
echo.
echo           ---------------------------------------------------
echo                  Converting XMLs to SSF with XML2SFF
echo           ---------------------------------------------------
echo.
echo.
Rem For files in XML format, convert them to SFF using xml2sff --
if exist "*.xml" (	
	if exist "kotor_*.*.xml" (
		for %%F in (kotor_*.ssf.xml) do xml2sff.exe --kotor %%F %%~nF
		echo    Converting K1 XMLs . . .
	)
	if exist "kotor2_*.*.xml" (
		for %%F in (kotor2_*.ssf.xml) do xml2sff.exe --kotor2 %%F %%~nF
		echo    Converting TSL XMLs . . .
	)
) else (
		echo    No valid XMLs present, skipping . . .
)

echo.
pause
goto :convertlist

Rem 8: k_rem
:k_rem
:: KRem Batch Script
cls
echo.
echo           ---------------------------------------------------
echo                        Removing Game Version Prefixes
echo           ---------------------------------------------------
echo.
echo.
Rem Remove game version prefixes from the relevant files --
Rem -- K1 --
echo                        Checking K1 files...
echo.
if exist "kotor_*.*" (
	for %%F in (kotor_*.*) do (
		if "%%~xF"==".xml" (
			echo    Skipping XML file %%F
			echo.
		) else if not "%%~xF"==".xml" (
			ren "%%F" "//////*.*"
			echo    Prefix removed from %%F
		)
	)
) else (
			echo    No valid files found
)

echo.
Rem -- K2 --
echo                        Checking TSL files...
echo.
if exist "kotor2_*.*" (
	for %%F in (kotor2_*.*) do (
		if "%%~xF"==".xml" (
			echo    Skipping XML file %%F
			echo.
		) else if not "%%~xF"==".xml" (
			ren "%%F" "///////*.*"
			echo    Prefix removed from %%F
		)
	)
) else (
			echo    No valid files found
)

echo.
pause
goto :convertlist

Rem 9: convert2da
:convert2da
:: Execute Convert2DA Script
cls
echo.
echo           ---------------------------------------------------
echo                            Running Convert2DA
echo           ---------------------------------------------------
echo.
echo.
Rem Run Convert2DA --
	convert2da.exe

echo.
goto :EOF

Rem 11: EOF
:EOF
exit
