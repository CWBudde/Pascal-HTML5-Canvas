object FrmBasic: TFrmBasic
  Left = 0
  Top = 0
  Caption = 'Basic'
  ClientHeight = 688
  ClientWidth = 1063
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SplitterHorizontal: TSplitter
    Left = 593
    Top = 0
    Height = 688
  end
  object SynEdit: TSynEdit
    Left = 0
    Top = 0
    Width = 593
    Height = 688
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Highlighter = SynDWSSyn
    Lines.Strings = (
      'var'
      '  CanvasContext: THtml5Canvas2DContextGR32;'
      '  '
      'PrintLn('#39'Width: '#39' + IntToStr(CanvasElement.Width));'
      'PrintLn('#39'Height: '#39' + IntToStr(CanvasElement.Height));'
      ''
      
        'CanvasContext := THtml5Canvas2DContextGR32.Create(CanvasElement)' +
        ';'
      'CanvasContext.FillStyle := '#39'#FF0000'#39';'
      'CanvasContext.FillRect(0, 0, 250, 75);'
      'CanvasContext.Fill;'
      ''
      'CanvasContext.StrokeStyle := '#39'#00FF00'#39';'
      'CanvasContext.BeginPath;'
      'CanvasContext.LineWidth := 2;'
      'CanvasContext.MoveTo(10, 10); '
      'CanvasContext.LineTo(100, 10);                          '
      'CanvasContext.LineTo(100, 100);'
      'CanvasContext.Stroke;')
    OnChange = SynEditChange
    FontSmoothing = fsmNone
  end
  object PanelOutput: TPanel
    Left = 596
    Top = 0
    Width = 467
    Height = 688
    Align = alClient
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 1
    object SplitterVertical: TSplitter
      Left = 0
      Top = 565
      Width = 467
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object Log: TMemo
      Left = 0
      Top = 568
      Width = 467
      Height = 120
      Align = alBottom
      TabOrder = 0
    end
    object PaintBox32: TPaintBox32
      Left = 0
      Top = 0
      Width = 467
      Height = 565
      Align = alClient
      TabOrder = 1
    end
  end
  object SynDWSSyn: TSynDWSSyn
    DefaultFilter = 'DWScript Files (*.dws;*.pas;*.inc)|*.dws;*.pas;*.inc'
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 152
    Top = 72
  end
  object DelphiWebScript: TDelphiWebScript
    Left = 152
    Top = 128
  end
  object Timer: TTimer
    Interval = 500
    Left = 152
    Top = 184
  end
  object dwsGUIFunctions: TdwsGUIFunctions
    Left = 152
    Top = 240
  end
  object dwsUnitHtml5Canvas: TdwsUnit
    Script = DelphiWebScript
    Classes = <
      item
        Name = 'TCustomHtml5CanvasElement'
        Methods = <
          item
            Name = 'GetWidth'
            ResultType = 'Integer'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetHeight'
            ResultType = 'Integer'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Width'
            DataType = 'Integer'
            ReadAccess = 'GetWidth'
          end
          item
            Name = 'Height'
            DataType = 'Integer'
            ReadAccess = 'GetHeight'
          end>
      end
      item
        Name = 'THtml5CanvasElementGR32'
        Ancestor = 'TCustomHtml5CanvasElement'
        Methods = <
          item
            Name = 'GetWidth'
            ResultType = 'Integer'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5CanvasElementGR32MethodsGetWidthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetHeight'
            ResultType = 'Integer'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5CanvasElementGR32MethodsGetHeightEval
            Visibility = cvProtected
            Kind = mkFunction
          end>
      end
      item
        Name = 'TCustomHtml5Canvas2DContext'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'CanvasElement'
                DataType = 'TCustomHtml5CanvasElement'
              end>
            OnEval = dwsUnitClassesTHtml5Canvas2DContextConstructorsCreateEval
            Attributes = [maVirtual]
          end>
        Methods = <
          item
            Name = 'Save'
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Restore'
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'BeginPath'
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Fill'
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Stroke'
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'ClearRect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'FillRect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'StrokeRect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Clip'
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'IsPointInPath'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            ResultType = 'Boolean'
            Attributes = [maVirtual, maAbstract]
            Kind = mkFunction
          end
          item
            Name = 'FillText'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'String'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'StrokeText'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'String'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Scale'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Rotate'
            Parameters = <
              item
                Name = 'Angle'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Translate'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Transform'
            Parameters = <
              item
                Name = 'A'
                DataType = 'Float'
              end
              item
                Name = 'B'
                DataType = 'Float'
              end
              item
                Name = 'C'
                DataType = 'Float'
              end
              item
                Name = 'D'
                DataType = 'Float'
              end
              item
                Name = 'E'
                DataType = 'Float'
              end
              item
                Name = 'F'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'SetTransform'
            Parameters = <
              item
                Name = 'A'
                DataType = 'Float'
              end
              item
                Name = 'B'
                DataType = 'Float'
              end
              item
                Name = 'C'
                DataType = 'Float'
              end
              item
                Name = 'D'
                DataType = 'Float'
              end
              item
                Name = 'E'
                DataType = 'Float'
              end
              item
                Name = 'F'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'CreateImageData'
            Parameters = <
              item
                Name = 'sw'
                DataType = 'Float'
              end
              item
                Name = 'sh'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'ClosePath'
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'MoveTo'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'LineTo'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'QuadraticCurveTo'
            Parameters = <
              item
                Name = 'ControlPointX'
                DataType = 'Float'
              end
              item
                Name = 'ControlPointY'
                DataType = 'Float'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'BezierCurveTo'
            Parameters = <
              item
                Name = 'ControlPoint1X'
                DataType = 'Float'
              end
              item
                Name = 'ControlPoint1Y'
                DataType = 'Float'
              end
              item
                Name = 'ControlPoint2X'
                DataType = 'Float'
              end
              item
                Name = 'ControlPoint2Y'
                DataType = 'Float'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'ArcTo'
            Parameters = <
              item
                Name = 'X1'
                DataType = 'Float'
              end
              item
                Name = 'Y1'
                DataType = 'Float'
              end
              item
                Name = 'X2'
                DataType = 'Float'
              end
              item
                Name = 'Y2'
                DataType = 'Float'
              end
              item
                Name = 'Radius'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Rect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'Arc'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Radius'
                DataType = 'Float'
              end
              item
                Name = 'StartAngle'
                DataType = 'Float'
              end
              item
                Name = 'EndAngle'
                DataType = 'Float'
              end
              item
                Name = 'AntiClockwise'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            Attributes = [maVirtual, maAbstract]
            Kind = mkProcedure
          end
          item
            Name = 'GetFillStyle'
            ResultType = 'Variant'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetGlobalAlpha'
            ResultType = 'Float'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetGlobalCompositeOperation'
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetShadowBlur'
            ResultType = 'Float'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetShadowColor'
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetShadowOffsetX'
            ResultType = 'Float'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetShadowOffsetY'
            ResultType = 'Float'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetStrokeStyle'
            ResultType = 'Variant'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetLineWidth'
            ResultType = 'Float'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetLineCap'
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetLineJoin'
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetMiterLimit'
            ResultType = 'Float'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetFillStyle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Variant'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetGlobalAlpha'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetGlobalCompositeOperation'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowBlur'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowColor'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowOffsetX'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowOffsetY'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetStrokeStyle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Variant'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetLineWidth'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetLineCap'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetLineJoin'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetMiterLimit'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetFont'
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetTextAlign'
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetTextBaseline'
            ResultType = 'String'
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetFont'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetTextAlign'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetTextBaseline'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maAbstract]
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'GlobalAlpha'
            DataType = 'Float'
            ReadAccess = 'GetGlobalAlpha'
            WriteAccess = 'SetGlobalAlpha'
          end
          item
            Name = 'GlobalCompositeOperation'
            DataType = 'String'
            ReadAccess = 'GetGlobalCompositeOperation'
            WriteAccess = 'SetGlobalCompositeOperation'
          end
          item
            Name = 'StrokeStyle'
            DataType = 'Variant'
            ReadAccess = 'GetStrokeStyle'
            WriteAccess = 'SetStrokeStyle'
          end
          item
            Name = 'FillStyle'
            DataType = 'Variant'
            ReadAccess = 'GetFillStyle'
            WriteAccess = 'SetFillStyle'
          end
          item
            Name = 'ShadowOffsetX'
            DataType = 'Float'
            ReadAccess = 'GetShadowOffsetX'
            WriteAccess = 'SetShadowOffsetX'
          end
          item
            Name = 'ShadowOffsetY'
            DataType = 'Float'
            ReadAccess = 'GetShadowOffsetY'
            WriteAccess = 'SetShadowOffsetY'
          end
          item
            Name = 'ShadowBlur'
            DataType = 'Float'
            ReadAccess = 'GetShadowBlur'
            WriteAccess = 'SetShadowBlur'
          end
          item
            Name = 'ShadowColor'
            DataType = 'String'
            ReadAccess = 'GetShadowColor'
            WriteAccess = 'SetShadowColor'
          end
          item
            Name = 'Font'
            DataType = 'String'
            ReadAccess = 'GetFont'
            WriteAccess = 'SetFont'
          end
          item
            Name = 'TextAlign'
            DataType = 'String'
            ReadAccess = 'GetTextAlign'
            WriteAccess = 'SetTextAlign'
          end
          item
            Name = 'TextBaseline'
            DataType = 'String'
            ReadAccess = 'GetTextBaseline'
            WriteAccess = 'SetTextBaseline'
          end
          item
            Name = 'LineWidth'
            DataType = 'Float'
            ReadAccess = 'GetLineWidth'
            WriteAccess = 'SetLineWidth'
          end
          item
            Name = 'LineCap'
            DataType = 'String'
            ReadAccess = 'GetLineCap'
            WriteAccess = 'SetLineCap'
          end
          item
            Name = 'LineJoin'
            DataType = 'String'
            ReadAccess = 'GetLineJoin'
            WriteAccess = 'SetLineJoin'
          end
          item
            Name = 'MiterLimit'
            DataType = 'Float'
            ReadAccess = 'GetMiterLimit'
            WriteAccess = 'SetMiterLimit'
          end>
        OnCleanUp = dwsUnitClassesTHtml5Canvas2DContextCleanUp
      end
      item
        Name = 'THtml5Canvas2DContextGR32'
        Ancestor = 'TCustomHtml5Canvas2DContext'
        Constructors = <
          item
            Name = 'Create'
            Parameters = <
              item
                Name = 'CanvasElement'
                DataType = 'TCustomHtml5CanvasElement'
              end>
            OnEval = dwsUnitClassesTHtml5Canvas2DContextConstructorsCreateEval
            Attributes = [maVirtual]
          end>
        Methods = <
          item
            Name = 'Save'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsSaveEval
            Kind = mkProcedure
          end
          item
            Name = 'Restore'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsRestoreEval
            Kind = mkProcedure
          end
          item
            Name = 'BeginPath'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsBeginPathEval
            Kind = mkProcedure
          end
          item
            Name = 'Fill'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsFillEval
            Kind = mkProcedure
          end
          item
            Name = 'Stroke'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsStrokeEval
            Kind = mkProcedure
          end
          item
            Name = 'ClearRect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsClearRectEval
            Kind = mkProcedure
          end
          item
            Name = 'FillRect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsFillRectEval
            Kind = mkProcedure
          end
          item
            Name = 'StrokeRect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsStrokeRectEval
            Kind = mkProcedure
          end
          item
            Name = 'Clip'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsClipEval
            Kind = mkProcedure
          end
          item
            Name = 'IsPointInPath'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            ResultType = 'Boolean'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsIsPointInPathEval
            Kind = mkFunction
          end
          item
            Name = 'FillText'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'String'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsFillTextEval
            Kind = mkProcedure
          end
          item
            Name = 'StrokeText'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'String'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsStrokeText2Eval
            Kind = mkProcedure
          end
          item
            Name = 'Scale'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsScaleEval
            Kind = mkProcedure
          end
          item
            Name = 'Rotate'
            Parameters = <
              item
                Name = 'Angle'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsRotateEval
            Kind = mkProcedure
          end
          item
            Name = 'Translate'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsTranslateEval
            Kind = mkProcedure
          end
          item
            Name = 'Transform'
            Parameters = <
              item
                Name = 'A'
                DataType = 'Float'
              end
              item
                Name = 'B'
                DataType = 'Float'
              end
              item
                Name = 'C'
                DataType = 'Float'
              end
              item
                Name = 'D'
                DataType = 'Float'
              end
              item
                Name = 'E'
                DataType = 'Float'
              end
              item
                Name = 'F'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsTransformEval
            Kind = mkProcedure
          end
          item
            Name = 'SetTransform'
            Parameters = <
              item
                Name = 'A'
                DataType = 'Float'
              end
              item
                Name = 'B'
                DataType = 'Float'
              end
              item
                Name = 'C'
                DataType = 'Float'
              end
              item
                Name = 'D'
                DataType = 'Float'
              end
              item
                Name = 'E'
                DataType = 'Float'
              end
              item
                Name = 'F'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsSetTransformEval
            Kind = mkProcedure
          end
          item
            Name = 'CreateImageData'
            Parameters = <
              item
                Name = 'sw'
                DataType = 'Float'
              end
              item
                Name = 'sh'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsCreateImageDataEval
            Kind = mkProcedure
          end
          item
            Name = 'ClosePath'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsClosePathEval
            Kind = mkProcedure
          end
          item
            Name = 'MoveTo'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsMoveToEval
            Kind = mkProcedure
          end
          item
            Name = 'LineTo'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsLineToEval
            Kind = mkProcedure
          end
          item
            Name = 'QuadraticCurveTo'
            Parameters = <
              item
                Name = 'ControlPointX'
                DataType = 'Float'
              end
              item
                Name = 'ControlPointY'
                DataType = 'Float'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsQuadraticCurveToEval
            Kind = mkProcedure
          end
          item
            Name = 'BezierCurveTo'
            Parameters = <
              item
                Name = 'ControlPoint1X'
                DataType = 'Float'
              end
              item
                Name = 'ControlPoint1Y'
                DataType = 'Float'
              end
              item
                Name = 'ControlPoint2X'
                DataType = 'Float'
              end
              item
                Name = 'ControlPoint2Y'
                DataType = 'Float'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsBezierCurveToEval
            Kind = mkProcedure
          end
          item
            Name = 'ArcTo'
            Parameters = <
              item
                Name = 'X1'
                DataType = 'Float'
              end
              item
                Name = 'Y1'
                DataType = 'Float'
              end
              item
                Name = 'X2'
                DataType = 'Float'
              end
              item
                Name = 'Y2'
                DataType = 'Float'
              end
              item
                Name = 'Radius'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsArcToEval
            Kind = mkProcedure
          end
          item
            Name = 'Rect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsRectEval
            Kind = mkProcedure
          end
          item
            Name = 'Arc'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Radius'
                DataType = 'Float'
              end
              item
                Name = 'StartAngle'
                DataType = 'Float'
              end
              item
                Name = 'EndAngle'
                DataType = 'Float'
              end
              item
                Name = 'AntiClockwise'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextMethodsArcEval
            Kind = mkProcedure
          end
          item
            Name = 'GetFillStyle'
            ResultType = 'Variant'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetFillStyleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetGlobalAlpha'
            ResultType = 'Float'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetGlobalAlphaEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetGlobalCompositeOperation'
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetGlobalCompositeOperationEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetShadowBlur'
            ResultType = 'Float'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowBlurEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetShadowColor'
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowColorEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetShadowOffsetX'
            ResultType = 'Float'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowOffsetXEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetShadowOffsetY'
            ResultType = 'Float'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetShadowOffsetYEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetStrokeStyle'
            ResultType = 'Variant'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetStrokeStyleEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetLineWidth'
            ResultType = 'Float'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetLineWidthEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetLineCap'
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetLineCapEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetLineJoin'
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetLineJoinEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetMiterLimit'
            ResultType = 'Float'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetMiterLimitEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetFillStyle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Variant'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetFillStyleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetGlobalAlpha'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetGlobalAlphaEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetGlobalCompositeOperation'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetGlobalCompositeOperationEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowBlur'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowBlurEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowColor'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowColorEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowOffsetX'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowOffsetXEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowOffsetY'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetShadowOffsetYEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetStrokeStyle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Variant'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetStrokeStyleEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetLineWidth'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetLineWidthEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetLineCap'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetLineCapEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetLineJoin'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetLineJoinEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetMiterLimit'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetMiterLimitEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'GetFont'
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetFontEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetTextAlign'
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetTextAlignEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'GetTextBaseline'
            ResultType = 'String'
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsGetTextBaselineEval
            Visibility = cvProtected
            Kind = mkFunction
          end
          item
            Name = 'SetFont'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetFontEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetTextAlign'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetTextAlignEval
            Visibility = cvProtected
            Kind = mkProcedure
          end
          item
            Name = 'SetTextBaseline'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Attributes = [maVirtual, maOverride]
            OnEval = dwsUnitClassesTHtml5Canvas2DContextGR32MethodsSetTextBaselineEval
            Visibility = cvProtected
            Kind = mkProcedure
          end>
        OnCleanUp = dwsUnitClassesTHtml5Canvas2DContextCleanUp
      end>
    Instances = <
      item
        Name = 'CanvasElement'
        DataType = 'THtml5CanvasElementGR32'
        OnInstantiate = dwsUnitInstancesCanvasElementInstantiate
      end>
    Interfaces = <
      item
        Name = 'IHtml5CanvasElement'
        Methods = <
          item
            Name = 'GetHeight'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetWidth'
            ResultType = 'Integer'
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Width'
            DataType = 'Integer'
            ReadAccess = 'GetWidth'
          end
          item
            Name = 'Height'
            DataType = 'Integer'
            ReadAccess = 'GetHeight'
          end>
      end
      item
        Name = 'IHtml5CanvasGradient'
        Methods = <
          item
            Name = 'AddColorStop'
            Parameters = <
              item
                Name = 'Offset'
                DataType = 'Float'
              end
              item
                Name = 'Color'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end>
      end
      item
        Name = 'IHtml5CanvasTransformation'
        Methods = <
          item
            Name = 'Scale'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Rotate'
            Parameters = <
              item
                Name = 'Angle'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Translate'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Transform'
            Parameters = <
              item
                Name = 'A'
                DataType = 'Float'
              end
              item
                Name = 'B'
                DataType = 'Float'
              end
              item
                Name = 'C'
                DataType = 'Float'
              end
              item
                Name = 'D'
                DataType = 'Float'
              end
              item
                Name = 'E'
                DataType = 'Float'
              end
              item
                Name = 'F'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetTransform'
            Parameters = <
              item
                Name = 'A'
                DataType = 'Float'
              end
              item
                Name = 'B'
                DataType = 'Float'
              end
              item
                Name = 'C'
                DataType = 'Float'
              end
              item
                Name = 'D'
                DataType = 'Float'
              end
              item
                Name = 'E'
                DataType = 'Float'
              end
              item
                Name = 'F'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end>
      end
      item
        Name = 'IHtml5CanvasLineStyles'
        Methods = <
          item
            Name = 'GetLineWidth'
            ResultType = 'Float'
            Kind = mkFunction
          end
          item
            Name = 'GetLineCap'
            ResultType = 'String'
            Kind = mkFunction
          end
          item
            Name = 'GetLineJoin'
            ResultType = 'String'
            Kind = mkFunction
          end
          item
            Name = 'GetMiterLimit'
            ResultType = 'Float'
            Kind = mkFunction
          end
          item
            Name = 'SetLineWidth'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetLineCap'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetLineJoin'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetMiterLimit'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'LineWidth'
            DataType = 'Float'
            ReadAccess = 'GetLineWidth'
            WriteAccess = 'SetLineWidth'
          end
          item
            Name = 'LineCap'
            DataType = 'String'
            ReadAccess = 'GetLineCap'
            WriteAccess = 'SetLineCap'
          end
          item
            Name = 'LineJoin'
            DataType = 'String'
            ReadAccess = 'GetString'
            WriteAccess = 'SetString'
          end
          item
            Name = 'MiterLimit'
            DataType = 'Float'
            ReadAccess = 'GetMiterLimit'
            WriteAccess = 'SetMiterLimit'
          end>
      end
      item
        Name = 'IHtml5CanvasText'
        Methods = <
          item
            Name = 'GetFont'
            ResultType = 'String'
            Kind = mkFunction
          end
          item
            Name = 'GetTextAlign'
            ResultType = 'String'
            Kind = mkFunction
          end
          item
            Name = 'GetTextBaseline'
            ResultType = 'String'
            Kind = mkFunction
          end
          item
            Name = 'SetFont'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetTextAlign'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetTextBaseline'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'Font'
            DataType = 'String'
            ReadAccess = 'GetFont'
            WriteAccess = 'SetFont'
          end
          item
            Name = 'TextAlign'
            DataType = 'String'
            ReadAccess = 'GetTextAlign'
            WriteAccess = 'SetTextAlign'
          end
          item
            Name = 'TextBaseline'
            DataType = 'String'
            ReadAccess = 'GetTextBaseline'
            WriteAccess = 'SetTextBaseline'
          end>
      end
      item
        Name = 'IHtml5CanvasPathMethods'
        Methods = <
          item
            Name = 'ClosePath'
            Kind = mkProcedure
          end
          item
            Name = 'MoveTo'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'LineTo'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'QuadraticCurveTo'
            Parameters = <
              item
                Name = 'ControlPointX'
                DataType = 'Float'
              end
              item
                Name = 'ControlPointY'
                DataType = 'Float'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'BezierCurveTo'
            Parameters = <
              item
                Name = 'ControlPoint1X'
                DataType = 'Float'
              end
              item
                Name = 'ControlPoint1Y'
                DataType = 'Float'
              end
              item
                Name = 'ControlPoint2X'
                DataType = 'Float'
              end
              item
                Name = 'ControlPoint2Y'
                DataType = 'Float'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'ArcTo'
            Parameters = <
              item
                Name = 'X1'
                DataType = 'Float'
              end
              item
                Name = 'Y1'
                DataType = 'Float'
              end
              item
                Name = 'X2'
                DataType = 'Float'
              end
              item
                Name = 'Y2'
                DataType = 'Float'
              end
              item
                Name = 'Radius'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Rect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Arc'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Radius'
                DataType = 'Float'
              end
              item
                Name = 'StartAngle'
                DataType = 'Float'
              end
              item
                Name = 'EndAngle'
                DataType = 'Float'
              end
              item
                Name = 'AntiClockwise'
                DataType = 'Boolean'
                HasDefaultValue = True
                DefaultValue = False
              end>
            Kind = mkProcedure
          end>
      end
      item
        Name = 'IHtml5TextMetrics'
        Methods = <
          item
            Name = 'GetWidth'
            ResultType = 'Integer'
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Width'
            DataType = 'Integer'
            ReadAccess = 'GetWidth'
          end>
      end
      item
        Name = 'IHtml5ImageData'
        Methods = <
          item
            Name = 'GetWidth'
            ResultType = 'Integer'
            Kind = mkFunction
          end
          item
            Name = 'GetHeight'
            ResultType = 'Integer'
            Kind = mkFunction
          end>
        Properties = <
          item
            Name = 'Width'
            DataType = 'Integer'
            ReadAccess = 'GetWidth'
          end
          item
            Name = 'Height'
            DataType = 'Integer'
            ReadAccess = 'GetHeight'
          end>
      end
      item
        Name = 'IHtml5Canvas2DContext'
        Methods = <
          item
            Name = 'Save'
            Kind = mkProcedure
          end
          item
            Name = 'Restore'
            Kind = mkProcedure
          end
          item
            Name = 'BeginPath'
            Kind = mkProcedure
          end
          item
            Name = 'Fill'
            Kind = mkProcedure
          end
          item
            Name = 'Stroke'
            Kind = mkProcedure
          end
          item
            Name = 'ClearRect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'FillRect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'StrokeRect'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end
              item
                Name = 'Width'
                DataType = 'Float'
              end
              item
                Name = 'Height'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'Clip'
            Kind = mkProcedure
          end
          item
            Name = 'IsPointInPath'
            Parameters = <
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            ResultType = 'Boolean'
            Kind = mkFunction
          end
          item
            Name = 'FillText'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'String'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'StrokeText'
            Parameters = <
              item
                Name = 'Text'
                DataType = 'String'
              end
              item
                Name = 'X'
                DataType = 'Float'
              end
              item
                Name = 'Y'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'CreateImageData'
            Parameters = <
              item
                Name = 'sw'
                DataType = 'Float'
              end
              item
                Name = 'sh'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'GetFillStyle'
            ResultType = 'Variant'
            Kind = mkFunction
          end
          item
            Name = 'GetGlobalAlpha'
            ResultType = 'Float'
            Kind = mkFunction
          end
          item
            Name = 'GetGlobalCompositeOperation'
            ResultType = 'String'
            Kind = mkFunction
          end
          item
            Name = 'GetShadowBlur'
            ResultType = 'Float'
            Kind = mkFunction
          end
          item
            Name = 'GetShadowColor'
            ResultType = 'String'
            Kind = mkFunction
          end
          item
            Name = 'GetShadowOffsetX'
            ResultType = 'Float'
            Kind = mkFunction
          end
          item
            Name = 'GetShadowOffsetY'
            ResultType = 'Float'
            Kind = mkFunction
          end
          item
            Name = 'GetStrokeStyle'
            ResultType = 'Variant'
            Kind = mkFunction
          end
          item
            Name = 'SetFillStyle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Variant'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetGlobalAlpha'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetGlobalCompositeOperation'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowBlur'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowColor'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'String'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowOffsetX'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetShadowOffsetY'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Float'
              end>
            Kind = mkProcedure
          end
          item
            Name = 'SetStrokeStyle'
            Parameters = <
              item
                Name = 'Value'
                DataType = 'Variant'
              end>
            Kind = mkProcedure
          end>
        Properties = <
          item
            Name = 'GlobalAlpha'
            DataType = 'Float'
            ReadAccess = 'GetGlobalAlpha'
            WriteAccess = 'SetGlobalAlpha'
          end
          item
            Name = 'GlobalCompositeOperation'
            DataType = 'String'
            ReadAccess = 'GetGlobalCompositeOperation'
            WriteAccess = 'SetGlobalCompositeOperation'
          end
          item
            Name = 'StrokeStyle'
            DataType = 'Variant'
            ReadAccess = 'GetStrokeStyle'
            WriteAccess = 'SetStrokeStyle'
          end
          item
            Name = 'FillStyle'
            DataType = 'Variant'
            ReadAccess = 'GetFillStyle'
            WriteAccess = 'SetFillStyle'
          end
          item
            Name = 'ShadowOffsetX'
            DataType = 'Float'
            ReadAccess = 'GetShadowOffsetX'
            WriteAccess = 'SetShadowOffsetX'
          end
          item
            Name = 'ShadowOffsetY'
            DataType = 'Float'
            ReadAccess = 'GetShadowOffsetY'
            WriteAccess = 'SetShadowOffsetY'
          end
          item
            Name = 'ShadowBlur'
            DataType = 'Float'
            ReadAccess = 'GetShadowBlur'
            WriteAccess = 'SetShadowBlur'
          end
          item
            Name = 'ShadowColor'
            DataType = 'String'
            ReadAccess = 'GetShadowColor'
            WriteAccess = 'SetShadowColor'
          end>
      end>
    UnitName = 'Html5Canvas'
    StaticSymbols = False
    Left = 152
    Top = 296
  end
end
