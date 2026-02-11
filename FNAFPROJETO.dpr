program FNAFPROJETO;

uses
  Vcl.Forms,
  unitMain in 'unitMain.pas' {formMainScreen},
  unitEmployeeManagement in 'unitEmployeeManagement.pas' {formEmployeeManagement},
  unitStockManagement in 'unitStockManagement.pas' {formStockManagement},
  unitStockManagementStockAdd in 'unitStockManagementStockAdd.pas' {formStockAdd},
  unitStockManagementAnimatronicAdd in 'unitStockManagementAnimatronicAdd.pas' {Form2},
  unitWardrobe in 'unitWardrobe.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMainScreen, formMainScreen);
  Application.CreateForm(TformEmployeeManagement, formEmployeeManagement);
  Application.CreateForm(TformStockManagement, formStockManagement);
  Application.CreateForm(TformStockAdd, formStockAdd);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
