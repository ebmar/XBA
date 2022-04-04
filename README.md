# Xoreos' Batch Actions [XBA] for K1/TSL

### Various actions to complement @DrMcCoy's [Xoreos Tools](https://xoreos.org/downloads/index.html) -- compiled on a batch script that worked and tested with Windows 10.

It currently limited only to several actions, such as :

1.  `GFF to XML` -- K1
2.  `TLK to XML` -- K1
3.  `NCS to NSS` -- K1 [bytecodes]
4.  `GFF to XML` -- TSL
5.  `TLK to XML` -- TSL
6.  `NCS to NSS` -- TSL [bytecodes]
7.  `XML to GFF` -- K1/TSL
8.  `XML to TLK` -- K1/TSL
9.  `Convert2DA` -- K1/TSL (requires [convert2da](https://web.archive.org/web/20101129192005/http://starwarsknights.com/mtools/Convert2da.rar))
10. `Remove game-ID [-KRem]` (to remove the game-version-placeholder prefix)

-- and requires to executed under the same folder with the tools.

**P.S.** Both `SFF to XML` & `XML to SFF` functions are currently redundant, as the binary didn't seem to work as intended.

```
:: Xoreos' Batch Actions [XBA] for K1/TSL
:: Version        : 1.1.0 [April 01, 2022]
:: Created By     : ebmar
:: Created On     : February 24, 2022 [v1.0.0]
:: Streamlined By : DarthParametric & ebmar
:: Streamlined On : April 01, 2022
:: Based On       : ReiKaz, of Resident Evil Modding Forum [https://residentevilmodding.boards.net/thread/12359/wem-ogg-wav-converter-batch]
::                : Flachzangen, of Nexus Mods [https://www.nexusmods.com/kotor/mods/1384]
::                : DarthParametric, of Deadly Stream [https://deadlystream.com/profile/15735-darthparametric/]
```

[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
