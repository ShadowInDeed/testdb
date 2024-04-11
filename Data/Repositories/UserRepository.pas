unit UserRepository;

interface

uses UserEntity, BaseRepository, Generics.Collections;

type
  TUserRepository = class ( TBaseRepository )
    {$region 'Summary'}
    /// <returns> All existing users </returns>
    {$endregion}
    class function All: TArray<TUserEntity>;
    {$region 'Summary'}
    /// <returns> User with a specified ID. Otherwise nil</returns>
    {$endregion}
    class function Get( Id: Integer ): TUserEntity;
  end;

implementation

uses Database, SysUtils;

class function TUserRepository.All: TArray<TUserEntity>;
begin
  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'SELECT ' + TUserEntity.FieldsString );
  query.SQL.Add( 'FROM ' + TUserEntity.TableName );
  query.SQL.Add( 'ORDER BY id' );

  query.Open;
  try
    if query.RecordCount > 0 then
    begin
      SetLength( Result, query.RecordCount );
      query.First;
      var i := 0;
      while not Query.Eof do
      begin
        Result[i] := TUserEntity.Create;
        Result[i].SetFromFields( query.Fields );

        Inc( i );
        Query.Next;
      end;
    end;
  finally
    query.Close;
  end;
end;

class function TUserRepository.Get( Id: Integer ): TUserEntity;
begin
  Result := nil;

  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'SELECT ' + TUserEntity.FieldsString );
  query.SQL.Add( 'FROM ' + TUserEntity.TableName );
  query.SQL.Add( 'WHERE id=' + IntToStr(Id) );

  query.Open;
  try
    if query.RecordCount > 0 then
    begin
      query.First;
      Result := TUserEntity.Create;
      Result.SetFromFields( query.Fields );
    end;
  finally
    query.Close;
  end;
end;

end.

