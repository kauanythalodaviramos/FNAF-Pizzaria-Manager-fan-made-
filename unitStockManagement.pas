unit unitStockManagement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Grids,
  unitStockManagementStockAdd, unitWardrobe;

type
  TformStockManagement = class(TForm)
    panelStockManagement: TPanel;
    StckManagButtonStock: TButton;
    ImageListStock: TImageList;
    LabelStock: TLabel;
    StockManagementAnimatronics: TButton;
    LableAnimatronics: TLabel;
    StockName: TLabel;
    ComboBoxStockAnimatronic: TComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    Label2: TLabel;
    editanimatronicssearch: TComboBox;
    btnSearch: TButton;
    btnDelete: TButton;
    mmShowDataItemAnimatronic: TMemo;

    procedure StckManagButtonStockClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);

  private
    procedure ShowItemData(AItem: TItem);
  end;

var
  formStockManagement: TformStockManagement;

implementation

{$R *.dfm}

{ ================= FORM CREATE ================= }

procedure TformStockManagement.FormCreate(Sender: TObject);
begin
  mmShowDataItemAnimatronic.Clear;
  mmShowDataItemAnimatronic.ReadOnly := True;
  mmShowDataItemAnimatronic.ScrollBars := ssVertical;
end;

{ ================= OPEN ADD FORM ================= }

procedure TformStockManagement.StckManagButtonStockClick(Sender: TObject);
begin
  formStockAdd.ShowModal;
end;

{ ================= SEARCH ================= }

procedure TformStockManagement.btnSearchClick(Sender: TObject);
var
  Item: TItem;
  IDValue: Integer;
  SearchText: string;
begin
  mmShowDataItemAnimatronic.Clear;

  SearchText := Trim(editanimatronicssearch.Text);

  if SearchText = '' then
  begin
    ShowMessage('Enter an ID or Name to search.');
    Exit;
  end;

  Item := nil;

  // Se for número → busca por ID
  if TryStrToInt(SearchText, IDValue) then
    Item := FindItemByID(IDValue)
  else
    Item := FindItemByName(SearchText);

  if Item = nil then
  begin
    ShowMessage('Item not found.');
    Exit;
  end;

  ShowItemData(Item);
end;

{ ================= DELETE ================= }

procedure TformStockManagement.btnDeleteClick(Sender: TObject);
var
  IDValue: Integer;
  Item: TItem;
begin
  if not TryStrToInt(Trim(editanimatronicssearch.Text), IDValue) then
  begin
    ShowMessage('To delete, enter a valid ID.');
    Exit;
  end;

  Item := FindItemByID(IDValue);

  if Item = nil then
  begin
    ShowMessage('Item not found.');
    Exit;
  end;

  if MessageDlg('Are you sure you want to delete this item?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DeleteItemByID(IDValue);
    mmShowDataItemAnimatronic.Clear;
    ShowMessage('Item deleted successfully.');
  end;
end;

{ ================= DISPLAY DATA ================= }

procedure TformStockManagement.ShowItemData(AItem: TItem);
begin
  if AItem = nil then
    Exit;

  mmShowDataItemAnimatronic.Lines.Clear;

  mmShowDataItemAnimatronic.Lines.Add('===== ITEM DATA =====');
  mmShowDataItemAnimatronic.Lines.Add('');
  mmShowDataItemAnimatronic.Lines.Add('ID: ' + AItem.ID.ToString);
  mmShowDataItemAnimatronic.Lines.Add('Name: ' + AItem.Name);
  mmShowDataItemAnimatronic.Lines.Add('Quantity: ' + AItem.Quantity.ToString);
  mmShowDataItemAnimatronic.Lines.Add('Description: ' + AItem.Description);
  mmShowDataItemAnimatronic.Lines.Add('Image Path: ' + AItem.PathImage);
end;

end.
