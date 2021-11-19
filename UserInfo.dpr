program UserInfo;

uses
  Forms,
  main in 'main.pas' {frmMain},
  EditUser in 'EditUser.pas' {frmEditUser};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmEditUser, frmEditUser);
  Application.CreateForm(TfrmEditUser, frmEditUser);
  Application.Run;
end.
