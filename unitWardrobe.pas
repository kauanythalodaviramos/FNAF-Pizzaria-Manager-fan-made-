unit unitWardrobe;

interface

uses System.Generics.Collections;

// Item List

type

TItem = class
  public
    Name: string;
    Quantity: Integer;
    Description: string;
    PathImage: string;
end;

var

ItemsList: TObjectList<TItem>;

implementation

// Item List

initialization

ItemsList := TObjectList<TItem>.Create;

finalization

ItemsList.Free;


end.
