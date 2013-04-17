{**
@Author Prof1983 <prof1983@ya.ru>
@Created 26.12.2012
@LastMod 17.04.2013
}
unit ADataMain;

{$define AStdCall}

interface

uses
  ABase,
  ABaseTypes,
  ADataBase,
  ADataUtils,
  AStringMain;

// --- AData ---

function AData_Fin(): AError; {$ifdef AStdCall}stdcall;{$endif}

function AData_Init(): AError; {$ifdef AStdCall}stdcall;{$endif}

function AData_NewConnection(const DriverName: AString_Type): ADataConnection; {$ifdef AStdCall}stdcall;{$endif}

function AData_NewConnectionP(const DriverName: APascalString): ADataConnection;

function AData_NewDatabaseStructure(): ADataStructure; {$ifdef AStdCall}stdcall;{$endif}

function AData_NewDatabaseWS(const DriverName: AWideString): ADataConnection; {$ifdef AStdCall}stdcall;{$endif}

function AData_RegisterDriver(DataDriver: ADataDriver): AInt; {$ifdef AStdCall}stdcall;{$endif}

// --- Data ---

function Data_Done(): AError;

function Data_Init(): AError;

function Data_NewDatabase(const DriverName: AWideString): ADataConnection; stdcall; deprecated {$ifdef ADeprText}'Use AData_NewDatabaseWS()'{$endif};

function Data_NewDatabaseStructure: ADataStructure; stdcall; deprecated {$ifdef ADeprText}'Use AData_NewDatabaseStructure()'{$endif};

function Data_RegisterDriver(DataDriver: ADataDriver): AInteger; stdcall; deprecated {$ifdef ADeprText}'Use AData_RegisterDriver()'{$endif};

implementation

// --- AData ---

function AData_Fin(): AError;
begin
  FInitialized := False;
  Result := 0;
end;

function AData_Init(): AError;
begin
  if FInitialized then
  begin
    Result := 0;
    Exit;
  end;

  FInitialized := True;
  Result := 0;
end;

function AData_NewConnection(const DriverName: AString_Type): ADataConnection;
begin
  Result := AData_NewConnectionP(AString_ToP(DriverName));
end;

function AData_NewConnectionP(const DriverName: APascalString): ADataConnection;
begin
  try
    Result := ADataUtils.Data_NewDatabase(DriverName);
  except
    Result := 0;
  end;
end;

function AData_NewDatabaseStructure(): ADataStructure;
begin
  try
    Result := ADataUtils.Data_NewDatabaseStructure();
  except
    Result := 0;
  end;
end;

function AData_NewDatabaseWS(const DriverName: AWideString): ADataConnection;
begin
  try
    Result := ADataUtils.Data_NewDatabase(DriverName);
  except
    Result := 0;
  end;
end;

function AData_RegisterDriver(DataDriver: ADataDriver): AInt;
begin
  try
    Result := ADataUtils.Data_RegisterDriver(DataDriver);
  except
    Result := -1;
  end;
end;

{ Data }

function Data_Done(): AError;
begin
  Result := AData_Fin()
end;

function Data_Init(): AError;
begin
  Result := AData_Init();
end;

function Data_NewDatabase(const DriverName: AWideString): ADataConnection;
begin
  Result := AData_NewDatabaseWS(DriverName);
end;

function Data_NewDatabaseStructure(): ADataStructure;
begin
  Result := AData_NewDatabaseStructure();
end;

function Data_RegisterDriver(DataDriver: ADataDriver): AInt;
begin
  Result := AData_RegisterDriver(DataDriver);
end;

end.
