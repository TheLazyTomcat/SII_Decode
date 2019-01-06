{-------------------------------------------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

-------------------------------------------------------------------------------}
unit SII_Decode_DataBlock;

{$INCLUDE '.\SII_Decode_defs.inc'}

interface

uses
  Classes, Contnrs,
  AuxTypes,
  SII_Decode_Common, SII_Decode_ValueNode;

{===============================================================================
--------------------------------------------------------------------------------
                               TSIIBin_DataBlock
--------------------------------------------------------------------------------
===============================================================================}
{===============================================================================
    TSIIBin_DataBlock - declaration
===============================================================================}
type
  TSIIBin_DataBlock = class(TObject)
  private
    fFormatVersion: UInt32;
    fStructure:     TSIIBin_Structure;
    fName:          AnsiString;
    fBlockID:       TSIIBin_ID;
    fFields:        TObjectList;
    Function GetFieldCount: Integer;
    Function GetField(Index: Integer): TSIIBin_ValueNode;
  public
    class Function ValueTypeSupported(ValueType: TSIIBin_ValueType): Boolean; virtual;
    constructor Create(FormatVersion: UInt32; Structure: TSIIBin_Structure);
    destructor Destroy; override;
    procedure Load(Stream: TStream); virtual;
    Function AsString: AnsiString; virtual;
    property Name: AnsiString read fName;
    property BlockID: TSIIBin_ID read fBlockID;
    property FieldCount: Integer read GetFieldCount;
    property Fields[Index: Integer]: TSIIBin_ValueNode read GetField; default;

  end;

{===============================================================================
--------------------------------------------------------------------------------
                           TSIIBin_DataBlockUnknowns                            
--------------------------------------------------------------------------------
===============================================================================}
{===============================================================================
    TSIIBin_DataBlockUnknowns - declaration
===============================================================================}

  TSIIBin_DataBlockUnknowns = class(TSIIBin_DataBlock)
  public
    //class Function ValueTypeSupported(ValueType: TSIIBin_ValueType): Boolean; override;
    //procedure Load(Stream: TStream); override;
  end;

implementation

uses
  SysUtils,
  AuxExceptions, ExplicitStringLists,
  SII_Decode_Utils,
  SII_Decode_ValueNode_00000001,
  SII_Decode_ValueNode_00000002,
  SII_Decode_ValueNode_00000003,
  SII_Decode_ValueNode_00000004,
  SII_Decode_ValueNode_00000005,
  SII_Decode_ValueNode_00000006,
  SII_Decode_ValueNode_00000009,
  SII_Decode_ValueNode_0000000A,
  SII_Decode_ValueNode_00000011,
  SII_Decode_ValueNode_00000012,
  SII_Decode_ValueNode_00000017,
  SII_Decode_ValueNode_00000018,
  SII_Decode_ValueNode_00000019,
  SII_Decode_ValueNode_0000001A,
  SII_Decode_ValueNode_00000025,
  SII_Decode_ValueNode_00000026,
  SII_Decode_ValueNode_00000027,
  SII_Decode_ValueNode_00000028,
  SII_Decode_ValueNode_0000002B,
  SII_Decode_ValueNode_0000002C,
  SII_Decode_ValueNode_00000031,
  //SII_Decode_ValueNode_00000032,
  SII_Decode_ValueNode_00000033,
  SII_Decode_ValueNode_00000034,
  SII_Decode_ValueNode_00000035,
  SII_Decode_ValueNode_00000036,
  SII_Decode_ValueNode_00000037,
  SII_Decode_ValueNode_00000039,
  SII_Decode_ValueNode_0000003A;

{===============================================================================
--------------------------------------------------------------------------------
                               TSIIBin_DataBlock
--------------------------------------------------------------------------------
===============================================================================}
{===============================================================================
    TSIIBin_DataBlock - implementation
===============================================================================}
{-------------------------------------------------------------------------------
    TSIIBin_DataBlock - private methods
-------------------------------------------------------------------------------}

Function TSIIBin_DataBlock.GetFieldCount: Integer;
begin
Result := fFields.Count;
end;

//------------------------------------------------------------------------------

Function TSIIBin_DataBlock.GetField(Index: Integer): TSIIBin_ValueNode;
begin
If (Index >= 0) and (Index < fFields.Count) then
  Result := TSIIBin_ValueNode(fFields[Index])
else
  raise EIndexOutOfBounds.Create(Index,Self,'GetField');
end;

{-------------------------------------------------------------------------------
    TSIIBin_DataBlock - public methods
-------------------------------------------------------------------------------}

class Function TSIIBin_DataBlock.ValueTypeSupported(ValueType: TSIIBin_ValueType): Boolean;
begin
Result := ValueType in [$01..$06,$09,$0A,$11,$12,$17..$1A,$25..$28,$2B,$2C,$31,$33..$37,$39..$3D];
end;

//------------------------------------------------------------------------------

constructor TSIIBin_DataBlock.Create(FormatVersion: UInt32; Structure: TSIIBin_Structure);
begin
inherited Create;
fFormatVersion := FormatVersion;
fStructure := Structure;
fName := fStructure.Name;
fFields := TObjectList.Create(True);
end;

//------------------------------------------------------------------------------

destructor TSIIBin_DataBlock.Destroy;
begin
fFields.Free;
inherited;
end;

//------------------------------------------------------------------------------

procedure TSIIBin_DataBlock.Load(Stream: TStream);
var
  i:        Integer;
  FieldObj: TSIIBin_ValueNode;
begin
SIIBin_LoadID(Stream,fBlockID);
SIIBin_DecodeID(fBlockID);
For i := Low(fStructure.Fields) to High(fStructure.Fields) do
  begin
    case fStructure.Fields[i].ValueType of
      $00000001:  FieldObj := TSIIBin_ValueNode_00000001.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000002:  FieldObj := TSIIBin_ValueNode_00000002.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000003:  FieldObj := TSIIBin_ValueNode_00000003.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000004:  FieldObj := TSIIBin_ValueNode_00000004.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000005:  FieldObj := TSIIBin_ValueNode_00000005.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000006:  FieldObj := TSIIBin_ValueNode_00000006.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000009:  FieldObj := TSIIBin_ValueNode_00000009.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $0000000A:  FieldObj := TSIIBin_ValueNode_0000000A.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000011:  FieldObj := TSIIBin_ValueNode_00000011.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000012:  FieldObj := TSIIBin_ValueNode_00000012.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000017:  FieldObj := TSIIBin_ValueNode_00000017.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000018:  FieldObj := TSIIBin_ValueNode_00000018.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000019:  FieldObj := TSIIBin_ValueNode_00000019.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $0000001A:  FieldObj := TSIIBin_ValueNode_0000001A.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000025:  FieldObj := TSIIBin_ValueNode_00000025.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000026:  FieldObj := TSIIBin_ValueNode_00000026.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000027:  FieldObj := TSIIBin_ValueNode_00000027.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000028:  FieldObj := TSIIBin_ValueNode_00000028.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $0000002B:  FieldObj := TSIIBin_ValueNode_0000002B.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $0000002C:  FieldObj := TSIIBin_ValueNode_0000002C.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000031:  FieldObj := TSIIBin_ValueNode_00000031.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000033:  FieldObj := TSIIBin_ValueNode_00000033.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000034:  FieldObj := TSIIBin_ValueNode_00000034.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000035:  FieldObj := TSIIBin_ValueNode_00000035.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000036:  FieldObj := TSIIBin_ValueNode_00000036.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000037:  FieldObj := TSIIBin_ValueNode_00000037.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $00000039,
      $0000003B,
      $0000003D:  FieldObj := TSIIBin_ValueNode_00000039.Create(fFormatVersion,fStructure.Fields[i],Stream);
      $0000003A,
      $0000003C:  FieldObj := TSIIBin_ValueNode_0000003A.Create(fFormatVersion,fStructure.Fields[i],Stream);
    else
      raise EGeneralException.CreateFmt('Unknown value type: %s(%d) at %d.',[fStructure.Fields[i].ValueName,
                                        fStructure.Fields[i].ValueType,Stream.Position],Self,'Load');
    end;
    fFields.Add(FieldObj);
  end;
end;

//------------------------------------------------------------------------------

Function TSIIBin_DataBlock.AsString: AnsiString;
var
  i:  Integer;
begin
with TAnsiStringList.Create do
try
  AddDef(Format('%s : %s {',[fName,SIIBin_IDToStr(fBlockID,fFormatVersion < 2)]));
  For i := 0 to Pred(fFields.Count) do
    Add(TSIIBin_ValueNode(fFields[i]).AsLine(1));
  AddDef('}');
  Result := Text;
finally
  Free;
end;
end;

end.
