unit UImagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtDlgs, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, zlibex, zlibexgz,
  ZAbstractConnection, ZConnection;

type
  TfrmFotos = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    opdialog: TOpenPictureDialog;
    conexao: TZConnection;
    qry: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFotos: TfrmFotos;

implementation

{$R *.dfm}

procedure TfrmFotos.BitBtn1Click(Sender: TObject);
var
  fileStreem,fileStreemOut  : TFileStream;
  //lZip         : TZCompressionStream;
begin

  opdialog.Execute();
  Image1.Picture.LoadFromFile(opdialog.FileName);
  Image1.Stretch := True;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select count(*) as qtde from tableimage');
  qry.Open;

  fileStreem    := TFileStream.Create(opdialog.FileName,fmOpenRead or fmShareDenyWrite);
  //fileStreemOut := TFileStream.Create('D:\teste\texte.rar',fmCreate );
  //lZip := TZCompressionStream.Create(fileStreemOut,zcMax);
  //lZip.CopyFrom(fileStreem,fileStreem.Size);
  try
    if qry.FieldByName('qtde').AsInteger > 0 then
    begin
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add('update tableimage set imagem =:imagem where codigo =1');
      qry.ParamByName('imagem').LoadFromStream(fileStreem,ftBlob);
      qry.ExecSQL;
    end
    else
    begin
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Add('insert into tableimage(codigo, imagem) values(:codigo,:imagem)');
      qry.ParamByName('codigo').AsInteger :=1;
      qry.ParamByName('imagem').LoadFromStream(fileStreem,ftBlob);
      qry.ExecSQL;
      ShowMessage('Imagem salvo com sucesso!!');
    end;
  finally
    fileStreem.Free;
    //FreeAndNil(lZip);
  end;
end;

procedure TfrmFotos.FormShow(Sender: TObject);
var
  memoryStreem : TMemoryStream;
begin
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select imagem as img from tableimage');
  qry.Open;
  memoryStreem := TMemoryStream.Create();
  try
    TBlobField(qry.FieldByName('img')).SaveToStream(memoryStreem);
    memoryStreem.Position := 0;
    Image1.Picture.Bitmap.LoadFromStream(memoryStreem);
    Image1.Stretch := true;
  finally
    FreeAndNil(memoryStreem);
  end;
end;

end.
