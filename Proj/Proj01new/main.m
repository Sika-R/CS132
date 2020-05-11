close all hidden
clear all

eleUI = ElevatorUI;
reqDB1 = RequestDB;
reqDB2 = RequestDB;
eleUI.RequestDB1 = reqDB1;
eleUI.RequestDB2 = reqDB2;
a = timer('StartDelay', 0, 'Period', 1, 'TasksToExecute', inf, 'ExecutionMode', 'fixedDelay', 'TimerFcn', 'eleUI.MoveEle1');
b = timer('StartDelay', 0, 'Period', 1, 'TasksToExecute', inf, 'ExecutionMode', 'fixedDelay', 'TimerFcn', 'eleUI.MoveEle2');

eleUI.timeEle1 = a;
eleUI.timeEle2 = b;
start(a);
start(b);