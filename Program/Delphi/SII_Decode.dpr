{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
program SII_Decode;

{$APPTYPE CONSOLE}

uses
  SII_Decode_Common    in '..\..\Source\SII_Decode_Common.pas',
  SII_Decode_Utils     in '..\..\Source\SII_Decode_Utils.pas',
  SII_Decode_FieldData in '..\..\Source\SII_Decode_FieldData.pas',
  SII_Decode_ValueNode in '..\..\Source\SII_Decode_ValueNode.pas',

  SII_Decode_ValueNode_00000001 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000001.pas',
  SII_Decode_ValueNode_00000002 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000002.pas',
  SII_Decode_ValueNode_00000003 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000003.pas',
  SII_Decode_ValueNode_00000004 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000004.pas',
  SII_Decode_ValueNode_00000005 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000005.pas',
  SII_Decode_ValueNode_00000006 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000006.pas',
  SII_Decode_ValueNode_00000007 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000007.pas',
  SII_Decode_ValueNode_00000008 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000008.pas',
  SII_Decode_ValueNode_00000009 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000009.pas',
  SII_Decode_ValueNode_0000000A in '..\..\Source\ValueNodes\SII_Decode_ValueNode_0000000A.pas',
  SII_Decode_ValueNode_00000011 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000011.pas',
  SII_Decode_ValueNode_00000012 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000012.pas',
  SII_Decode_ValueNode_00000018 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000018.pas',
  SII_Decode_ValueNode_00000017 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000017.pas',
  SII_Decode_ValueNode_00000019 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000019.pas',
  SII_Decode_ValueNode_0000001A in '..\..\Source\ValueNodes\SII_Decode_ValueNode_0000001A.pas',
  SII_Decode_ValueNode_00000025 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000025.pas',
  SII_Decode_ValueNode_00000026 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000026.pas',
  SII_Decode_ValueNode_00000027 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000027.pas',
  SII_Decode_ValueNode_00000028 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000028.pas',
  SII_Decode_ValueNode_00000029 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000029.pas',
  SII_Decode_ValueNode_0000002A in '..\..\Source\ValueNodes\SII_Decode_ValueNode_0000002A.pas',
  SII_Decode_ValueNode_0000002B in '..\..\Source\ValueNodes\SII_Decode_ValueNode_0000002B.pas',
  SII_Decode_ValueNode_0000002C in '..\..\Source\ValueNodes\SII_Decode_ValueNode_0000002C.pas',
  SII_Decode_ValueNode_00000031 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000031.pas',
  SII_Decode_ValueNode_00000032 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000032.pas',
  SII_Decode_ValueNode_00000033 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000033.pas',
  SII_Decode_ValueNode_00000034 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000034.pas',
  SII_Decode_ValueNode_00000035 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000035.pas',
  SII_Decode_ValueNode_00000036 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000036.pas',
  SII_Decode_ValueNode_00000037 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000037.pas',
  SII_Decode_ValueNode_00000038 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000038.pas',
  SII_Decode_ValueNode_00000039 in '..\..\Source\ValueNodes\SII_Decode_ValueNode_00000039.pas',
  SII_Decode_ValueNode_0000003A in '..\..\Source\ValueNodes\SII_Decode_ValueNode_0000003A.pas',

  SII_Decode_DataBlock in '..\..\Source\SII_Decode_DataBlock.pas',
  SII_Decode_Decoder   in '..\..\Source\SII_Decode_Decoder.pas',

  SII_Decode_Program in '..\SII_Decode_Program.pas';

begin
  SII_Decode_Program.Main;
end.
