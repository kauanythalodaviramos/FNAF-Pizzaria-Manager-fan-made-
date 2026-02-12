unit unitStockManagementStockAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, unitWardrobe;

type
  TformStockAdd = class(TForm)
    pnl1: TPanel;
    lblStockAddName: TLabel;
    lbl1: TLabel;
    lbl11: TLabel;
    lblDescription: TLabel;
    Image: TLabel;
    img1: TImage;
    btnsave: TButton;
    nome1: TEdit;
    nome2: TEdit;
    nome3: TEdit;
    btnSelectImage: TButton;
    OpenDialog1: TOpenDialog;
    TypeofItem: TLabel;
    cbbnome5: TComboBox;

    procedure btnsaveClick(Sender: TObject);
    procedure btnSelectImageClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    FSelectedImagePath: string;
  end;

var
  formStockAdd: TformStockAdd;

implementation

{$R *.dfm}

procedure TformStockAdd.FormCreate(Sender: TObject);
begin
  cbbnome5.Items.Clear;
  cbbnome5.Items.Add('Ingredient');
  cbbnome5.Items.Add('Drink');
  cbbnome5.Items.Add('Pizza');

  cbbnome5.ItemIndex := 0;

  FSelectedImagePath := '';
end;

procedure TformStockAdd.btnSelectImageClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    FSelectedImagePath := OpenDialog1.FileName;
    img1.Picture.LoadFromFile(FSelectedImagePath);
  end;
end;

procedure TformStockAdd.btnsaveClick(Sender: TObject);
var
  NewItem: TItem;
  QuantityValue: Integer;
begin
  if Trim(nome1.Text) = '' then
  begin
    ShowMessage('Set the name of the Item!');
    nome1.SetFocus;
    Exit;
  end;

  if not TryStrToInt(Trim(nome2.Text), QuantityValue) then
  begin
    ShowMessage('Quantity must be a valid number!');
    nome2.SetFocus;
    Exit;
  end;

  if Trim(nome3.Text) = '' then
  begin
    ShowMessage('Set the description of the item!');
    nome3.SetFocus;
    Exit;
  end;

  if FSelectedImagePath = '' then
  begin
    ShowMessage('Select an image for the item!');
    Exit;
  end;

  if cbbnome5.ItemIndex = -1 then
  begin
    ShowMessage('Select the type of item!');
    Exit;
  end;

  if ItemNameExists(nome1.Text) then
  begin
    ShowMessage('An item with this name already exists!');
    nome1.SetFocus;
    Exit;
  end;

  NewItem := TItem.Create;
  try
    NewItem.Name := Trim(nome1.Text);
    NewItem.Quantity := QuantityValue;
    NewItem.Description := Trim(nome3.Text);
    NewItem.PathImage := FSelectedImagePath;

    case cbbnome5.ItemIndex of
      0: NewItem.ItemType := itIngredient;
      1: NewItem.ItemType := itDrink;
      2: NewItem.ItemType := itPizza;
    end;

    // 🔥 AGORA A RESPONSABILIDADE É DO WARDROBE
    AddItem(NewItem);

    ShowMessage('Item successfully saved!');
    ModalResult := mrOk;

  except
    NewItem.Free;
    raise;
  end;
end;

end.
