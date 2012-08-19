unit TestHtml5CanvasGR32;

interface

uses
  TestFramework, Types, Classes, SysUtils, Variants, Graphics, GR32, GR32_Paths,
  GR32_Polygons, GR32_Transforms, Html5CanvasInterfaces, Html5CanvasGR32;

type
  TTestTHtml5CanvasTransformation = class(TTestCase)
  strict private
    FHtml5CanvasTransformation: THtml5CanvasTransformation;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestNumericalColorValues;
    procedure TestHSLColorValues;
    procedure TestExtendedColorKeywords;
  end;

implementation

procedure TTestTHtml5CanvasTransformation.SetUp;
begin
  FHtml5CanvasTransformation := THtml5CanvasTransformation.Create;
end;

procedure TTestTHtml5CanvasTransformation.TearDown;
begin
  FHtml5CanvasTransformation.Free;
  FHtml5CanvasTransformation := nil;
end;

procedure TTestTHtml5CanvasTransformation.TestNumericalColorValues;
begin
  Check(Css3ColorToColor32('#F00') = clRed32);
  Check(Css3ColorToColor32('#0F0') = clLime32);
  Check(Css3ColorToColor32('#00F') = clBlue32);

  Check(Css3ColorToColor32('#FF0000') = clRed32);
  Check(Css3ColorToColor32('#00FF00') = clLime32);
  Check(Css3ColorToColor32('#0000FF') = clBlue32);

  Check(Css3ColorToColor32('rgb(255, 0, 0)') = clRed32);
  Check(Css3ColorToColor32('rgb(0, 255, 0)') = clLime32);
  Check(Css3ColorToColor32('rgb(0, 0, 255)') = clBlue32);

  Check(Css3ColorToColor32('rgb(100%, 0%, 0%)') = clRed32);
  Check(Css3ColorToColor32('rgb(0%, 100%, 0%)') = clLime32);
  Check(Css3ColorToColor32('rgb(0%, 0%, 100%)') = clBlue32);

  Check(Css3ColorToColor32('rgb(255,0,0)') = clRed32);
  Check(Css3ColorToColor32('rgb(300,0,0)') = clRed32);
  Check(Css3ColorToColor32('rgb(255,-10,0)') = clRed32);
  Check(Css3ColorToColor32('rgb(110%, -10%, 0%)') = clRed32);

  Check(Css3ColorToColor32('rgba(255, 0, 0, 1)') = clRed32);
  Check(Css3ColorToColor32('rgba(0, 255, 0, 1)') = clLime32);
  Check(Css3ColorToColor32('rgba(0, 0, 255, 1)') = clBlue32);

  Check(Css3ColorToColor32('rgba(100%, 0%, 0%, 1)') = clRed32);
  Check(Css3ColorToColor32('rgba(0%, 100%, 0%, 1)') = clLime32);
  Check(Css3ColorToColor32('rgba(0%, 0%, 100%, 1)') = clBlue32);
end;

procedure TTestTHtml5CanvasTransformation.TestHSLColorValues;
begin
  Check(Css3ColorToColor32('hsl(0, 100%, 50%)') = clRed32);
  Check(Css3ColorToColor32('hsl(120, 100%, 50%)') = clLime32);
  Check(Css3ColorToColor32('hsl(120, 100%, 25%)') = $FF008000);
  Check(Css3ColorToColor32('hsl(120, 100%, 75%)') = $FF80FF80);
  Check(Css3ColorToColor32('hsl(120, 75%, 75%)') = $FF8FEF8F);

  Check(Css3ColorToColor32('hsla(0, 100%, 50%, 1)') = clRed32);
  Check(Css3ColorToColor32('hsla(120, 100%, 50%, 1)') = clLime32);
  Check(Css3ColorToColor32('hsla(0, 100%, 50%, 0.5)') = $80FF0000);
  Check(Css3ColorToColor32('hsla(240, 100%, 50%, 0.5)') = $800000FF);
end;

procedure TTestTHtml5CanvasTransformation.TestExtendedColorKeywords;
begin
  Check(Css3ColorToColor32('aliceblue') = $FFF0F8FF, 'Error with color ''aliceblue''');
  Check(Css3ColorToColor32('antiquewhite') = $FFFAEBD7, 'Error with color ''antiquewhite''');
  Check(Css3ColorToColor32('aqua') = $FF00FFFF, 'Error with color ''aqua''');
  Check(Css3ColorToColor32('aquamarine') = $FF7FFFD4, 'Error with color ''aquamarine''');
  Check(Css3ColorToColor32('azure') = $FFF0FFFF, 'Error with color ''azure''');
  Check(Css3ColorToColor32('beige') = $FFF5F5DC, 'Error with color ''beige''');
  Check(Css3ColorToColor32('bisque') = $FFFFE4C4, 'Error with color ''bisque''');
  Check(Css3ColorToColor32('black') = $FF000000, 'Error with color ''black''');
  Check(Css3ColorToColor32('blanchedalmond') = $FFFFEBCD, 'Error with color ''blanchedalmond''');
  Check(Css3ColorToColor32('blue') = $FF0000FF, 'Error with color ''blue''');
  Check(Css3ColorToColor32('blueviolet') = $FF8A2BE2, 'Error with color ''blueviolet''');
  Check(Css3ColorToColor32('brown') = $FFA52A2A, 'Error with color ''brown''');
  Check(Css3ColorToColor32('burlywood') = $FFDEB887, 'Error with color ''burlywood''');
  Check(Css3ColorToColor32('cadetblue') = $FF5F9EA0, 'Error with color ''cadetblue''');
  Check(Css3ColorToColor32('chartreuse') = $FF7FFF00, 'Error with color ''chartreuse''');
  Check(Css3ColorToColor32('chocolate') = $FFD2691E, 'Error with color ''chocolate''');
  Check(Css3ColorToColor32('coral') = $FFFF7F50, 'Error with color ''coral''');
  Check(Css3ColorToColor32('cornflowerblue') = $FF6495ED, 'Error with color ''cornflowerblue''');
  Check(Css3ColorToColor32('cornsilk') = $FFFFF8DC, 'Error with color ''cornsilk''');
  Check(Css3ColorToColor32('crimson') = $FFDC143C, 'Error with color ''crimson''');
  Check(Css3ColorToColor32('cyan') = $FF00FFFF, 'Error with color ''cyan''');
  Check(Css3ColorToColor32('darkblue') = $FF00008B, 'Error with color ''darkblue''');
  Check(Css3ColorToColor32('darkcyan') = $FF008B8B, 'Error with color ''darkcyan''');
  Check(Css3ColorToColor32('darkgoldenrod') = $FFB8860B, 'Error with color ''darkgoldenrod''');
  Check(Css3ColorToColor32('darkgray') = $FFA9A9A9, 'Error with color ''darkgray''');
  Check(Css3ColorToColor32('darkgreen') = $FF006400, 'Error with color ''darkgreen''');
  Check(Css3ColorToColor32('darkgrey') = $FFA9A9A9, 'Error with color ''darkgrey''');
  Check(Css3ColorToColor32('darkkhaki') = $FFBDB76B, 'Error with color ''darkkhaki''');
  Check(Css3ColorToColor32('darkmagenta') = $FF8B008B, 'Error with color ''darkmagenta''');
  Check(Css3ColorToColor32('darkolivegreen') = $FF556B2F, 'Error with color ''darkolivegreen''');
  Check(Css3ColorToColor32('darkorange') = $FFFF8C00, 'Error with color ''darkorange''');
  Check(Css3ColorToColor32('darkorchid') = $FF9932CC, 'Error with color ''darkorchid''');
  Check(Css3ColorToColor32('darkred') = $FF8B0000, 'Error with color ''darkred''');
  Check(Css3ColorToColor32('darksalmon') = $FFE9967A, 'Error with color ''darksalmon''');
  Check(Css3ColorToColor32('darkseagreen') = $FF8FBC8F, 'Error with color ''darkseagreen''');
  Check(Css3ColorToColor32('darkslateblue') = $FF483D8B, 'Error with color ''darkslateblue''');
  Check(Css3ColorToColor32('darkslategray') = $FF2F4F4F, 'Error with color ''darkslategray''');
  Check(Css3ColorToColor32('darkslategrey') = $FF2F4F4F, 'Error with color ''darkslategrey''');
  Check(Css3ColorToColor32('darkturquoise') = $FF00CED1, 'Error with color ''darkturquoise''');
  Check(Css3ColorToColor32('darkviolet') = $FF9400D3, 'Error with color ''darkviolet''');
  Check(Css3ColorToColor32('deeppink') = $FFFF1493, 'Error with color ''deeppink''');
  Check(Css3ColorToColor32('deepskyblue') = $FF00BFFF, 'Error with color ''deepskyblue''');
  Check(Css3ColorToColor32('dimgray') = $FF696969, 'Error with color ''dimgray''');
  Check(Css3ColorToColor32('dimgrey') = $FF696969, 'Error with color ''dimgrey''');
  Check(Css3ColorToColor32('dodgerblue') = $FF1E90FF, 'Error with color ''dodgerblue''');
  Check(Css3ColorToColor32('firebrick') = $FFB22222, 'Error with color ''firebrick''');
  Check(Css3ColorToColor32('floralwhite') = $FFFFFAF0, 'Error with color ''floralwhite''');
  Check(Css3ColorToColor32('forestgreen') = $FF228B22, 'Error with color ''forestgreen''');
  Check(Css3ColorToColor32('fuchsia') = $FFFF00FF, 'Error with color ''fuchsia''');
  Check(Css3ColorToColor32('gainsboro') = $FFDCDCDC, 'Error with color ''gainsboro''');
  Check(Css3ColorToColor32('ghostwhite') = $FFF8F8FF, 'Error with color ''ghostwhite''');
  Check(Css3ColorToColor32('gold') = $FFFFD700, 'Error with color ''gold''');
  Check(Css3ColorToColor32('goldenrod') = $FFDAA520, 'Error with color ''goldenrod''');
  Check(Css3ColorToColor32('gray') = $FF808080, 'Error with color ''gray''');
  Check(Css3ColorToColor32('green') = $FF008000, 'Error with color ''green''');
  Check(Css3ColorToColor32('greenyellow') = $FFADFF2F, 'Error with color ''greenyellow''');
  Check(Css3ColorToColor32('grey') = $FF808080, 'Error with color ''grey''');
  Check(Css3ColorToColor32('honeydew') = $FFF0FFF0, 'Error with color ''honeydew''');
  Check(Css3ColorToColor32('hotpink') = $FFFF69B4, 'Error with color ''hotpink''');
  Check(Css3ColorToColor32('indianred') = $FFCD5C5C, 'Error with color ''indianred''');
  Check(Css3ColorToColor32('indigo') = $FF4B0082, 'Error with color ''indigo''');
  Check(Css3ColorToColor32('ivory') = $FFFFFFF0, 'Error with color ''ivory''');
  Check(Css3ColorToColor32('khaki') = $FFF0E68C, 'Error with color ''khaki''');
  Check(Css3ColorToColor32('lavender') = $FFE6E6FA, 'Error with color ''lavender''');
  Check(Css3ColorToColor32('lavenderblush') = $FFFFF0F5, 'Error with color ''lavenderblush''');
  Check(Css3ColorToColor32('lawngreen') = $FF7CFC00, 'Error with color ''lawngreen''');
  Check(Css3ColorToColor32('lemonchiffon') = $FFFFFACD, 'Error with color ''lemonchiffon''');
  Check(Css3ColorToColor32('lightblue') = $FFADD8E6, 'Error with color ''lightblue''');
  Check(Css3ColorToColor32('lightcoral') = $FFF08080, 'Error with color ''lightcoral''');
  Check(Css3ColorToColor32('lightcyan') = $FFE0FFFF, 'Error with color ''lightcyan''');
  Check(Css3ColorToColor32('lightgoldenrodyellow') = $FFFAFAD2, 'Error with color ''lightgoldenrodyellow''');
  Check(Css3ColorToColor32('lightgray') = $FFD3D3D3, 'Error with color ''lightgray''');
  Check(Css3ColorToColor32('lightgreen') = $FF90EE90, 'Error with color ''lightgreen''');
  Check(Css3ColorToColor32('lightgrey') = $FFD3D3D3, 'Error with color ''lightgrey''');
  Check(Css3ColorToColor32('lightpink') = $FFFFB6C1, 'Error with color ''lightpink''');
  Check(Css3ColorToColor32('lightsalmon') = $FFFFA07A, 'Error with color ''lightsalmon''');
  Check(Css3ColorToColor32('lightseagreen') = $FF20B2AA, 'Error with color ''lightseagreen''');
  Check(Css3ColorToColor32('lightskyblue') = $FF87CEFA, 'Error with color ''lightskyblue''');
  Check(Css3ColorToColor32('lightslategray') = $FF778899, 'Error with color ''lightslategray''');
  Check(Css3ColorToColor32('lightslategrey') = $FF778899, 'Error with color ''lightslategrey''');
  Check(Css3ColorToColor32('lightsteelblue') = $FFB0C4DE, 'Error with color ''lightsteelblue''');
  Check(Css3ColorToColor32('lightyellow') = $FFFFFFE0, 'Error with color ''lightyellow''');
  Check(Css3ColorToColor32('lime') = $FF00FF00, 'Error with color ''lime''');
  Check(Css3ColorToColor32('limegreen') = $FF32CD32, 'Error with color ''limegreen''');
  Check(Css3ColorToColor32('linen') = $FFFAF0E6, 'Error with color ''linen''');
  Check(Css3ColorToColor32('magenta') = $FFFF00FF, 'Error with color ''magenta''');
  Check(Css3ColorToColor32('maroon') = $FF800000, 'Error with color ''maroon''');
  Check(Css3ColorToColor32('mediumaquamarine') = $FF66CDAA, 'Error with color ''mediumaquamarine''');
  Check(Css3ColorToColor32('mediumblue') = $FF0000CD, 'Error with color ''mediumblue''');
  Check(Css3ColorToColor32('mediumorchid') = $FFBA55D3, 'Error with color ''mediumorchid''');
  Check(Css3ColorToColor32('mediumpurple') = $FF9370DB, 'Error with color ''mediumpurple''');
  Check(Css3ColorToColor32('mediumseagreen') = $FF3CB371, 'Error with color ''mediumseagreen''');
  Check(Css3ColorToColor32('mediumslateblue') = $FF7B68EE, 'Error with color ''mediumslateblue''');
  Check(Css3ColorToColor32('mediumspringgreen') = $FF00FA9A, 'Error with color ''mediumspringgreen''');
  Check(Css3ColorToColor32('mediumturquoise') = $FF48D1CC, 'Error with color ''mediumturquoise''');
  Check(Css3ColorToColor32('mediumvioletred') = $FFC71585, 'Error with color ''mediumvioletred''');
  Check(Css3ColorToColor32('midnightblue') = $FF191970, 'Error with color ''midnightblue''');
  Check(Css3ColorToColor32('mintcream') = $FFF5FFFA, 'Error with color ''mintcream''');
  Check(Css3ColorToColor32('mistyrose') = $FFFFE4E1, 'Error with color ''mistyrose''');
  Check(Css3ColorToColor32('moccasin') = $FFFFE4B5, 'Error with color ''moccasin''');
  Check(Css3ColorToColor32('navajowhite') = $FFFFDEAD, 'Error with color ''navajowhite''');
  Check(Css3ColorToColor32('navy') = $FF000080, 'Error with color ''navy''');
  Check(Css3ColorToColor32('oldlace') = $FFFDF5E6, 'Error with color ''oldlace''');
  Check(Css3ColorToColor32('olive') = $FF808000, 'Error with color ''olive''');
  Check(Css3ColorToColor32('olivedrab') = $FF6B8E23, 'Error with color ''olivedrab''');
  Check(Css3ColorToColor32('orange') = $FFFFA500, 'Error with color ''orange''');
  Check(Css3ColorToColor32('orangered') = $FFFF4500, 'Error with color ''orangered''');
  Check(Css3ColorToColor32('orchid') = $FFDA70D6, 'Error with color ''orchid''');
  Check(Css3ColorToColor32('palegoldenrod') = $FFEEE8AA, 'Error with color ''palegoldenrod''');
  Check(Css3ColorToColor32('palegreen') = $FF98FB98, 'Error with color ''palegreen''');
  Check(Css3ColorToColor32('paleturquoise') = $FFAFEEEE, 'Error with color ''paleturquoise''');
  Check(Css3ColorToColor32('palevioletred') = $FFDB7093, 'Error with color ''palevioletred''');
  Check(Css3ColorToColor32('papayawhip') = $FFFFEFD5, 'Error with color ''papayawhip''');
  Check(Css3ColorToColor32('peachpuff') = $FFFFDAB9, 'Error with color ''peachpuff''');
  Check(Css3ColorToColor32('peru') = $FFCD853F, 'Error with color ''peru''');
  Check(Css3ColorToColor32('pink') = $FFFFC0CB, 'Error with color ''pink''');
  Check(Css3ColorToColor32('plum') = $FFDDA0DD, 'Error with color ''plum''');
  Check(Css3ColorToColor32('powderblue') = $FFB0E0E6, 'Error with color ''powderblue''');
  Check(Css3ColorToColor32('purple') = $FF800080, 'Error with color ''purple''');
  Check(Css3ColorToColor32('red') = $FFFF0000, 'Error with color ''red''');
  Check(Css3ColorToColor32('rosybrown') = $FFBC8F8F, 'Error with color ''rosybrown''');
  Check(Css3ColorToColor32('royalblue') = $FF4169E1, 'Error with color ''royalblue''');
  Check(Css3ColorToColor32('saddlebrown') = $FF8B4513, 'Error with color ''saddlebrown''');
  Check(Css3ColorToColor32('salmon') = $FFFA8072, 'Error with color ''salmon''');
  Check(Css3ColorToColor32('sandybrown') = $FFF4A460, 'Error with color ''sandybrown''');
  Check(Css3ColorToColor32('seagreen') = $FF2E8B57, 'Error with color ''seagreen''');
  Check(Css3ColorToColor32('seashell') = $FFFFF5EE, 'Error with color ''seashell''');
  Check(Css3ColorToColor32('sienna') = $FFA0522D, 'Error with color ''sienna''');
  Check(Css3ColorToColor32('silver') = $FFC0C0C0, 'Error with color ''silver''');
  Check(Css3ColorToColor32('skyblue') = $FF87CEEB, 'Error with color ''skyblue''');
  Check(Css3ColorToColor32('slateblue') = $FF6A5ACD, 'Error with color ''slateblue''');
  Check(Css3ColorToColor32('slategray') = $FF708090, 'Error with color ''slategray''');
  Check(Css3ColorToColor32('slategrey') = $FF708090, 'Error with color ''slategrey''');
  Check(Css3ColorToColor32('snow') = $FFFFFAFA, 'Error with color ''snow''');
  Check(Css3ColorToColor32('springgreen') = $FF00FF7F, 'Error with color ''springgreen''');
  Check(Css3ColorToColor32('steelblue') = $FF4682B4, 'Error with color ''steelblue''');
  Check(Css3ColorToColor32('tan') = $FFD2B48C, 'Error with color ''tan''');
  Check(Css3ColorToColor32('teal') = $FF008080, 'Error with color ''teal''');
  Check(Css3ColorToColor32('thistle') = $FFD8BFD8, 'Error with color ''thistle''');
  Check(Css3ColorToColor32('tomato') = $FFFF6347, 'Error with color ''tomato''');
  Check(Css3ColorToColor32('turquoise') = $FF40E0D0, 'Error with color ''turquoise''');
  Check(Css3ColorToColor32('violet') = $FFEE82EE, 'Error with color ''violet''');
  Check(Css3ColorToColor32('wheat') = $FFF5DEB3, 'Error with color ''wheat''');
  Check(Css3ColorToColor32('white') = $FFFFFFFF, 'Error with color ''white''');
  Check(Css3ColorToColor32('whitesmoke') = $FFF5F5F5, 'Error with color ''whitesmoke''');
  Check(Css3ColorToColor32('yellow') = $FFFFFF00, 'Error with color ''yellow''');
  Check(Css3ColorToColor32('yellowgreen') = $FF9ACD32, 'Error with color ''yellowgreen''');
end;

initialization
  RegisterTest(TTestTHtml5CanvasTransformation.Suite);

end.
