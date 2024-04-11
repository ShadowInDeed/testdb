unit BaseEntity;

interface

uses Data.DB;

type
  TBaseEntity = class abstract
    {$region 'Summary'}
    /// <returns> Entity ID</returns>
    {$endregion}
    function  GetId: Integer;                       virtual; abstract;
    {$region 'Summary'}
    /// <returns> Entity fields values, comma separated</returns>
    {$endregion}
    function  ValuesString: string;                 virtual; abstract;
    {$region 'Summary'}
    /// <summary> Set entity fields from query data</summary>
    {$endregion}
    procedure SetFromFields( const Fields: TFields ); virtual; abstract;

    {$region 'Summary'}
    /// <summary> Entity fields names, comma separated</summary>
    {$endregion}
    class function FieldsString: string;  virtual; abstract;
    {$region 'Summary'}
    /// <summary> Name of the table where entity stores</summary>
    {$endregion}
    class function TableName: string;     virtual; abstract;
  end;

implementation

end.
