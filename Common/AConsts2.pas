﻿{**
@Abstract(Глобальные типы и константы для всех проектов)
@Author(Prof1983 prof1983@ya.ru)
@Created(06.10.2006)
@LastMod(10.05.2012)
@Version(0.5)
}
unit AConsts2;

interface

const
  DIR_CONFIGS  = 'Configs';
  DIR_DATABASE = 'DataBase';
  DIR_LOGS = 'Logs';

// === Глобальные константы ====================================================

const // Расширения файлов -----------------------------------------------------
  FILE_EXT_CONFIG = 'config';
  FILE_EXT_INI    = 'ini';
  FILE_EXT_LOG    = 'log';
  FILE_EXT_MDB    = 'mdb';
  FILE_EXT_XML    = 'xml';

const // Некоторые имена тегов в XML файле конфигурации программ ---------------
  CONFIG_LOG_DOCUMENTS = 'LogDocuments';

const // -----------------------------------------------------------------------
  CR = #13;
  LF = #10;
  CRLF = #13 + #10;

{const // Константы временных интервалов ----------------------------------------
  //** Интервал в часах проверки старых логов
  INTERVAL_CHECK_OLD_LOG = 1.0;
  //** Минимальный размер свободного места на диске (в %)
  MIN_FREE_DISK_SPACE    = 0.01;
  //** Максимальный объем логов (в %)
  MAX_DIR_LOG_SIZE       = 0.05;
  //** Максимальный объем файлов сигналов (в %)
  MAX_DIR_SIG_FILE_SIZE  = 0.20;}

const // Константы для файлов настроек -----------------------------------------
  FILE_EXT_SETTING = '.stg';
  //** Имя файла настроек
  FILE_NAME_SETTING = 'settings' + FILE_EXT_SETTING;
  //** Время ожидания блокировки файлов настроек
  TIMEOUT_LOCK_FILE_SETTING = 5000;
  //** Имя мутекса для блокировки файлов настроек
  NAME_MUTEX_LOCK_SETTING = '%s_Settings_LOCK';
  //** Имя мутекса для блокировки порта
  NAME_MUTEX_LOCK_SERIAL_PORT = 'AR_MUTEX_%s'; //'PROF_MUTEX_%s';
  //** Имя файла проецируемого в память для расшаривания инфы о портах
  NAME_FILE_MAP_SERIAL_PORT = 'AR_SHARE_%s'; //'PROF_SHARE_%s';

const // Стандартная структура папок проекта -----------------------------------
  DEFAULT_DB_DIR = 'DataBase';
  DEFAULT_BIN_DIR = 'Bin';
  //DEFAULT_HTTP_DIR = 'HTTP';
  DEFAULT_MODULE_DIR = 'Modules';
  DEFAULT_LOGS_DIR = 'Logs';
  //DEFAULT_SIGNAL_DIR = 'Signals';
  //DEFAULT_RELS_COEF_DIR = 'RelsCOEF';

{const
  FILE_EXT_RELS_TKR = 'tkr'; }

const
  AR_HOME_PAGE = 'http://aikernel.org';
  AR_EMAIL_MAIN = 'prof1983@yandex.ru';
  PROF_HOME_PAGE = 'http://prof1983.info';
  PROF_EMAIL_MAIN = 'prof1983@yandex.ru';

const // Для регистрации категории COM объектов
  Ar_CategoryComDesc_409 = 'AReason OLE Automation'; //Prof_CategoryComDesc_409 = 'Prof OLE Automation'; // eng
  Ar_CategoryComDesc_419 = 'AReason OLE Automation'; //Prof_CategoryComDesc_419 = 'Prof OLE Automation'; // rus
  CATID_ArAppServer: TGUID = '{C3D94DD9-3B4A-4010-BE1D-0873DC0AF5A7}'; //CATID_ProfAppServer: TGUID = '{43B87872-98B1-44D1-B53E-9E84845FDEA7}';

const // Название группы в которой регистрируются все сервисы ------------------
  LOAD_GROUP: PChar = 'ArServices';

// === Константы ===============================================================

const // Константы приведения типов --------------------------------------------
  STR_BOOL: array[Boolean] of string =
    ('False', 'True');
  STR_BOOL_ENG: array[Boolean] of string =
    ('false', 'true');
  STR_BOOL_RUS: array[Boolean] of string =
    ('нет', 'да');
  STR_MONTH_RUS: array[0..12]of string =
    ('неизвестен', 'январь', 'февраль', 'март', 'апрель', 'май', 'июнь', 'июль',
     'август', 'сентябрь', 'октябрь', 'ноябрь', 'декабрь');
  STR_MONTH_ENG: array[0..12]of string =
    ('none', 'January', 'February', 'March', 'April', 'May', 'June', 'July',
     'August', 'September', 'October', 'November', 'December');
  STR_DAYOFWEEK_RUS: array[0..7]of string =
    ('неизвестно', 'воскресенье', 'понедельник', 'вторник', 'среда', 'четверг',
     'пятница', 'суббота');
  STR_DAYOFWEEK_ENG: array[0..7]of string =
    ('none', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday',
     'Saturday');

const // Константы результата выполнения операций (методов) --------------------
  RESULT_OK    = 0;  // Операция выполнена успешно
  RESULT_ERROR = -1; // Операция не выполнена
const
  RESULT_XML_DOCUMENT_CREATE    = 1;  // XML документ создан (TProfXmlDocument.OpenDocument)
  RESULT_XML_DOCUMENT_NOTCREATE = -2; // XML документ не создан (TProfXmlDocument.OpenDocument)

const // Константы времени -----------------------------------------------------
  DateTimeDay = 1;
  DateTimeHour = DateTimeDay / 24;
  DateTimeMinute = DateTimeHour / 60;
  DateTimeSecond = DateTimeMinute / 60;

// === Сообщения ===============================================================

resourcestring // Сообщения ----------------------------------------------------
  sER_LogGroup_None      = 'неизвестно или неопределено';
  sER_LogGroup_NetWork   = 'работа сети, сокетов, протокола TCP/IP';
  sER_LogGroup_Setup     = 'настройки';
  sER_LogGroup_General   = 'общая информация';
  sER_LogGroup_DataBase  = 'работа базы данных';
  sER_LogGroup_Key       = 'работа с ключом защиты';
  sER_LogGroup_Equipment = 'работа специализированного оборудования';
  sER_LogGroup_Algorithm = 'работа математических алгоритмов';
  sER_LogGroup_System    = 'работа системы Windows';
  sER_LogGroup_User      = 'действия пользователя';
resourcestring
  sER_LogType_None        = 'неизвестно или неопределено';
  sER_LogType_Error       = 'ошибка';
  sER_LogType_Warning     = 'предупреждение';
  sER_LogType_Information = 'сообщение';
  sEr_LogType_Do          = 'выполнить';
const // Стандартные сообщения ----------------------------------------
  info_ConfigureLoad   = 'Конфигурации загружены';
  info_ConfigureSave   = 'Конфигурации сохранены';
  stConfigureLoadOk    = 'Конфигурации загружены';
  stConfigureLoadError = 'Конфигурации не загружены';
  stConfigureLoadStart = 'Загрузка конфигураций';
  stConfigureSaveStart = 'Сохранение конфигураций';
  stConfigureSaveOk    = 'Конфигурации сохранены';
  stConfigureSaveError = 'Конфигурации не сохранены';
  stCreateOk           = 'Объект создан';
  stCreateOkA          = 'Объект "%s" создан';
  stFinalize           = 'Финализация';
  stFinalizeError      = 'Не финализировано';
  stFinalizeOk         = 'Финализировано';
  stFinalizeStart      = 'Финализация';
  stFreeOk             = 'Объект уничтожен';
  stInitialize         = 'Инициализация';
  stInitializeError    = 'Ошибка при инициализации';
  stInitializedA       = 'Объект "%s" инициализирован';
  stInitializeOk       = 'Инициализировано';
  stInitialize_Error   = 'Ошибка при инициализации объекта "%s"';
  stInitialize_Ok      = 'Объект "%s" инициализирован';
  stInitialize_Start   = 'Инициализация обекта "%s"';
  stNotActive          = 'Не активирован';
  stNotAssigned        = '"%s.%s" не задан';
  stNotInitialized     = 'Не инициализировано';
  stNotOverride        = 'Функция не переопределена';
  stNotOverrideA       = 'Функция "%s" не переопределена';
  stNotOverrideB       = 'Функция не переопределена "%s.%s"';
  stProgram            = 'Сообщения программы';

resourcestring // Сообщения ----------------------------------------------------
  err_SaveToFile      = 'Ошибка при сохранении файла "%s" "%s"';
  err_Xml_Load1       = 'Не найден закрывающий тег "?>" Line=%d';
  err_Xml_Load2       = 'Не задан элемент Line=%d';
  err_Xml_ReadNodes_1 = 'Не найдена закрывающая символ ">"';

const //** @abstract(Для логирования всех ошибок)
  err_Exception_Str = '%s <%s.%s>.';

// === unConst ===

{uses
  ProfTypes;}

const // Идентификатор стандартной библиотеки ----------------------------------
  STD_TLB_GUID: TGUID = '{00020430-0000-0000-C000-000000000046}';

const // Описания для датчиков -------------------------------------------------
  STR_CH_SENSOR_NAME_RUS: array[0..3]of string =
    ('левый ближний', 'левый дальний', 'правый дальний', 'правый ближний');
  STR_CH_SENSOR_NAME: array[0..3]of string =
    ('LB', 'LD', 'PD', 'PB');

implementation

end.