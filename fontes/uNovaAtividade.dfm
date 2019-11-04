inherited FNovaAtividade: TFNovaAtividade
  Caption = 'Cadastrar Nova Atividade'
  ClientHeight = 206
  ClientWidth = 612
  Position = poDesktopCenter
  ExplicitWidth = 620
  ExplicitHeight = 233
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 612
    Height = 160
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 612
    ExplicitHeight = 137
    object Label1: TLabel
      Left = 44
      Top = 27
      Width = 30
      Height = 13
      Caption = 'Titulo:'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object Label3: TLabel
      Left = 50
      Top = 100
      Width = 24
      Height = 13
      Caption = 'Tipo:'
    end
    object DBEdit1: TDBEdit
      Left = 75
      Top = 24
      Width = 278
      Height = 21
      DataField = 'TITULO'
      DataSource = FDMDB.dsAtividades
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 75
      Top = 61
      Width = 502
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = FDMDB.dsAtividades
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 75
      Top = 96
      Width = 145
      Height = 21
      DataField = 'TIPO'
      DataSource = FDMDB.dsAtividades
      KeyField = 'ID_TIPO'
      ListField = 'DESCRICAO'
      ListSource = FDMDB.dsTipoAtividade
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 160
    Width = 612
    Height = 46
    Align = alBottom
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 155
      Top = 9
      Width = 100
      Height = 29
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn1: TBitBtn
      Left = 24
      Top = 9
      Width = 100
      Height = 29
      Caption = 'Gravar'
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
end
