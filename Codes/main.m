clc
clear
close all

%% GFT and Filtering

T = readtable("lat_long.xlsx"); %reading the data
Q = T(1:100, 4:5);
Q = table2array(Q);
adjmat = zeros(100, 100);

% Calculating distance using Haversine formula (given lattitude and
% longitude data).

for a=1:100
    for b=1:100
        adjmat(a,b)= 1.609344*3963.0*acos((sin(Q(a,1)*pi/180)*sin(Q(b,1)*pi/180))+cos(Q(a,1)*pi/180)*cos(Q(b,1)*pi/180)*cos(Q(b,2)*pi/180 - Q(b,2)*pi/180));
    end
end

figure(1);
image(abs(adjmat));
title(["Adjacency Matrix of The Weighted Graph" "Nodes \rightarrow Districts, Edges \rightarrow Paths, Weights \rightarrow Distance"]);

%% Laplacian Matrix

% Laplacian matrix = diag(degree matrix) - (adjacency matrix)
D = sum(abs(adjmat));
L = -adjmat;
for a=1:100
    L(a,a)=L(a,a)+D(a);
end

% Finding eigenvalues and eigenvectors of Laplacian matrix
[evec, eval] = eig(L);

eval_sort = zeros(1,length(eval));
for a=1:length(eval)
    eval_sort(a)=abs(eval(a,a));
end

[eval_sort,ind] = sort(eval_sort);

% Isolating the lowest/highest 1/5th eigenvalues and their corresponding
% eigenvectors to design LPF/HPF respectively.
evecLOW = zeros(100,20);
evecHIGH = zeros(100,20);

evalLOW = eval_sort(1:20);
evalHIGH = eval_sort(81:100);

for a=1:20
    evecLOW(1:100,a) = evec(1:100,ind(a));
    evecHIGH(1:100,a) = evec(1:100,ind(80+a));
end

h1 = zeros(100,100);

for a = 1:19
    h1(a,a) = 1;
end

H_L = evec.*h1.*transpose(evec);

for a = 1:20
    h1(a,a) = 0;
    h1(a+80,a+80) = 1;
end

H_H = evec.*h1.*transpose(evec);

% X is a signal which is daily covid cases of all the districts. Now we
% filter X to obtain HP and LP regions using HPF and LPF respectively.
X_sig = readtable("SignalX.xlsx");

X_sig = table2array(X_sig);

X = transpose(X_sig);

X = X(2:101,1:80);

XL = H_L*X;
XH = H_H*X;

% Finding average of each signal in it's high-pass and low-pass domain over
% the 80 days.
avgXL = sum(XL,2)./80;
avgXH = sum(XH,2)./80;


%% Mapping Part

% 
% 
% 1. figure 2 - cummulative cases
% 2. figure 3 - LP regions
% 3. figure 4 - HP regions
% 
% 
% 

districts = readtable("lat_long.xlsx");

figure(2);
gb = geobubble(districts,'Latitude','Longitude','SizeVariable','Cumulative');
title("Comparision of severity of Corona Cases across 100 districts in India");

head(gb.SourceTable, 100);

maxc = 769499;
rangec = [0 1 2 3 4 5 6 7 8 9].*(maxc/9);

gb.SourceTable.Severity = discretize(districts.Cumulative,rangec,'categorical', {'1', '2', '3','4','5','6','7','8','9'});
gb.ColorVariable = 'Severity';


%% figure 3,4 - LP&HP Regions


figure(3);
gbl = geobubble(districts,'Latitude','Longitude','SizeVariable','LPregions');

head(gbl.SourceTable, 100);

maxl = ceil(max(abs(avgXL)));
rangel = [0 0.001 0.01 0.1 0.4 0.5 0.6 7 8 9].*(maxl/9);

gbl.SourceTable.Severity = discretize(districts.LPregions,rangel,'categorical', {'1', '2', '3','4','5','6','7','8','9'});
gbl.ColorVariable = 'Severity';

figure(4);
gbh = geobubble(districts,'Latitude','Longitude','SizeVariable','HPregions');

head(gbh.SourceTable, 100);

maxh = ceil(max(abs(avgXH)));
rangeh = [0 0.0000001 0.0000025 0.0000037 0.000004 0.000005 0.6 7 8 9].*(maxh/9);

gbh.SourceTable.Severity = discretize(districts.HPregions,rangeh,'categorical', {'1', '2', '3','4','5','6','7','8','9'});
gbh.ColorVariable = 'Severity';

















