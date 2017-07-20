unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    Datasnap.DSServer, Datasnap.DSAuth, System.Generics.Collections, uDog,
  uPeople;

type
{$METHODINFO ON}
  TServerMethods1 = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Peoples(Value: Integer): TList<TPeople>;
    function Dogs(Value: Integer): TList<TDog>;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.Dogs(Value: Integer): TList<TDog>;
var
  I: Integer;
begin
  Result := TList<TDog>.Create;
  try
  for I := 1 to Value do
  begin
    Result.Add(TDog.Create(I, 'Dog ' + I.ToString))
  end;
  except
    Result.Free;
  end;
end;

function TServerMethods1.Peoples(Value: Integer): TList<TPeople>;
var
  I: Integer;
begin
  Result := TList<TPeople>.Create;
  try
  for I := 1 to Value do
  begin
    Result.Add(TPeople.Create(I, 'People ' + I.ToString))
  end;
  except
    Result.Free;
  end;
end;


end.

