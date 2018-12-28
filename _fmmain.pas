unit _fmMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Contnrs, ExtCtrls;

type

  { TfmMain }

  TfmMain = class(TForm)
    ScrollBox: TScrollBox;
    TmChange: TTimer;
    procedure TmChangeTimer(Sender: TObject);
  private
    FImageList: TComponentList;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.frm}

{ TfmMain }

constructor TfmMain.Create(AOwner: TComponent);
var
  I: Integer;
  Image: TImage;
begin
  inherited Create(AOwner);

  FImageList := TComponentList.Create;
  for I := 1 to ParamCount do begin
    Image := TImage.Create(self);
    Image.Parent := ScrollBox;
    Image.SetBounds(0, 0, 0, 0);
    Image.AutoSize := True;
    Image.Picture.LoadFromFile(ParamStr(I));
    FImageList.Add(Image);
  end;

  TmChange.Enabled := (FImageList.Count >= 2);
end;

destructor TfmMain.Destroy;
begin
  FImageList.Free;

  inherited Destroy;
end;

procedure TfmMain.TmChangeTimer(Sender: TObject);
  function Next: TImage;
  var
    Component: TComponent;
  begin
    repeat
      Component := FImageList.Items[TmChange.Tag];
      TmChange.Tag := (TmChange.Tag + 1) mod FImageList.Count;
    until Component is TImage;
    Result := Component as TImage;
    Caption := IntToStr(TmChange.Tag);
  end;
begin
  Next.BringToFront;
end;

end.

