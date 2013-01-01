unit Html5CanvasGR32;

interface

uses
  Classes, Types, SysUtils, Variants, Graphics, GR32, GR32_Polygons,
  GR32_Paths, GR32_Geometry, GR32_Transforms, GR32_ColorGradients,
  Html5CanvasInterfaces;

type
  THtml5CanvasElementGR32 = class(TCustomHtml5CanvasElement)
  protected
    FBitmap32: TBitmap32;
    function GetHeight: Cardinal; override;
    function GetWidth: Cardinal; override;
  public
    constructor Create(Bitmap32: TBitmap32); virtual;
  end;

  THtml5CanvasStateGR32 = record
    FillStyle: Variant;
    StrokeStyle: Variant;
    LineWidth: Double;
    EndStyle: TEndStyle;
    JoinStyle: TJoinStyle;
    MiterLimit: Double;
    GlobalAlpha: Double;
    GlobalCompositeOperation: string;
    ShadowBlur: Double;
    ShadowColor: string;
    ShadowOffsetX: Double;
    ShadowOffsetY: Double;
    Font: string;
    TextAlign: string;
    TextBaseline: string;
    TransformationMatrix: TFloatMatrix;
  end;

  THtml5CanvasGradient = class (TCustomHtml5CanvasGradient)
  public
    procedure AddColorStop(Offset: Double; Color: string); override;
  end;

  THtml5Canvas2DContextGR32 = class(TCustomHtml5Canvas2DContext)
  private
    FPath: TFlattenedPath;
    FRenderer: TPolygonRenderer32;
    FTransformMatrix: TFloatMatrix;

    FFillColor32: TColor32;
    FStrokeColor32: TColor32;
    FShadowColor32: TColor32;
    FShadowOffset: TFloatPoint;
    FApplyShadow: Boolean;
    FDirectDraw: Boolean;

    FGlobalCompositeOperation: string;
    FTextAlign: string;
    FTextBaseline: string;

    FJoinStyle: TJoinStyle;
    FEndStyle: TEndStyle;

    FStates: array of THtml5CanvasStateGR32;

    procedure TextToPath(Text: string; X, Y: Double);
    procedure UpdateApplyShadow;
    function VertexTransform(Vertex: TFloatPoint): TFloatPoint;
  protected
    function GetGlobalCompositeOperation: string; override;
    procedure SetGlobalCompositeOperation(Value: string); override;

    // line caps/joins
    function GetLineCap: string; override;
    function GetLineJoin: string; override;
    procedure SetLineCap(Value: string); override;
    procedure SetLineJoin(Value: string); override;

    // text
    function GetTextAlign: string; override;
    function GetTextBaseline: string; override;
    procedure SetTextAlign(Value: string); override;
    procedure SetTextBaseline(Value: string); override;

    procedure FillStyleChanged; override;
    procedure FontChanged; override;
    procedure GlobalAlphaChanged; override;
    procedure LineWidthChanged; override;
    procedure MiterLimitChanged; override;
    procedure ShadowBlurChanged; override;
    procedure ShadowColorChanged; override;
    procedure ShadowOffsetXChanged; override;
    procedure ShadowOffsetYChanged; override;
    procedure StrokeStyleChanged; override;
  public
    constructor Create(CanvasElement: TCustomHtml5CanvasElement); override;
    destructor Destroy; override;

    // state
    procedure Save; override;
    procedure Restore; override;

    // colors and styles
    function CreateLinearGradient(x0, y0, x1, y1: Double): IHtml5CanvasGradient; override;
    function CreateRadialGradient(x0, y0, r0, x1, y1, r1: Double): IHtml5CanvasGradient; override;
//    function CreatePattern(Image: (HtmlImageElement or HtmlCanvasElement or HtmlVideoElement); Repetition: string): CanvasPattern;

    // rects
    procedure ClearRect(X, Y, Width, Height: Double); override;
    procedure FillRect(X, Y, Width, Height: Double); override;
    procedure StrokeRect(X, Y, Width, Height: Double); override;

    // current default path API (see also CanvasPathMethods)
    procedure BeginPath; override;
    procedure Fill; override;
    procedure Stroke; override;
(*
    procedure DrawSystemFocusRing(Element element);
    function DrawCustomFocusRing(Element element): Boolean;
    procedure ScrollPathIntoView;
*)
    procedure Clip; override;
    function IsPointInPath(X, Y: Double): Boolean; override;

    // text (see also the CanvasText interface)
    procedure FillText(Text: string; x, y: Double); overload; override;
    procedure FillText(Text: string; x, y: Double; MaxWidth: Double); overload; override;
    procedure StrokeText(Text: string; x, y: Double); overload; override;
    procedure StrokeText(Text: string; x, y: Double; MaxWidth: Double); overload; override;
//    function MeasureText(Text: string): TextMetrics;

    // drawing images
(*
    procedure DrawImage((HtmlImageElement or HtmlCanvasElement or HtmlVideoElement) image; dx, dy: Double); overload;
    procedure DrawImage((HtmlImageElement or HtmlCanvasElement or HtmlVideoElement) image; dx, dy, dw, dh: Double); overload;
    procedure DrawImage((HtmlImageElement or HtmlCanvasElement or HtmlVideoElement) image; sx, sy, sw, sh, dx, dy, dw, dh: Double); overload;
*)

    // transformations (default transform is the identity matrix)
    procedure Scale(X, Y: Double); override;
    procedure Rotate(Angle: Double); override;
    procedure Translate(X, Y: Double); override;
    procedure Transform(A, B, C, D, E, F: Double); override;
    procedure SetTransform(A, B, C, D, E, F: Double); override;

    // pixel manipulation
    function CreateImageData(sw, sh: Double): IHtml5ImageData; overload; override;
    function CreateImageData(ImageData: IHtml5ImageData): IHtml5ImageData; overload; override;
    function GetImageData(SourceX, SourceY, SourceWidth, SourceHeight: Double): IHtml5ImageData; override;
    procedure PutImageData(Imagedata: IHtml5ImageData; DestinationX, DestinationY: Double); overload; override;
    procedure PutImageData(Imagedata: IHtml5ImageData; DestinationX,
      DestinationY, DirtyX, DirtyY, DirtyWidth, DirtyHeight: Double); overload; override;

    // shared path API methods
    procedure ClosePath; override;
    procedure MoveTo(X, Y: Double); override;
    procedure LineTo(X, Y: Double); override;
    procedure QuadraticCurveTo(ControlPointX, ControlPointY, X, Y: Double); override;
    procedure BezierCurveTo(ControlPoint1X, ControlPoint1Y, ControlPoint2X, ControlPoint2Y, X, Y: Double); override;
    procedure ArcTo(X1, Y1, X2, Y2, Radius: Double); override;
    procedure Rect(X, Y, Width, Height: Double); override;
    procedure Arc(X, Y, Radius, StartAngle, EndAngle: Double; AntiClockwise: Boolean = False); override;
  end;

function Css3ColorToColor32(Text: string): TColor32;

implementation

uses
  Math, GR32_Math, GR32_VectorUtils, GR32_Backends;

resourcestring
  RCStrWrongColorFormat = 'Wrong Format!';
  RCStrDelimiterExpected = 'Delimiter expected';

function Css3ColorToColor32(Text: string): TColor32;
var
  ColorEntryCast: TColor32Entry absolute Result;

  function ParseFloatValue(var Value: string; out Percent: Boolean): TFloat;
  var
    Index: Integer;
    IntPart: Integer;
    Exponent: Integer;
    Negative: Boolean;
  begin
    if Value = '' then
      raise Exception.Create(RCStrWrongColorFormat);

    // ignore white spaces
    Index := 1;
    while Value[Index] = ' ' do
      Inc(Index);

    // read sign (negative values are truncated)
    Negative := False;
    if Value[Index] = '-' then
    begin
      Negative := True;
      Inc(Index);
    end;

    IntPart := 0;
    while CharInSet(Value[Index], ['0'..'9']) do
    begin
      IntPart := IntPart * 10 + Ord(Value[Index]) - Ord('0');
      Inc(Index);
    end;

    Exponent := 0;
    if Value[Index] = '.' then
    begin
      Inc(Index);
      while CharInSet(Value[Index], ['0'..'9']) do
      begin
        IntPart := IntPart * 10 + Ord(Value[Index]) - Ord('0');
        Inc(Index);
        Inc(Exponent);
      end;
    end;

    Percent := Value[Index] = '%';
    if Percent then
      Inc(Index);

    // ignore white spaces
    while Value[Index] = ' ' do
      Inc(Index);

    // check for delimiter
    if not CharInSet(Value[Index], [',', ')']) then
      raise Exception.Create(RCStrDelimiterExpected);

    // delete strings already parsed
    Delete(Value, 1, Index);

    if Negative then
    begin
      Result := 0;
      Exit;
    end;
    Result := Power10(IntPart, -Exponent);
  end;

  function ParseNormalizedValue(var Value: string): TFloat;
  var
    Percent: Boolean;
  begin
    Result := ParseFloatValue(Value, Percent);
    if Percent then
      Result := 0.01 * Result;
  end;

  function ParseValue(var Value: string; MaxLimit: Integer = $FF): Integer;
  var
    Percent: Boolean;
    Number: Double;
  begin
    Number := ParseFloatValue(Value, Percent);
    if Percent then
      Result := Min(Round(2.55 * Number), MaxLimit)
    else
      Result := Min(Round(Number), MaxLimit);
  end;

begin
  case Text[1] of
    '#':
      case Length(Text) of
        4:
          begin
            ColorEntryCast.R := StrToInt('$' + Text[2] + Text[2]);
            ColorEntryCast.G := StrToInt('$' + Text[3] + Text[3]);
            ColorEntryCast.B := StrToInt('$' + Text[4] + Text[4]);
            ColorEntryCast.A := $FF
          end;
        7:
          begin
            Text[1] := '$';
            Result := StrToInt(Text);
            ColorEntryCast.A := $FF;
          end;
      end;
    'a', 'A':
      begin
        if LowerCase(Text) = 'aliceblue' then
          Result := $FFF0F8FF else
        if LowerCase(Text) = 'antiquewhite' then
          Result := $FFFAEBD7 else
        if LowerCase(Text) = 'aqua' then
          Result := clAqua32 else
        if LowerCase(Text) = 'aquamarine' then
          Result := $FF7FFFD4 else
        if LowerCase(Text) = 'azure' then
          Result := $FFF0FFFF;
      end;
    'b', 'B':
      begin
        if LowerCase(Text) = 'black' then
          Result := clBlack32 else
        if LowerCase(Text) = 'blue' then
          Result := clBlue32 else
        if LowerCase(Text) = 'beige' then
          Result := $FFF5F5DC else
        if LowerCase(Text) = 'bisque' then
          Result := $FFFFE4C4 else
        if LowerCase(Text) = 'blanchedalmond' then
          Result := $FFFFEBCD else
        if LowerCase(Text) = 'blueviolet' then
          Result := $FF8A2BE2 else
        if LowerCase(Text) = 'brown' then
          Result := $FFA52A2A else
        if LowerCase(Text) = 'burlywood' then
          Result := $FFDEB887;
      end;
    'c', 'C':
      begin
        if LowerCase(Text) = 'cadetblue' then
          Result := $FF5F9EA0 else
        if LowerCase(Text) = 'chartreuse' then
          Result := $FF7FFF00 else
        if LowerCase(Text) = 'chocolate' then
          Result := $FFD2691E else
        if LowerCase(Text) = 'coral' then
          Result := $FFFF7F50 else
        if LowerCase(Text) = 'cornflowerblue' then
          Result := $FF6495ED else
        if LowerCase(Text) = 'cornsilk' then
          Result := $FFFFF8DC else
        if LowerCase(Text) = 'crimson' then
          Result := $FFDC143C else
        if LowerCase(Text) = 'cyan' then
          Result := $FF00FFFF;
      end;
    'd', 'D':
      begin
        if LowerCase(Text) = 'darkblue' then
          Result := $FF00008B;
        if LowerCase(Text) = 'darkcyan' then
          Result := $FF008B8B;
        if LowerCase(Text) = 'darkgoldenrod' then
          Result := $FFB8860B;
        if LowerCase(Text) = 'darkgray' then
          Result := $FFA9A9A9;
        if LowerCase(Text) = 'darkgreen' then
          Result := $FF006400;
        if LowerCase(Text) = 'darkgrey' then
          Result := $FFA9A9A9;
        if LowerCase(Text) = 'darkkhaki' then
          Result := $FFBDB76B;
        if LowerCase(Text) = 'darkmagenta' then
          Result := $FF8B008B;
        if LowerCase(Text) = 'darkolivegreen' then
          Result := $FF556B2F;
        if LowerCase(Text) = 'darkorange' then
          Result := $FFFF8C00;
        if LowerCase(Text) = 'darkorchid' then
          Result := $FF9932CC;
        if LowerCase(Text) = 'darkred' then
          Result := $FF8B0000;
        if LowerCase(Text) = 'darksalmon' then
          Result := $FFE9967A;
        if LowerCase(Text) = 'darkseagreen' then
          Result := $FF8FBC8F;
        if LowerCase(Text) = 'darkslateblue' then
          Result := $FF483D8B;
        if LowerCase(Text) = 'darkslategray' then
          Result := $FF2F4F4F;
        if LowerCase(Text) = 'darkslategrey' then
          Result := $FF2F4F4F;
        if LowerCase(Text) = 'darkturquoise' then
          Result := $FF00CED1;
        if LowerCase(Text) = 'darkviolet' then
          Result := $FF9400D3;
        if LowerCase(Text) = 'deeppink' then
          Result := $FFFF1493;
        if LowerCase(Text) = 'deepskyblue' then
          Result := $FF00BFFF;
        if LowerCase(Text) = 'dimgray' then
          Result := $FF696969;
        if LowerCase(Text) = 'dimgrey' then
          Result := $FF696969;
        if LowerCase(Text) = 'dodgerblue' then
          Result := $FF1E90FF;
      end;
    'f', 'F':
      begin
        if LowerCase(Text) = 'fuchsia' then
          Result := clFuchsia32 else
        if LowerCase(Text) = 'firebrick' then
          Result := $FFB22222 else
        if LowerCase(Text) = 'floralwhite' then
          Result := $FFFFFAF0 else
        if LowerCase(Text) = 'forestgreen' then
          Result := $FF228B22;
      end;
    'g', 'G':
      begin
        if LowerCase(Text) = 'gray' then
          Result := $FF808080 else
        if LowerCase(Text) = 'green' then
          Result := $FF008000 else
        if LowerCase(Text) = 'gainsboro' then
          Result := $FFDCDCDC else
        if LowerCase(Text) = 'ghostwhite' then
          Result := $FFF8F8FF else
        if LowerCase(Text) = 'gold' then
          Result := $FFFFD700 else
        if LowerCase(Text) = 'goldenrod' then
          Result := $FFDAA520 else
        if LowerCase(Text) = 'green' then
          Result := $FF008000 else
        if LowerCase(Text) = 'greenyellow' then
          Result := $FFADFF2F else
        if LowerCase(Text) = 'grey' then
          Result := $FF808080;
      end;
    'h', 'H':
      begin
        if LowerCase(Text) = 'honeydew' then
          Result := $FFF0FFF0 else
        if LowerCase(Text) = 'hotpink' then
          Result := $FFFF69B4 else
        if LowerCase(Text) = 'hotpink' then
          Result := $FFFF69B4 else
        if LowerCase(Copy(Text, 1, 3)) = 'hsl' then
          if Text[4] = '(' then
          begin
            Delete(Text, 1, 4);
            Result := HSLtoRGB(ParseNormalizedValue(Text) / 360,
              ParseNormalizedValue(Text),
              ParseNormalizedValue(Text));
            ColorEntryCast.A := $FF;
          end
          else
          if ((Text[4] = 'a') or (Text[4] = 'A')) and (Text[5] = '(') then
          begin
            Delete(Text, 1, 5);
            Result := HSLtoRGB(ParseNormalizedValue(Text) / 360,
              ParseNormalizedValue(Text),
              ParseNormalizedValue(Text));
            ColorEntryCast.A := Min(Round(ParseNormalizedValue(Text) * $FF), $FF);
          end;
      end;
    'i', 'I':
      begin
        if LowerCase(Text) = 'indianred' then
          Result := $FFCD5C5C else
        if LowerCase(Text) = 'indigo' then
          Result := $FF4B0082 else
        if LowerCase(Text) = 'ivory' then
          Result := $FFFFFFF0;
      end;
    'k', 'K':
      if LowerCase(Text) = 'khaki' then
        Result := $FFF0E68C;
    'l', 'L':
    begin
      if LowerCase(Text) = 'lime' then
        Result := clLime32 else
      if LowerCase(Text) = 'lavender' then
        Result := $FFE6E6FA else
      if LowerCase(Text) = 'lavenderblush' then
        Result := $FFFFF0F5 else
      if LowerCase(Text) = 'lawngreen' then
        Result := $FF7CFC00 else
      if LowerCase(Text) = 'lemonchiffon' then
        Result := $FFFFFACD else
      if LowerCase(Text) = 'lightblue' then
        Result := $FFADD8E6 else
      if LowerCase(Text) = 'lightcoral' then
        Result := $FFF08080 else
      if LowerCase(Text) = 'lightcyan' then
        Result := $FFE0FFFF else
      if LowerCase(Text) = 'lightgoldenrodyellow' then
        Result := $FFFAFAD2 else
      if LowerCase(Text) = 'lightgray' then
        Result := $FFD3D3D3 else
      if LowerCase(Text) = 'lightgreen' then
        Result := $FF90EE90 else
      if LowerCase(Text) = 'lightgrey' then
        Result := $FFD3D3D3 else
      if LowerCase(Text) = 'lightpink' then
        Result := $FFFFB6C1 else
      if LowerCase(Text) = 'lightsalmon' then
        Result := $FFFFA07A else
      if LowerCase(Text) = 'lightseagreen' then
        Result := $FF20B2AA else
      if LowerCase(Text) = 'lightskyblue' then
        Result := $FF87CEFA else
      if LowerCase(Text) = 'lightslategray' then
        Result := $FF778899 else
      if LowerCase(Text) = 'lightslategrey' then
        Result := $FF778899 else
      if LowerCase(Text) = 'lightsteelblue' then
        Result := $FFB0C4DE else
      if LowerCase(Text) = 'lightyellow' then
        Result := $FFFFFFE0 else
      if LowerCase(Text) = 'limegreen' then
        Result := $FF32CD32 else
      if LowerCase(Text) = 'linen' then
        Result := $FFFAF0E6;
    end;
    'm', 'M':
      begin
        if LowerCase(Text) = 'maroon' then
          Result := $FF800000 else
        if LowerCase(Text) = 'magenta' then
          Result := $FFFF00FF else
        if LowerCase(Text) = 'mediumaquamarine' then
          Result := $FF66CDAA else
        if LowerCase(Text) = 'mediumblue' then
          Result := $FF0000CD else
        if LowerCase(Text) = 'mediumorchid' then
          Result := $FFBA55D3 else
        if LowerCase(Text) = 'mediumpurple' then
          Result := $FF9370DB else
        if LowerCase(Text) = 'mediumseagreen' then
          Result := $FF3CB371 else
        if LowerCase(Text) = 'mediumslateblue' then
          Result := $FF7B68EE else
        if LowerCase(Text) = 'mediumspringgreen' then
          Result := $FF00FA9A else
        if LowerCase(Text) = 'mediumturquoise' then
          Result := $FF48D1CC else
        if LowerCase(Text) = 'mediumvioletred' then
          Result := $FFC71585 else
        if LowerCase(Text) = 'midnightblue' then
          Result := $FF191970 else
        if LowerCase(Text) = 'mintcream' then
          Result := $FFF5FFFA else
        if LowerCase(Text) = 'mistyrose' then
          Result := $FFFFE4E1 else
        if LowerCase(Text) = 'moccasin' then
          Result := $FFFFE4B5;
      end;
    'n', 'N':
      begin
        if LowerCase(Text) = 'navy' then
          Result := $FF000080
        else
        if LowerCase(Text) = 'navajowhite' then
          Result := $FFFFDEAD;
      end;
    'o', 'O':
      begin
        if LowerCase(Text) = 'olive' then
          Result := $FF808000 else
        if LowerCase(Text) = 'oldlace' then
          Result := $FFFDF5E6 else
        if LowerCase(Text) = 'olivedrab' then
          Result := $FF6B8E23 else
        if LowerCase(Text) = 'orange' then
          Result := $FFFFA500 else
        if LowerCase(Text) = 'orangered' then
          Result := $FFFF4500 else
        if LowerCase(Text) = 'orchid' then
          Result := $FFDA70D6;
      end;
    'p', 'P':
      begin
        if LowerCase(Text) = 'purple' then
          Result := $FF800080 else
        if LowerCase(Text) = 'palegoldenrod' then
          Result := $FFEEE8AA else
        if LowerCase(Text) = 'palegreen' then
          Result := $FF98FB98 else
        if LowerCase(Text) = 'paleturquoise' then
          Result := $FFAFEEEE else
        if LowerCase(Text) = 'palevioletred' then
          Result := $FFDB7093 else
        if LowerCase(Text) = 'papayawhip' then
          Result := $FFFFEFD5 else
        if LowerCase(Text) = 'peachpuff' then
          Result := $FFFFDAB9 else
        if LowerCase(Text) = 'peru' then
          Result := $FFCD853F else
        if LowerCase(Text) = 'pink' then
          Result := $FFFFC0CB else
        if LowerCase(Text) = 'plum' then
          Result := $FFDDA0DD else
        if LowerCase(Text) = 'powderblue' then
          Result := $FFB0E0E6;
      end;
    'r', 'R':
      begin
        if LowerCase(Text) = 'red' then
          Result := clRed32
        else
        if LowerCase(Text) = 'rosybrown' then
          Result := $FFBC8F8F
        else
        if LowerCase(Text) = 'royalblue' then
          Result := $FF4169E1
        else
        if LowerCase(Copy(Text, 1, 3)) = 'rgb' then
          if Text[4] = '(' then
          begin
            Delete(Text, 1, 4);
            ColorEntryCast.R := ParseValue(Text);
            ColorEntryCast.G := ParseValue(Text);
            ColorEntryCast.B := ParseValue(Text);
            ColorEntryCast.A := $FF;
          end
          else
          if ((Text[4] = 'a') or (Text[4] = 'A')) and (Text[5] = '(') then
          begin
            Delete(Text, 1, 5);
            ColorEntryCast.R := ParseValue(Text);
            ColorEntryCast.G := ParseValue(Text);
            ColorEntryCast.B := ParseValue(Text);
            ColorEntryCast.A := Min(Round(ParseNormalizedValue(Text) * $FF), $FF);
          end;
      end;
    's', 'S':
      begin
        if LowerCase(Text) = 'silver' then
          Result := clSilver32 else
        if LowerCase(Text) = 'saddlebrown' then
          Result := $FF8B4513 else
        if LowerCase(Text) = 'salmon' then
          Result := $FFFA8072 else
        if LowerCase(Text) = 'sandybrown' then
          Result := $FFF4A460 else
        if LowerCase(Text) = 'seagreen' then
          Result := $FF2E8B57 else
        if LowerCase(Text) = 'seashell' then
          Result := $FFFFF5EE else
        if LowerCase(Text) = 'sienna' then
          Result := $FFA0522D else
        if LowerCase(Text) = 'skyblue' then
          Result := $FF87CEEB else
        if LowerCase(Text) = 'slateblue' then
          Result := $FF6A5ACD else
        if LowerCase(Text) = 'slategray' then
          Result := $FF708090 else
        if LowerCase(Text) = 'slategrey' then
          Result := $FF708090 else
        if LowerCase(Text) = 'snow' then
          Result := $FFFFFAFA else
        if LowerCase(Text) = 'springgreen' then
          Result := $FF00FF7F else
        if LowerCase(Text) = 'steelblue' then
          Result := $FF4682B4;
      end;
    't', 'T':
      begin
        if LowerCase(Text) = 'teal' then
          Result := $FF008080 else
        if LowerCase(Text) = 'tan' then
          Result := $FFD2B48C else
        if LowerCase(Text) = 'thistle' then
          Result := $FFD8BFD8 else
        if LowerCase(Text) = 'tomato' then
          Result := $FFFF6347 else
        if LowerCase(Text) = 'turquoise' then
          Result := $FF40E0D0;
      end;
    'v', 'V':
      if LowerCase(Text) = 'violet' then
        Result := $FFEE82EE;
    'w', 'W':
      begin
        if LowerCase(Text) = 'white' then
          Result := clWhite32 else
        if LowerCase(Text) = 'wheat' then
          Result := $FFF5DEB3 else
        if LowerCase(Text) = 'whitesmoke' then
          Result := $FFF5F5F5;
      end;
    'y', 'Y':
      begin
        if LowerCase(Text) = 'yellow' then
          Result := clYellow32 else
        if LowerCase(Text) = 'yellowgreen' then
          Result := $FF9ACD32;
      end;
  end;
end;


{ THtml5CanvasElementGR32 }

constructor THtml5CanvasElementGR32.Create(Bitmap32: TBitmap32);
begin
  FBitmap32 := Bitmap32;
end;

function THtml5CanvasElementGR32.GetHeight: Cardinal;
begin
  Result := FBitmap32.Height;
end;

function THtml5CanvasElementGR32.GetWidth: Cardinal;
begin
  Result := FBitmap32.Width;
end;


{ THtml5CanvasGradient }

procedure THtml5CanvasGradient.AddColorStop(Offset: Double; Color: string);
begin
  inherited;

end;


{ THtml5Canvas2DContextGR32 }

constructor THtml5Canvas2DContextGR32.Create(CanvasElement: TCustomHtml5CanvasElement);
begin
  inherited Create(CanvasElement);

  FJoinStyle := jsMiter;
  FEndStyle := esButt;

  FRenderer := TPolygonRenderer32VPR.Create;
  FRenderer.Bitmap := THtml5CanvasElementGR32(CanvasElement).FBitmap32;
  FRenderer.FillMode := pfWinding;

  FShadowColor32 := 0;
  FApplyShadow := False;
  FDirectDraw := True;

  FPath := TFlattenedPath.Create;
  FTransformMatrix := IdentityMatrix;
end;

destructor THtml5Canvas2DContextGR32.Destroy;
begin
  FPath.Free;
  FRenderer.Free;
  inherited;
end;

procedure THtml5Canvas2DContextGR32.Arc(X, Y, Radius, StartAngle,
  EndAngle: Double; AntiClockwise: Boolean);
var
  Points: TArrayOfFloatPoint;
  Index: Integer;
begin
  Points := BuildArc(FloatPoint(X, Y), StartAngle, EndAngle, Radius);
  for Index := 0 to Length(Points) - 1 do
    Points[Index] := VertexTransform(Points[Index]);
  FPath.Polygon(Points);
end;

procedure THtml5Canvas2DContextGR32.ArcTo(X1, Y1, X2, Y2, Radius: Double);
begin
  //
end;

procedure THtml5Canvas2DContextGR32.BeginPath;
begin
  FPath.BeginPath;
end;

procedure THtml5Canvas2DContextGR32.BezierCurveTo(ControlPoint1X,
  ControlPoint1Y, ControlPoint2X, ControlPoint2Y, X, Y: Double);
begin
  FPath.CurveTo(VertexTransform(FloatPoint(ControlPoint1X, ControlPoint1Y)),
    VertexTransform(FloatPoint(ControlPoint2X, ControlPoint2Y)),
    VertexTransform(FloatPoint(X, Y)));
end;

procedure THtml5Canvas2DContextGR32.ClearRect(X, Y, Width, Height: Double);
var
  OldColor: TColor32;
  ClipRect: TFloatRect;
  Path: TArrayOfFloatPoint;
begin
  OldColor := FRenderer.Color;
  FRenderer.Color := 0;

  SetLength(Path, 5);
  Path[0] := VertexTransform(FloatPoint(X, Y));
  Path[1] := VertexTransform(FloatPoint(X + Width, Y));
  Path[2] := VertexTransform(FloatPoint(X + Width, Y + Height));
  Path[3] := VertexTransform(FloatPoint(X, Y + Height));
  Path[4] := VertexTransform(FloatPoint(X, Y));

  with THtml5CanvasElementGR32(CanvasElement) do
  begin
    ClipRect := FloatRect(FBitmap32.ClipRect);
    FRenderer.Bitmap := FBitmap32;
  end;
  FRenderer.PolygonFS(Path, ClipRect);

  FRenderer.Color := OldColor;
end;

procedure THtml5Canvas2DContextGR32.Clip;
begin

end;

procedure THtml5Canvas2DContextGR32.ClosePath;
begin
  FPath.ClosePath;
end;

function THtml5Canvas2DContextGR32.CreateImageData(
  ImageData: IHtml5ImageData): IHtml5ImageData;
begin

end;

function THtml5Canvas2DContextGR32.CreateImageData(sw,
  sh: Double): IHtml5ImageData;
begin

end;

function THtml5Canvas2DContextGR32.CreateLinearGradient(x0, y0, x1,
  y1: Double): IHtml5CanvasGradient;
begin

end;

function THtml5Canvas2DContextGR32.CreateRadialGradient(x0, y0, r0, x1, y1,
  r1: Double): IHtml5CanvasGradient;
begin

end;

procedure THtml5Canvas2DContextGR32.Fill;
var
  ClipRect: TFloatRect;
  TempBitmap: TBitmap32;
begin
  if FDirectDraw then
  begin
    // implicitly close subpath
    if Length(FPath.Points) > 0 then
      FPath.ClosePath;

    with THtml5CanvasElementGR32(CanvasElement) do
    begin
      ClipRect := FloatRect(FBitmap32.ClipRect);
      FRenderer.Bitmap := FBitmap32;
    end;

    FRenderer.Color := SetAlpha(FFillColor32,
      Round(AlphaComponent(FFillColor32) * GlobalAlpha));
    FRenderer.PolyPolygonFS(FPath.Path, ClipRect);
  end
  else
  begin
    TempBitmap := TBitmap32.Create;
    try
      // implicitly close subpath
      if Length(FPath.Points) > 0 then
        FPath.ClosePath;

      with THtml5CanvasElementGR32(CanvasElement) do
        TempBitmap.SetSize(FBitmap32.Width, FBitmap32.Height);

      ClipRect := FloatRect(TempBitmap.ClipRect);
      FRenderer.Bitmap := TempBitmap;
      FRenderer.Color := FFillColor32;
  (*
      FRenderer.Color := SetAlpha(FFillColor32,
        Round(AlphaComponent(FFillColor32) * $FF * GlobalAlpha));
  *)
      FRenderer.PolyPolygonFS(FPath.Path, ClipRect);

      with THtml5CanvasElementGR32(CanvasElement) do
      begin
        TempBitmap.DrawMode := dmBlend;
        TempBitmap.MasterAlpha := Round($FF * GlobalAlpha);
        FBitmap32.Draw(0, 0, TempBitmap);
      end;
    finally
      TempBitmap.Free;
    end;
  end;
end;

procedure THtml5Canvas2DContextGR32.FillRect(X, Y, Width, Height: Double);
begin
  // redirection
  Rect(X, Y, Width, Height);
  Fill;
end;

procedure THtml5Canvas2DContextGR32.FillStyleChanged;
begin
  inherited;
  if VarIsStr(FillStyle) then
    FFillColor32 := Css3ColorToColor32(FillStyle);
end;

procedure THtml5Canvas2DContextGR32.FillText(Text: string; x, y,
  MaxWidth: Double);
begin
  // redirection
  FillText(Text, X, Y);
end;

procedure THtml5Canvas2DContextGR32.FillText(Text: string; x, y: Double);
begin
  with THtml5CanvasElementGR32(CanvasElement) do
    TextToPath(Text, X, Y + FBitmap32.Font.Size);
  Fill;
end;

procedure THtml5Canvas2DContextGR32.FontChanged;
var
  FontStyle: string;
  SpacePos: Integer;
  CheckFontStyle: Boolean;
  CheckFontSize: Boolean;
  FontStyleDefined: Boolean;
  FontName: string;
  Bold, Italic: Boolean;
  FontSize: Integer;
  Item: string;
begin
  inherited;
  FontStyle := Font;
  CheckFontStyle := True;
  CheckFontSize := True;
  FontSize := 0;
  FontName := '';
  Bold := False;
  Italic := False;
  FontStyleDefined := False;

  SpacePos := Pos(' ', FontStyle);

  while SpacePos > 0 do
  begin
    Item := Copy(FontStyle, 1, SpacePos);

    if CheckFontStyle then
    begin
      Italic := (Item = 'italic');
      Bold := (Item = 'oblique') or (Item = 'bold');

      FontStyleDefined := (Item = 'normal') or (Item = 'bold') or
        (Item = 'italic') or (Item = 'oblique') or (Item = '100') or
        (Item = '200') or (Item = '300') or (Item = '400') or (Item = '500') or
        (Item = '600') or (Item = '700') or (Item = '800') or (Item = '900') or
        (Item = 'small-caps');

      CheckFontStyle := False;
    end;

    if (not FontStyleDefined) and not (FontSize = 0) then
    begin
      if FontName = '' then
        FontName := Item
      else
        FontName := FontName + ' ' + Item;
    end;

    if (not FontStyleDefined) and CheckFontSize then
    begin
      if Pos('px', Item) > 0 then
      begin
        Delete(Item, Pos('px', Item), 2);
        FontSize := StrToInt(Trim(Item));
      end
      else
      if Pos('pt', Item) > 0 then
      begin
        Delete(Item, Pos('pt', Item), 2);
        FontSize := StrToInt(Trim(Item));
      end
      else
        FontSize := 24;
      CheckFontSize := False;
    end;

    Delete(FontStyle, 1, SpacePos);
    SpacePos := Pos(' ', FontStyle);
  end;

  if FontName = '' then
    FontName := FontStyle
  else
    FontName := FontName + ' ' + FontStyle;

  while Pos('"', FontName) > 0 do
    FontName[Pos('"', FontName)] := ' ';

  FontName := Trim(FontName);

  with THtml5CanvasElementGR32(CanvasElement) do
  begin
    FBitmap32.Font.Name := FontName;
    FBitmap32.Font.Height := FontSize;
    if Bold then
      FBitmap32.Font.Style := FBitmap32.Font.Style + [fsBold]
    else
      FBitmap32.Font.Style := FBitmap32.Font.Style - [fsBold];
    if Italic then
      FBitmap32.Font.Style := FBitmap32.Font.Style + [fsItalic]
    else
      FBitmap32.Font.Style := FBitmap32.Font.Style - [fsItalic];
  end;
end;

function THtml5Canvas2DContextGR32.GetGlobalCompositeOperation: string;
begin
  Result := FGlobalCompositeOperation;
end;

function THtml5Canvas2DContextGR32.GetImageData(SourceX, SourceY, SourceWidth,
  SourceHeight: Double): IHtml5ImageData;
begin

end;

function THtml5Canvas2DContextGR32.GetLineCap: string;
begin
  case FEndStyle of
    esButt: Result := 'butt';
    esSquare: Result := 'square';
    esRound: Result := 'round';
  end;
end;

function THtml5Canvas2DContextGR32.GetLineJoin: string;
begin
  case FJoinStyle of
    jsMiter: Result := 'miter';
    jsBevel: Result := 'bevel';
    jsRound: Result := 'round';
  end;
end;

function THtml5Canvas2DContextGR32.GetTextAlign: string;
begin
  Result := FTextAlign;
end;

function THtml5Canvas2DContextGR32.GetTextBaseline: string;
begin
  Result := FTextAlign;
end;

procedure THtml5Canvas2DContextGR32.GlobalAlphaChanged;
begin
  inherited;
(*
  with THtml5CanvasElementGR32(CanvasElement) do
    FBitmap32.MasterAlpha := EnsureRange(Round(GlobalAlpha * $FF), 0, $FF);
*)
end;

function THtml5Canvas2DContextGR32.IsPointInPath(X, Y: Double): Boolean;
var
  Index: Integer;
begin
  Result := True;
  for Index := 0 to Length(FPath.Path) - 1 do
    if PointInPolygon(FloatPoint(X, Y), FPath.Path[Index]) then
      Exit;
  Result := False;
end;

procedure THtml5Canvas2DContextGR32.LineTo(X, Y: Double);
begin
  FPath.LineTo(VertexTransform(FloatPoint(X, Y)));
end;

procedure THtml5Canvas2DContextGR32.LineWidthChanged;
begin
  inherited;
end;

procedure THtml5Canvas2DContextGR32.MiterLimitChanged;
begin
  inherited;
end;

procedure THtml5Canvas2DContextGR32.MoveTo(X, Y: Double);
begin
  FPath.MoveTo(VertexTransform(FloatPoint(X, Y)));
end;

procedure THtml5Canvas2DContextGR32.PutImageData(Imagedata: IHtml5ImageData;
  DestinationX, DestinationY: Double);
begin

end;

procedure THtml5Canvas2DContextGR32.PutImageData(Imagedata: IHtml5ImageData;
  DestinationX, DestinationY, DirtyX, DirtyY, DirtyWidth, DirtyHeight: Double);
begin

end;

procedure THtml5Canvas2DContextGR32.QuadraticCurveTo(ControlPointX,
  ControlPointY, X, Y: Double);
begin
  FPath.ConicTo(VertexTransform(FloatPoint(ControlPointX, ControlPointY)),
    VertexTransform(FloatPoint(X, Y)));
end;

procedure THtml5Canvas2DContextGR32.Rect(X, Y, Width, Height: Double);
begin
  FPath.Rectangle(FloatRect(VertexTransform(FloatPoint(X, Y)),
    VertexTransform(FloatPoint(X + Width, Y + Height))));
end;

procedure THtml5Canvas2DContextGR32.Restore;
var
  Index: Integer;
begin
  Index := Length(FStates) - 1;

  FillStyle := FStates[Index].FillStyle;
  StrokeStyle := FStates[Index].StrokeStyle;
  LineWidth := FStates[Index].LineWidth;
  FEndStyle := FStates[Index].EndStyle;
  FJoinStyle := FStates[Index].JoinStyle;
  MiterLimit := FStates[Index].MiterLimit;
  GlobalAlpha := FStates[Index].GlobalAlpha;
  GlobalCompositeOperation := FStates[Index].GlobalCompositeOperation;
  ShadowBlur := FStates[Index].ShadowBlur;
  ShadowColor := FStates[Index].ShadowColor;
  ShadowOffsetX := FStates[Index].ShadowOffsetX;
  ShadowOffsetY := FStates[Index].ShadowOffsetY;
  Font := FStates[Index].Font;
  TextAlign := FStates[Index].TextAlign;
  TextBaseline := FStates[Index].TextBaseline;
  FTransformMatrix := FStates[Index].TransformationMatrix;

  SetLength(FStates, Index);
end;

procedure THtml5Canvas2DContextGR32.Rotate(Angle: Double);
var
  S, C: TFloat;
  M: TFloatMatrix;
begin
  GR32_Math.SinCos(-Angle, S, C);
  M := IdentityMatrix;
  M[0, 0] := C;
  M[1, 0] := S;
  M[0, 1] := -S;
  M[1, 1] := C;
  FTransformMatrix := Mult(FTransformMatrix, M);
end;

procedure THtml5Canvas2DContextGR32.Save;
var
  Index: Integer;
begin
  Index := Length(FStates);
  SetLength(FStates, Index + 1);

  FStates[Index].FillStyle := FillStyle;
  FStates[Index].StrokeStyle := StrokeStyle;
  FStates[Index].LineWidth := LineWidth;
  FStates[Index].EndStyle := FEndStyle;
  FStates[Index].JoinStyle := FJoinStyle;
  FStates[Index].MiterLimit := MiterLimit;
  FStates[Index].GlobalAlpha := GlobalAlpha;
  FStates[Index].GlobalCompositeOperation := FGlobalCompositeOperation;
  FStates[Index].ShadowBlur := ShadowBlur;
  FStates[Index].ShadowColor := ShadowColor;
  FStates[Index].ShadowOffsetX := ShadowOffsetX;
  FStates[Index].ShadowOffsetY := ShadowOffsetY;
  FStates[Index].Font := Font;
  FStates[Index].TextAlign := FTextAlign;
  FStates[Index].TextBaseline := FTextBaseline;
  FStates[Index].TransformationMatrix := FTransformMatrix;
end;

procedure THtml5Canvas2DContextGR32.Scale(X, Y: Double);
var
  M: TFloatMatrix;
begin
  M := IdentityMatrix;
  M[0, 0] := X;
  M[1, 1] := Y;
  FTransformMatrix := Mult(FTransformMatrix, M);
end;

procedure THtml5Canvas2DContextGR32.SetGlobalCompositeOperation(Value: string);
begin
  if FGlobalCompositeOperation <> Value then
  begin
    FGlobalCompositeOperation := Value;
  end;
end;

procedure THtml5Canvas2DContextGR32.SetLineCap(Value: string);
begin
  case Value[1] of
    'b', 'B' : if LowerCase(Value) = 'butt' then FEndStyle := esButt;
    'r', 'R' : if LowerCase(Value) = 'round' then FEndStyle := esRound;
    's', 'S' : if LowerCase(Value) = 'square' then FEndStyle := esSquare;
  end;
end;

procedure THtml5Canvas2DContextGR32.SetLineJoin(Value: string);
begin
  case Value[1] of
    'm', 'M' : if LowerCase(Value) = 'miter' then FJoinStyle := jsMiter;
    'r', 'R' : if LowerCase(Value) = 'round' then FJoinStyle := jsRound;
    'b', 'B' : if LowerCase(Value) = 'bevel' then FJoinStyle := jsBevel;
  end;
end;

procedure THtml5Canvas2DContextGR32.SetTextAlign(Value: string);
begin
  if FTextAlign <> Value then
  begin
    FTextAlign := Value;
    //TextAlignChanged;
  end;
end;

procedure THtml5Canvas2DContextGR32.SetTextBaseline(Value: string);
begin
  if FTextBaseline <> Value then
  begin
    FTextBaseline := Value;
    //TextBaselineChanged;
  end;
end;

procedure THtml5Canvas2DContextGR32.SetTransform(A, B, C, D, E, F: Double);
begin
  FTransformMatrix[0, 0] := A;
  FTransformMatrix[0, 1] := B;
  FTransformMatrix[0, 2] := C;
  FTransformMatrix[1, 0] := D;
  FTransformMatrix[1, 1] := E;
  FTransformMatrix[1, 2] := F;
end;

procedure THtml5Canvas2DContextGR32.ShadowBlurChanged;
begin
  inherited;

end;

procedure THtml5Canvas2DContextGR32.ShadowColorChanged;
begin
  inherited;
  FShadowColor32 := Css3ColorToColor32(ShadowColor);
  UpdateApplyShadow;
end;

procedure THtml5Canvas2DContextGR32.ShadowOffsetXChanged;
begin
  inherited;
  FShadowOffset.X := ShadowOffsetX;
end;

procedure THtml5Canvas2DContextGR32.ShadowOffsetYChanged;
begin
  inherited;
  FShadowOffset.Y := ShadowOffsetY;
end;

procedure THtml5Canvas2DContextGR32.Stroke;
var
  ClipRect: TFloatRect;
  TempBitmap: TBitmap32;
  APoints: TArrayOfArrayOfFloatPoint;
begin
  if FDirectDraw then
  begin
    // implicitly close subpath
    if Length(FPath.Points) > 0 then
      FPath.ClosePath;

    with THtml5CanvasElementGR32(CanvasElement) do
    begin
      ClipRect := FloatRect(FBitmap32.ClipRect);
      FRenderer.Bitmap := FBitmap32;
    end;

    FRenderer.Color := SetAlpha(FStrokeColor32,
      Round(AlphaComponent(FStrokeColor32) * GlobalAlpha));

    if Length(FPath.Points) > 0 then
    begin
      SetLength(APoints, 1);
      APoints[0] := BuildPolyLine(FPath.Points, LineWidth, FJoinStyle,
        FEndStyle, MiterLimit);
      FRenderer.PolygonFS(APoints[0], ClipRect);
    end;

    APoints := BuildPolyPolyLine(FPath.Path, True, LineWidth, FJoinStyle,
      FEndStyle, MiterLimit);
    FRenderer.PolyPolygonFS(APoints, ClipRect);
  end
  else
  begin
    TempBitmap := TBitmap32.Create;
    try
      // implicitly close subpath
      if Length(FPath.Points) > 0 then
        FPath.ClosePath;

      with THtml5CanvasElementGR32(CanvasElement) do
        TempBitmap.SetSize(FBitmap32.Width, FBitmap32.Height);

      ClipRect := FloatRect(TempBitmap.ClipRect);
      FRenderer.Bitmap := TempBitmap;
      FRenderer.Color := FStrokeColor32;

      if Length(FPath.Points) > 0 then
      begin
        SetLength(APoints, 1);
        APoints[0] := BuildPolyLine(FPath.Points, LineWidth, FJoinStyle,
          FEndStyle, MiterLimit);
        FRenderer.PolygonFS(APoints[0], ClipRect);
      end;

      APoints := BuildPolyPolyLine(FPath.Path, True, LineWidth, FJoinStyle,
        FEndStyle, MiterLimit);
      FRenderer.PolyPolygonFS(APoints, ClipRect);

      with THtml5CanvasElementGR32(CanvasElement) do
      begin
        TempBitmap.DrawMode := dmBlend;
        TempBitmap.MasterAlpha := Round($FF * GlobalAlpha);
        FBitmap32.Draw(0, 0, TempBitmap);
      end;
    finally
      TempBitmap.Free;
    end;
  end;
end;

procedure THtml5Canvas2DContextGR32.StrokeRect(X, Y, Width, Height: Double);
begin
  // redirection
  Rect(X, Y, Width, Height);
  Stroke;
end;

procedure THtml5Canvas2DContextGR32.StrokeStyleChanged;
begin
  inherited;
  if VarIsStr(StrokeStyle) then
    FStrokeColor32 := Css3ColorToColor32(StrokeStyle);
end;

procedure THtml5Canvas2DContextGR32.StrokeText(Text: string; X, Y: Double);
begin
  TextToPath(Text, X, Y);
  Stroke;
end;

procedure THtml5Canvas2DContextGR32.StrokeText(Text: string; X, Y,
  MaxWidth: Double);
begin
  TextToPath(Text, X, Y);
  Stroke;
end;

procedure THtml5Canvas2DContextGR32.TextToPath(Text: string; X, Y: Double);
var
  Intf: ITextToPathSupport;
  SubPathIndex, Index: Integer;
begin
  with THtml5CanvasElementGR32(CanvasElement) do
  if Supports(FBitmap32.Backend, ITextToPathSupport, Intf) then
    Intf.TextToPath(FPath, X, Y, Text)
  else
    raise Exception.Create(RCStrInpropriateBackend);


  for SubPathIndex := 0 to Length(FPath.Path) - 1 do
    for Index := 0 to Length(FPath.Path[SubPathIndex]) - 1 do
      FPath.Path[SubPathIndex][Index] := VertexTransform(FPath.Path[SubPathIndex][Index]);
end;

procedure THtml5Canvas2DContextGR32.Transform(A, B, C, D, E, F: Double);
var
  TempMatrix: TFloatMatrix;
begin
  TempMatrix[0, 0] := A;
  TempMatrix[0, 1] := B;
  TempMatrix[0, 2] := C;
  TempMatrix[1, 0] := D;
  TempMatrix[1, 1] := E;
  TempMatrix[1, 2] := F;
  TempMatrix[2, 0] := 0;
  TempMatrix[2, 1] := 0;
  TempMatrix[2, 2] := 1;

  FTransformMatrix := Mult(FTransformMatrix, TempMatrix);
end;

procedure THtml5Canvas2DContextGR32.Translate(X, Y: Double);
var
  M: TFloatMatrix;
begin
  M := IdentityMatrix;
  M[2, 0] := X;
  M[2, 1] := Y;
  FTransformMatrix := Mult(FTransformMatrix, M);
end;

procedure THtml5Canvas2DContextGR32.UpdateApplyShadow;
begin
  FApplyShadow := (TColor32Entry(FShadowColor32).A > 0) and ((ShadowBlur <> 0)
    or (ShadowOffsetX <> 0) or (ShadowOffsetX <> 0));
end;

function THtml5Canvas2DContextGR32.VertexTransform(
  Vertex: TFloatPoint): TFloatPoint;
begin
  Result.X := Vertex.X * FTransformMatrix[0, 0] +
    Vertex.Y * FTransformMatrix[1, 0] + FTransformMatrix[2, 0];
  Result.Y := Vertex.X * FTransformMatrix[0, 1] +
    Vertex.Y * FTransformMatrix[1, 1] + FTransformMatrix[2, 1];
end;

end.
