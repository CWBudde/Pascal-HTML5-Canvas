unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, GR32, GR32_Image, Html5CanvasInterfaces,
  Html5CanvasGR32, dwsComp, dwsExprs, dwsVCLGUIFunctions, SynEditHighlighter,
  SynHighlighterDWS, SynEdit;

type
  TRescanThread = class(TThread)
  public
    procedure Execute; override;
  end;

  TFrmBasic = class(TForm)
    DelphiWebScript: TDelphiWebScript;
    dwsGUIFunctions: TdwsGUIFunctions;
    dwsUnitHtml5Canvas: TdwsUnit;
    Log: TMemo;
    PaintBox32: TPaintBox32;
    PanelOutput: TPanel;
    SplitterHorizontal: TSplitter;
    SplitterVertical: TSplitter;
    SynDWSSyn: TSynDWSSyn;
    SynEdit: TSynEdit;
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SynEditChange(Sender: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextConstructorsCreateEval(
      Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextCleanUp(
      ExternalObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsFillEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsBeginPathEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsClosePathEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsStrokeEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsSaveEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsRestoreEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsFillTextEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsClearRectEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsFillText2Eval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsStrokeText2Eval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsScaleEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsRotateEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsTranslateEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsTransformEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsSetTransformEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsCreateImageDataEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsMoveToEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsLineToEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsQuadraticCurveToEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsBezierCurveToEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsArcToEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsRectEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsArcEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsFillRectEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsStrokeRectEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsClipEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextMethodsIsPointInPathEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetFillStyleEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetGlobalAlphaEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowColorEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetGlobalCompositeOperationEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowBlurEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowOffsetXEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowOffsetYEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetStrokeStyleEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetLineWidthEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetLineCapEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetLineJoinEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetMiterLimitEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetGlobalAlphaEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetGlobalCompositeOperationEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowBlurEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowColorEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowOffsetXEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowOffsetYEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetStrokeStyleEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetLineWidthEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetLineCapEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetLineJoinEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetMiterLimitEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetFontEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetTextAlignEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetTextBaselineEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetFontEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetTextAlignEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetTextBaselineEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitFunctionsGetCanvasElementEval(info: TProgramInfo);
    procedure dwsUnitInstancesCanvasElementInstantiate(info: TProgramInfo;
      var ExtObject: TObject);
    procedure dwsUnitClassesTHtml5CanvasElementGR32MethodsGetWidthEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5CanvasElementGR32MethodsGetHeightEval(
      Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetFillStyleEval(
      Info: TProgramInfo; ExtObject: TObject);
  private
    FCanvasElement: THtml5CanvasElementGR32;
    FChanged: Boolean;
    FRecentScriptName: TFileName;
    FRescanThread: TRescanThread;
  public
    procedure RunScript;
  end;

var
  FrmBasic: TFrmBasic;

implementation

{$R *.dfm}

{ TRescanThread }

procedure TRescanThread.Execute;
begin
  repeat
    Synchronize(FrmBasic.RunScript);
    Sleep(100);
  until Terminated;
end;


{ TFrmBasic }

procedure TFrmBasic.FormCreate(Sender: TObject);
begin
  FChanged := True;
  PaintBox32.Buffer.Clear($FFFFFFFF);

  FCanvasElement := THtml5CanvasElementGR32.Create(PaintBox32.Buffer);

  FRescanThread := TRescanThread.Create;
end;

procedure TFrmBasic.FormDestroy(Sender: TObject);
begin
  FRescanThread.Terminate;
  FRescanThread.WaitFor;
  FreeAndNil(FRescanThread);

  FreeAndNil(FCanvasElement);
end;

procedure TFrmBasic.FormShow(Sender: TObject);
begin
  FRecentScriptName := ChangeFileExt(Application.ExeName, '.dws');
  if FileExists(FRecentScriptName) then
    SynEdit.Lines.LoadFromFile(FRecentScriptName);
end;

procedure TFrmBasic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SynEdit.Lines.SaveToFile(FRecentScriptName);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextCleanUp(
  ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextConstructorsCreateEval(
  Info: TProgramInfo; var ExtObject: TObject);
begin
  ExtObject := THtml5Canvas2DContextGR32.Create(FCanvasElement);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetFillStyleEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := THtml5Canvas2DContextGR32(ExtObject).FillStyle;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetFontEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := THtml5Canvas2DContextGR32(ExtObject).Font;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetGlobalAlphaEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := THtml5Canvas2DContextGR32(ExtObject).GlobalAlpha;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetGlobalCompositeOperationEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := THtml5Canvas2DContextGR32(ExtObject).GlobalCompositeOperation;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetLineCapEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := THtml5Canvas2DContextGR32(ExtObject).LineCap;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetLineJoinEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := THtml5Canvas2DContextGR32(ExtObject).LineJoin;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetLineWidthEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := THtml5Canvas2DContextGR32(ExtObject).LineWidth;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetMiterLimitEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := THtml5Canvas2DContextGR32(ExtObject).MiterLimit;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowBlurEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := THtml5Canvas2DContextGR32(ExtObject).ShadowBlur;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowColorEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := THtml5Canvas2DContextGR32(ExtObject).ShadowColor;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowOffsetXEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := THtml5Canvas2DContextGR32(ExtObject).ShadowOffsetX;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowOffsetYEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsFloat := THtml5Canvas2DContextGR32(ExtObject).ShadowOffsetY;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetStrokeStyleEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsVariant := THtml5Canvas2DContextGR32(ExtObject).StrokeStyle;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetTextAlignEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := THtml5Canvas2DContextGR32(ExtObject).TextAlign;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetTextBaselineEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := THtml5Canvas2DContextGR32(ExtObject).TextBaseline;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetFontEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).Font := Info.ValueAsString['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetGlobalAlphaEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).GlobalAlpha := Info.ValueAsFloat['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetGlobalCompositeOperationEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).GlobalCompositeOperation := Info.ValueAsString['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetLineCapEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).LineCap := Info.ValueAsString['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetLineJoinEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).LineJoin := Info.ValueAsString['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetLineWidthEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).LineWidth := Info.ValueAsFloat['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetMiterLimitEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).MiterLimit := Info.ValueAsFloat['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowBlurEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).ShadowBlur := Info.ValueAsFloat['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowColorEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).ShadowColor := Info.ValueAsString['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowOffsetXEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).ShadowOffsetX := Info.ValueAsFloat['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowOffsetYEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).ShadowOffsetY := Info.ValueAsFloat['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetStrokeStyleEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).StrokeStyle := Info.ValueAsVariant['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetTextAlignEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).TextAlign := Info.ValueAsString['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetTextBaselineEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).TextBaseline := Info.ValueAsString['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetFillStyleEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).FillStyle := Info.ValueAsVariant['Value'];
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsArcEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).Arc(
    Info.ValueAsFloat['X'], Info.ValueAsFloat['Y'],
    Info.ValueAsFloat['Radius'], Info.ValueAsFloat['StartAngle'],
    Info.ValueAsFloat['EndAngle']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsArcToEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).ArcTo(
    Info.ValueAsFloat['X1'], Info.ValueAsFloat['Y1'],
    Info.ValueAsFloat['X2'], Info.ValueAsFloat['Y2'],
    Info.ValueAsFloat['Radius']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsBeginPathEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as THtml5Canvas2DContextGR32).BeginPath;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsBezierCurveToEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).BezierCurveTo(
    Info.ValueAsFloat['ConstrolPoint1X'], Info.ValueAsFloat['ConstrolPoint1Y'],
    Info.ValueAsFloat['ConstrolPoint2X'], Info.ValueAsFloat['ConstrolPoint2Y'],
    Info.ValueAsFloat['X'], Info.ValueAsFloat['Y']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsClearRectEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).ClearRect(Info.ValueAsFloat['X'],
    Info.ValueAsFloat['Y'], Info.ValueAsFloat['Width'],
    Info.ValueAsFloat['Height']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsClipEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).Clip;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsClosePathEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as THtml5Canvas2DContextGR32).ClosePath;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsCreateImageDataEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).CreateImageData(Info.ValueAsFloat['sw'],
    Info.ValueAsFloat['sh']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsFillEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as THtml5Canvas2DContextGR32).Fill;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsFillRectEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).FillRect(Info.ValueAsFloat['X'],
    Info.ValueAsFloat['Y'], Info.ValueAsFloat['Width'],
    Info.ValueAsFloat['Height']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsFillTextEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).FillText(Info.ValueAsString['Text'],
    Info.ValueAsFloat['X'], Info.ValueAsFloat['Y']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsIsPointInPathEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := THtml5Canvas2DContextGR32(ExtObject).IsPointInPath(
    Info.ValueAsFloat['X'], Info.ValueAsFloat['Y']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsLineToEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).LineTo(Info.ValueAsFloat['X'],
    Info.ValueAsFloat['Y']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsMoveToEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).MoveTo(Info.ValueAsFloat['X'],
    Info.ValueAsFloat['Y']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsQuadraticCurveToEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).QuadraticCurveTo(
    Info.ValueAsFloat['ConstrolPointX'], Info.ValueAsFloat['ConstrolPointY'],
    Info.ValueAsFloat['X'], Info.ValueAsFloat['Y']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsFillText2Eval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).FillText(Info.ValueAsString['Text'],
    Info.ValueAsFloat['X'], Info.ValueAsFloat['Y'],
    Info.ValueAsFloat['MaxWidth']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsRectEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).Rect(
    Info.ValueAsFloat['X'], Info.ValueAsFloat['Y'],
    Info.ValueAsFloat['Width'], Info.ValueAsFloat['Height']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsRestoreEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as THtml5Canvas2DContextGR32).Restore;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsRotateEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).Rotate(Info.ValueAsFloat['Angle']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsSaveEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as THtml5Canvas2DContextGR32).Save;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsScaleEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).Scale(Info.ValueAsFloat['X'],
    Info.ValueAsFloat['Y']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsSetTransformEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).SetTransform(Info.ValueAsFloat['A'],
    Info.ValueAsFloat['B'], Info.ValueAsFloat['C'], Info.ValueAsFloat['D'],
    Info.ValueAsFloat['E'], Info.ValueAsFloat['F']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsStrokeEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  (ExtObject as THtml5Canvas2DContextGR32).Stroke;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsStrokeRectEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).StrokeRect(Info.ValueAsFloat['X'],
    Info.ValueAsFloat['Y'], Info.ValueAsFloat['Width'],
    Info.ValueAsFloat['Height']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsStrokeText2Eval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).StrokeText(Info.ValueAsString['Text'],
    Info.ValueAsFloat['X'], Info.ValueAsFloat['Y']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsTransformEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).Transform(Info.ValueAsFloat['A'],
    Info.ValueAsFloat['B'], Info.ValueAsFloat['C'], Info.ValueAsFloat['D'],
    Info.ValueAsFloat['E'], Info.ValueAsFloat['F']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5Canvas2DContextMethodsTranslateEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  THtml5Canvas2DContextGR32(ExtObject).Translate(Info.ValueAsFloat['X'],
    Info.ValueAsFloat['Y']);
end;

procedure TFrmBasic.dwsUnitClassesTHtml5CanvasElementGR32MethodsGetHeightEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := THtml5CanvasElementGR32(ExtObject).Height;
end;

procedure TFrmBasic.dwsUnitClassesTHtml5CanvasElementGR32MethodsGetWidthEval(
  Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := THtml5CanvasElementGR32(ExtObject).Width;
end;

procedure TFrmBasic.dwsUnitFunctionsGetCanvasElementEval(info: TProgramInfo);
begin
//  Info.ResultAsVariant := FCanvasElement;
end;

procedure TFrmBasic.dwsUnitInstancesCanvasElementInstantiate(info: TProgramInfo;
  var ExtObject: TObject);
begin
  ExtObject := FCanvasElement;
end;

procedure TFrmBasic.SynEditChange(Sender: TObject);
begin
  FChanged := True;
end;

procedure TFrmBasic.RunScript;
var
  CompiledProgram: IdwsProgram;
  ExecutedProgram: IdwsProgramExecution;
begin
  if FChanged then
  begin
    Log.Lines.Clear;
    try
      PaintBox32.Buffer.Clear($FFFFFFFF);
      CompiledProgram := DelphiWebScript.Compile(SynEdit.Lines.Text);
      Log.Lines.Add(CompiledProgram.Msgs.AsInfo);
      ExecutedProgram := CompiledProgram.Execute;
      Log.Lines.Text := ExecutedProgram.Result.ToString;
      PaintBox32.Invalidate;
    except
    end;
  end;
  FChanged := False;
end;

initialization
  SetGamma(1 / 1.6);

end.
