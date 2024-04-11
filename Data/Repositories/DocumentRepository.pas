unit DocumentRepository;

interface

uses DocumentEntity, BaseRepository, BaseEntity, Generics.Collections;

type
  TDocumentRepository = class ( TBaseRepository )
    {$region 'Summary'}
    /// <returns> All existing documents </returns>
    {$endregion}
    class function All: TArray<TDocumentEntity>;
    {$region 'Summary'}
    ///  <summary> Change document state and add log record</summary>
    ///  <param name="DocId">Document ID</param>
    ///  <param name="UserId">User ID, who change</param>
    ///  <param name="NewState">New document state</param>
    {$endregion}
    class function ChangeState( DocId, UserId, NewState: Integer ): Integer;
    {$region 'Summary'}
    /// <returns> Document with a specified ID. Otherwise nil</returns>
    {$endregion}
    class function Get( Id: Integer ): TDocumentEntity;
  end;

implementation

uses Database, SysUtils, StateRepository, UserRepository;

class function TDocumentRepository.All: TArray<TDocumentEntity>;
begin
  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'SELECT ' + TDocumentEntity.FieldsString );
  query.SQL.Add( 'FROM ' + TDocumentEntity.TableName );
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
        Result[i] := TDocumentEntity.Create;
        Result[i].SetFromFields( query.Fields );

        Inc( i );
        Query.Next;
      end;
    end;
  finally
    query.Close;
  end;
end;

class function TDocumentRepository.ChangeState( DocId, UserId, NewState: Integer ): Integer;
begin
  var doc := Get( DocId );
  if doc = nil then
    Exit( -1 );

  var user := TUserRepository.Get( UserId );
  if user = nil then
    Exit( -2 );

  if doc.State = NewState then
    Exit( 0 );

  var oldState: Integer := doc.State;

  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'UPDATE ' + TDocumentEntity.TableName );
  query.SQL.Add( 'SET state=' + IntToStr(NewState) );
  query.SQL.Add( 'WHERE id=' + IntToStr(DocID) );
  if query.ExecSQL( False ) <> 0 then
  begin
    Result := TStateRepository.Create( oldState, NewState, DocId, userId );
  end
  else
    Result := 0;
end;

class function TDocumentRepository.Get( Id: Integer ): TDocumentEntity;
begin
  Result := nil;

  var query := DataModule1.FDQuery;
  query.SQL.Clear;
  query.SQL.Add( 'SELECT ' + TDocumentEntity.FieldsString );
  query.SQL.Add( 'FROM ' + TDocumentEntity.TableName );
  query.SQL.Add( 'WHERE id=' + IntToStr(Id) );

  query.Open;
  try
    if query.RecordCount > 0 then
    begin
      query.First;
      Result := TDocumentEntity.Create;
      Result.SetFromFields( query.Fields );
    end;
  finally
    query.Close;
  end;
end;

end.

