unit Html5CanvasInterfaces;

interface

uses
  Variants;

type
  IUint8ClampedArray = interface
    function Get(Index: Cardinal): Byte;
    function GetLength: Cardinal;
    procedure &Set(Index: Cardinal; Value: Byte);

    property Length: Cardinal read GetLength;
    property Data[Index: Cardinal]: Byte read Get write &Set;
  end;

  IHtml5CanvasElement = interface
    function GetHeight: Cardinal;
    function GetWidth: Cardinal;

    property Width: Cardinal read GetWidth;
    property Height: Cardinal read GetWidth;
  end;

  IHtml5CanvasGradient = interface
    procedure AddColorStop(Offset: Double; Color: string);
  end;

  IHtml5CanvasPattern = interface

  end;

  IHtml5CanvasTransformation = interface
    // transformations (default transform is the identity matrix)
    procedure Scale(x, y: Double);
    procedure Rotate(Angle: Double);
    procedure Translate(x, y: Double);
    procedure Transform(a, b, c, d, e, f: Double);
    procedure SetTransform(a, b, c, d, e, f: Double);
  end;

  IHtml5CanvasLineStyles = interface
    function GetLineWidth: Double;
    function GetLineCap: string;
    function GetLineJoin: string;
    function GetMiterLimit: Double;
    procedure SetLineWidth(Value: Double);
    procedure SetLineCap(Value: string);
    procedure SetLineJoin(Value: string);
    procedure SetMiterLimit(Value: Double);

    // line caps/joins
    property LineWidth: Double read GetLineWidth write SetLineWidth; // (default 1)
    property LineCap: string read GetLineCap write SetLineCap; // "butt", "round", "square" (default "butt")
    property LineJoin: string read GetLineJoin write SetLineJoin; // "round", "bevel", "miter" (default "miter")
    property MiterLimit: Double read GetMiterLimit write SetMiterLimit; // (default 10)
  end;

  IHtml5CanvasText = interface
    function GetFont: string;
    function GetTextAlign: string;
    function GetTextBaseline: string;
    procedure SetFont(Value: string);
    procedure SetTextAlign(Value: string);
    procedure SetTextBaseline(Value: string);

    // text
    property Font: string read GetFont write SetFont; // (default 10px sans-serif)
    property TextAlign: string read GetTextAlign write SetTextAlign; // "start", "end", "left", "right", "center" (default: "start")
    property TextBaseline: string read GetTextBaseline write SetTextBaseline; // "top", "hanging", "middle", "alphabetic", "ideographic", "bottom" (default: "alphabetic")
  end;

  IHtml5CanvasPathMethods = interface
    // shared path API methods
    procedure ClosePath;
    procedure MoveTo(X, Y: Double);
    procedure LineTo(X, Y: Double);
    procedure QuadraticCurveTo(ControlPointX, ControlPointY, X, Y: Double);
    procedure BezierCurveTo(ControlPoint1X, ControlPoint1Y, ControlPoint2X, ControlPoint2Y, X, Y: Double);
    procedure ArcTo(X1, Y1, X2, Y2, Radius: Double);
    procedure Rect(X, Y, Width, Height: Double);
    procedure Arc(X, Y, Radius, StartAngle, EndAngle: Double; AntiClockwise: Boolean = False);
  end;

  IHtml5TextMetrics = interface
    function GetWidth: Cardinal;

    property Width: Cardinal read GetWidth;
  end;

  IHtml5ImageData = interface
    function GetData: IUint8ClampedArray;
    function GetHeight: Cardinal;
    function GetWidth: Cardinal;

    property Width: Cardinal read GetWidth;
    property Height: Cardinal read GetWidth;
    property Data: IUInt8ClampedArray read GetData;
  end;

  IHtml5Canvas2DContext = interface
    function GetCanvas: IHtml5CanvasElement;
    function GetFillStyle: Variant;
    function GetGlobalAlpha: Double;
    function GetGlobalCompositeOperation: string;
    function GetShadowBlur: Double;
    function GetShadowColor: string;
    function GetShadowOffsetX: Double;
    function GetShadowOffsetY: Double;
    function GetStrokeStyle: Variant;
    procedure SetFillStyle(Value: Variant);
    procedure SetGlobalAlpha(Value: Double);
    procedure SetGlobalCompositeOperation(Value: string);
    procedure SetShadowBlur(Value: Double);
    procedure SetShadowColor(Value: string);
    procedure SetShadowOffsetX(Value: Double);
    procedure SetShadowOffsetY(Value: Double);
    procedure SetStrokeStyle(Value: Variant);

    property Canvas: IHtml5CanvasElement read GetCanvas;

    // state
    procedure Save;
    procedure Restore;

    // compositing
    property GlobalAlpha: Double read GetGlobalAlpha write SetGlobalAlpha;
    property GlobalCompositeOperation: string read GetGlobalCompositeOperation
      write SetGlobalCompositeOperation;

    // colors and styles
    property StrokeStyle: Variant read GetStrokeStyle write SetStrokeStyle;
    property FillStyle: Variant read GetFillStyle write SetFillStyle;
    function CreateLinearGradient(x0, y0, x1, y1: Double): IHtml5CanvasGradient;
    function CreateRadialGradient(x0, y0, r0, x1, y1, r1: Double): IHtml5CanvasGradient;
//    function CreatePattern(Image: (HtmlImageElement or HtmlCanvasElement or HtmlVideoElement); Repetition: string): CanvasPattern;

    // shadows
    property ShadowOffsetX: Double read GetShadowOffsetX write SetShadowOffsetX;
    property ShadowOffsetY: Double read GetShadowOffsetY write SetShadowOffsetY;
    property ShadowBlur: Double read GetShadowBlur write SetShadowBlur;
    property ShadowColor: string read GetShadowColor write SetShadowColor;

    // rects
    procedure ClearRect(X, Y, Width, Height: Double);
    procedure FillRect(X, Y, Width, Height: Double);
    procedure StrokeRect(X, Y, Width, Height: Double);

    // current default path API (see also CanvasPathMethods)
    procedure BeginPath;
    procedure Fill;
    procedure Stroke;
(*
    procedure DrawSystemFocusRing(Element element);
    function DrawCustomFocusRing(Element element): Boolean;
*)
    procedure ScrollPathIntoView;
    procedure Clip;
    function IsPointInPath(X, Y: Double): Boolean;

    // text (see also the CanvasText interface)
    procedure FillText(Text: string; x, y: Double); overload;
    procedure FillText(Text: string; x, y: Double; MaxWidth: Double); overload;
    procedure StrokeText(Text: string; x, y: Double); overload;
    procedure StrokeText(Text: string; x, y: Double; MaxWidth: Double); overload;
//    function MeasureText(Text: string): TextMetrics;

    // drawing images
(*
    procedure DrawImage(image: (HtmlImageElement or HtmlCanvasElement or HtmlVideoElement); dx, dy: Double); overload;
    procedure DrawImage(image: (HtmlImageElement or HtmlCanvasElement or HtmlVideoElement); dx, dy, dw, dh: Double); overload;
    procedure DrawImage(image: (HtmlImageElement or HtmlCanvasElement or HtmlVideoElement); sx, sy, sw, sh, dx, dy, dw, dh: Double); overload;
*)

    // pixel manipulation
    function CreateImageData(sw, sh: Double): IHtml5ImageData; overload;
    function CreateImageData(ImageData: IHtml5ImageData): IHtml5ImageData; overload;
    function GetImageData(SourceX, SourceY, SourceWidth, SourceHeight: Double): IHtml5ImageData;
    procedure PutImageData(Imagedata: IHtml5ImageData; DestinationX, DestinationY: Double); overload;
    procedure PutImageData(Imagedata: IHtml5ImageData; DestinationX,
      DestinationY, DirtyX, DirtyY, DirtyWidth, DirtyHeight: Double); overload;
  end;

  TCustomHtml5CanvasElement = class(TInterfacedObject, IHtml5CanvasElement)
  protected
    function GetHeight: Cardinal; virtual; abstract;
    function GetWidth: Cardinal; virtual; abstract;
  public
    property Height: Cardinal read GetHeight;
    property Width: Cardinal read GetWidth;
  end;

  TCustomHtml5CanvasGradient = class(TInterfacedObject, IHtml5CanvasGradient)
  public
    procedure AddColorStop(Offset: Double; Color: string); virtual; abstract;
  end;

  TCustomHtml5Canvas2DContext = class(TInterfacedObject, IHtml5Canvas2DContext,
    IHtml5CanvasTransformation, IHtml5CanvasLineStyles, IHtml5CanvasText,
    IHtml5CanvasPathMethods)
  private
    FCanvasElement: TCustomHtml5CanvasElement;
    FFillStyle: Variant;
    FFont: string;
    FGlobalAlpha: Double;
    FLineWidth: Double;
    FMiterLimit: Double;
    FShadowBlur: Double;
    FShadowColor: string;
    FShadowOffsetX: Double;
    FShadowOffsetY: Double;
    FStrokeStyle: Variant;
  protected
    function GetCanvas: IHtml5CanvasElement; virtual;
    function GetFillStyle: Variant; virtual;
    function GetGlobalAlpha: Double; virtual;
    function GetGlobalCompositeOperation: string; virtual; abstract;
    function GetShadowBlur: Double; virtual;
    function GetShadowColor: string; virtual;
    function GetShadowOffsetX: Double; virtual;
    function GetShadowOffsetY: Double; virtual;
    function GetStrokeStyle: Variant; virtual;
    procedure SetFillStyle(Value: Variant); virtual;
    procedure SetGlobalAlpha(Value: Double); virtual;
    procedure SetGlobalCompositeOperation(Value: string); virtual; abstract;
    procedure SetShadowBlur(Value: Double); virtual;
    procedure SetShadowColor(Value: string); virtual;
    procedure SetShadowOffsetX(Value: Double); virtual;
    procedure SetShadowOffsetY(Value: Double); virtual;
    procedure SetStrokeStyle(Value: Variant); virtual;

    // line caps/joins
    function GetLineWidth: Double; virtual;
    function GetLineCap: string; virtual; abstract;
    function GetLineJoin: string; virtual; abstract;
    function GetMiterLimit: Double; virtual;
    procedure SetLineWidth(Value: Double); virtual;
    procedure SetLineCap(Value: string); virtual; abstract;
    procedure SetLineJoin(Value: string); virtual; abstract;
    procedure SetMiterLimit(Value: Double); virtual;

    // text
    function GetFont: string; virtual;
    function GetTextAlign: string; virtual; abstract;
    function GetTextBaseline: string; virtual; abstract;
    procedure SetFont(Value: string); virtual;
    procedure SetTextAlign(Value: string); virtual; abstract;
    procedure SetTextBaseline(Value: string); virtual; abstract;

    procedure FillStyleChanged; virtual; abstract;
    procedure FontChanged; virtual; abstract;
    procedure GlobalAlphaChanged; virtual; abstract;
    procedure LineWidthChanged; virtual; abstract;
    procedure MiterLimitChanged; virtual; abstract;
    procedure StrokeStyleChanged; virtual; abstract;
    procedure ShadowBlurChanged; virtual; abstract;
    procedure ShadowColorChanged; virtual; abstract;
    procedure ShadowOffsetXChanged; virtual; abstract;
    procedure ShadowOffsetYChanged; virtual; abstract;

    property CanvasElement: TCustomHtml5CanvasElement read FCanvasElement;
  public
    constructor Create(CanvasElement: TCustomHtml5CanvasElement); virtual;

    // state
    procedure Save; virtual; abstract;
    procedure Restore; virtual; abstract;

    // colors and styles
    function CreateLinearGradient(x0, y0, x1, y1: Double): IHtml5CanvasGradient; virtual; abstract;
    function CreateRadialGradient(x0, y0, r0, x1, y1, r1: Double): IHtml5CanvasGradient; virtual; abstract;
//    function CreatePattern(Image: (HtmlImageElement or HtmlCanvasElement or HtmlVideoElement); Repetition: string): CanvasPattern;

    // rects
    procedure ClearRect(X, Y, Width, Height: Double); virtual; abstract;
    procedure FillRect(X, Y, Width, Height: Double); virtual; abstract;
    procedure StrokeRect(X, Y, Width, Height: Double); virtual; abstract;

    // current default path API (see also CanvasPathMethods)
    procedure BeginPath; virtual; abstract;
    procedure Fill; virtual; abstract;
    procedure Stroke; virtual; abstract;
(*
    procedure DrawSystemFocusRing(element: Element); virtual; abstract;
    function DrawCustomFocusRing(element: Element): Boolean; virtual; abstract;
*)
    procedure ScrollPathIntoView; virtual; abstract;
    procedure Clip; virtual; abstract;
    function IsPointInPath(X, Y: Double): Boolean; virtual; abstract;

    // text (see also the CanvasText interface)
    procedure FillText(Text: string; x, y: Double); overload; virtual; abstract;
    procedure FillText(Text: string; x, y: Double; MaxWidth: Double); overload; virtual; abstract;
    procedure StrokeText(Text: string; x, y: Double); overload; virtual; abstract;
    procedure StrokeText(Text: string; x, y: Double; MaxWidth: Double); overload; virtual; abstract;
//    function MeasureText(Text: string): TextMetrics;

    // drawing images
(*
    procedure DrawImage((HtmlImageElement or HtmlCanvasElement or HtmlVideoElement) image; dx, dy: Double); overload;
    procedure DrawImage((HtmlImageElement or HtmlCanvasElement or HtmlVideoElement) image; dx, dy, dw, dh: Double); overload;
    procedure DrawImage((HtmlImageElement or HtmlCanvasElement or HtmlVideoElement) image; sx, sy, sw, sh, dx, dy, dw, dh: Double); overload;
*)

    // transformations (default transform is the identity matrix)
    procedure Scale(x, y: Double); virtual; abstract;
    procedure Rotate(Angle: Double); virtual; abstract;
    procedure Translate(x, y: Double); virtual; abstract;
    procedure Transform(a, b, c, d, e, f: Double); virtual; abstract;
    procedure SetTransform(a, b, c, d, e, f: Double); virtual; abstract;

    // pixel manipulation
    function CreateImageData(sw, sh: Double): IHtml5ImageData; overload; virtual; abstract;
    function CreateImageData(ImageData: IHtml5ImageData): IHtml5ImageData; overload; virtual; abstract;
    function GetImageData(SourceX, SourceY, SourceWidth, SourceHeight: Double): IHtml5ImageData; virtual; abstract;
    procedure PutImageData(Imagedata: IHtml5ImageData; DestinationX, DestinationY: Double); overload; virtual; abstract;
    procedure PutImageData(Imagedata: IHtml5ImageData; DestinationX,
      DestinationY, DirtyX, DirtyY, DirtyWidth, DirtyHeight: Double); overload; virtual; abstract;

    // shared path API methods
    procedure ClosePath; virtual; abstract;
    procedure MoveTo(X, Y: Double); virtual; abstract;
    procedure LineTo(X, Y: Double); virtual; abstract;
    procedure QuadraticCurveTo(ControlPointX, ControlPointY, X, Y: Double); virtual; abstract;
    procedure BezierCurveTo(ControlPoint1X, ControlPoint1Y, ControlPoint2X, ControlPoint2Y, X, Y: Double); virtual; abstract;
    procedure ArcTo(X1, Y1, X2, Y2, Radius: Double); virtual; abstract;
    procedure Rect(X, Y, Width, Height: Double); virtual; abstract;
    procedure Arc(X, Y, Radius, StartAngle, EndAngle: Double; AntiClockwise: Boolean = False); virtual; abstract;

    property Canvas: IHtml5CanvasElement read GetCanvas;

    // compositing
    property GlobalAlpha: Double read GetGlobalAlpha write SetGlobalAlpha;
    property GlobalCompositeOperation: string read GetGlobalCompositeOperation
      write SetGlobalCompositeOperation;

    // colors and styles
    property StrokeStyle: Variant read GetStrokeStyle write SetStrokeStyle;
    property FillStyle: Variant read GetFillStyle write SetFillStyle;

    // shadows
    property ShadowOffsetX: Double read GetShadowOffsetX write SetShadowOffsetX;
    property ShadowOffsetY: Double read GetShadowOffsetY write SetShadowOffsetY;
    property ShadowBlur: Double read GetShadowBlur write SetShadowBlur;
    property ShadowColor: string read GetShadowColor write SetShadowColor;

    // text
    property Font: string read GetFont write SetFont; // (default 10px sans-serif)
    property TextAlign: string read GetTextAlign write SetTextAlign; // "start", "end", "left", "right", "center" (default: "start")
    property TextBaseline: string read GetTextBaseline write SetTextBaseline; // "top", "hanging", "middle", "alphabetic", "ideographic", "bottom" (default: "alphabetic")

    // line caps/joins
    property LineWidth: Double read GetLineWidth write SetLineWidth; // (default 1)
    property LineCap: string read GetLineCap write SetLineCap; // "butt", "round", "square" (default "butt")
    property LineJoin: string read GetLineJoin write SetLineJoin; // "round", "bevel", "miter" (default "miter")
    property MiterLimit: Double read GetMiterLimit write SetMiterLimit; // (default 10)
  end;

implementation

{ TCustomHtml5Canvas2DContext }

constructor TCustomHtml5Canvas2DContext.Create(CanvasElement: TCustomHtml5CanvasElement);
begin
  inherited Create;

  FCanvasElement := CanvasElement;

  FGlobalAlpha := 1;
  FShadowBlur := 0;
  FShadowOffsetX := 0;
  FShadowOffsetY := 0;
  FShadowColor := 'rgba(0, 0, 0, 0)';
  FLineWidth := 1;
  FMiterLimit := 10;
end;

function TCustomHtml5Canvas2DContext.GetCanvas: IHtml5CanvasElement;
begin
  Result := FCanvasElement;
end;

function TCustomHtml5Canvas2DContext.GetFillStyle: Variant;
begin
  Result := FFillStyle;
end;

function TCustomHtml5Canvas2DContext.GetFont: string;
begin
  Result := FFont;
end;

function TCustomHtml5Canvas2DContext.GetGlobalAlpha: Double;
begin
  Result := FGlobalAlpha;
end;

function TCustomHtml5Canvas2DContext.GetLineWidth: Double;
begin
  Result := FLineWidth;
end;

function TCustomHtml5Canvas2DContext.GetMiterLimit: Double;
begin
  Result := FMiterLimit;
end;

function TCustomHtml5Canvas2DContext.GetShadowBlur: Double;
begin
  Result := FShadowBlur;
end;

function TCustomHtml5Canvas2DContext.GetShadowColor: string;
begin
  Result := FShadowColor;
end;

function TCustomHtml5Canvas2DContext.GetShadowOffsetX: Double;
begin
  Result := FShadowOffsetX;
end;

function TCustomHtml5Canvas2DContext.GetShadowOffsetY: Double;
begin
  Result := FShadowOffsetY;
end;

function TCustomHtml5Canvas2DContext.GetStrokeStyle: Variant;
begin
  Result := FStrokeStyle;
end;

procedure TCustomHtml5Canvas2DContext.SetFillStyle(Value: Variant);
begin
  if Value <> FFillStyle then
  begin
    FFillStyle := Value;
    FillStyleChanged;
  end;
end;

procedure TCustomHtml5Canvas2DContext.SetFont(Value: string);
begin
  if Value <> FFont then
  begin
    FFont := Value;
    FontChanged;
  end;
end;

procedure TCustomHtml5Canvas2DContext.SetGlobalAlpha(Value: Double);
begin
  if FGlobalAlpha <> Value then
  begin
    FGlobalAlpha := Value;
    GlobalAlphaChanged;
  end;
end;

procedure TCustomHtml5Canvas2DContext.SetLineWidth(Value: Double);
begin
  if Value <> FLineWidth then
  begin
    FLineWidth := Value;
    LineWidthChanged;
  end;
end;

procedure TCustomHtml5Canvas2DContext.SetMiterLimit(Value: Double);
begin
  if Value <> FMiterLimit then
  begin
    FMiterLimit := Value;
    MiterLimitChanged;
  end;
end;

procedure TCustomHtml5Canvas2DContext.SetShadowBlur(Value: Double);
begin
  if FShadowBlur <> Value then
  begin
    FShadowBlur := Value;
    ShadowBlur;
  end;
end;

procedure TCustomHtml5Canvas2DContext.SetShadowColor(Value: string);
begin
  if FShadowColor <> Value then
  begin
    FShadowColor := Value;
    ShadowColor;
  end;
end;

procedure TCustomHtml5Canvas2DContext.SetShadowOffsetX(Value: Double);
begin
  if FShadowOffsetX <> Value then
  begin
    FShadowOffsetX := Value;
    ShadowOffsetXChanged;
  end;
end;

procedure TCustomHtml5Canvas2DContext.SetShadowOffsetY(Value: Double);
begin
  if FShadowOffsetY <> Value then
  begin
    FShadowOffsetY := Value;
    ShadowOffsetYChanged;
  end;
end;

procedure TCustomHtml5Canvas2DContext.SetStrokeStyle(Value: Variant);
begin
  if Value <> FStrokeStyle then
  begin
    FStrokeStyle := Value;
    StrokeStyleChanged;
  end;
end;

end.

