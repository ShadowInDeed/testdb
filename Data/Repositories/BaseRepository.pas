unit BaseRepository;

interface

uses BaseEntity;

type
  TBaseRepository = class
    class function Exists( const Entiy: TBaseEntity ): Boolean;
    class function Create( const Entiy: TBaseEntity ): Boolean;
    class function Delete( const Entiy: TBaseEntity ): Boolean;
  end;

implementation

uses Database, SysUtils;

class function TBaseRepository.Exists( const Entiy: TBaseEntity ): Boolean;
begin
  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'SELECT EXISTS(SELECT 1 FROM ' + Entiy.TableName );
  query.SQL.Add( 'WHERE id=' + IntToStr(Entiy.GetId) + ');' );

  query.Open;
  try
    if query.RecordCount > 0 then
    begin
      query.First;
      Result := query.Fields[0].AsInteger <> 0;
    end
    else
      Result := False;
  finally
    query.Close;
  end;
end;

class function TBaseRepository.Create( const Entiy: TBaseEntity ): Boolean;
begin
  if not Assigned( Entiy ) or Exists( Entiy ) then
    Exit( False );

  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'INSERT OR IGNORE' );
  query.SQL.Add( 'INTO ' + Entiy.TableName + '( ' + Entiy.FieldsString + ' )' );
  query.SQL.Add( 'VALUES (' + Entiy.ValuesString + ');' );
  var return := query.ExecSQL( False );
  Result := return <> 0;
end;

class function TBaseRepository.Delete( const Entiy: TBaseEntity ): Boolean;
begin
  if not Assigned( Entiy ) or not Exists( Entiy ) then
    Exit( False );
  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'DELETE FROM ' + Entiy.TableName );
  query.SQL.Add( 'WHERE id=' + IntToStr(Entiy.GetId) );
  var return := query.ExecSQL( False );
  Result := return <> 0;
end;

end.
