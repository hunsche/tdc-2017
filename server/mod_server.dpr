library mod_server;

uses
  {$IFDEF MSWINDOWS}
  Winapi.ActiveX,
  System.Win.ComObj,
  {$ENDIF }
  Web.WebBroker,
  Web.ApacheApp,
  Web.HTTPD24Impl,
  Data.DBXCommon,
  Datasnap.DSSession,
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDataModule},
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  uDog in 'uDog.pas',
  uPeople in 'uPeople.pas';

{$R *.res}

// httpd.conf entries:
//
(*
 LoadModule server_module modules/mod_server.dll

 <Location /xyz>
    SetHandler mod_server-handler
 </Location>
*)
//
// These entries assume that the output directory for this project is the apache/modules directory.
//
// httpd.conf entries should be different if the project is changed in these ways:
//   1. The TApacheModuleData variable name is changed
//   2. The project is renamed.
//   3. The output directory is not the apache/modules directory
//

// Declare exported variable so that Apache can access this module.
var
  GModuleData: TApacheModuleData;
exports
  GModuleData name 'server_module';

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
{$IFDEF MSWINDOWS}
  CoInitFlags := COINIT_MULTITHREADED;
{$ENDIF}
  Web.ApacheApp.InitApplication(@GModuleData);
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TApacheApplication(Application).OnTerminate := TerminateThreads;
  Application.Run;
end.
