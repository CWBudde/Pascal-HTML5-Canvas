program PrettyGlowingLines;

uses
  Vcl.Forms,
  Html5CanvasGR32 in '..\..\Source\Html5CanvasGR32.pas',
  Html5CanvasInterfaces in '..\..\Source\Html5CanvasInterfaces.pas',
  MainUnit in 'MainUnit.pas' {FormPrettyGlowingLines};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrettyGlowingLines, FormPrettyGlowingLines);
  Application.Run;
end.

