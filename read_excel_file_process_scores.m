%
% file i/o
%
close all;
clear all;
%
% Part B) Process Imported Data - final_scores_example.xlsm
%
% - right click on final_scores_example.xlsm and select Import Data
% - with your mouse select all rows and columns of data
% - then go to Output Type and select Numeric Matrix
% - lastly, click on Import Selection button
% - then in Workspace click on finalscoresexample matrix to display the data
%
% open in Workspace the matrix finalscoresexample and by hand
% change NaN with the number 0
%
% read file newdatafile.mat
% get size of matrix
%
load newdatafile
sizefse = size(finalscoresexample)
% 
% extract numbers in column 9
% display scores
%
col9 = finalscoresexample(:,9)
[r c] = size(col9)
figure(1);
%stem(col9,'rs-','MarkerFaceColor','b','MarkerSize',8,'MarkerEdgeColor','g');
plot(col9,'rs-','MarkerFaceColor','b','MarkerSize',8,'MarkerEdgeColor','g');
title('Student Scores');
xlabel('Number of Students');
ylabel('Scores');
axis([0 length(col9) -5 max(col9)*1.2]);
grid minor
%
% find mean
%
meanscores = mean(col9);
var_scores = var(col9);
std_scores = sqrt(var_scores);
meanL = ones(length(col9))*meanscores;
%
%
% do a histogram of scores using 30 bins
%
figure(2);
hist(col9,50)
grid minor;
%
% sort scores in ascending order
%
[scoresa, indexsa] = sort(col9)
%
% one way to sort scores in descending order
% [scoresd, indexsd] = sort(col9,'descend')
% flip the order of ascend sort
scoresd = scoresa(end:-1:1)
indexsd = indexsa(end:-1:1)
%
% display scores and location (index)
%
figure(3);
stem(scoresa,'k-o','MarkerFaceColor','r','MarkerSize',8,'MarkerEdgeColor','g');
title('Student Scores - Ascending order');
xlabel('Number of Students');
ylabel('Scores');
grid minor;
%
figure(4);
hold on;
stem(indexsa,scoresa,'b-o','MarkerFaceColor','b','MarkerSize',8,'MarkerEdgeColor','g');
title('Student Scores - Student Number');
xlabel('Student Number');
ylabel('Scores');
plot(meanL,'r:o');
axis([0 131 0 110])
grid minor;
%
spread_mean = col9 - meanscores;
%
figure(5);
hold on;
stem(spread_mean,'b-o','MarkerFaceColor','b','MarkerSize',8,'MarkerEdgeColor','g');
title('Student Scores - Student Number');
xlabel('Student Number');
ylabel('Scores from the Mean');
%plot(meanL,'r:o');
grid minor;
%
% find minimum and maximum scores and their index (location)
%
[maxs, maxi] = max(col9)
[mins, mini] = min(col9)
%
% find index (location) of students in ranges and the number
% of students in each range
% scores >= 90 - A
% scores >= 80 and less than 90 - B
% scores >= 70 and less than 80 - C
% scores >= 60 and less than 70 - D or less
%
% for 1D vectors gives location
%
% finds students with score > 90 - logical array
% 1 or T are > 90; 0 or F are < 90
% grabs True values
%
% finds students with their socred and grade
%
s90 = find(col9>=90);
ss90 = (col9 >= 90);
AS = length(s90)
S90 = ss90 .* col9;
%
s80_90 = find(col9>=80 & col9<90);
ss80_90 = (col9>=80 & col9<90);
BS = length(s80_90)
S80_90 = ss80_90 .* col9;
%
s70_80 = find(col9>=70 & col9<80);
ss70_80 = (col9>=70 & col9<80);
CS = length(s70_80)
S70_80 = ss70_80 .* col9;
%
s60_70 = find(col9>=60 & col9<70);
ss60 = (col9>=60 & col9<70);
DS = length(s60_70)
S60 = ss60 .* col9;
%
% for 2D matrices
%
%[i90,j90] = find(col9>90);
%[i80,j80] = find(col9>80 & col9<90);
%[i70,j70] = find(col9>70 & col9<80);
%[i60,j60] = find(col9>60 & col9<70);
%
figure(6)
data = [AS BS CS DS];
explode = [1 0 0 0 ];
pie(data, explode);
title('Final Grades');
legend('As','Bs','Cs','Ds','Location','Best');
%
disp('>>> END of arrays_final_scores_9b.m <<<')
