function out = outline( FF )

Etmp = sort([FF(:,1) FF(:,2);FF(:,2) FF(:,3);FF(:,3) FF(:,4);FF(:,4) FF(:,1)],2);
[~, ~, idx] = unique(Etmp, 'rows');

oriEtmp = [FF(:,1) FF(:,2);FF(:,2) FF(:,3);FF(:,3) FF(:,4);FF(:,4) FF(:,1)];
hh=sortrows([oriEtmp,idx],3);

x2=diff(sortrows(idx));
vector = all(x2==0, 2);

index1=find(vector);
index2=index1+1;
index=[index1;index2];

hh(index,:)=[];
out=hh(:, 1:2);

end

