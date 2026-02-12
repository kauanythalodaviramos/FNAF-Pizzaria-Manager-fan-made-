unit unitWardrobe;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  System.JSON,
  System.IOUtils;

type
  TItemType = (itIngredient, itDrink, itPizza);

  TItem = class
  public
    ID: Integer;
    Name: string;
    Quantity: Integer;
    Description: string;
    PathImage: string;
    ItemType: TItemType;
  end;

var
  ItemsList: TObjectList<TItem>;

function ItemNameExists(const AName: string): Boolean;
function GetNextID: Integer;

function FindItemByID(AID: Integer): TItem;
function FindItemByName(const AName: string): TItem;

procedure AddItem(NewItem: TItem);
procedure DeleteItemByID(AID: Integer);

procedure SaveItemsToFile;
procedure LoadItemsFromFile;

implementation

const
  FILE_NAME = 'items.json';

{ ================= ENUM HELPERS ================= }

function ItemTypeToString(AType: TItemType): string;
begin
  case AType of
    itIngredient: Result := 'Ingredient';
    itDrink:      Result := 'Drink';
    itPizza:      Result := 'Pizza';
  else
    Result := 'Ingredient';
  end;
end;

function StringToItemType(const AValue: string): TItemType;
begin
  if SameText(AValue, 'Ingredient') then
    Result := itIngredient
  else if SameText(AValue, 'Drink') then
    Result := itDrink
  else if SameText(AValue, 'Pizza') then
    Result := itPizza
  else
    Result := itIngredient;
end;

{ ================= VERIFY DUPLICATION ================= }

function ItemNameExists(const AName: string): Boolean;
var
  Item: TItem;
begin
  Result := False;

  for Item in ItemsList do
    if SameText(Trim(Item.Name), Trim(AName)) then
      Exit(True);
end;

{ ================= GENERATE NEXT ID ================= }

function GetNextID: Integer;
var
  Item: TItem;
  MaxID: Integer;
begin
  MaxID := 0;

  for Item in ItemsList do
    if Item.ID > MaxID then
      MaxID := Item.ID;

  Result := MaxID + 1;
end;

{ ================= FIND BY ID ================= }

function FindItemByID(AID: Integer): TItem;
var
  Item: TItem;
begin
  Result := nil;

  for Item in ItemsList do
    if Item.ID = AID then
      Exit(Item);
end;

{ ================= FIND BY NAME ================= }

function FindItemByName(const AName: string): TItem;
var
  Item: TItem;
begin
  Result := nil;

  for Item in ItemsList do
    if SameText(Item.Name, Trim(AName)) then
      Exit(Item);
end;

{ ================= ADD ITEM ================= }

procedure AddItem(NewItem: TItem);
begin
  if NewItem = nil then
    Exit;

  NewItem.ID := GetNextID;

  ItemsList.Add(NewItem);

  SaveItemsToFile;
end;

{ ================= DELETE ITEM ================= }

procedure DeleteItemByID(AID: Integer);
var
  Item: TItem;
begin
  Item := FindItemByID(AID);

  if Item <> nil then
  begin
    ItemsList.Remove(Item);
    SaveItemsToFile;
  end;
end;

{ ================= SAVE ================= }

procedure SaveItemsToFile;
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  Item: TItem;
begin
  JSONArray := TJSONArray.Create;
  try
    for Item in ItemsList do
    begin
      JSONObject := TJSONObject.Create;

      JSONObject.AddPair('ID', TJSONNumber.Create(Item.ID));
      JSONObject.AddPair('Name', Item.Name);
      JSONObject.AddPair('Quantity', TJSONNumber.Create(Item.Quantity));
      JSONObject.AddPair('Description', Item.Description);
      JSONObject.AddPair('PathImage', Item.PathImage);
      JSONObject.AddPair('ItemType', ItemTypeToString(Item.ItemType));

      JSONArray.AddElement(JSONObject);
    end;

    TFile.WriteAllText(FILE_NAME, JSONArray.Format(2));
  finally
    JSONArray.Free;
  end;
end;

{ ================= LOAD ================= }

procedure LoadItemsFromFile;
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  Item: TItem;
  JSONText: string;
  I: Integer;
begin
  if not TFile.Exists(FILE_NAME) then
    Exit;

  JSONText := TFile.ReadAllText(FILE_NAME);
  JSONArray := TJSONObject.ParseJSONValue(JSONText) as TJSONArray;

  if JSONArray = nil then
    Exit;

  try
    ItemsList.Clear;

    for I := 0 to JSONArray.Count - 1 do
    begin
      JSONObject := JSONArray.Items[I] as TJSONObject;

      Item := TItem.Create;

      if JSONObject.GetValue('ID') <> nil then
        Item.ID := JSONObject.GetValue<Integer>('ID')
      else
        Item.ID := GetNextID;

      Item.Name := JSONObject.GetValue<string>('Name');
      Item.Quantity := JSONObject.GetValue<Integer>('Quantity');
      Item.Description := JSONObject.GetValue<string>('Description');
      Item.PathImage := JSONObject.GetValue<string>('PathImage');
      Item.ItemType := StringToItemType(
        JSONObject.GetValue<string>('ItemType')
      );

      ItemsList.Add(Item);
    end;
  finally
    JSONArray.Free;
  end;
end;

initialization
  ItemsList := TObjectList<TItem>.Create(True);
  LoadItemsFromFile;

finalization
  SaveItemsToFile;
  ItemsList.Free;

end.
