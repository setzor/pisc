unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, PrintersDlgs, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Buttons, Printers;

type

  { TForm3 }

  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation

Uses Unit1;

{$R *.lfm}

{ TForm3 }


procedure TForm3.BitBtn1Click(Sender: TObject);
const
  LEFTMARGIN = 100;
  HEADLINE = 'Public Interest Score Calculator - Report: ';
var
  APos, Bpos, CPos, DPos, EPos, LineHeight, VerticalMargin: Integer;
  SuccessString: String;
  CompName, PIScore: String;
begin
  with Printer do
  try
    BeginDoc;
    Canvas.Font.Name := 'Courier New';
    Canvas.Font.Size := 11;
    Canvas.Font.Color := clBlack;
    LineHeight := Round(1.2 * Abs(Canvas.TextHeight('I')));
    VerticalMargin := 4 * LineHeight;
    // There we go
    APos := VerticalMargin;
    BPos := Apos + VerticalMargin;
    CPos := Bpos + VerticalMargin;
    DPos := CPos + VerticalMargin;
    EPos := DPos + VerticalMargin;
    SuccessString := HEADLINE + DateTimeToStr(Now);
    CompName := Unit1.Form1.ComNameEdt.Text;
    PIScore := Unit1.Form1.ScoreEdt.Text;
    Canvas.TextOut(LEFTMARGIN, APos, SuccessString);
    Canvas.TextOut(LEFTMARGIN, BPos, CompName + PIScore);
  finally
    EndDoc;
  end;

end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  Form3.Visible:=false;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;


procedure TForm3.FormCreate(Sender: TObject);
begin

end;

end.

