unit uPeople;

interface

type

  TPeople = class
  private
    Fname: string;
    Fid: Integer;
    procedure Setid(const Value: Integer);
    procedure Setname(const Value: string);
  public
    constructor Create(id: Integer; name: string);
    property id: Integer read Fid write Setid;
    property name: string read Fname write Setname;
  end;

implementation

{ TPeople }

constructor TPeople.Create(id: Integer; name: string);
begin
  Fid := id;
  Fname := name;
end;

procedure TPeople.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TPeople.Setname(const Value: string);
begin
  Fname := Value;
end;

end.