program FNAFPROJETO;

uses
  Vcl.Forms,
  unitMain in 'unitMain.pas' {formMainScreen},
  unitEmployeeManagement in 'unitEmployeeManagement.pas' {formEmployeeManagement},
  unitStockManagement in 'unitStockManagement.pas' {formStockManagement};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMainScreen, formMainScreen);
  Application.CreateForm(TformEmployeeManagement, formEmployeeManagement);
  Application.CreateForm(TformStockManagement, formStockManagement);
  Application.Run;
end.
