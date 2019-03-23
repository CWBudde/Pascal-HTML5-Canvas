unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  AppEvnts, ExtCtrls, GR32, GR32_Image, Html5CanvasInterfaces, Html5CanvasGR32;

type
  TFormPrettyGlowingLines = class(TForm)
    PaintBox32: TPaintBox32;
    AppEvents: TApplicationEvents;
    TimerLines: TTimer;
    TimerBlank: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AppEventsIdle(Sender: TObject; var Done: Boolean);
    procedure TimerBlankTimer(Sender: TObject);
    procedure TimerLinesTimer(Sender: TObject);
  private
    FCanvasElement: THtml5CanvasElementGR32;
    FContext2D: THtml5Canvas2DContextGR32;
    FLastPos: TFloatPoint;
    FHue: TFloat;
  public
    { Public-Deklarationen }
  end;

var
  FormPrettyGlowingLines: TFormPrettyGlowingLines;

implementation

{$R *.dfm}

procedure TFormPrettyGlowingLines.FormCreate(Sender: TObject);
begin
  FCanvasElement := THtml5CanvasElementGR32.Create(PaintBox32.Buffer);
  FContext2D := THtml5Canvas2DContextGR32.Create(FCanvasElement);

  FLastPos := FloatPoint(FCanvasElement.Width, FCanvasElement.Height);
  FHue := 0;
  TimerLines.Enabled := True;
  TimerBlank.Enabled := True;
end;

procedure TFormPrettyGlowingLines.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FCanvasElement);
  FreeAndNil(FContext2D);
end;

procedure TFormPrettyGlowingLines.TimerLinesTimer(Sender: TObject);
begin
  FContext2D.Save;
  try
    // clear background
    FContext2D.Translate(FCanvasElement.Width * 0.5,
      FCanvasElement.Height * 0.5);
    FContext2D.Scale(0.9, 0.9);
    FContext2D.Translate(-FCanvasElement.Width * 0.5,
      -FCanvasElement.Height * 0.5);

    FContext2D.BeginPath;
    FContext2D.LineWidth := 5 + Random * 10;
    FContext2D.MoveTo(FLastPos.X, FLastPos.Y);
    FLastPos.X := FCanvasElement.Width * Random;
    FLastPos.Y := FCanvasElement.Height * Random;
    FContext2D.BezierCurveTo(FCanvasElement.Width * Random,
      FCanvasElement.Height * Random, FCanvasElement.Width * Random,
      FCanvasElement.Height * Random, FLastPos.X, FLastPos.Y);

    FHue := FHue + 10 * Random;
    FContext2D.StrokeStyle := 'hsl(' + IntToStr(Round(FHue)) + ', 50%, 50%)';
    FContext2D.ShadowColor := 'white';
    FContext2D.ShadowBlur := 10;
    FContext2D.Stroke;
  finally
    FContext2D.Restore;
  end;
end;

procedure TFormPrettyGlowingLines.TimerBlankTimer(Sender: TObject);
begin
  FContext2D.FillStyle := 'rgba(0,0,0,0.1)';
  FContext2D.FillRect(0, 0, FCanvasElement.Width, FCanvasElement.Height);
end;

procedure TFormPrettyGlowingLines.AppEventsIdle(Sender: TObject;
  var Done: Boolean);
begin
  PaintBox32.Invalidate;
end;

initialization
  SetGamma(1 / 1.6);

end.
