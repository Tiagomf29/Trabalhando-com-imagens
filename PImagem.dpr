program PImagem;

uses
  Vcl.Forms,
  UImagem in 'UImagem.pas' {frmFotos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFotos, frmFotos);
  Application.Run;
end.
