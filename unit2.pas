unit Unit2; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    CloseBtn: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form2: TForm2; 

implementation

{$R *.lfm}

{ TForm2 }

{ TForm2 }



procedure TForm2.CloseBtnClick(Sender: TObject);
begin
    Unit2.Form2.Visible:=False;
  //Hides the About Form
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  If Memo1.Visible = False
  then Memo1.Visible:=True
  Else if Memo1.Visible = True
  then memo1.Visible:=False;
end;




end.

