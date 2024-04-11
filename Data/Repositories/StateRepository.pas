unit StateRepository;

interface

uses StateEntity, BaseRepository, Generics.Collections;

type
  TStateRepository = class ( TBaseRepository )
    {$region 'Summary'}
    /// <returns> All existing documents </returns>
    {$endregion}
    class function All: TArray<TStateEntity>;
    {$region 'Summary'}
    /// <summary> Create new record with next ID (autoincrement) and current timestamp</summary>
    /// <param name="OldState">Old document state</param>
    /// <param name="NewState">New document state</param>
    /// <param name="DocId">Document ID. Error if not exists</param>
    /// <param name="UserId">User ID. Error if not exists</param>
    /// <returns> SQL execution result</returns>
    {$endregion}
    class function Create( OldState, NewState, DocId, UserId: Integer ): Integer; overload;
    {$region 'Summary'}
    /// <returns> State entity with a specified ID. Otherwise nil</returns>
    {$endregion}
    class function Get( Id: Integer ): TStateEntity;
  end;

implementation

uses Database, SysUtils, System.DateUtils;

class function TStateRepository.All: TArray<TStateEntity>;
begin
  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'SELECT ' + TStateEntity.FieldsString );
  query.SQL.Add( 'FROM ' + TStateEntity.TableName );

  query.Open;
  try
    if query.RecordCount > 0 then
    begin
      SetLength( Result, query.RecordCount );
      query.First;
      var i := 0;
      while not Query.Eof do
      begin
        Result[i] := TStateEntity.Create;
        Result[i].SetFromFields( query.Fields );

        Inc( i );
        Query.Next;
      end;
    end;
  finally
    query.Close;
  end;
end;

class function TStateRepository.Create( OldState, NewState, DocId, UserId: Integer ): Integer;
begin
  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'INSERT OR IGNORE' );
  query.SQL.Add( 'INTO ' + TStateEntity.TableName + '(changeTime, oldState, newState, docId, userId)' );
  query.SQL.Add( 'VALUES( ' + string.Join( ',', [
                                IntToStr(DateTimeToUnix(Now)),
                                IntToStr(oldState),
                                IntToStr(NewState),
                                IntToStr(DocId),
                                IntToStr(UserId) ]) + ');' );
  Result := query.ExecSQL( False );
end;

class function TStateRepository.Get( Id: Integer ): TStateEntity;
begin
  Result := nil;

  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'SELECT ' + TStateEntity.FieldsString );
  query.SQL.Add( 'FROM ' + TStateEntity.TableName );
  query.SQL.Add( 'WHERE id=' + IntToStr(Id) );

  query.Open;
  try
    if query.RecordCount > 0 then
    begin
      query.First;
      Result := TStateEntity.Create;
      Result.SetFromFields( query.Fields );
    end;
  finally
    query.Close;
  end;
end;


end.

