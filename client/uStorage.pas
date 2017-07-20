unit uStorage;

interface

uses
  System.Generics.Collections;

type

  TStorage = class
  private
    FCache: TDictionary<string, string>;
    procedure SetCache(const Value: TDictionary<string, string>);
  public
    constructor Create;
    destructor Destroy; override;
    property Cache: TDictionary<string, string> read FCache write SetCache;
  end;

var
  Storage: TStorage;

implementation

{ TStorage }

constructor TStorage.Create;
begin
  FCache := TDictionary<string, string>.Create;
end;

destructor TStorage.Destroy;
begin
  FCache.Free;
  inherited;
end;

procedure TStorage.SetCache(const Value: TDictionary<string, string>);
begin
  FCache := Value;
end;

initialization
  if not Assigned(Storage) then
    Storage := TStorage.Create;

finalization
  Storage.Free;

end.
