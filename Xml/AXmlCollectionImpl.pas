{**
@Abstract(XML)
@Author(Prof1983 prof1983@ya.ru)
@Created(09.10.2005)
@LastMod(02.07.2012)
@Version(0.5)
}
unit AXmlCollectionImpl;

interface

uses
  XmlIntf,
  ABase, AXmlCollectionIntf, AXmlNodeIntf, AXmlNodeListUtils, AXmlNodeUtils;

type
  // ��������� �����
  TProfXmlCollection = class(TInterfacedObject, IProfXmlCollection)
  protected
    FCollection: IXmlNodeCollection;
    FNodes: AXmlNodeList; //array of AProfXmlNode;
    FOwner: AProfXmlNode;
  public // IProfXmlCollection
    function DeleteNode(Node: AProfXmlNode): WordBool;
    function GetCount(): Integer;
    function GetNode(Index: Integer): AProfXmlNode;
  public
    function AddChild(const AName: WideString): AProfXmlNode;
    function AddNode(Node: AProfXmlNode): AInt; deprecated; // Use NewNode() or AXmlNodeList_Add()
    procedure Clear();
    function FindNode(const Name: WideString): AProfXmlNode; deprecated; // Use AXmlNodeList_FindNode()
    procedure Free();
    function GetNodeByAttribute(AttrName, AttrValue: WideString): AProfXmlNode; deprecated; // Use AXmlNode_GetChildNodeByAttribute()
    function GetNodeByName(Name: WideString): AProfXmlNode;
    function NewNode(const Name: WideString): AProfXmlNode;
  public
    constructor Create(AOwner: AProfXmlNode);
    constructor Create2(Collection: IXmlNodeCollection);
  public
    //property Count: Integer read GetCount;
    property Nodes[Index: Integer]: AProfXmlNode read GetNode;
    property NodesByName[Name: WideString]: AProfXmlNode read GetNodeByName;
  end;

implementation

{ TProfXmlCollection }

function TProfXmlCollection.AddChild(const AName: WideString): AProfXmlNode;
begin
  Result := NewNode(AName);
end;

function TProfXmlCollection.AddNode(Node: AProfXmlNode): AInt;
{var
  I: Int32;
  Document: AXmlDocument;}
begin
  Result := AXmlNodeList_Add(FNodes, Node);
  {I := Length(FNodes);
  SetLength(FNodes, I + 1);
  FNodes[I] := Node;

  // Only if (TObject(Node) is TProfXmlNode1) then
  Document := AXmlNode_GetDocument(FOwner);
  AXmlNode_SetDocument(FNodes[I], Document);}
end;

procedure TProfXmlCollection.Clear();
begin
  AXmlNodeList_Clear(FNodes);
end;

constructor TProfXmlCollection.Create(AOwner: AProfXmlNode);
begin
  inherited Create;
  FCollection := nil;
  FOwner := AOwner;
  FNodes := AXmlNode_GetChildNodes(FOwner);
end;

constructor TProfXmlCollection.Create2(Collection: IXmlNodeCollection);
begin
  inherited Create();
  FCollection := Collection;
end;

function TProfXmlCollection.DeleteNode(Node: AProfXmlNode): WordBool;
begin
  Result := (AXmlNodeList_Remove(FNodes, Node) >= 0);
end;

function TProfXmlCollection.FindNode(const Name: WideString): AProfXmlNode;
begin
  Result := AXmlNodeList_FindNode(FNodes, Name);
end;

procedure TProfXmlCollection.Free();
begin
  Clear();
  inherited Free();
end;

function TProfXmlCollection.GetCount(): Integer;
begin
  Result := AXmlNodeList_GetCount(FNodes);
end;

function TProfXmlCollection.GetNode(Index: Integer): AProfXmlNode;
begin
  Result := AXmlNodeList_GetNodeByIndex(FNodes, Index);
end;

function TProfXmlCollection.GetNodeByAttribute(AttrName, AttrValue: WideString): AProfXmlNode;
begin
  Result := AXmlNode_GetChildNodeByAttribute(Self.FOwner, AttrName, AttrValue);
end;

function TProfXmlCollection.GetNodeByName(Name: WideString): AProfXmlNode;
var
  Res: AProfXmlNode1;
  Document: AXmlDocument;
begin
  if (Name = '') then
  begin
    Result := 0;
    Exit;
  end;
  Result := FindNode(Name);
  if (Result <> 0) then Exit;
  Document := AXmlNode_GetDocument(FOwner);
  Res := AXmlNode1_New(Document);
  AXmlNode_SetName(Res, Name);
  AddNode(AProfXmlNode1(Res));
  Result := AProfXmlNode1(Res);
end;

{function TProfXmlCollection.Get_Node(Index: Integer): AProfXmlNode2;
var
  Node: TProfXmlNode1;
begin
  Node := TProfXmlNode1(GetNode(Index));
  if not(Assigned(Node)) then
  begin
    Result := nil;
    Exit;
  end;
  Result := Node;
end;}

function TProfXmlCollection.NewNode(const Name: WideString): AProfXmlNode;
var
  Res: AProfXmlNode1;
  Document: AXmlDocument;
begin
  Document := AXmlNode_GetDocument(FOwner);
  Res := AXmlNode1_New(Document);
  AXmlNode_SetName(Res, Name);
  AddNode(AProfXmlNode1(Res));
  Result := AProfXmlNode1(Res);
end;

end.
