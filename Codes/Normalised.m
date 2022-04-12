clc
clear
%%

n = 1:1:80;

%% Thrissur

opts = spreadsheetImportOptions("NumVariables", 1);
opts.Sheet = "Sheet1";
opts.DataRange = "B3:B82";

opts.VariableNames = "Thrissur";
opts.VariableTypes = "double";

Thrissur = readtable("Book.xlsx", opts, "UseExcel", false);

 
Thrissur = Thrissur.Thrissur;

%% Bengaluru
 
opts = spreadsheetImportOptions("NumVariables", 1);

 
opts.Sheet = "Sheet1";
opts.DataRange = "C3:C82";

opts.VariableNames = "BengaluruUrban";
opts.VariableTypes = "double";

Bengaluru = readtable("Book.xlsx", opts, "UseExcel", false);

 
BengaluruUrban = Bengaluru.BengaluruUrban;

%% Agra

 
opts = spreadsheetImportOptions("NumVariables", 1);

 
opts.Sheet = "Sheet1";
opts.DataRange = "D3:D82";

opts.VariableNames = "Agra";
opts.VariableTypes = "double";

Agra = readtable("Book.xlsx", opts, "UseExcel", false);

Agra = Agra.Agra;

%% Kolkata

opts.DataRange = "E3:E82";

opts.VariableNames = "Kolkata";
opts.VariableTypes = "double";

Kolkata = readtable("Book.xlsx", opts, "UseExcel", false);

 
Kolkata = Kolkata.Kolkata;

%% Delhi
opts.DataRange = "F3:F82";

opts.VariableNames = "Delhi";
opts.VariableTypes = "double";

Delhi = readtable("Book.xlsx", opts, "UseExcel", false);
 
Delhi = Delhi.Delhi;

%% Chennai
opts.DataRange = "G3:G82";

opts.VariableNames = "Chennai";
opts.VariableTypes = "double";

Chennai = readtable("Book.xlsx", opts, "UseExcel", false);
Chennai = Chennai.Chennai;

%% Mumbai
opts.DataRange = "H3:H82";
opts.VariableNames = "Mumbai";
opts.VariableTypes = "double";

Mumbai = readtable("Book.xlsx", opts, "UseExcel", false);
Mumbai = Mumbai.Mumbai;

%% Puri
opts.DataRange = "I3:I82";

opts.VariableNames = "Puri";
opts.VariableTypes = "double";

Puri = readtable("Book.xlsx", opts, "UseExcel", false);
Puri = Puri.Puri;

%% Krishna
opts.DataRange = "J3:J82";
opts.VariableNames = "Krishna";
opts.VariableTypes = "double";

Krishna = readtable("Book.xlsx", opts, "UseExcel", false);
Krishna = Krishna.Krishna;

%% Populations

T_Thrissur = 3121200;
T_Bengaluru = 9621551;
T_Agra = 4418797;
T_Kolkata = 4496694;
T_Delhi = 3656539+2731929+2543243+582320+142004;
T_Chennai = 4646732;
T_Mumbai = 9356962;
T_Puri = 1698730;
T_Krishna = 4517398;

%% Normalised Graph plotting

figure(2);
plot(n,Thrissur.*(100000/T_Thrissur));
hold on;
plot(n,BengaluruUrban.*(100000/T_Bengaluru),'-r');
plot(n,Agra.*(100000/T_Agra),'-y');
plot(n,Kolkata.*(100000/T_Kolkata),'-m');
plot(n,Delhi.*(100000/T_Delhi),'-k');
plot(n,Chennai.*(100000/T_Chennai),"Color",[0 0.3 0.2]);
plot(n,Mumbai.*(100000/T_Mumbai),"Color",[0 0.3 0]);
plot(n,Puri.*(100000/T_Puri),'-b');
plot(n,Krishna.*(100000/T_Krishna),'-c');
xlabel("Days");
ylabel("Normalised number of cases")
title(["Normalised number of daily confirmed cases from April 1^{st} - June 19^{th}" "Over 9 districts"]);
legend("Thrissur","Bengaluru Urban","Agra","Kolkata","Delhi","Chennai","Mumbai","Puri","Krishna");
grid on;
