object fmMain: TfmMain
  Left = 448
  Height = 1062
  Top = 185
  Width = 780
  Caption = 'FindHidden'
  ClientHeight = 1062
  ClientWidth = 780
  LCLVersion = '6.6'
  object ScrollBox: TScrollBox
    Left = 0
    Height = 1062
    Top = 0
    Width = 780
    HorzScrollBar.Increment = 1
    HorzScrollBar.Page = 1
    HorzScrollBar.Smooth = True
    HorzScrollBar.Tracking = True
    VertScrollBar.Increment = 1
    VertScrollBar.Page = 1
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 0
  end
  object TmChange: TTimer
    Interval = 100
    OnTimer = TmChangeTimer
    Left = 24
    Top = 10
  end
end
