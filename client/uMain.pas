unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, uStorage;

type
  TForm4 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    CheckBox2: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
  private
    function GetHash(Value: string): string;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses
  System.Generics.Collections, IdHash, IdHashSHA, IdSSLOpenSSL, IdHashMessageDigest;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
const
  BASE_URL = 'http://%s:%s/api/datasnap/rest';
  BASE_RESOURCE = 'TServerMethods1/%s/%s';
var
  resource, result, key: string;
  indexEtag: Integer;
begin
  RESTClient1.BaseURL := Format(BASE_URL, [Edit1.Text, Edit2.Text]);

  if CheckBox1.Checked then
    RESTRequest1.AcceptEncoding := 'gzip'
  else
    RESTRequest1.AcceptEncoding := '';

  if RadioButton1.Checked then
    resource := 'peoples'
  else
    resource := 'dogs';

  RESTRequest1.Resource := Format(BASE_RESOURCE, [resource, Edit3.Text]);

  key := GetHash(RESTRequest1.Resource);
  if CheckBox2.Checked and Storage.Cache.ContainsKey(key) then
    RESTRequest1.Params.AddHeader('If-None-Match', GetHash(Storage.Cache[key]));

  RESTRequest1.Execute;

  result := RESTResponse1.Content;

  indexEtag := RESTResponse1.Headers.IndexOfName('ETag');
  if indexEtag >= 0 then
  begin
    if (RESTResponse1.StatusCode = 201) then
      result := Storage.Cache[key]
    else
      Storage.Cache.AddOrSetValue(key, RESTResponse1.Content);
  end;

  Memo1.Lines.Text := result;

  Edit4.Text := RESTResponse1.ContentLength.ToString;
end;

function TForm4.GetHash(Value: string): string;
var
  MD5: TIdHashMessageDigest5;
begin
  Result := Value;
  MD5 := TIdHashMessageDigest5.Create;
  try
    Result := MD5.HashStringAsHex(Value);
  finally
    MD5.Free;
  end;
end;

end.
