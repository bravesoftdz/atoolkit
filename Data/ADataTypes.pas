{**
@Abstract ������ ������ � ������ � ����������� ������
@Author Prof1983 <prof1983@ya.ru>
@Created 13.10.2008
@LastMod 19.07.2012
}
unit ADataTypes;

{DEFINE A02}
{DEFINE A03}

interface

uses
  ABase, ABaseTypes, ADataBase;

const
  ADataBdeGuid: TGuid = '{3A401EE1-A8DC-421F-9048-E8FC1CDC5EC1}';
  BdeDriverName: string = 'Bde';

const
  ADataFibGuid: TGuid = '{724541D0-31DD-4632-AAEC-BA52F3C3C3A9}';
  FibDriverName: string = 'Fib';

// --- Types ---------------------------------------------------------------------------------------

type
  TAFieldType = (
    aftUnknown  = 0,
    aftString   = 1,
    aftSmallInt = 2,
    aftInteger  = 3,
    aftInt64    = 4,
    aftNumeric  = 5,
    aftBoolean  = 6,
    aftFloat    = 7,
    aftDate     = 8,
    aftTime     = 9,
    aftDateTime = 10,
    aftAutoInc  = 11,
    aftBlob     = 12,
    aftMemo     = 13  // VARCHAR
    );

type // ��� �������
  TAIndexType = (
    idxNotUniqum = 0,
    idxUniqum    = 1,
    idxPrimary   = 2
    );

type
  TAJoinType = (
    jtInner      = 0,
    jtLeftOuter  = 1,
    jtRightOuter = 2,
    jtOuter      = 3
    );

type // ��� ������� ������� �������������
  TATableAccess = (
    tbNone      = 0,
    tbRead      = 1,
    tbWrite     = 2,
    tbReadWrite = 3
    );

// --- Structures ----------------------------------------------------------------------------------

{$IFDEF A01}
type
  PADataSet = ADataSet;

type
  // Use ADataConnection
  //ADatabase = type Integer; // ^IADatabase
  PADatabase = ADataConnection;
{$ENDIF A01}

// --- Data ---

type
  // �������� ����
  {PAFieldStructure = type Integer;
  TAFieldStructureFuncs = interface
    // �������� �� ���������
    function Field_GetFieldDefault: AString;
    // ������������ ����
    function Field_GetFieldName: AString;
    // ��� ����
    function Field_GetFieldType: TAFieldType;
    // ������ ����
    function Field_GetFieldSize: AInteger;
    // �� ����� ��������� ������ ��������
    function Field_GetFieldNotNull: ABoolean;
    // ������������ ���� �� �������
    function Field_GetDescription: AString;
    procedure Field_SetFieldDefault(const Value: AString);
  end;}
  AFieldStructure = type Integer; // IAFieldStructure;

  // �������� �������
  AIndexStructure = type Integer; // IAIndexStructure

  {TAIndexStructureFuncs = interface
    // ������ �����
    function GetIndexField: WideString;
    // ��� �������
    function GetIndexType: TAIndexType;
    // ��� �������
    function GetName: WideString;
  end;}

  // �������� ����� ������
  {IAJoinStructure = interface
    // ��� �����������
    property JoinType: TJoinType;
    // ������� �������
    property JoinTable: string;
    // ���� ��� �����
    property JoinFieldIn: string;
    // ���� �� ������� ������� ��� �����
    property JoinFieldOut: string;
    // �������� �����
    property JoinOperator: string;
  end;}

  // �������� �������������
  {IAViewStructure = interface
    function Get_Access: TATableAccess; safecall;
    function Get_Description: WideString; safecall;
    function Get_FieldByIndex(Index: Integer): IAFieldStructure; safecall;
    function Get_FieldCount: Integer; safecall;
    function Get_Name: WideString; safecall;

    // ��� �������������
    property Name: WideString read Get_Name;
    // ������������ ������������� �� �������
    property Description: WideString read Get_Description;
    // ������ ��� ������ �������������
    property Access: TATableAccess read Get_Access;
    // ���������� ��������
    property FieldCount: Integer read Get_FieldCount;
    //** �������� �����
    property FieldsByIndex[Index: Integer]: IAFieldStructure read Get_FieldByIndex;
    //** ���������� �����������
    //ViewJoinsCount: word;
    //** ������ �����������
    //ViewJoins: PJoinArray;
    //** ������ ��� �������� �������������
    //ViewSQLCreate: string;
  end;}

type
  TADatabaseVersion = Integer;
const
  DatabaseVersionMask = $FFFF0000;
  DatabaseVersion10   = $01000000;
  DatabaseVersion11   = $01010000; // v 1.1
  DatabaseVersion12   = $01020000; // v 1.2

type
  TADatabaseStructureProc = procedure(Struct: ADataStructure; DatabaseVersion: TADatabaseVersion); stdcall;
  TAGetStrProc = function: AWideString; stdcall;

// --- Database ---

type
  ADataDriver_GetName_Proc = function(): AWideString; stdcall;

{IFDEF A01}
{
type
  ADataDriverRec = record
    GetName: ADataDriver_GetName_Proc;
    //Connect: function(const ConnectionString: AWideString): IADatabase;
    NewDatabase: function: ADataConnection; stdcall;

    Database_GetConnected: function: Boolean; stdcall;
    Database_GetConnectionString: function: AWideString; stdcall;
    Database_SetConnectionString: procedure(const Value: AWideString); stdcall;
    Database_SetReadOnly: procedure(DataSet: PADataSet; ReadOnly: Boolean); stdcall;

    Database_Close: procedure; stdcall;
    Database_Connect: function: Boolean; stdcall;
    Database_CreateDatabase: function: Boolean; stdcall;
    Database_Disconnect: procedure; stdcall;
    Database_ExecuteSql: function(const Sql: AWideString): Boolean; stdcall;

    DataSet_Change: procedure(DataSet: ADataSet; const SelectSql: AWideString);
  end;
  TADataDriver = ADataDriverRec;
  PADataDriver = ^TADataDriver;
}
{ELSE}
type
  ADataDriverRec = packed record
    GetName: ADataDriver_GetName_Proc;
    //Connect: function(const ConnectionString: AString): IADatabase;
    NewDatabase: function: ADataConnection; stdcall;

    Database_GetConnected: function: ABoolean; stdcall;
    Database_GetConnectionString: function: AWideString; stdcall;
    Database_SetConnectionString: procedure(const Value: AWideString); stdcall;
    Database_SetReadOnly: procedure(DataSet: ADataSet; ReadOnly: ABoolean); stdcall;

    Database_Close: procedure; stdcall;
    Database_Connect: function: ABoolean; stdcall;
    Database_CreateDatabase: function: ABoolean; stdcall;
    Database_Disconnect: procedure; stdcall;
    Database_ExecuteSql: function(const Sql: AWideString): ABoolean; stdcall;

    DataSet_Change: procedure(DataSet: ADataSet; const SelectSql: AWideString);

    Reserved12: AInteger;
    Reserved13: AInteger;
    Reserved14: AInteger;
    Reserved15: AInteger;

    Reserved16: AInteger;
    Reserved17: AInteger;
    Reserved18: AInteger;
    Reserved19: AInteger;
    Reserved20: AInteger;
    Reserved21: AInteger;
    Reserved22: AInteger;
    Reserved23: AInteger;

    Reserved24: AInteger;
    Reserved25: AInteger;
    Reserved26: AInteger;
    Reserved27: AInteger;
    Reserved28: AInteger;
    Reserved29: AInteger;
    Reserved31: AInteger;
    Reserved30: AInteger;
  end;
{ENDIF A01}

type
  PDataDriver = ^ADataDriverRec;

// --- Interfaces ----------------------------------------------------------------------------------

type // �������� ����
  IAFieldStructure = interface
    function Get_FieldDefault: WideString;
    function Get_FieldName: WideString;
    function Get_FieldType: TAFieldType;
    function Get_FieldSize: Integer;
    function Get_FieldNotNull: WordBool;
    function Get_Description: WideString;
    procedure Set_FieldDefault(const Value: WideString);

    // ������������ ����
    property FieldName: WideString read Get_FieldName;
    // ��� ����
    property FieldType: TAFieldType read Get_FieldType;
    // ������ ����
    property FieldSize: Integer read Get_FieldSize;
    // �� ����� ��������� ������ ��������
    property FieldNotNull: WordBool read Get_FieldNotNull;
    // ������������ ���� �� �������
    property Description: WideString read Get_Description;
    // ����������� ����������� ����
    //IsCalculated: Boolean;
    // �������� �� ���������
    property FieldDefault: WideString read Get_FieldDefault write Set_FieldDefault;
  end;

type // �������� �������
  IAIndexStructure = interface
    function Get_IndexField: WideString;
    function Get_IndexType: TAIndexType;
    function Get_Name: WideString;

    // ��� �������
    property Name: WideString read Get_Name;
    // ������ �����
    property IndexField: WideString read Get_IndexField;
    // ��� �������
    property IndexType: TAIndexType read Get_IndexType;
  end;

type // �������� �������
  IATableStructure = interface
    function Get_Description: WideString;
    function Get_FieldByIndex(Index: Integer): IAFieldStructure;
    function Get_FieldCount: Integer;
    function Get_IndexByIndex(Index: Integer): IAIndexStructure;
    function Get_IndexCount: Integer;
    function Get_Access: TATableAccess;
    function Get_Name: WideString;
    procedure Set_Description(const Value: WideString);

    function AddField(const FieldName: WideString; FieldType: TAFieldType): IAFieldStructure; overload;
    function AddField(const FieldName: WideString; FieldType: TAFieldType; FieldSize: Integer; NotNull: Boolean; const Description: WideString): IAFieldStructure; overload;
    function AddField(const FieldName: WideString; FieldType: TAFieldType; FieldSize: Integer; NotNull: Boolean; const Default, Description: WideString): IAFieldStructure; overload;
    function AddFieldItem(Field: IAFieldStructure): Integer;
    function AddIndex(const IndexName: WideString; IndexType: TAIndexType; const IndexFields: WideString): IAIndexStructure;

    // ������������ �������
    property Name: WideString read Get_Name;
    // ������������ ������� �� �������
    property Description: WideString read Get_Description write Set_Description;
    // ������ ��� ������ �������������
    property Access: TATableAccess read Get_Access;
    // ���������� ��������
    property FieldCount: Integer read Get_FieldCount;
    // ����
    property FieldByIndex[Index: Integer]: IAFieldStructure read Get_FieldByIndex;
    // ���������� �������� � �������
    property IndexCount: Integer read Get_IndexCount;
    // ������ ��������
    property IndexByIndex[Index: Integer]: IAIndexStructure read Get_IndexByIndex;
    // ���������� �����������
    //TableJoinsCount: Word;
    // ������ �����������
    //TableJoins: PJoinArray;
  end;

type
  IADatabaseStructure = interface
    function Get_TableByIndex(Index: Integer): IATableStructure;
    function Get_TableByName(const Name: WideString): IATableStructure;
    function Get_TableCount: Integer;

    function AddTable(const TableName: WideString): IATableStructure;
    function AddTableItem(Table: IATableStructure): Integer;
    procedure Clear;

    property TableByIndex[Index: Integer]: IATableStructure read Get_TableByIndex;
    property TableByName[const Name: WideString]: IATableStructure read Get_TableByName;
    property TableCount: Integer read Get_TableCount;
  end;

// ---

type
  IADatabase = interface
    function GetConnected: Boolean;
    function GetConnectionString: AWideString;
    //function Get_DatabaseName: AString;
    procedure SetConnectionString(const Value: AWideString);
    procedure SetReadOnly(DataSet: ADataSet; ReadOnly: Boolean);

    procedure Close;
    function Connect: Boolean;
    function CreateDatabase: Boolean;
    procedure Disconnect;
    function ExecuteSql(const Sql: AWideString): Boolean;

    procedure ChangeDataSet(DataSet: ADataSet; const SelectSql: AWideString);
    function ChechDatabaseStructure(Struct: IADatabaseStructure; Logger: TAddToLogWSProc): Boolean;
    function CheckTableStructure(TableStruct: IATableStructure; Logger: TAddToLogWSProc): Boolean;
    function NewDataSet(const SelectSqlText: AWideString; ReadOnly: ABoolean): ADataSet;
    function NewDataSetA(const SelectSqlText, UpdateSqlText, InsertSqlText, DeleteSqlText, RefreshSqlText: AWideString): ADataSet;
  end;

// --- Procs ---

type
  ADatabase_Close = procedure(Database: ADataConnection); stdcall;
  ADatabase_Connect = function(Database: ADataConnection): ABoolean; stdcall;
  ADatabase_CreateDatabase = function(Database: ADataConnection): ABoolean; stdcall;
  ADatabase_Disconnect = procedure(Database: ADataConnection); stdcall;
  ADatabase_ExecuteSql = function(Database: ADataConnection; const Sql: AWideString): ABoolean; stdcall;
  ADatabase_ChechDatabaseStructure = function(Database: ADataConnection; Struct: ADataStructure; Logger: TAddToLogWSProc): ABoolean; stdcall;
  ADatabase_CheckTableStructure = function(Database: ADataConnection; TableStruct: ATableStructure; Logger: TAddToLogWSProc): ABoolean; stdcall;
  ADatabase_GetConnected = function(Database: ADataConnection): ABoolean; stdcall;
  ADatabase_GetConnectionString = function(Database: ADataConnection): AWideString; stdcall;
  ADatabase_New = function(const DriverName: AWideString): ADataConnection; stdcall;
  ADatabase_NewDataSet = function(Database: ADataConnection; const SelectSqlText: AWideString; ReadOnly: ABoolean): ADataSet; stdcall;
  ADatabase_NewDataSetA = function(Database: ADataConnection; const SelectSqlText, UpdateSqlText, InsertSqlText, DeleteSqlText, RefreshSqlText: AWideString): ADataSet; stdcall;
  ADatabase_SetConnectionString = procedure(Database: ADataConnection; const Value: AWideString); stdcall;
type
  ADatabaseStructure_New = function: ADataStructure; stdcall;
type
  ADriver_Register = function(DataDriver: ADataDriver): AInteger; stdcall;

// --- Testing functions ---------------------------------------------------------------------------

type
  // �������� �� ���������
  AFieldStructure_GetFieldDefault = function: AWideString;
  // ������������ ����
  AFieldStructure_GetFieldName = function: AWideString;
  // ��� ����
  AFieldStructure_GetFieldType = function: TAFieldType;
  // ������ ����
  AFieldStructure_GetFieldSize = function: AInteger;
  // �� ����� ��������� ������ ��������
  AFieldStructure_GetFieldNotNull = function: ABoolean;
  // ������������ ���� �� �������
  AFieldStructure_GetDescription = function: AWideString;
  AFieldStructure_SetFieldDefault = procedure(const Value: AWideString);

var
  FieldStructure_GetFieldDefault: AFieldStructure_GetFieldDefault;
  FieldStructure_GetFieldName: AFieldStructure_GetFieldName;
  FieldStructure_GetFieldType: AFieldStructure_GetFieldType;
  FieldStructure_GetFieldSize: AFieldStructure_GetFieldSize;
  FieldStructure_GetFieldNotNull: AFieldStructure_GetFieldNotNull;
  FieldStructure_GetDescription: AFieldStructure_GetDescription;
  FieldStructure_SetFieldDefault: AFieldStructure_SetFieldDefault;

implementation

end.
