function [ Label ] = Ncp( X,Y,XX,classnum)
%% by Jiaye Li  2024-04-04
%% Input
%X£ºTraining data
%Y:Class labels for training data
%XX£ºtesting data
%classnum: Number of classes

%% Output
% Label:Class labels for testing data

[n1,d1] = size(XX);
[n,d] = size(X);
classnumber = classnum;
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
%     md1(i,1:sizeidx) = pdist2(X(idx,:),center(i,:),'Euclidean');
    md2(i,:) = pdist2(XX,center(i,:),'Euclidean');
    idx = [];
end
m= min(md2);
for jj = 1:n1
    mm = find(md2(:,jj)==m(jj));
    result(jj) = mm;
end
Label = result';




end

