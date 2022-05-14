
function auc=auc(predict,ground_truth)
x =0.0;
y =0.0;
pos_num=sum(ground_truth==1);
neg_num=sum(ground_truth==0);
x_step =1.0/neg_num;
y_step =1.0/pos_num;
[predict,index]=sort(predict,'descend');
ground_truth =ground_truth(index);
for i=1:length(ground_truth)
if ground_truth(i)==1
        y = y + y_step;
else
        x = x + x_step;
    end
X(i)=x;
Y(i)=y;
end
axis([0 1 0 1]);
plot(X,Y);
xlabel('False Positive Rate');
ylabel('True Positive rate');
title('ROC');
auc =trapz(X,Y);
hold on
plot([0 1],[0 1], '--k');
set(gca,'xtick',0:0.1:1.1);
set(gca,'ytick',0:0.1:1.1);

end
