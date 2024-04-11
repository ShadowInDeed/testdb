unit DocumentController;

interface

type
  TDocumentController = class
    class function ChangeState( Id, UserId, NewState: Integer ): Integer;
  end;

implementation

uses DocumentRepository;

class function TDocumentController.ChangeState( Id, UserId, NewState: Integer ): Integer;
begin
  Result := TDocumentRepository.ChangeState( Id, UserId, NewState );
end;

end.
