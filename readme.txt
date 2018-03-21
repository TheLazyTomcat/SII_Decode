================================================================================

                               SII Decode utility

                                 version 1.3.x

================================================================================

Index
------------------------------

  Index ...................................................   9
  Description .............................................  22
  Library files ...........................................  40
  Repositories ............................................  65
  Licensing ...............................................  78
  Authors, contacts .......................................  86
  Copyright ...............................................  92



Description
------------------------------
This utility is intended to decode binary form of SII save files (saves from
truck games developed by SCS Software) into their textual form.

At this moment, the binary format specification is not publicly available.
Information necessary for the conversion were obtained only by observing data
patterns in existing saves, therefore the decoder is not complete and any
conversion made by it cannot be verified. It is strongly recommended to backup
original data in case the conversion is done wrong.

The project is primarily developed in Delphi 7 Personal and Lazarus 1.8.x
(FPC 3.x) and therefore can be compiled by those development tools. It should be
also possible to compile it in newer versions of mentioned tools/compilers.
This utility can be compiled into both 32bit and 64bit binaries.



Library files
------------------------------
List of folders with description of their content:

  .\
    Root folder. Contains license and readme files.

  .\Documents

    Documentation of the decoder.

  .\Source

    Source code of this utility. Also contains other units used by the docoder.

  .\Program

    Console program implementation of the decoder.

  .\Scripts

    Batch files for automated compilation and cleaning.



Repositories
----------------------------------------
You can get actual copies of SII Decode utility on either of these git
repositories:

https://github.com/ncs-sniper/SII_Decode
https://bitbucket.org/ncs-sniper/sii_decode

Note - master branch does not contain binaries, you can find them in a branch
       called "bin".



Licensing
----------------------------------------
Everything (source codes, executables/binaries, configurations, etc.) is
licensed under Mozilla Public License Version 2.0. You can find full text of
this license in file license.txt or on web page https://www.mozilla.org/MPL/2.0/.



Authors, contacts
----------------------------------------
František Milt, frantisek.milt@gmail.com



Copyright
----------------------------------------
©2017-2018 František Milt, all rights reserved