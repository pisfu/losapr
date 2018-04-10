unit uForm1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    btnForLoopRegular: TButton;
    ToolBar1: TToolBar;
    Label1: TLabel;
    btnForLoopParallel: TButton;
    btnNonResponsive: TButton;
    btnResponsive1: TButton;
    btnFuture1: TButton;
    btnResponsive2: TButton;
    btnFuture2: TButton;
    procedure btnForLoopRegularClick(Sender: TObject);
    procedure btnForLoopParallelClick(Sender: TObject);
    procedure btnNonResponsiveClick(Sender: TObject);
    procedure btnResponsive1Click(Sender: TObject);
    procedure btnResponsive2Click(Sender: TObject);
    procedure btnFuture2Click(Sender: TObject);
    procedure btnFuture1Click(Sender: TObject);
  private
    procedure DoTimeConsumingOperation(milis: integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.Threading, // Parallel Programming Library
  System.Diagnostics; // TStopwatch

procedure TForm1.DoTimeConsumingOperation(milis: integer);
begin
  Sleep(milis);//задержка времени
end;

procedure TForm1.btnForLoopRegularClick(Sender: TObject);
var sw: TStopwatch; i: Integer;
begin
  sw := TStopwatch.StartNew; //запуск секундомера для подсчета затраченного времени
  for i := 0 to 99 do //цикл с задержкой на каждой итерации на  ms
    DoTimeConsumingOperation(10);
  sw.Stop; //остановка секундомера
  (Sender as TButton).Text := sw.ElapsedMilliseconds.ToString + 'ms'; //отображение затраченного времени
end;

procedure TForm1.btnForLoopParallelClick(Sender: TObject);
var sw: TStopwatch; i: Integer;
begin
  sw := TStopwatch.StartNew; //запуск секундомера
  TParallel.For(0, 99, procedure(i: integer) //цикл с параллельным выполнением процедур
  begin
    DoTimeConsumingOperation(10);
  end);
  sw.Stop; //остановка секундомера
  (Sender as TButton).Text := sw.ElapsedMilliseconds.ToString + 'ms'; //отображение затраченного времени
end;

procedure TForm1.btnNonResponsiveClick(Sender: TObject); //новое задание, при котором форма недоступна
begin
  DoTimeConsumingOperation(3000);
  (Sender as TButton).Text := 'Done'; 
end;

procedure TForm1.btnResponsive1Click(Sender: TObject);//разделение потоков
var aTask: ITask;
begin
  aTask := TTask.Create(procedure //новое задание в фоновом режиме, при котором форма остается доступной
  begin
    DoTimeConsumingOperation(3000);
  end);
  aTask.Start;
  (Sender as TButton).Text := 'Done';
end;

procedure TForm1.btnResponsive2Click(Sender: TObject);
var aTask: ITask;
begin
  aTask := TTask.Create(procedure
  begin
    DoTimeConsumingOperation(3000);
    TThread.Synchronize(nil, //изменения текста на кнопке через основной поток приложения
      procedure
      begin
       (Sender as TButton).Text := 'Done';
      end);
  end);
  aTask.Start;
  end;

function GetPlannedExpenses: currency;//получение значения плановых расходов
begin
  Sleep(1000);
  Result := 100;
end;

function GetActualExpenses: currency;//получение значения фактических расходов
begin
  Sleep(2000);
  Result := 110;
end;

procedure TForm1.btnFuture1Click(Sender: TObject); // последовательное получение значений расходов и вычиселние коэффициента
var
  planned, actual: currency;
  ratio: double;
  sw: TStopwatch;
begin
  sw := TStopwatch.StartNew;//запуск секундомера

  planned := GetPlannedExpenses;//получение значения плановых расходов
  actual := GetActualExpenses;//получение значения фактических расходов
  ratio := actual / planned;//вычисление коэффициента

  sw.Stop;
  (Sender as TButton).Text := ratio.ToString
    + ' (' +  sw.ElapsedMilliseconds.ToString + 'ms)';
end;

procedure TForm1.btnFuture2Click(Sender: TObject);//параллельное получение значений расходов и вычиселние коэффициента
var
   //IFuture - класс, возвращающий значение определенного типа. Когда вы пытаетесь 
  //получить зачение этой переменной, то Future выполняет это в фоновом режиме и возвращает значение.
  //Вы можете рассчитать что-то на основе значений двух или более параметров
	// которые необходимо вычислить в первую очередь.
  planned: IFuture<currency>; // плановые расходы
  actual: IFuture<currency>; // фактические расходы
  ratio: double; // соотношение расходов
  sw: TStopwatch; // секундомер
begin
  sw := TStopwatch.StartNew;//запуск секундомера

  planned := TTask.Future<currency>(function: currency//получение значения плановых расходов в фоновом режиме
  begin
    Result := GetPlannedExpenses;
  end);

  actual := TTask.Future<currency>(function: currency//получение значения фактических расходов в фоновом режиме
  begin
    Result := GetActualExpenses;
  end);

  ratio := actual.Value / planned.Value;//вычисление соотношения расходов

  sw.Stop;
  (Sender as TButton).Text := ratio.ToString
    + ' (' +  sw.ElapsedMilliseconds.ToString + 'ms)';
end;


end.
