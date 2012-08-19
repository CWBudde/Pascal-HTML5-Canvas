object FrmPrettyGlowingLines: TFrmPrettyGlowingLines
  Left = 0
  Top = 0
  Caption = 'Basic'
  ClientHeight = 450
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox32: TPaintBox32
    Left = 0
    Top = 0
    Width = 800
    Height = 450
    Align = alClient
    TabOrder = 0
  end
  object AppEvents: TApplicationEvents
    OnIdle = AppEventsIdle
    Left = 24
    Top = 24
  end
  object LinesTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = LinesTimerTimer
    Left = 96
    Top = 24
  end
  object BlankTimer: TTimer
    Enabled = False
    Interval = 40
    OnTimer = BlankTimerTimer
    Left = 168
    Top = 24
  end
end
