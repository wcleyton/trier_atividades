inherited FAtividades: TFAtividades
  Caption = 'Controle de Atividades'
  ClientHeight = 500
  ClientWidth = 1040
  Position = poDesktopCenter
  OnCreate = FormCreate
  ExplicitWidth = 1048
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1040
    Height = 478
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 924
    ExplicitHeight = 478
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 144
      Height = 476
      Align = alLeft
      TabOrder = 0
      object BitBtn1: TBitBtn
        Left = 10
        Top = 8
        Width = 128
        Height = 41
        Caption = 'Nova Atividade'
        TabOrder = 0
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 10
        Top = 55
        Width = 128
        Height = 41
        Caption = 'Editar Atividade'
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object BitBtn3: TBitBtn
        Left = 10
        Top = 102
        Width = 128
        Height = 41
        Caption = 'Remover Atividade'
        TabOrder = 2
        OnClick = BitBtn3Click
      end
    end
    object Panel3: TPanel
      Left = 145
      Top = 1
      Width = 894
      Height = 476
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 778
      object DBGrid1: TDBGrid
        Left = 1
        Top = 33
        Width = 892
        Height = 442
        Align = alClient
        DataSource = FDMDB.dsAtividades
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        PopupMenu = PopupConcluir
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_ATIVIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'digo'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            Title.Caption = 'T'#237'tulo'
            Width = 215
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 412
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TipoDescricao'
            Title.Caption = 'Tipo'
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Width = 36
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 892
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitWidth = 776
        object Label1: TLabel
          Left = 594
          Top = 10
          Width = 273
          Height = 13
          Caption = 'Status: A -> Atividade Aberta / C -> Atividade Conclu'#237'da'
        end
        object CheckBox1: TCheckBox
          Left = 16
          Top = 8
          Width = 153
          Height = 17
          Caption = 'Atividades em Aberto'
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 175
          Top = 8
          Width = 153
          Height = 17
          Caption = 'Atividades Conclu'#237'das'
          TabOrder = 1
        end
      end
    end
  end
  object SB: TStatusBar
    Left = 0
    Top = 478
    Width = 1040
    Height = 22
    Panels = <
      item
        Alignment = taCenter
        Text = 'Data:'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'Hora:'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'Controle de Atividades - Vers'#227'o Trier'
        Width = 50
      end>
    ExplicitWidth = 924
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 832
    Top = 160
  end
  object PopupConcluir: TPopupMenu
    OnPopup = PopupConcluirPopup
    Left = 481
    Top = 225
    object ConcluirAtividade1: TMenuItem
      Caption = 'Concluir Atividade'
      OnClick = ConcluirAtividade1Click
    end
  end
end
