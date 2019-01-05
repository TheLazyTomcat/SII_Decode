{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
program SII_Decode;

{$APPTYPE CONSOLE}

uses
  SII_Decode_Common in '..\..\Source\SII_Decode_Common.pas',
  SII_Decode_Program in '..\SII_Decode_Program.pas',
  SII_Decode_Utils in '..\..\Source\SII_Decode_Utils.pas',
  SII_Decode_FieldData in '..\..\Source\SII_Decode_FieldData.pas',
  SII_Decode_ValueNode in '..\..\Source\SII_Decode_ValueNode.pas',
  SII_Decode_ValueNode_00000001 in '..\..\Source\SII_Decode_ValueNode_00000001.pas',
  SII_Decode_ValueNode_00000002 in '..\..\Source\SII_Decode_ValueNode_00000002.pas',
  SII_Decode_ValueNode_00000003 in '..\..\Source\SII_Decode_ValueNode_00000003.pas',
  SII_Decode_ValueNode_00000004 in '..\..\Source\SII_Decode_ValueNode_00000004.pas',
  SII_Decode_ValueNode_00000005 in '..\..\Source\SII_Decode_ValueNode_00000005.pas',
  SII_Decode_ValueNode_00000006 in '..\..\Source\SII_Decode_ValueNode_00000006.pas';

begin
  SII_Decode_Program.Main;
end.
