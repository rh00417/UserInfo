unit EditUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrlsEh, Mask;

type
  TfrmEditUser = class(TForm)
    paTop: TPanel;
    paBot: TPanel;
    btCancel: TButton;
    btOk: TButton;
    edUsrName: TDBEditEh;
    edUsr: TDBEditEh;
    edPassword: TDBEditEh;
    paAll: TPanel;
    cbPlatform: TDBComboBoxEh;
    edMName: TDBEditEh;
    edFName: TDBEditEh;
    edLName: TDBEditEh;
    cbRMesto: TDBComboBoxEh;
    chAll: TDBCheckBoxEh;
    procedure chAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditUser: TfrmEditUser;

implementation

{$R *.dfm}

// доступность всех настроек
procedure TfrmEditUser.chAllClick(Sender: TObject);
begin
  paAll.Enabled := chAll.Checked;
end;

end.
