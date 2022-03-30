:: Xoreos' Batch Actions [XBA] for K1/TSL
:: Version      : 1.0.0
:: Created By   : ebmar
:: Created On   : February 24, 2022
:: Based On     : ReiKaz, of Resident Evil Modding Forum [https://residentevilmodding.boards.net/thread/12359/wem-ogg-wav-converter-batch]
::              : Flachzangen, of Nexus Mods [https://www.nexusmods.com/kotor/mods/1384]
::              : DarthParametric, of Deadly Stream [https://deadlystream.com/profile/15735-darthparametric/]

@echo off
setlocal EnableDelayedExpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (set "DEL=%%a")
title [K1/TSL] X B A v1.0.0
echo.---------------------------------
echo [K1/TSL] Xoreos Batch Actions
echo.---------------------------------
echo.
echo.
echo 1: GFF to XML -- K1
echo 2: TLK to XML -- K1
echo 3: NCS to NSS -- K1 [bytecodes]
echo.
echo 4: GFF to XML -- TSL
echo 5: TLK to XML -- TSL
echo 6: NCS to NSS -- TSL [bytecodes]
echo.
echo 7: XML to GFF -- K1/TSL
echo 8: XML to TLK -- K1/TSL
echo.
echo 9: SFF to XML -- K1/TSL [Defunct]
echo 10: XML to SFF -- K1/TSL [Defunct]
echo.
echo 11: Convert2DA -- K1/TSL
echo.
echo 99: Remove game-ID [-KRem]
echo.
echo.
set /p _inputtype= [Statement] Which of the action above you want to execute, meatbags? [1 - 99] :
echo.
if /i "%_inputtype%"=="1" GOTO :gff2xmlk1
if /i "%_inputtype%"=="2" GOTO :tlk2xmlk1
if /i "%_inputtype%"=="3" GOTO :ncs2nssk1
if /i "%_inputtype%"=="4" GOTO :gff2xmlk2
if /i "%_inputtype%"=="5" GOTO :tlk2xmlk2
if /i "%_inputtype%"=="6" GOTO :ncs2nssk2
if /i "%_inputtype%"=="7" GOTO :xml2gff_b
if /i "%_inputtype%"=="8" GOTO :xml2tlk_b
if /i "%_inputtype%"=="9" GOTO :sff2xml_b
if /i "%_inputtype%"=="10" GOTO :xml2sff_b
if /i "%_inputtype%"=="11" GOTO :convert2da_b
if /i "%_inputtype%"=="99" GOTO :k_rem
echo [Statement] Error: Unknown input, abort process...
echo.
call :colorEcho 0e "[EXIT]"
echo.
echo.
pause
exit

Rem 1: gff2xmlk1
:gff2xmlk1
:: GFF2XML Batch Script for K1
echo.
echo.------------------------------------
echo GFF2XML for K1
echo.------------------------------------
echo.
echo.
Rem For files in GFF format, convert them to XML using gff2xml --
:: DLG
for %%F in (*.dlg) do (
	gff2xml.exe --kotor %%~nF.dlg K1_%%~nF.dlg.xml
)
:: UTI
for %%F in (*.uti) do (
	gff2xml.exe --kotor %%~nF.uti K1_%%~nF.uti.xml
)
:: UTC
for %%F in (*.utc) do (
	gff2xml.exe --kotor %%~nF.utc K1_%%~nF.utc.xml
)
:: UTS
for %%F in (*.uts) do (
	gff2xml.exe --kotor %%~nF.uts K1_%%~nF.uts.xml
)
:: UTP
for %%F in (*.utp) do (
	gff2xml.exe --kotor %%~nF.utp K1_%%~nF.utp.xml
)
:: UTD
for %%F in (*.utd) do (
	gff2xml.exe --kotor %%~nF.utd K1_%%~nF.utd.xml
)
:: UTE
for %%F in (*.ute) do (
	gff2xml.exe --kotor %%~nF.ute K1_%%~nF.ute.xml
)
:: UTT
for %%F in (*.utt) do (
	gff2xml.exe --kotor %%~nF.utt K1_%%~nF.utt.xml
)
:: UTW
for %%F in (*.utw) do (
	gff2xml.exe --kotor %%~nF.utw K1_%%~nF.utw.xml
)
:: ARE
for %%F in (*.are) do (
	gff2xml.exe --kotor %%~nF.are K1_%%~nF.are.xml
)
:: GIT
for %%F in (*.git) do (
	gff2xml.exe --kotor %%~nF.git K1_%%~nF.git.xml
)
:: IFO
for %%F in (*.ifo) do (
	gff2xml.exe --kotor %%~nF.ifo K1_%%~nF.ifo.xml
)
echo.
pause
exit

Rem 2: tlk2xmlk1
:tlk2xmlk1
:: TLK2XML Batch Script for K1
echo.
echo.------------------------------------
echo TLK2XML for K1
echo.------------------------------------
echo.
echo.
Rem For files in TLK format, convert them to XML using tlk2xml --
for %%F in (*.tlk) do (
	tlk2xml.exe --kotor %%~nF.tlk K1_%%~nF.tlk.xml
)
echo.
pause
exit

Rem 3: ncs2nssk1
:ncs2nssk1
:: NCS2NSS Batch Script for K1
echo.
echo.------------------------------------
echo NCS2NSS for K1
echo.------------------------------------
echo.
echo.
Rem For files in NCS format, decompile them to NSS using ncsdecomp --
for %%F in (*.ncs) do (
	ncsdecomp.exe --kotor %%~nF.ncs K1_%%~nF.nss
)
echo.
pause
exit

Rem 4: gff2xmlk2
:gff2xmlk2
:: GFF2XML Batch Script for K2
echo.
echo.------------------------------------
echo GFF2XML for K2
echo.------------------------------------
echo.
echo.
Rem For files in GFF format, convert them to XML using gff2xml --
:: DLG
for %%F in (*.dlg) do (
	gff2xml.exe --kotor2 %%~nF.dlg K2_%%~nF.dlg.xml
)
:: UTI
for %%F in (*.uti) do (
	gff2xml.exe --kotor2 %%~nF.uti K2_%%~nF.uti.xml
)
:: UTC
for %%F in (*.utc) do (
	gff2xml.exe --kotor2 %%~nF.utc K2_%%~nF.utc.xml
)
:: UTS
for %%F in (*.uts) do (
	gff2xml.exe --kotor2 %%~nF.uts K2_%%~nF.uts.xml
)
:: UTP
for %%F in (*.utp) do (
	gff2xml.exe --kotor2 %%~nF.utp K2_%%~nF.utp.xml
)
:: UTD
for %%F in (*.utd) do (
	gff2xml.exe --kotor2 %%~nF.utd K2_%%~nF.utd.xml
)
:: UTE
for %%F in (*.ute) do (
	gff2xml.exe --kotor2 %%~nF.ute K2_%%~nF.ute.xml
)
:: UTT
for %%F in (*.utt) do (
	gff2xml.exe --kotor2 %%~nF.utt K2_%%~nF.utt.xml
)
:: UTW
for %%F in (*.utw) do (
	gff2xml.exe --kotor2 %%~nF.utw K2_%%~nF.utw.xml
)
:: ARE
for %%F in (*.are) do (
	gff2xml.exe --kotor2 %%~nF.are K2_%%~nF.are.xml
)
:: GIT
for %%F in (*.git) do (
	gff2xml.exe --kotor2 %%~nF.git K2_%%~nF.git.xml
)
:: IFO
for %%F in (*.ifo) do (
	gff2xml.exe --kotor2 %%~nF.ifo K2_%%~nF.ifo.xml
)
echo.
pause
exit

Rem 5: tlk2xmlk2
:tlk2xmlk2
:: TLK2XML Batch Script for K2
echo.
echo.------------------------------------
echo TLK2XML for K2
echo.------------------------------------
echo.
echo.
Rem For files in TLK format, convert them to XML using tlk2xml --
for %%F in (*.tlk) do (
	tlk2xml.exe --kotor2 %%~nF.tlk K2_%%~nF.tlk.xml
)
echo.
pause
exit

Rem 6: ncs2nssk2
:ncs2nssk2
:: NCS2NSS Batch Script for K2
echo.
echo.------------------------------------
echo NCS2NSS for K2
echo.------------------------------------
echo.
echo.
Rem For files in NCS format, decompile them to NSS using ncsdecomp --
for %%F in (*.ncs) do (
	ncsdecomp.exe --kotor2 %%~nF.ncs K2_%%~nF.nss
)
echo.
pause
exit

Rem 7: xml2gff_b
:xml2gff_b
:: XML2GFF Batch Script for K1/K2
echo.
echo.---------------------------------------
echo XML2GFF for K1/K2
echo.---------------------------------------
echo.
echo.
Rem For files in XML format, convert them to GFF using xml2gff --
Rem -- K1 --
echo -- checking K1 version...
echo.
if exist "K1_*.*.xml" (
:: DLG
for %%F in (K1_*.dlg.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTI
for %%F in (K1_*.uti.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTC
for %%F in (K1_*.utc.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTS
for %%F in (K1_*.uts.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTP
for %%F in (K1_*.utp.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTD
for %%F in (K1_*.utd.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTE
for %%F in (K1_*.ute.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTT
for %%F in (K1_*.utt.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTW
for %%F in (K1_*.utw.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: ARE
for %%F in (K1_*.are.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: GIT
for %%F in (K1_*.git.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: IFO
for %%F in (K1_*.ifo.xml) do (
	xml2gff.exe --kotor %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
) else (
    echo          -- nothing to convert
)
echo.
Rem -- K2 --
echo -- checking K2/TSL version...
echo.
if exist "K2_*.*.xml" (
:: DLG
for %%F in (K2_*.dlg.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTI
for %%F in (K2_*.uti.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTC
for %%F in (K2_*.utc.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTS
for %%F in (K2_*.uts.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTP
for %%F in (K2_*.utp.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTD
for %%F in (K2_*.utd.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTE
for %%F in (K2_*.ute.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTT
for %%F in (K2_*.utt.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: UTW
for %%F in (K2_*.utw.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: ARE
for %%F in (K2_*.are.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: GIT
for %%F in (K2_*.git.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
:: IFO
for %%F in (K2_*.ifo.xml) do (
	xml2gff.exe --kotor2 %%~nF.xml -%%~nF.
	echo          -- %%F converted
)
) else (
    echo          -- nothing to convert
)
echo.
pause
exit

Rem 8: xml2tlk_b
:xml2tlk_b
:: XML2TLK Batch Script for K1/K2
echo.
echo.---------------------------------------
echo XML2TLK for K1/K2
echo.---------------------------------------
echo.
echo.
Rem For files in XML format, convert them to TLK using xml2tlk --
Rem -- K1 --
echo -- checking K1 version...
echo.
if exist "K1_*.tlk.xml" (
    for %%F in (K1_*.tlk.xml) do (
        xml2tlk.exe --kotor %%~nF.xml -%%~nF.
	    echo          -- %%F converted
)
) else (
    echo          -- nothing to convert
)
echo.
Rem -- K2 --
echo -- checking K2/TSL version...
echo.
if exist "K2_*.tlk.xml" (
    for %%F in (K2_*.tlk.xml) do (
	    xml2tlk.exe --kotor2 %%~nF.xml -%%~nF.
	    echo          -- %%F converted
) 
) else (
    echo          -- nothing to convert
)
echo.
pause
exit

Rem 9: sff2xml_b
:sff2xml_b
:: SFF2XML Batch Script for K1/K2
echo.
echo.------------------------------------
echo SFF2XML for K1/K2
echo.------------------------------------
echo.
echo.
Rem For files in SFF format, convert them to XML using ssf2xml --
for %%F in (*.sff) do (
	ssf2xml.exe --kotor2 %%~nF.sff %%~nF.sff.xml
)
echo.
pause
exit

Rem 10: xml2sff_b
:xml2sff_b
:: XML2SFF Batch Script for K1/K2
echo.
echo.------------------------------------
echo XML2SFF for K1/K2
echo.------------------------------------
echo.
echo.
Rem For files in XML format, convert them to SFF using xml2sff --
for %%F in (*.sff.xml) do (
	xml2sff.exe --kotor2 %%~nF.xml %%~nF.
)
echo.
pause
exit

Rem 11: convert2da_b
:convert2da_b
:: Execute Convert2DA Script for K1/K2
echo.
echo.------------------------------------
echo Convert2DA for K1/K2
echo.------------------------------------
echo.
echo.
Rem Run Convert2DA --
	convert2da.exe
echo.
pause
exit

Rem 99: k_rem
:k_rem
:: -KRem Batch Script for K1/K2
echo.
echo.-------------------------------------
echo -KRem for K1/K2
echo.-------------------------------------
echo.
echo.
Rem Remove -K~_ prefix from the relevant files --
Rem -- K1 --
echo -- checking K1 files...
echo.
if exist "-K1_*.*" (
    for %%F in (-K1_*.*) do (
	    rename "-K1_*.*" "////*.*"
	    echo          -- -K1_ prefix has been removed
) 
) else (
    echo          -- nothing to remove
)
echo.
Rem -- K2 --
echo -- checking K2/TSL files...
echo.
if exist "*-K2_*.**" (
    for %%F in (-K2_*.*) do (
	    rename "-K2_*.*" "////*.*"
	    echo          -- -K2_ prefix has been removed
) 
) else (
    echo          -- nothing to remove
)
echo.
pause
exit

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i
