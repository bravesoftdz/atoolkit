﻿{**
@Abstract(Класс главной форма - оболочка для TForm)
@Author(Prof1983 prof1983@ya.ru)
@Created(16.11.2005)
@LastMod(25.05.2012)
@Version(0.5)
}
unit AFormMain;

interface

uses
  Classes, Forms, SysUtils, XmlIntf,
  ALogDocumentsAll, AForm2007, ALogDocumentIntf, AXml3,
  ATypes, AXmlUtils;

type
  TProfFormMain = class(TProfForm)
  private
    FConfigFileName: WideString;
    FConfigFilePath: WideString;
    FIsConfigDocumentInit: Boolean; // ConfigDocument инициализирован в этом объекте
    FIsLogDocumentsInit: Boolean;   // LogDocuments инициализирован в этом объекте
    FLogFilePath: WideString;
    FLogID: Integer;
    FLogName: string;
    FLogTypeSet: TLogTypeSet;
  protected
    FLogDocuments: ILogDocuments2;
  public
    constructor Create(AOwner: TComponent); override;
      //** Финализация программы (конфигурации, логирование)
    procedure Done(); virtual;
      //** Инициализация программы (конфигурации, логирование)
    procedure Init(); virtual;
  published
      //** Имя файла конфигураций (с путем или без него)
    property ConfigFileName: WideString read FConfigFileName write FConfigFileName;
      //** Путь к файлу конфигураций (если ConfigFileName = '' то берется имя .exe файла без расширения)
    property ConfigFilePath: WideString read FConfigFilePath write FConfigFilePath;
      //** Путь к файлу логирования .txt
    property LogFilePath: WideString read FLogFilePath write FLogFilePath;
      //** ID программы для подключения к системе логирования
    property LogID: Integer read FLogID write FLogID;
      //** Имя программы для подключения к системе логирования
    property LogName: string read FLogName write FLogName;
      //** Устанавливаем в какие места выводить Log
    property LogTypeSet: TLogTypeSet read FLogTypeSet write FLogTypeSet;
  end;

implementation

// Function --------------------------------------------------------------------

function StrPosEnd(const St: WideString; C: WideChar): Integer;
// Ищет индекс символа C в строке St с конца строки. Возвращает 0, если символ не найден.
var
  I: Integer;
begin
  Result := 0;
  for I := Length(St) downto 1 do if St[I] = C then begin Result := I; Exit; end;
end;

// TProfFormMain ---------------------------------------------------------------

constructor TProfFormMain.Create(AOwner: TComponent);
begin
  FLogID := 123;
  FLogName := ChangeFileExt(ExtractFileName(ParamStr(0)), '');
  inherited Create(AOwner);
  FIsConfigDocumentInit := False;
  FIsLogDocumentsInit := False;
end;

procedure TProfFormMain.Done();
begin
  {if FIsLogDocumentsInit and Assigned(FLogDocuments) then
  try
    FLogDocuments.Finalize();
    FLogDocuments.Free();
  finally
    FLogDocuments := nil;
  end;}

  ConfigureSave();

  DoFinalize();

  if FIsConfigDocumentInit and Assigned(FConfigDocument) then
  try
    { $IFDEF VER150}
    // Проверим наличие файла
    if (not FileExists(FConfigFileName)) then
    begin
      // Создадим каталог, если надо
      ForceDirectories(ExtractFilePath(FConfigFileName));
    end;
    { $ENDIF}

    FConfigDocument.SaveToFile(FConfigFileName);
    FreeAndNil(FConfigDocument);
    //FConfigDocument := nil;
  except
  end;
end;

procedure TProfFormMain.Init();
var
  doc: TProfXmlDocument;
  conf: IXmlNode;
begin
  if not(Assigned(FConfigDocument)) and not(Assigned(FConfig)) then
  try
    if (FConfigFileName = '') then
      FConfigFileName := ChangeFileExt(ExtractFileName(ParamStr(0)), '.config');
    // Получение полного имени файла
    if ExtractFilePath(FConfigFileName) = '' then
    begin
      if (FConfigFilePath = '') then
        FConfigFileName := ExtractFilePath(ParamStr(0)) + FConfigFileName
      else
        FConfigFileName := FConfigFilePath + FConfigFileName;
    end;
    // Проверка существования директории
    {$IFDEF VER150}
    ForceDirectories(ExtractFilePath(FConfigFileName));
    {$ENDIF}
    // Создание объекта
    doc := TProfXmlDocument.Create(FConfigFileName);
    doc.Initialize();
    FConfigDocument := doc.Controller;
    // Проверим наличие файла----
    FIsConfigDocumentInit := True;
  except
  end;
  if not(Assigned(FConfig)) and Assigned(FConfigDocument) then
  try          
    conf := FConfigDocument.DocumentElement as IXmlNode;
    FConfig := ProfXmlNode_GetNodeByName(conf, 'FormMain');
  except
  end;

  ConfigureLoad();

  if not(Assigned(FLogDocuments)) then
  begin
    conf := nil;
    //if Assigned(FConfig) then conf := FConfig.GetNodeByName('Logs');

    FLogDocuments := TLogDocumentsAll.Create(conf, FLogTypeSet, FLogFilePath, FLogID, FLogName);
    FIsLogDocumentsInit := True;
  end;
  FLog := FLogDocuments;
end;

end.