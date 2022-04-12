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

%% Cumulative graph plotting

figure(1);
plot(n,Thrissur);
hold on;
plot(n,BengaluruUrban,'-r');
plot(n,Agra,'-y');
plot(n,Kolkata,'-m');
plot(n,Delhi,'-k');
plot(n,Chennai,"Color",[0 0.3 0.2]);
plot(n,Mumbai,"Color",[0 0.3 0]);
plot(n,Puri,'-b');
plot(n,Krishna,'-c');
legend("Thrissur","Bengaluru Urban","Agra","Kolkata","Delhi","Chennai","Mumbai","Puri","Krishna");
xlabel("days");
ylabel("Number of cases")
title(["Number of daily confirmed cases from April 1^{st} - June 19^{th}" "Over 9 districts"]);
grid on;





