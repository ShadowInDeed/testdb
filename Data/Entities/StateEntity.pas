unit StateEntity;

interface

uses BaseEntity, Data.DB;

type
  TStateEntity = class ( TBaseEntity )
    constructor Create;
  private
    _Id: Integer;
  	_ChangeTime: TDateTime;
  	_OldState:    Integer;
  	_NewState:    Integer;
  	_DocumentId:  Integer;
  	_UserId:      Integer;
  public
    property Id: Integer read _Id write _Id;
		property ChangeTime: TDateTime  read  _ChangeTime write _ChangeTime;
		property OldState:    Integer read  _OldState   write _OldState;
		property NewState:    Integer read  _NewState   write _NewState;
		property DocumentId:  Integer read  _DocumentId write _DocumentId;
		property UserId:      Integer read  _UserId     write _UserId;

    // TBaseEntity:
    function  GetId: Integer;                       override;
    function  ValuesString: string;                 override;
    procedure SetFromFields( const Fields: TFields ); override;

    class function FieldsString: string;  override;
    class function TableName: string;     override;
  end;

implementation

uses SysUtils, System.DateUtils;

constructor TStateEntity.Create;
begin
    _Id := -1;
  	_ChangeTime := TDateTime.Now;
  	_OldState := -1;
  	_NewState := -1;
  	_DocumentId := -1;
  	_UserId := -1;
end;


class function TStateEntity.TableName: string;
begin
  Result := 'stateLog';
end;

class function TStateEntity.FieldsString: string;
begin
  Result := string.Join( ', ', [
              'id',
              'changeTime',
              'oldState',
              'newState',
              'docId',
              'userId'
            ] );
end;

function TStateEntity.ValuesString: string;
begin
  Result := string.Join( ', ', [
              IntToStr( _Id ),
              IntToStr( DateTimeToUnix(_ChangeTime) ),
              IntToStr( _OldState ),
              IntToStr( _NewState ),
              IntToStr( _DocumentId ),
              IntToStr( _UserId )
            ] );
end;

function TStateEntity.GetId: Integer;
begin
  Result := _Id;
end;

procedure TStateEntity.SetFromFields( const Fields: TFields );
begin
  _Id := Fields[0].AsInteger;
  _ChangeTime := UnixToDateTime( Fields[1].AsInteger );
  _OldState   := Fields[2].AsInteger;
  _NewState   := Fields[3].AsInteger;
  _DocumentId := Fields[4].AsInteger;
  _UserId     := Fields[5].AsInteger;
end;

end.
