{**
@Abstract(At Log types)
@Author(Prof1983 prof1983@ya.ru)
@Created(09.06.2012)
@LastMod(09.06.2012)
@Version(0.5)
}
unit ALogTypes;

interface

uses
  Graphics;

type //** ��� ��������� ��� ������ � ��� ����
  TLogTypeMessageColor = Graphics.TColor;
const
    //** ���������� ��� ������������
  ltNoneColor = clBlack;
    //** ������
  ltErrorColor = clRed;
    //** ��������������
  ltWarningColor = clYellow;
    //** ���������
  ltInformationColor = clBlue;

implementation

end.
