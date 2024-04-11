unit UserEntity;

interface

uses BaseEntity, Data.DB;

type
  TUserEntity = class ( TBaseEntity )
    constructor Create;
  private
    _Id:    Integer;
  public
    property Id:    Integer read  _Id   write _Id;

    // TBaseEntity:
    function  GetId: Integer;                       override;
    function  ValuesString: string;                 override;
    procedure SetFromFields( const Fields: TFields ); override;

    class function FieldsString: string;  override;
    class function TableName: string;     override;
  end;

implementation

uses SysUtils;

constructor TUserEntity.Create;
begin
  _Id := 0;
end;

function TUserEntity.GetId: Integer;
begin
  Result := _Id;
end;

class function TUserEntity.TableName: string;
begin
  Result := 'users';
end;

class function TUserEntity.FieldsString: string;
begin
  Result := string.Join( ', ', [ 'id' ] );
end;

function TUserEntity.ValuesString: string;
begin
  Result := string.Join( ', ', [
              IntToStr(_Id)
            ] );
end;

procedure TUserEntity.SetFromFields( const Fields: TFields );
begin
  _Id := Fields[0].AsInteger;
end;

end.
