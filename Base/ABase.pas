﻿{**
@Abstract(Base types and consts (Базовые типы и константы))
@Author(Prof1983 prof1983@ya.ru)
@Created(06.03.2008)
@LastMod(10.07.2012)
@Version(0.5)

0.3.2
[*] Восстановил использование AWideString (01.09.2011)
}
unit ABase;

{$I A.inc}

{DEFINE A02}

interface

type // Простые типы
  AFloat32 = Single;
  AFloat64 = Double;
  AInt08 = ShortInt;
  AInt16 = SmallInt;
  AInt32 = LongInt;
  AInt64 = Int64;
  AUInt08 = Byte;
  AUInt16 = Word;
  AUInt32 = LongWord;
  AUInt64 = Int64;
  AWideChar = WideChar;

type // Простые типы
  ABool = Boolean;
  AChar = Char; // Или UTF-32 (UCS4Char)
  AInt = Integer;
  ASize = LongWord;

type
  ABoolean = ABool;
  AFloat = AFloat32;
  AInteger = AInt;
  AUInt = AUInt32;

type // Версия. Имеет формат $AABBCCDD = AA.BB.CC.DD
  AVersion = type Integer;
const // Маска для проверки соответсвия версий модулей
  AVersionMask = $FFFF0000;

type
  { Возвращаемое значение функций. Значения:
    <0 - ошибка при выполнении,
    0 - выполнение прошло успешно
    >0 - выполнение прошло успешно, но есть замечания или информация }
  AError = type Integer;

// --- Array ---

type
  //AArray = ^AArray_Type;
  AArray_Type = packed record {4x4}
    Data: Pointer;
    Len: AInteger;
    AllocateLen: AInteger;
    Reserved03: AInteger;
  end;

// --- String ---

type
  AWideString = WideString;
  APascalString = {$IFDEF DELPHI_2010_UP}string{$ELSE}WideString{$ENDIF};

type
  AString_Type = packed record  // (4x4 = 16 bytes)
    Str: WideString;
    Reserved01: AInteger;
    Reserved02: AInteger;
    Reserved03: AInteger;
    { Вероятно будет реализовано в V04
    Str: PChar;                // Нультерминальная строка (UTF-8). Массив байтов, заканчивающийся нулем. Аналог GString Points to the string's current \0-terminated value (gchar).
    Len: AInteger;             // Длина строки (кол-во символов). Аналог GString Current length (gsize)
    AllocSize: ASize;          // Размер выделенной памяти в байтах. Аналог GString allocated_len (gsize).
    Code: AInteger;            // Кодировка символов: 0-Нультерминальная строка UTF-8; (1-Нультерминальная строка Ansi)
    }
  end;

type
  {$IFDEF A01}
  AString = AWideString;
  {$ELSE}
  AString  = ^AString_Type;
  {$ENDIF}

{
type
  // (для Win32 и Linux)
  AData   = Pointer;
  // (для CLR и Java)
  //AData   = TObject;
}

// --- ---

type
  AProc01 = procedure; stdcall;
  AProc02 = AProc01;
  AProc03 = function(): AInteger; stdcall;
  ACallbackProc01 = procedure(Obj, Data: AInteger); stdcall;
  ACallbackProc02 = ACallbackProc01;
  ACallbackProc03 = function(Obj, Data: AInteger): AError; stdcall;

type
  {$IFDEF A01}
    AProc = AProc01;
    ACallbackProc = ACallbackProc01;
  {$ELSE}
    {$IFDEF A02}
    AProc = AProc02;
    ANotifyProc = procedure(Sender: AInteger); stdcall;
    ACallbackProc = ACallbackProc02;
    {$ELSE}
    AProc = AProc03;
    ACallbackProc = ACallbackProc03;
    {$ENDIF}
  {$ENDIF}

type
  // = TAbstractSettings or TProfXmlNode1 or TProfXmlNode4
  AConfig = type AInteger;
  AEvent = type AInteger;       // = AEvent_Type^ - Указатель на структуру AEvent_Type
  AColor = type AInteger;
  {$IFDEF A02}
  //AStrings = type AInteger;     // Заменил на ACollectionsBase.AStringList
  {$ENDIF A02}

type
  ALibrary = type AInteger;
  ALibraryFlags = type AInteger;

type
  {**
    Идентификатор. Глобальный тип для использования во всех модулях.
    Номер 0 может использоваться для хранения глобальных параметров системы.
    Номера от 0 до 1023 заререзвированы.
    Номер 1024 используется для хранения настроек программы.
    Номера от 1025 до 2047 используются для определения внутренних типов программы.
    Номера от 2028 до 65535 зарезервированы.
    Номера от 65535 до 2^31 используются свободно для локального приложения.
    Использование номеров от 2^32 до 2^63 выделяются сервером системы.
    Сущности с номерами от 2^32 хранятся на сервере
    (локальные копии могут хранится на локальном компьютере).
    Аналог: org.framerd.OID.OID
  }
  AId = AInt64;
  TAId = AId;

  AMessage = type AInt; // = AMessage_Type*
  AMessage_Type = record
      {** Message identifier }
    MsgId: AInt;
      {** Message type }
    MsgType: AInt;
      {** Message data size }
    MsgDataSize: AInt;
    {**
      Message data (depends on the MsgType):
        ConversationID
        Content
        Encoding
        InReplyTo
        Language
        Ontology
        Protocol
        ReceiverName
        ReplyBy
        ReplyWith
        Performative
        PersistentID
        SenderName
    }
    MsgData: Pointer;
  end;

  AXmlNodeCollection = type AInt; // TProfXmlCollection
  AXmlDocument = type AInt; // AXmlDocumentImpl.TProfXmlDocument or TProfXmlDocument1
  AProfXmlDocument = type AXmlDocument; // AXmlDocumentImpl.TProfXmlDocument
  AProfXmlDocument1 = type Integer; // TProfXmlDocument1
  AXmlNode = type AInt; // AXmlNodeImpl.TProfXmlNode TProfXmlNode1 or TProfXmlNode2
  AProfXmlNode = type AXmlNode; // AXmlNodeImpl.TProfXmlNode or TProfXmlNode2
  AProfXmlNode1 = type AProfXmlNode; // TProfXmlNode1
  AProfXmlNode2 = type AProfXmlNode; // TProfXmlNode2
  AProfXmlNodeA = type AInt; // IProfXmlNodeA
  AXmlNodeList = type AInt; // =AXmlNodeList_Type.Id (TProfXmlNodeList)
  AConfigNode = AXmlNode; // =AXmlNode or AConfig

implementation

end.
