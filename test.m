%%We use the Ionosphere dataset to test our Reachable distance KNN algorithm
% Environment: matlab2016b
clear;
clc;
load('Ionosphere_uni.mat')
classnum = 2;
miu = 1;
kvalue = 5;
ind = crossvalind('Kfold',size(find(Y),1),10);
algorithm = {'Ncp','Z_0','Z'};
for i1 = 1:length(algorithm)
    para.algorithm = char(algorithm(i1));
    for k = 1:10
        testindex = ind(:) == k;
        trainindex = ~testindex;
        
        switch para.algorithm
            case 'Z'
                [ label ] = Z(X(trainindex,:),Y(trainindex,:),X(testindex,:),classnum,kvalue,miu);
            case 'Z_0'
                [ label ] = Z_0( X(trainindex,:),Y(trainindex,:),X(testindex,:),classnum,kvalue,miu);   
            case 'Ncp'
                [ label ] = Ncp( X(trainindex,:),Y(trainindex,:),X(testindex,:),classnum );     
        end
        acc(k) = Accuracy(label,Y(testindex,:) );
    end
    
    Acc = mean(acc);
    fprintf(char(algorithm(i1)))
    fprintf('The accuracy is %8.5f\n',acc)
    fprintf('The Average accuracy is %8.5f\n',Acc)
    
end