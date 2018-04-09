unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.CheckLst, System.Actions, Vcl.ActnList, Vcl.StdActns;

type
  TMainForm = class(TForm)
    Generate: TButton;
    Clean: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    FirstdotX_4: TLabeledEdit;
    A_4: TLabeledEdit;
    B_4: TLabeledEdit;
    D_1: TLabeledEdit;
    FirstdotY_4: TLabeledEdit;
    SavetoFile: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo: TMemo;
    SaveDialog1: TSaveDialog;
    Panel4: TPanel;
    Sedit: TLabeledEdit;
    Fedit: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    T2X: TLabeledEdit;
    T2Y: TLabeledEdit;
    T3X: TLabeledEdit;
    T3Y: TLabeledEdit;
    SaveZEdit: TLabeledEdit;
    CheckBox1: TCheckBox;
    procedure FirstdotX_4KeyPress(Sender: TObject; var Key: Char);
    procedure SavetoFileClick(Sender: TObject);
    procedure CleanClick(Sender: TObject);
    procedure GenerateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  EDITS, FirstX, FirstY, Primitive, SaveZ, poda4a, FirstdotCircle,
    SeconddotCircle, X0, X1, X2, X3, Y0, Y1, Y2, Y3, G0203,
    primitivename: string;
  today: TDateTime;

implementation

{$R *.dfm}

function GetSystemUserName: string;
var // ѕолучить им€ пользовател€ машины
  UserName: array [0 .. 255] of Char;
  UserNameSize: DWORD;
begin
  UserNameSize := 255;
  if GetUserName(@UserName, UserNameSize) then
    Result := string(UserName)
  else
    Result := '';
end;

procedure TMainForm.CleanClick(Sender: TObject);
begin
  Memo.lines.clear;
end;

procedure TMainForm.FirstdotX_4KeyPress(Sender: TObject; var Key: Char);
var
  k: integer;
begin
  begin
    if ((Sender as TLabeledEdit).Text) = '0'
    // ≈сли введен ноль, то после него должна
    then // сто€ть зап€та€
      if not(Key in [',', #8]) then
        Key := #0;
    if not(Key in ['0' .. '9', ',', #8]) then
      Key := #0; // Ќичего не вводить, если клавиша не из указанного диапазона
    if (Key = '-') and (Length((Sender as TLabeledEdit).Text) > 0) then
      Key := #0;
    begin
      if Key = ',' then // ѕроверка только дл€ одной зап€той
      begin
        if (Sender as TLabeledEdit).Text = '' then
          Key := #0;
        for k := 1 to Length((Sender as TLabeledEdit).Text) do
        begin
          if (Sender as TLabeledEdit).Text[k] = ',' then
            Key := #0;

        end;
      end;
    end;
  end;
end;

procedure TMainForm.GenerateClick(Sender: TObject);
begin
  EDITS := Sedit.Text; // задание частоты вращени€ шпиндел€
  poda4a := Fedit.Text; // задание подачи
  FirstX := FirstdotX_4.Text; // задание начальных точек
  FirstY := FirstdotY_4.Text;
  SaveZ := SaveZEdit.Text; // задание безопасной высоты
  today := Time;

  if RadioGroup1.ItemIndex = 0 then // примитив "пр€моугольник"
  begin
    primitivename := RadioGroup1.Items[0];
    X0 := floatTOSTR(STRTOFloat(FirstdotX_4.Text) + STRTOFloat(A_4.Text));
    Y0 := FirstdotY_4.Text;
    Y1 := floatTOSTR(STRTOFloat(FirstdotY_4.Text) + STRTOFloat(B_4.Text));

    Primitive := 'G01 Z-' + SaveZ + ' F' + poda4a + #13 + 'X' + X0 + ' Y' + Y0 +
      #13 + 'Y' + Y1 + #13 + 'X' + FirstdotX_4.Text + #13 + 'X' +
      FirstX + ' Y' + FirstY;
  end;

  if RadioGroup1.ItemIndex = 1 then // примитив "треугольник"
  begin
    primitivename := RadioGroup1.Items[1];
    X0 := T2X.Text;
    Y0 := T2Y.Text;
    X1 := T3X.Text;
    Y1 := T3Y.Text;

    Primitive := 'G01 Z-' + SaveZ + ' F' + poda4a + #13 + 'X' + X0 + ' Y' + Y0 +
      #13 + 'Y' + X1 + ' Y' + Y1 + #13 + 'X' + FirstX + ' Y' +
      FirstY;
  end;

  if RadioGroup1.ItemIndex = 2 then // примитив "круг"
  begin
    primitivename := RadioGroup1.Items[2];
    if CheckBox1.Checked then
      G0203 := 'G02'
    else
      G0203 := 'G03';
    FirstdotCircle := floatTOSTR(STRTOFloat(FirstX) -
      ((STRTOFloat(D_1.Text)) / 2));
    SeconddotCircle := floatTOSTR(STRTOFloat(FirstX) +
      ((STRTOFloat(D_1.Text)) / 2));

    Primitive := G0203 + ' X' + SeconddotCircle + ' Y' + FirstY + ' R'
      + floatTOSTR((STRTOFloat(D_1.Text)) / 2) + ' F' + poda4a + #13 + 'X' +
      FirstdotCircle + ' Y' + FirstY + ' R' +
      floatTOSTR((STRTOFloat(D_1.Text)) / 2);
  end;

  Memo.lines.Text := '%' + #13 + '( Auto generate program)' + #13 +
    '( PART NAME     : ' + primitivename + ')' + #13 + '( PROGRAM DATE  : ' +
    TimeToStr(today) + ' - ' + DateToStr(today) + ')' + #13 +
    '( PROGRAMMED BY : ' + GetSystemUserName() + ')' + #13 + 'G90 G40 G17' + #13
    + 'S' + EDITS + ' M3' + #13 + 'G00 X' + FirstX + ' Y' + FirstY + #13 +
    'G00 X' + FirstdotCircle + ' Y' + FirstY + #13 + 'Z' + SaveZ + #13 +
    Primitive + #13 + 'G00 Z' + SaveZ + #13 + 'M5' + #13 + 'M30' + #13 + '%';
  Memo.lines.Text := StringReplace(Memo.lines.Text, ',', '.', [rfReplaceAll]);
  // замена зап€тых на точки
end;

procedure TMainForm.SavetoFileClick(Sender: TObject);
begin
  If SaveDialog1.Execute Then
  Begin
    Memo.lines.SavetoFile(SaveDialog1.FileName);
  End;
end;

end.
