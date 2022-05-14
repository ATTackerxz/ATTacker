%% %%%%  example %%%%%%%%%
 clear
 clc
%% t
t=[1:100000]./1200;
m=csvread('D:\college\spring\PRP\nsch_2020_topical_SAS\database_depression.csv',1,0);
i=1;
while i<size(m,1)
%for i=1:17539
    for j=1:29
        if m(i,j)==0
            %m(i,j)=mode(m(:,j));
            m(i,:)=[];
            i=i-1;
            break;
        end
    end
            i=i+1;
end
writematrix(m,'anxiety_extracted.csv')
m=m';
m=mapminmax(m,-1,1);
m=m';

%% input £¨18£©
I(:,1)=m(:,1);
I(:,2)=m(:,2);
I(:,3)=m(:,4);
I(:,4)=m(:,5);
I(:,5)=m(:,6);
I(:,6)=m(:,7);
I(:,7)=m(:,8);
I(:,8)=m(:,9);
I(:,9)=m(:,10);
I(:,10)=m(:,11);
I(:,11)=m(:,12);
I(:,12)=m(:,13);
I(:,13)=m(:,14);
I(:,14)=m(:,15);
I(:,15)=m(:,16);
I(:,16)=m(:,17);
I(:,17)=m(:,18);
I(:,18)=m(:,19);
I(:,19)=m(:,20);
I(:,20)=m(:,21);
I(:,21)=m(:,22);
I(:,22)=m(:,23);
I(:,23)=m(:,24);
I(:,24)=m(:,25);
I(:,25)=m(:,26);
I(:,26)=m(:,27);
I(:,27)=m(:,28);
I(:,28)=m(:,29);


%% output 
S(:,1)=m(:,3);


X=I';
Y=S';
% 
% for i=1:size(X,1)
% X(i,:)=mapminmax(X(i,:),-1,1);
% end
% for i=1:size(Y,1)
% Y(i,:)=mapminmax(Y(i,:),-1,1);
% end


%%  train
x=2;
c=100000;
nl=3;% number of layers
%seed=2;
%net=TLCnet(X,Y,nl,seed,c);%training net
net=TLCnet(X(:,2001:12111),Y(:,2001:12111),nl,x,c);
plot(net{3});

%%  test
Y_pre=test_TLCnet(net,X(:,1:2000));%test net
%Y_pre=test_TLCnet(net,X);
Y_copy=Y_pre;
Y_blank=Y_copy;
negative_max=0;
target=0;
%k=0;
negative=0;
sum_max=0;
sum=0;
ground_truth=[];
negative_copy=0;
positive_copy=0;
positive=0;
index=[];
for i=2001:12111
    if Y(i)==1 index
threshold=0.5*(mean(Y_copy==1)-mean(Y_copy==-1))+mean(Y_copy==-1)
%for j=-0.5:0.01:1
 %   k=k+1;
    for i=1:size(Y_pre,2)
        if Y_copy(i)>=threshold
            Y_blank(i)=1;
        else 
            Y_blank(i)=-1;
        end
        if Y(i)==-1&&Y_blank(i)==Y(i)
            negative_copy=negative_copy+1;
        end
       if Y(i)==1&&Y_blank(i)==-1
            positive_copy=positive_copy+1;
        end
        if Y_blank(i)==Y(i)
            sum=sum+1;
            ground_truth(i)=1;
        else
            ground_truth(i)=0;
        end
    end
%    if sum(k)>sum_max
%            sum_max=sum(k);
%            target=k;
%    end
%end
for i=1:1
    figure
   plot(Y(i,:));
    plot(m(1001:2000,3))
    hold on;
 plot(Y_copy(1001:2000));
end
for i=1:size(Y_pre,2)
    if Y(i)==-1
        negative=negative+1;
    end
    if Y(i)==1
        positive=positive+1;
    end
end
positive
negative
%target
accr=sum/size(Y_pre,2)
TPR=negative_copy/negative
FPR=positive_copy/positive

for i=1:1
    figure
    %plot(Y(i,:));
    plot(Y(i,1:200))
    hold on;
    plot(Y_pre(i,1:200));
end
result=auc(Y_copy,ground_truth)
hold on
m=csvread('D:\college\spring\PRP\nsch_2020_topical_SAS\database_depression.csv',1,0);
i=1;
while i<size(m,1)
%for i=1:17539
    for j=1:29
        if m(i,j)==0
            %m(i,j)=mode(m(:,j));
            m(i,:)=[];
            i=i-1;
            break;
        end
    end
            i=i+1;
end
X=[ones(size(m,1),1) m(:,1:2) m(:,4:29)];

Y=m(:,3);
B=regress(Y(2001:12111,1),X(2001:12111,:));
threshold=0.5*(mean(Y_copy==1)-mean(Y_copy==-1))+mean(Y_copy==-1)
Y_copy=X(1:2000,:)*B;


ground_truth=[];
    for i=1:size(Y_copy,1)
        if Y_copy(i)>=threshold
            Y_blank(i)=2;
        else 
            Y_blank(i)=1;
        end
          if Y_blank(i)==Y(i)
       %     sum(k)=sum(k)+1;
            ground_truth(i)=1;
        else
            ground_truth(i)=0;
        end
    end
    result=auc(Y_copy,ground_truth)
%Read_PNN

 



