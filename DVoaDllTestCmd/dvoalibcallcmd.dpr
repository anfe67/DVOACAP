program DVoaDllTestCmd;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes;


function Predict(ArgsStr: PAnsiChar): PAnsiChar; stdcall; external 'dvoa';

var
  Lst: TStringList;
  AnsiStr: AnsiString;
begin
  try
    Lst := TStringList.Create;
    try
      Lst.LoadFromFile(ExtractFilePath(ParamStr(0)) + ParamStr(1));
      AnsiStr := Lst.Text;
      Lst.Text := Predict(PAnsiChar(AnsiStr));
      Lst.SaveToFile(ExtractFilePath(ParamStr(0)) + ParamStr(2));
    finally
      Lst.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

