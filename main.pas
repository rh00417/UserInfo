unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IB_Services, MemTableDataEh, Db,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, MemTableEh, DBGridEhImpExp, Mask, DBCtrlsEh,
  Menus, DBVertGridsEh, DBLookupEh;

type
  TfrmMain = class(TForm)
    sSec: TpFIBSecurityService;
    paTop: TPanel;
    Panel2: TPanel;
    btStart: TButton;
    mtUsr: TMemTableEh;
    dgUsr: TDBGridEh;
    dsUsr: TDataSource;
    sd1: TSaveDialog;
    btSave: TButton;
    pmMenu: TPopupMenu;
    mpDelUser: TMenuItem;
    cbBase: TDBComboBoxEh;
    btEditUser: TButton;
    procedure btStartClick(Sender: TObject);
    procedure dgUsrTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btSaveClick(Sender: TObject);
    procedure mpDelUserClick(Sender: TObject);
    procedure btEditUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  loc: string;  // локация
const
  cr = #10#13;

implementation

{$R *.dfm}

uses EditUser;

procedure TfrmMain.btSaveClick(Sender: TObject);
var
  Path: string;
begin
  GetDir(0,Path);
  sd1.FileName := 'Пользователи '+loc;
  sd1.DefaultExt := 'xlsx';
  sd1.Filter := 'Все файлы|*.*|Excel|*.xlsx';
  sd1.InitialDir := path;
  if sd1.Execute then
//   SaveDBGridEhToExportFile(TDBGridEhExportAsText,dgUsr,sd1.FileName,true);
   SaveDBGridEhToExportFile(TDBGridEhExportAsOLEXLS,dgUsr,sd1.FileName,true);
end;


{--------------------- MesYesNo ------------------------------------------------}
function MesYesNo(const title,mes: string; tip: boolean = true): boolean;
// tip - выбранная кнопка по умолчанию YES
begin

//MessageBox(0, '', '', MB_ICONSTOP or MB_OK or MB_DEFAULT_DESKTOP_ONLY);
  if tip then
    result := (MessageBox(GetActiveWindow,PChar(mes), PChar(title),
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1)=IDYES)
  else
    result := (MessageBox(GetActiveWindow,PChar(mes), PChar(title),
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=IDYES);
end;
{--------------------- MesYesNo1 ------------------------------------------------}
function MesYesNo1(const title,mes: string; tip: boolean = true): boolean;
// tip - выбранная кнопка по умолчанию YES
begin

//MessageBox(0, '', '', MB_ICONSTOP or MB_OK or MB_DEFAULT_DESKTOP_ONLY);
  if tip then
    result := (Application.MessageBox(PChar(mes), PChar(title),
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1)=IDYES)
  else
    result := (Application.MessageBox(PChar(mes), PChar(title),
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=IDYES);
end;
{--------------------- MesEr --------------------------------------------------}
procedure MesEr(const mes: string; log: Boolean = true);  // ошибка
begin
  MessageBox(GetActiveWindow,PChar(mes), PChar('Ошибка'), MB_OK+MB_ICONERROR);
end;
{--------------------- MeWarn --------------------------------------------------}
procedure MesWarn(const mes: string); // предупреждение
begin
//  MessageBox(GetActiveWindow,PChar(mes), PChar('Внимание'), MB_OK+MB_ICONWARNING);
  MessageBox(0,PChar(mes), PChar('Внимание'), MB_OK+MB_ICONWARNING);
end;
{--------------------- MeOk --------------------------------------------------}
procedure MesOk(const mes: string); // сообщение
begin
//  MessageBox(GetActiveWindow,PChar(mes), PChar('Сообщение'), MB_OK+MB_ICONINFORMATION);
  MessageBox(0,PChar(mes), PChar('Сообщение'), MB_OK+MB_ICONINFORMATION);
end;



procedure TfrmMain.btStartClick(Sender: TObject);
const
  // права доступа, код=название
  usr: array[0..1,-1..8] of string = (('нет','DO','DI','DP','M','S','G','C','F','B'),
         ('нет',
         'Диспетчер отгрузки',
         'Диспетчер приема заказов',
         'Диспетчер по планированию',
         'Мастер',
         'Кладовщик',
         'Грузчик',
         'Начальник',
         'Финансист',
         'Бухгалтер')
         );
  // площадки
  plat: array[0..2] of string = ('Все','Первая','Вторая');
  // левые usera
  xUser:  array[0..7] of AnsiString = ('SYSDBA','UNLOCK','MASTER','WEBCLIENT','SYSCLIENT1C','FOREL','INTERMAC','PROCMON');
var
  i,j,n,l: Integer;
//  ch: string;
  ch: char;
  pl: string;
  s: string;
  sBase: string;
  pas: string;
  iBase: string;
  fl: boolean;

begin

  sBase := upperCase(frmMain.cbBase.Text);
  loc := Copy(sBase,1,3); // локация
  if (loc = 'MIN') then
  begin
    pas := 'pf,sk';
    iBase := '10.107.197.18';
  end
  else
  if (loc = 'KNI') then
  begin
    pas := 'gkfybhjdfybt';
    iBase := '10.107.202.18';
  end
  else
  if (loc = 'SMR') then
  begin
    pas := 'ghjuhtcc';
    iBase := '10.107.208.18';
  end
  else
  if (loc = 'YAR') then
  begin
    pas := 'jgsn';
    iBase := '10.107.209.18';
  end
  else
  begin
    MesEr('Ошибка. Неизвестная локация '+loc);
    Exit;
  end;

  sSec.Params.Clear;
  sSec.Params.Append('user_name=SYSDBA');
  sSec.Params.Append('sql_role_name=');
  sSec.Params.Append('password='+pas);
  sSec.ServerName := iBase;       // только IP

  sSec.SecurityAction := ActionDisplayUser;
  sSec.Attach;
  sSec.DisplayUsers;
  sSec.Detach;

  mtUsr.EmptyTable;
  mtUsr.DisableControls;
  try
  for i := 0 to sSec.UserInfoCount-1 do
  begin
    l := 1;
    fl := true;
    for s in xUser do
    if (s=sSec.UserInfo[i].UserName) then
    begin
      fl := false;
      break;
    end;


//    for j := Low(xUser) to High(xUser) do  // пропустить
//    begin
//     if (Trim(sSec.UserInfo[i].UserName)=xUser[j]) then
//       Continue;
//    end;

    begin
      if fl then
      begin
        for j := Low(usr[0]) to High(usr[0]) do  // определить роль по первым 2-3 знакам имени
        begin
          n := ansiPos(usr[0,j],sSec.UserInfo[i].UserName);
          if (n=1) then // найдено
          begin
            // проверить номер площадки
            l := Length(usr[0,j])+1;
            ch := sSec.UserInfo[i].UserName[length(usr[0,j])+1];
            case ch of
              '0': begin pl := 'Первая'; inc(l); end;
              '1': begin pl := 'Вторая'; inc(l); end;
              else pl := 'Все';
            end;
            n := j;
            break;
          end
          else
            n := -1;
        end;
      end;
      mtUsr.Append;
      mtUsr.FieldByName('IP').AsString := sSec.ServerName;
      mtUsr.FieldByName('UsrName').AsString := sSec.UserInfo[i].UserName;  //Имя пользователя FB
      mtUsr.FieldByName('Usr').AsString := Copy(sSec.UserInfo[i].UserName,l,100);  //Имя без прав доступа и площадки
      mtUsr.FieldByName('FName').AsString := UTF8ToString(sSec.UserInfo[i].FirstName);
      mtUsr.FieldByName('MName').AsString := UTF8ToString(sSec.UserInfo[i].MiddleName);
      mtUsr.FieldByName('LName').AsString := UTF8ToString(sSec.UserInfo[i].LastName);
      mtUsr.FieldByName('Location').AsString := Loc;
      mtUsr.FieldByName('Platform').AsString := pl;
      mtUsr.FieldByName('Prava').AsString := usr[0,n];
      mtUsr.FieldByName('RMesto').AsString := usr[1,n];
      mtUsr.Post;
    end;
  end;
  mtUsr.First;
  finally
    mtUsr.EnableControls;
  end;

end;


// редактирование строки
procedure TfrmMain.btEditUserClick(Sender: TObject);
begin
  frmEditUser.edUsrName.Text := mtUsr.FieldByName('UsrName').AsString;
  frmEditUser.edUsr.Text := mtUsr.FieldByName('Usr').AsString;
  frmEditUser.edMName.Text := mtUsr.FieldByName('MName').AsString;
  frmEditUser.edFName.Text := mtUsr.FieldByName('FName').AsString;
  frmEditUser.edLName.Text := mtUsr.FieldByName('LName').AsString;
  frmEditUser.cbRMesto.Text := mtUsr.FieldByName('RMesto').AsString;
  frmEditUser.cbPlatform.Text := mtUsr.FieldByName('Platform').AsString;

  frmEditUser.Show;
end;

// сортировка
procedure TfrmMain.dgUsrTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if (mtUsr.SortOrder = Column.FieldName) or
      (mtUsr.SortOrder = Column.FieldName+' DESC')  then
  begin
    if mtUsr.SortOrder=Column.FieldName then
    begin
      mtUsr.SortOrder := mtUsr.SortOrder+' DESC';
//      Column.Title.SortIndex := 2;
      Column.Title.SortMarker := smDownEh;
    end
    else
    begin
      mtUsr.SortOrder := '';
//      Column.Title.SortIndex := 0;
      Column.Title.SortMarker := smNoneEh;
    end;
  end
  else
  begin
    mtUsr.SortOrder := Column.FieldName;
//    Column.Title.SortIndex := 1;
    Column.Title.SortMarker := smUpEh;
  end;

end;

// удалить пользователя
procedure TfrmMain.mpDelUserClick(Sender: TObject);
begin

  if (mtUsr.IsEmpty or (mtUsr.FieldByName('UsrName').AsString='')) then
  begin
    MesEr('Нет данных');
    exit;
  end;

  if not MesYesNo('Удалить','Удалить запись?'+cr
       +mtUsr.FieldByName('LName').AsString
       +' '
       +mtUsr.FieldByName('FName').AsString
       +' '
       +mtUsr.FieldByName('MName').AsString) then
    Exit;

  sSec.SecurityAction := ActionDeleteUser;
  sSec.UserName := mtUsr.FieldByName('UsrName').AsString;
  sSec.Attach;
  sSec.DeleteUser;
  sSec.Detach;

end;

end.
