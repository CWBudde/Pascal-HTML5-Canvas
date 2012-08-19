program PrettyGlowingLines;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {FrmPrettyGlowingLines};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrettyGlowingLines, FrmPrettyGlowingLines);
  Application.Run;
end.

