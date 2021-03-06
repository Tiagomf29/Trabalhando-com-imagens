object frmFotos: TfrmFotos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Fotos'
  ClientHeight = 311
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 1
    Top = 8
    Width = 341
    Height = 233
  end
  object BitBtn1: TBitBtn
    Left = 1
    Top = 247
    Width = 341
    Height = 65
    Caption = 'Carregar Foto'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object opdialog: TOpenPictureDialog
    Left = 72
    Top = 248
  end
  object conexao: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Connected = True
    HostName = 'localhost'
    Port = 0
    Database = 'D:\Projetos GitHub\Trabalhando com imagens\banco.fdb'
    User = 'sysdba'
    Password = 'masterkey'
    Protocol = 'firebirdd-3.0'
    Left = 167
    Top = 248
  end
  object qry: TZQuery
    Connection = conexao
    Params = <>
    Left = 240
    Top = 248
  end
end
