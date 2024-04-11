program TestDb;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  Database in 'Database.pas' {DataModule1: TDataModule},
  UserEntity in 'Data\Entities\UserEntity.pas',
  DocumentEntity in 'Data\Entities\DocumentEntity.pas',
  StateEntity in 'Data\Entities\StateEntity.pas',
  BaseEntity in 'Data\Entities\BaseEntity.pas',
  DocumentController in 'Controllers\DocumentController.pas',
  UserRepository in 'Data\Repositories\UserRepository.pas',
  DocumentRepository in 'Data\Repositories\DocumentRepository.pas',
  StateRepository in 'Data\Repositories\StateRepository.pas',
  BaseRepository in 'Data\Repositories\BaseRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
