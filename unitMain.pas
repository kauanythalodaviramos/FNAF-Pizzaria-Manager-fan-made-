unit unitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TformMainScreen = class(TForm)
    formMainScreenMainMenu: TMainMenu;
    Employe1: TMenuItem;
    EmployeeManagement1: TMenuItem;
    StockManagement1: TMenuItem;
    System1: TMenuItem;
    Close1: TMenuItem;
    LogoFNAFBackgroundMainMenu: TImage;
    procedure Close1Click(Sender: TObject);
    procedure EmployeeManagement1Click(Sender: TObject);
    procedure StockManagement1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMainScreen: TformMainScreen;

implementation

{$R *.dfm}

uses unitEmployeeManagement, unitStockManagement;

procedure TformMainScreen.Close1Click(Sender: TObject);
begin
            Application.Terminate;
end;

procedure TformMainScreen.EmployeeManagement1Click(Sender: TObject);
begin
formEmployeeManagement.ShowModal;
end;

procedure TformMainScreen.StockManagement1Click(Sender: TObject);
begin
formStockManagement.ShowModal;
end;

end.
