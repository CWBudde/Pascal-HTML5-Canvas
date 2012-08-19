program ColorTest;
{

  Delphi DUnit-Testprojekt
  -------------------------
  Dieses Projekt enthält das DUnit-Test-Framework und die GUI/Konsolen-Test-Runner.
  Fügen Sie den Bedingungen in den Projektoptionen "CONSOLE_TESTRUNNER" hinzu,
  um den Konsolen-Test-Runner zu verwenden.  Ansonsten wird standardmäßig der
  GUI-Test-Runner verwendet.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestHtml5CanvasGR32 in 'TestHtml5CanvasGR32.pas',
  Html5CanvasGR32 in '..\..\Source\Html5CanvasGR32.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.


