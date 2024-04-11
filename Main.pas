unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Tabs, Database,
  Vcl.DBCGrids, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    DataSourceUsers: TDataSource;
    DBGridDocuments: TDBGrid;
    DBGridUsers: TDBGrid;
    DataSourceDocs: TDataSource;
    GroupBoxDocuments: TGroupBox;
    GroupBoxUsers: TGroupBox;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    GroupBoxLogs: TGroupBox;
    DBGridLogs: TDBGrid;
    DataSourceLogs: TDataSource;
    DBNavigatorDocs: TDBNavigator;
    DBNavigatorLogs: TDBNavigator;
    DBNavigatorUsers: TDBNavigator;
    SpeedButtonAddUser: TSpeedButton;
    SpeedButtonChangeStates: TSpeedButton;
    SpeedButtonAddDoc: TSpeedButton;
    procedure SpeedButtonAddUserClick(Sender: TObject);
    procedure SpeedButtonAddDocClick(Sender: TObject);
    procedure SpeedButtonChangeStatesClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UserEntity, UserRepository, DocumentEntity, DocumentRepository, Math;

{$R *.dfm}

procedure TForm1.SpeedButtonAddDocClick(Sender: TObject);
begin
  // Add document with random ID and default state:
  var doc := TDocumentEntity.Create;
  doc.Id := RandomRange(1, Integer.MaxValue );

  while not TDocumentRepository.Create( doc ) do
    doc.Id := RandomRange(1, Integer.MaxValue );

  // Refresh table:
  DBGridDocuments.DataSource.DataSet.Refresh;
end;

procedure TForm1.SpeedButtonAddUserClick(Sender: TObject);
begin
  // Add user with random ID and default state:
  var user := TUserEntity.Create;
  user.Id := RandomRange(1, Integer.MaxValue );

  while not TUserRepository.Create( user ) do
    user.Id := RandomRange(1, Integer.MaxValue );

  // Refresh table:
  DBGridUsers.DataSource.DataSet.Refresh;
end;

procedure TForm1.SpeedButtonChangeStatesClick(Sender: TObject);
begin
  var users := TUserRepository.All;
  var docs := TDocumentRepository.All;

  // No users or documents:
  if ( Length(users) = 0 ) or ( Length(docs) = 0 ) then
  begin
    Application.MessageBox( 'Please add users and documents first', 'Error', MB_OK+MB_ICONWARNING );
    Exit;
  end;

  // Set random state for each document, from random user:
  for var doc in docs do
    TDocumentRepository.ChangeState( doc.Id,
      users[RandomRange(Low(users), High(users))].Id, // random user
      RandomRange(1, 100) ); // random state

  // Refresh table:
  DBGridLogs.DataSource.DataSet.Refresh;
end;

end.
