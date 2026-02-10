unit unitStockManagement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Grids;

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
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formStockManagement: TformStockManagement;

implementation

{$R *.dfm}

end.
