{$IF Defined(WINDOWS) or Defined(MSWINDOWS)}
  {$DEFINE Windows}
{$IFEND}

{$IFDEF FPC}
  {$MODE ObjFPC}{$H+}
  {$MODESWITCH CLASSICPROCVARS+}
  {$INLINE ON}
  {$DEFINE CanInline}
  {$DEFINE FPC_DisableWarns}
  {$MACRO ON}
{$ELSE}
  {$IF CompilerVersion >= 17 then}  // Delphi 2005+
    {$DEFINE CanInline}
  {$ELSE}
    {$UNDEF CanInline}
  {$IFEND}
{$ENDIF}

// don't touch following
{$UNDEF ESL_Short}
{$UNDEF ESL_Ansi}
{$UNDEF ESL_UTF8}
{$UNDEF ESL_Wide}
{$UNDEF ESL_Unicode}
{$UNDEF ESL_Default}

{$UNDEF ESL_ShortHelper}

{$IFOPT H+}
  // long strings (Ansi/Unicode)
  {$UNDEF ESL_ShortDefault}
{$ELSE}
  // short strings
  {$DEFINE ESL_ShortDefault}
{$ENDIF}
