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

    procedure btnsaveClick(Sender: TObject);
    procedure btnSelectImageClick(Sender: TObject);

  private
    FSelectedImagePath: string;

  public
  end;

var
  formStockAdd: TformStockAdd;

implementation

{$R *.dfm}

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
begin
  // 🔎 Validações
  if Trim(nome1.Text) = '' then
  begin
    ShowMessage('Set the name of the Item!');
    nome1.SetFocus;
    Exit;
  end;

  if Trim(nome2.Text) = '' then
  begin
    ShowMessage('Set the quantity of the item!');
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

  // 📦 Criando objeto
  NewItem := TItem.Create;
  try
    NewItem.Name := nome1.Text;
    NewItem.Quantity := StrToIntDef(nome2.Text, 0);
    NewItem.Description := nome3.Text;
    NewItem.PathImage := FSelectedImagePath;

    ItemsList.Add(NewItem);

    ShowMessage('Item successfully saved!');
    ModalResult := mrOk;

  except
    NewItem.Free;
    raise;
  end;
end;

end.
