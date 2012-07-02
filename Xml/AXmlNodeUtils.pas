{**
@Abstract(AXmlNode functions)
@Author(Prof1983 prof1983@ya.ru)
@Created(28.06.2012)
@LastMod(02.07.2012)
@Version(0.5)
}
unit AXmlNodeUtils;

interface

uses
  XmlIntf,
  ABase;

// --- AXmlNode ---

function AXmlNode_AsString(Node: AXmlNode): APascalString;

function AXmlNode_GetAttributeCount(Node: AXmlNode): AInteger;

function AXmlNode_GetAttributeName(Node: AXmlNode; Index: AInt): APascalString;

function AXmlNode_GetAttributeValue(Node: AXmlNode; const Name: APascalString): APascalString;

function AXmlNode_GetAttributeValue2(Node: AXmlNode; const Name: APascalString;
    UpperCase: ABoolean): APascalString;

function AXmlNode_GetAttributeValueByIndex(Node: AXmlNode; Index: AInt): APascalString;

function AXmlNode_GetChildNodeByAttribute(Node: AXmlNode; const AttrName, AttrValue: APascalString): AXmlNode;

{** Return TProfXmlNode }
function AXmlNode_GetChildNodeByName(Node: AXmlNode; const Name: APascalString): AProfXmlNode;

function AXmlNode_GetChildNodeCount(Node: AXmlNode): AInt;

function AXmlNode_GetChildNodes(Node: AXmlNode): AXmlNodeList;

function AXmlNode_GetCollection(Node: AXmlNode): AXmlNodeCollection;

function AXmlNode_GetDocument(Node: AXmlNode): AXmlDocument;

function AXmlNode_GetName(Node: AXmlNode): APascalString;

function AXmlNode_GetNameAndAttributes(Node: AXmlNode; const Value: APascalString): AError;

function AXmlNode_GetValueAsBool(Node: AXmlNode; out Value: ABoolean): AError;

function AXmlNode_GetValueAsDateTime(Node: AXmlNode; out Value: TDateTime): AError;

function AXmlNode_GetValueAsInt(Node: AXmlNode; out Value: AInt): AError;

function AXmlNode_GetValueAsInt32(Node: AXmlNode; out Value: AInt32): AError;

function AXmlNode_GetValueAsInt64(Node: AXmlNode; out Value: AInt64): AError;

function AXmlNode_GetValueAsString(Node: AXmlNode; out Value: APascalString): AError;

function AXmlNode_GetValueAsUInt08(Node: AXmlNode; out Value: AUInt08): AError;

function AXmlNode_GetValueAsUInt64(Node: AXmlNode; out Value: AUInt64): AError;

function AXmlNode_GetXml(Node: AXmlNode): APascalString;

function AXmlNode_GetXmlA(Node: AXmlNode; const Prefix: APascalString): APascalString;

function AXmlNode_Free(Node: AXmlNode): AError;

function AXmlNode_SetDocument(Node: AXmlNode; Document: AXmlDocument): AError;

function AXmlNode_SetName(Node: AXmlNode; const Name: APascalString): AError;

function AXmlNode_SetValueAsBool(Node: AXmlNode; Value: ABoolean): AError;

function AXmlNode_SetValueAsFloat64(Node: AXmlNode; Value: AFloat64): AError;

function AXmlNode_SetValueAsInt32(Node: AXmlNode; Value: AInt32): AError;

function AXmlNode_SetXml(Node: AXmlNode; const S: APascalString): AError;

function AXmlNode_SetXmlA(Node: AXmlNode; var Value: APascalString; const CloseTag: APascalString): AError;

// --- AXmlNode0 ---

function AXmlNode0_New(): AXmlNode;

// --- AXmlNode1 ---

function AXmlNode1_New(Document: AXmlDocument): AXmlNode;

// --- AXmlNode2 ---

function AXmlNode2_New(Node: IXmlNode): AProfXmlNode2;

implementation

uses
  AXml2007, AXmlNodeImpl;

// --- AXmlNode ---

function AXmlNode_AsString(Node: AXmlNode): APascalString;
begin
  if (TObject(Node) is TProfXmlNode) then
    Result := TProfXmlNode(Node).AsString
  else if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).AsString
  else if (TObject(Node) is TProfXmlNode2) then
    Result := TProfXmlNode2(Node).AsString
  else
    Result := '';
end;

function AXmlNode_CreateCollection(Node: AXmlNode): AXmlNodeCollection;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := AXmlNodeCollection_New1(Node)
    xxx
    Result := TProfXmlNode1(Node).Get_Collection()
  else if (TObject(Node) is TProfXmlNode2) then
    Result := AXmlNodeCollection_New2(Node)
  else
    Result := 0;
end;

function AXmlNode_GetAttributeCount(Node: AXmlNode): AInteger;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).Attributes_Count()
  else
    Result := -1;
end;

function AXmlNode_GetAttributeName(Node: AXmlNode; Index: AInt): APascalString;
begin
  Result := TProfXmlNode1(Node).Attribute_Name[Index];
end;

function AXmlNode_GetAttributeValue(Node: AXmlNode; const Name: APascalString): APascalString;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).GetAttribute(Name)
  else if (TObject(Node) is TProfXmlNode2) then
    Result := TProfXmlNode2(Node).GetAttribute(Name)
  else
    Result := '';
end;

function AXmlNode_GetAttributeValue2(Node: AXmlNode; const Name: APascalString;
    UpperCase: ABoolean): APascalString;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).GetAttribute(Name, UpperCase)
  else
    Result := '';
end;

function AXmlNode_GetAttributeValueByIndex(Node: AXmlNode; Index: AInt): APascalString;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).Attribute_Value[Index]
  else
    Result := '';
end;

function AXmlNode_GetChildNodeByAttribute(Node: AXmlNode; const AttrName, AttrValue: APascalString): AXmlNode;
var
  Nodes: AXmlNodeList;
  Count: AInt;
  ChildNode: AXmlNode;
begin
  Nodes := AXmlNode_GetChildNodes(Node);
  Count := AXmlNodeList_GetCount();
  for I := 0 to Count - 1 do
  begin
    ChildNode := AXmlNodeList_GetNodeByIndex(Nodes, I);
    if (AXmlNode_GetAttributeValue(ChildNode, AttrName) = AttrValue) then
    begin
      Result := ChildNode;
      Exit;
    end;
  end;
  Result := 0;
end;

function AXmlNode_GetChildNodeByName(Node: AXmlNode; const Name: APascalString): AProfXmlNode;
begin
  if (TObject(Node) is TProfXmlNode) then
    Result := TProfXmlNode(Node).GetNodeByName(Name)
  else
    Result := 0;
end;

function AXmlNode_GetChildNodeCount(Node: AXmlNode): AInt;
var
  Nodes: AXmlNodeList;
begin
  if (TObject(Node) is TProfXmlNode) then
  begin
    if not(Assigned(TProfXmlNode(Node).Node)) then
    begin
      Result := -1;
      Exit;
    end;
    try
      Result := TProfXmlNode(Node).ChildNodes.Count;
    except
      Result := -1;
    end;
  end
  else if (TObject(Node) is TProfXmlNode2) then
  begin
    if Assigned(TProfXmlNode2(Node).Node) then
    try
      Result := TProfXmlNode2(Node).Node.ChildNodes.Count;
    except
      Result := -1;
    end
    else
    begin
      Nodes := TProfXmlNode2(Node).GetChildNodes();
      Result := AXmlNodeList_GetCount(Nodes);
      Exit;
    end;
  end
  else
    Result := -1;
end;

function AXmlNode_GetChildNodes(Node: AXmlNode): AXmlNodeList;
begin
  if (TObject(Node) is TProfXmlNode2) then
    Result := TProfXmlNode2(Node).GetChildNodes()
  else
    Result := 0;
end;

function AXmlNode_GetCollection(Node: AXmlNode): AXmlNodeCollection;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).Get_Collection()
  else
    Result := 0;
end;

function AXmlNode_GetDocument(Node: AXmlNode): AXmlDocument;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).Document.GetSelf()
  else
    Result := 0;
end;

function AXmlNode_GetName(Node: AXmlNode): APascalString;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).GetName()
  else if (TObject(Node) is TProfXmlNode2) then
    Result := TProfXmlNode2(Node).GetName()
  else
    Result := '';
end;

function AXmlNode_GetNameAndAttributes(Node: AXmlNode; const Value: APascalString): AError;
begin
  if (TObject(Node) is TProfXmlNode2) then
  begin
    TProfXmlNode2(Node).GetNameAndAttributes(Value);
    Result := 0;
  end
  else
    Result := -1;
end;

function AXmlNode_GetValueAsBool(Node: AXmlNode; out Value: ABoolean): AError;
begin
  if (Node = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if (TObject(Node) is TProfXmlNode1) then
  begin
    if TProfXmlNode1(Node).GetValueAsBool(Value) then
      Result := 0
    else
      Result := -4;
  end
  else
    Result := -3;
end;

function AXmlNode_GetValueAsDateTime(Node: AXmlNode; out Value: TDateTime): AError;
begin
  if (Node = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if (TObject(Node) is TProfXmlNode1) then
  begin
    if TProfXmlNode1(Node).GetValueAsDateTime(Value) then
      Result := 0
    else
      Result := -4;
  end
  else
    Result := -3;
end;

function AXmlNode_GetValueAsInt(Node: AXmlNode; out Value: AInt): AError;
begin
  if (Node = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if (TObject(Node) is TProfXmlNode1) then
  begin
    if TProfXmlNode1(Node).GetValueAsInteger(Value) then
      Result := 0
    else
      Result := -4;
  end
  else
    Result := -3;
end;

function AXmlNode_GetValueAsInt32(Node: AXmlNode; out Value: AInt32): AError;
begin
  if (Node = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if (TObject(Node) is TProfXmlNode1) then
  begin
    if TProfXmlNode1(Node).GetValueAsInt32(Value) then
      Result := 0
    else
      Result := -4;
  end
  else
    Result := -3;
end;

function AXmlNode_GetValueAsInt64(Node: AXmlNode; out Value: AInt64): AError;
begin
  if (Node = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if (TObject(Node) is TProfXmlNode1) then
  begin
    if TProfXmlNode1(Node).GetValueAsInt64(Value) then
      Result := 0
    else
      Result := -4;
  end
  else
    Result := -3;
end;

function AXmlNode_GetValueAsString(Node: AXmlNode; out Value: APascalString): AError;
begin
  if (Node = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if (TObject(Node) is TProfXmlNode1) then
  begin
    if TProfXmlNode1(Node).GetValueAsString(Value) then
      Result := 0
    else
      Result := -4;
  end
  else
    Result := -3;
end;

function AXmlNode_GetValueAsUInt08(Node: AXmlNode; out Value: AUInt08): AError;
begin
  if (Node = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if (TObject(Node) is TProfXmlNode1) then
  begin
    if TProfXmlNode1(Node).GetValueAsUInt08(Value) then
      Result := 0
    else
      Result := -4;
  end
  else
    Result := -3;
end;

function AXmlNode_GetValueAsUInt64(Node: AXmlNode; out Value: AUInt64): AError;
begin
  if (Node = 0) then
  begin
    Result := -2;
    Exit;
  end;
  if (TObject(Node) is TProfXmlNode1) then
  begin
    if TProfXmlNode1(Node).GetValueAsUInt64(Value) then
      Result := 0
    else
      Result := -4;
  end
  else
    Result := -3;
end;

function AXmlNode_GetXml(Node: AXmlNode): APascalString;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).GetXml()
  else
    Result := '';
end;

function AXmlNode_GetXmlA(Node: AXmlNode; const Prefix: APascalString): APascalString;
begin
  if (TObject(Node) is TProfXmlNode1) then
    Result := TProfXmlNode1(Node).GetXmlA('')
  else
    Result := '';
end;

function AXmlNode_Free(Node: AXmlNode): AError;
begin
  if (TObject(Node) is TProfXmlNode1) then
  begin
    TProfXmlNode1(Node).Free();
    Result := 0;
  end
  else
    Result := -1;
end;

function AXmlNode_SetDocument(Node: AXmlNode; Document: AXmlDocument): AError;
begin
  if (TObject(Node) is TProfXmlNode1) then
  begin
    TProfXmlNode1(Node).SetDocument_Priv(Document);
    Result := 0;
  end
  else
    Result := -1;
end;

function AXmlNode_SetName(Node: AXmlNode; const Name: APascalString): AError;
begin
  if (TObject(Node) is TProfXmlNode1) then
  begin
    TProfXmlNode1(Node).SetName(Name);
    Result := 0;
  end
  else
    Result := -1;
end;

function AXmlNode_SetValueAsBool(Node: AXmlNode; Value: ABoolean): AError;
begin
  if (TObject(Node) is TProfXmlNode2) then
  begin
    if TProfXmlNode2(Node).SetValueAsBool(Value) then
      Result := 0
    else
      Result := -1;
  end
  else
    Result := -2;
end;

function AXmlNode_SetValueAsFloat64(Node: AXmlNode; Value: AFloat64): AError;
begin
  if (TObject(Node) is TProfXmlNode2) then
  begin
    if TProfXmlNode2(Node).SetValueAsFloat64(Value) then
      Result := 0
    else
      Result := -1;
  end
  else
    Result := -2;
end;

function AXmlNode_SetValueAsInt32(Node: AXmlNode; Value: AInt32): AError;
begin
  if (TObject(Node) is TProfXmlNode2) then
  begin
    if TProfXmlNode2(Node).SetValueAsInt32(Value) then
      Result := 0
    else
      Result := -1;
  end
  else
    Result := -2;
end;

function AXmlNode_SetXml(Node: AXmlNode; const S: APascalString): AError;
begin
  if TProfXmlNode1(Node).SetXml(S) then
    Result := 0
  else
    Result := -1;
end;

function AXmlNode_SetXmlA(Node: AXmlNode; var Value: APascalString; const CloseTag: APascalString): AError;
begin
  if TProfXmlNode2(Node).ReadNodes(Value, CloseTag) then
    Result := 0
  else
    Result := -1;
end;

// --- AXmlNode0 ---

function AXmlNode0_New(): AXmlNode;
begin
  Result := AXmlNode(AXmlNodeImpl.TProfXmlNode.Create());
end;

// --- AXmlNode1 ---

function AXmlNode1_New(Document: AXmlDocument): AXmlNode;
//function AXmlNode_New(Document: AXmlDocument): AXmlNode;
begin
  Result := AXmlNode(TProfXmlNode1.Create(Document));
end;

// --- AXmlNode2 ---

function AXmlNode2_New(Node: IXmlNode): AProfXmlNode2;
begin
  try
    Result := AProfXmlNode2(TProfXmlNode2.Create(Node));
  except
    Result := 0;
  end;
end;

end.
