%% read your C-R PNN
%% define your input. Note that x0=1£»
syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28
Xm=[1;x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15;x16;x17;x18;x19;x20;x21;x22;x23;x24;x25;x26;x27;x28];
% syms x1 x2
% Xm=[1;x1;x2];

W=net{1};
nl=net{2};% layer of C-R
%% 

  for l=1:nl-1
      if l==1
      Z=W{l}*Xm;
      A=Z.*Xm;
  
      else
      Z=W{l}*A;
      A=Z.*Xm;
  
      end
  end
  %
      RY=W{nl}*A;
%       digits(3);
      RY=vpa(expand(RY));
      
     [c t]=coeffs(RY(1,1),[x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28])
     [c t]=coeffs(RY(1,1)); % sym 1
          s=double(c);

     %values=zeros(size(t,2),size(Y_pre,2)); 
     %for i=1:size(t,2)
     %    parfor j=1:size(Y_pre,2)
     %       values(i,j)=s(i)*subs(t(i),[x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28],[m(j,1) m(j,2) m(j,4) m(j,5) m(j,6) m(j,7) m(j,8) m(j,9) m(j,10) m(j,11) m(j,12) m(j,13) m(j,14) m(j,15) m(j,16) m(j,17) m(j,18) m(j,19) m(j,20) m(j,21) m(j,22) m(j,23) m(j,24) m(j,25) m(j,26) m(j,27) m(j,28) m(j,29)]);
     %    end
     %end
     %h=zeros(size(values,1),1);
     %for i=1:size(values,1)
     %    h(i,1)=ttest(values(i,:));
     %end
            

%        for i=1:length(s)W
 %       if  abs(s(i))<0.1
  %          s(i)=0;
   %     end
   %     end
      figure
      plot(s)
      title('CR-PNN Serie');
      xlabel('position of item');
      ylabel('coefficient of item');
    

