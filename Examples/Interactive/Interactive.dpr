program Basic;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {FrmBasic};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmBasic, FrmBasic);
  Application.Run;
end.

