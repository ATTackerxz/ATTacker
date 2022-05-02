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
%        for i=1:length(s)
 %       if  abs(s(i))<0.1
  %          s(i)=0;
   %     end
   %     end
      figure
      plot(s)
      title('CR-PNN Serie');
      xlabel('position of item');
      ylabel('coefficient of item');
    

