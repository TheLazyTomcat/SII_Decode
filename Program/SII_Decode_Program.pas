{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
unit SII_Decode_Program;

{$INCLUDE '..\Source\SII_Decode_defs.inc'}

interface

procedure Main;

implementation

uses
  SysUtils, StrRect, ExplicitStringLists,
  SII_Decode_Decoder;

procedure Main;
var
  Output: TAnsiStringList;
begin
try
  WriteLn('**************************************');
  WriteLn('*      SII Decode utility 1.2.2      *');
  WriteLn('*   (c) 2017 - 2018 Frantisek Milt   *');
  WriteLn('**************************************');
  WriteLn;
  If ParamCount <= 0 then
    begin
      WriteLn('usage:');
      WriteLn;
      WriteLn('  SII_Decode.exe InputFile [OutputFile]');
      WriteLn;
      WriteLn('    InputFile - file that has to be decoded');
      WriteLn('    OutputFile (optional) - target file where to store the decoded result');
      WriteLn;
      Write('Press enter to continue...'); ReadLn;
    end
  else
    begin
      with TSIIBin_Decoder.Create do
      try
        Output := TAnsiStringList.Create;
        try
          Output.TrailingLineBreak := False;
          WriteLn('Loading...');
          LoadFromFile(RTLToStr(ParamStr(1)));
          WriteLn('Converting...');
          Convert(Output);
          WriteLn('Saving...');
          If ParamCount > 1 then
            Output.SaveToFile(ParamStr(2))
          else
            Output.SaveToFile(ParamStr(1));
        finally
          Output.Free;
        end;
      finally
        Free;
      end;
    end;
except
  on E: Exception do
    begin
      WriteLn('An error has occured. Error message:');
      WriteLn;
      WriteLn('  ',E.Message);
      WriteLn;
      Write('Press enter to continue...'); ReadLn;
    end;
end;
end;

end.
