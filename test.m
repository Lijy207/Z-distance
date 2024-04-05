%%We use the Ionosphere dataset to test our Reachable distance KNN algorithm
% Environment: matlab2016b
clear;
clc;
load('Ionosphere_uni.mat');
X=NormalizeFea(X,0);
classnum = 2;
Y(find(Y==-1)) = 2;
miu = 1;
kvalue = 10;
ind = crossvalind('Kfold',size(find(Y),1),10);
for k = 1:10
testindex = ind(:) == k;
trainindex = ~testindex;
[ label ] = Z(X(trainindex,:),Y(trainindex,:),X(testindex,:),classnum,kvalue,miu);
acc(k) = Accuracy(label,Y(testindex,:) );
end
Acc = mean(acc);
fprintf('The accuracy is %8.5f\n',acc)
fprintf('The Average accuracy is %8.5f\n',Acc)
    
