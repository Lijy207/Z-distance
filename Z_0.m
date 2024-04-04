function [ Label ] = Z_0(X,Y,XX,classnum,k,miu)

%% by Jiaye Li  2024-04-04
%% Input
%X£ºTraining data
%Y:Class labels for training data
%XX£ºtesting data
%classnum: Number of classes
%k: K value
%miu: Parameter values
%% Output
% Label:Class labels for testing data


[n1,d1] = size(XX);
[n,d] = size(X);
classnumber = classnum;
trainingcenter = mean(X);

for j = 1 :classnumber
    mmax(j) = size(find(Y==j),1);
end
maxc = max(mmax);
md1 = zeros(classnumber,maxc);
md3 = zeros(classnumber,maxc);


for i = 1:classnumber
    idx = find(Y==i);
    sizeidx = size(idx,1);
    center(i,:) = mean(X(idx,:));
    md1(i,1:sizeidx) = pdist2(X(idx,:),center(i,:),'Euclidean');
    md2(i) = pdist2(trainingcenter,center(i,:),'Euclidean');
    
    idx = [];
end

for jj =1:n1
    md33(jj) = pdist2(trainingcenter,XX(jj,:),'Euclidean');
    for ii = 1:classnumber
        md3(ii,1:size(find(md1(ii,:)),2)) = md1(ii,1:size(find(md1(ii,:)),2)) + miu* md2(ii)*ones(1,size(find(md1(ii,:)),2)) + md33(jj)*ones(1,size(find(md1(ii,:)),2));
    end
    md4{jj} = md3;
end


for jj = 1:n1
    
    distance = md4{jj};
    distance(distance==0)=inf;
    A = distance(:);
    
    for iii = 1: k
        B=sort(A);
        smin_k(iii)=B(iii);
        [row,col] = find(distance == smin_k(iii));
        if length(row)>1
            row = row(1);
        end
        class(iii) = row;
    end
    table = tabulate(class);
    [F,I] = max(table(:,2));
    I = find(table(:,2)==F);
    if length(I)>1
        I = I(1);
    end
    result(jj) = table(I,1);
    
    
end
Label = result';


end

