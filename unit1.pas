unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LR_Class, Forms, Controls, Graphics, Dialogs,
  Menus, ComCtrls, Buttons, StdCtrls, EditBtn, Printers, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CalcBtn: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    CompiledComboBox: TComboBox;
    DateEdit1: TDateEdit;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    frReport1: TfrReport;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    MenuItem10: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    ScoreEdt: TEdit;
    ReqEdt: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    LiabilitiesEdt: TEdit;
    MenuItem7: TMenuItem;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TurnoverEdt: TEdit;
    IndivEdt: TEdit;
    EmployeesEdt: TEdit;
    Image1: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    TabSheet4: TTabSheet;
    TypeComboBox: TComboBox;
    ComNameEdt: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MainCloseBtn: TBitBtn;
    AboutBtn: TBitBtn;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure AboutBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CalcBtnClick(Sender: TObject);
    procedure MainCloseBtnClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  Form1: TForm1;
  Score, EmployeesVar, LiabilitiesVar, TurnoverVar, IndivVar : Integer;

implementation
//Adds Unit2 and Unit3 and Access to AboutForm (Form2)
Uses Unit2;

{ TForm1 }

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  Unit2.Form2.Visible:=True;
  Unit2.Form2.Memo1.Visible:=False;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  Unit2.Form2.Close;
  Form1.Close;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  //Ensure that PageControl is active again and jump to Greeting-Page
  PageControl2.Visible:=False;
  PageControl1.Visible:=True;
  PageControl1.ActivePage:=TabSheet4;
  //Clear first Tab and Setfocus to enter new data
  ComNameEdt.Text:='';
  //ComNameEdt.SetFocus;
  TypeComboBox.Text:='Private Company';
  DateEdit1.Text:='';
  CompiledComboBox.Text:='Independently';
  //Clear second tab
  EmployeesEdt.Text:='0';
  LiabilitiesEdt.Text:='0';
  TurnoverEdt.Text:='0';
  IndivEdt.Text:='0';
  //Reset last tab comboboxes - all to YES
  ComboBox1.Text:='No';
  ComboBox2.Text:='No';
  ComboBox3.Text:='No';
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  Unit2.Form2.Visible:=True;
  Unit2.Form2.Memo1.Visible:=True;
end;



procedure TForm1.AboutBtnClick(Sender: TObject);
begin
  Unit2.Form2.Visible:=True;
  Unit2.Form2.Memo1.Visible:=False;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  PageControl1.ActivePage:=TabSheet2;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  PageControl1.ActivePage:=TabSheet3;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  PageControl1.ActivePage:=TabSheet1;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
   //Unit3.Form3.Visible:=True;
   //Unit3.Form3.Memo1.Lines.Add((ComNameEdt.Text) + ' has a public interest score of ' + (IntToStr(Score)) + ' points and require: ' + (ReqEdt.Text));
const
  LEFTMARGIN = 100;
  HEADLINE = 'Public Interest Score Calculator - Report: ';
var
  APos, Bpos, LineHeight, VerticalMargin: Integer;
  SuccessString: String;
  CompName, PIScore: String;
begin
  with Printer do
  try
    BeginDoc;
    Canvas.Font.Name := 'Courier New';
    Canvas.Font.Size := 12;
    Canvas.Font.Color := clBlack;
    LineHeight := Round(1.2 * Abs(Canvas.TextHeight('I')));
    VerticalMargin := 4 * LineHeight;
    // There we go
    APos := VerticalMargin;
    BPos := Apos + VerticalMargin;
    SuccessString := HEADLINE + DateTimeToStr(Now);
    CompName := Unit1.Form1.ComNameEdt.Text;
    PIScore := Unit1.Form1.ScoreEdt.Text;
    Canvas.TextOut(LEFTMARGIN, APos, SuccessString);
    Canvas.TextOut(LEFTMARGIN, BPos, CompName + ' has a score of ' + PIScore + ' and require: ' + reqedt.Text);
  finally
    EndDoc;
  end;

end;

procedure TForm1.CalcBtnClick(Sender: TObject);
begin
  PageControl1.Visible:=False;
  PageControl2.Visible:=True;

  //Calculate the Score
  EmployeesVar   := StrToInt(EmployeesEdt.Text);
  LiabilitiesVar := (StrToInt(LiabilitiesEdt.Text)) div 1000000;
  TurnoverVar    := StrToInt(TurnoverEdt.Text) div 1000000;
  IndivVar       := StrToInt(IndivEdt.Text);
  Score          := EmployeesVar + LiabilitiesVar + TurnoverVar + IndivVar;
  Form1.ScoreEdt.Text:= IntToStr(Score);

  //Calculate if Audit or Review Required
  //=IF(AuditorReview!C3="Yes","an audit.",IF(AuditorReview!C4="Yes","an independent review.",IF(AuditorReview!C5="Yes","no intervention.","no intervention")))

  //Audit Tab
  Edit3.Text:= ComboBox1.Text;
  Edit4.Text:= ComboBox2.Text;

  If TypeComboBox.Text = 'State Owned Company'
   then Edit5.Text:= 'Yes'
   else if TypeComboBox.Text = 'Public Company'
   then Edit5.Text:= 'Yes'
   else Edit5.Text:= 'No';

  If Score > 350
   then Edit6.Text:='Yes'
   Else Edit6.Text:='No';

  If Score > 100
   then
       If CompiledComboBox.Text = 'Internally'
       Then Edit7.Text:='Yes'
       Else Edit7.Text:='No'
   Else Edit7.Text:= 'No';

  If Edit3.Text = 'Yes'
  then Edit1.Text:= 'Yes'
       else if Edit4.Text = 'Yes'
       then Edit1.Text:= 'Yes'
              else if Edit5.Text = 'Yes'
              then Edit1.Text:= 'Yes'
                     else if Edit6.Text = 'Yes'
                     then Edit1.Text:= 'Yes'
                          else if Edit7.Text = 'Yes'
                          then Edit1.Text:= 'Yes'
                          Else Edit1.Text:= 'No';


  //Review Tab

  Edit9.Text:= ComboBox3.Text;

  If Score > 100
  Then
      If Score < 350 then
       If ComboBox3.Text = 'No'
        then if CompiledComboBox.Text = 'Independently'
         Then Edit10.Text := 'Yes'
         Else Edit10.Text:='No'
        Else Edit10.Text:='No'
      Else Edit10.Text:='No'
  Else Edit10.Text:='No';

  If Score < 100
  then If ComboBox3.Text = 'Yes'
        then Edit11.Text:='Yes'
        Else Edit11.Text:='No'
  Else Edit11.Text:='No';

    If Edit9.Text = 'Yes'
  then Edit8.Text:= 'Yes'
       else if Edit10.Text = 'Yes'
       then Edit8.Text:= 'Yes'
              else if Edit11.Text = 'Yes'
              then Edit8.Text:= 'Yes'
                          Else Edit8.Text:= 'No';

  // Results
  If Edit1.Text = 'Yes'
   Then ReqEdt.Text:='Audit'
   Else if Edit8.Text = 'Yes'
    Then ReqEdt.Text:='Independent Review'
     Else ReqEdt.Text:='No Intervention';

   Label16.Caption:= (ComNameEdt.Text) + ' Requires:';


end;


procedure TForm1.MainCloseBtnClick(Sender: TObject);
begin
  //Close the Application (all forms)
  Unit2.Form2.Close;
  Form1.Close;
end;


{$R *.lfm}

{ TForm1 }



end.

