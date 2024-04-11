unit DocumentEntity;

interface

uses BaseEntity, Data.DB;

type
  TDocumentEntity = class ( TBaseEntity )
    constructor Create;
  private
    _Id:    Integer;
    _State: Integer;
  public
    property Id: Integer    read  _Id     write _Id;
    property State: Integer read  _State  write _State;

    // TBaseEntity:
    function  GetId: Integer;                       override;
    function  ValuesString: string;                 override;
    procedure SetFromFields( const Fields: TFields ); override;

    class function FieldsString: string;  override;
    class function TableName: string;     override;
  end;

implementation

uses SysUtils;

constructor TDocumentEntity.Create;
begin
  _Id := 0;
  _State := 0;
end;

function TDocumentEntity.GetId: Integer;
begin
  Result := _Id;
end;

function TDocumentEntity.ValuesString: string;
begin
  Result := string.Join( ', ', [
              IntToStr( _Id ),
              IntToStr( _State )
            ] );
end;

procedure TDocumentEntity.SetFromFields( const Fields: TFields );
begin
  _Id := Fields[0].AsInteger;
  _State := Fields[1].AsInteger;
end;

class function TDocumentEntity.FieldsString: string;
begin
  Result := string.Join( ', ', [ 'id', 'state' ] );
end;

class function TDocumentEntity.TableName: string;
begin
  Result := 'docs';
end;

end.

