unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    Memo2: TMemo;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

//Функция парсинга
function parse(StartString, FinishString, FullString: string): string;
var
  n1,n2: integer;
begin
  n1:=pos(StartString, FullString)+length(StartString)-1;                       //Опеределили начальный токен
  Delete(FullString,1,n1);                                                      //Обрезаем строку от начала и до начального токена
  n2:=pos(FinishString, FullString);                                            //Опеределили конечный токен
  Delete(FullString,n2,length(FullString));                                     //Обрезаем строку от конечного токена и до конца строки
  Result:=FullString;                                                           //Конечный результат функции
end;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Caption:=parse(edit1.Text, edit3.Text, edit2.Text);
  //edit1.Text - начальный токен
  //edit3.Text - конечный токен
  //edit2.Text - отсюда берем строку которую будем парсить
end;


procedure TForm1.Button2Click(Sender: TObject);
var
  str: TStringList;                                                             //Массив строк
  s: string;                                                                    //Переменнная, в которой хранится строка для парсинга
  i: Integer;                                                                   //Переменная-счетчик
begin
  s:=edit2.Text;

  try
    str := TStringList.create;                                                  //Создаем массив строк
    str.text := stringReplace(s, '-', ' ', [rfReplaceAll]);                     //Заменяем все символы "-" на пробелы
    str.text := stringReplace(str.text, ';', ' ', [rfReplaceAll]);              //Заменяем все символы ";" на пробелы
    str.text := stringReplace(str.text, ',', ' ', [rfReplaceAll]);              //Заменяем все символы "," на пробелы
    str.text := stringReplace(str.text, '.', ' ', [rfReplaceAll]);              //Заменяем все символы "." на пробелы
    str.text := stringReplace(str.text, '(', ' ', [rfReplaceAll]);              //Заменяем все символы "(" на пробелы
    str.text := stringReplace(str.text, ')', ' ', [rfReplaceAll]);              //Заменяем все символы ")" на пробелы
    str.text := stringReplace(str.text, '!', ' ', [rfReplaceAll]);              //Заменяем все символы "!" на пробелы
    str.text := stringReplace(str.text, '?', ' ', [rfReplaceAll]);              //Заменяем все символы "?" на пробелы
    str.text := stringReplace(str.text, '"', ' ', [rfReplaceAll]);              //Заменяем все символы """ на пробелы
    str.text := stringReplace(str.text, '№', ' ', [rfReplaceAll]);              //Заменяем все символы "№" на пробелы
    str.text := stringReplace(str.text, '   ', ' ', [rfReplaceAll]);            //Заменяем все символы "   " на пробелы
    str.text := stringReplace(str.text, '  ', ' ', [rfReplaceAll]);             //Заменяем все символы "  " на пробелы
    str.text := stringReplace(str.text, '#9', ' ', [rfReplaceAll]);             //Заменяем все символы "табуляции" на пробелы

    str.text := stringReplace(str.text, ' ', #13#10, [rfReplaceAll]);           //После замены всех знаков препинания/символов/таблуляции на пробелы парсим строку, переносим каждое слово на новую строку и заносим в массив

  for i := 0 to str.Count-1 do
    Memo2.Lines.Add(str[i]);                                                    //Выводим распасреную строку в Memo2
  finally
    str.free;
  end;

end;

end.
