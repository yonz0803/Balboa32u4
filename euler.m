global g Mb Mw Rw L  Jb Jm Jw Kt Kb Rm Gr


dt= 0.001;
tf=5;
xx1 =[];

i=0;


for t= 0:dt:tf;

  x1 = x(1);
  x2 = x(2);
  x3 = x(3);
  x4 = x(4);



i=i+1;

 en11=Mb*Rw^2+Mw*Rw^2+Jw+Gr^2*Jm;
 en12=Mb*Rw*L*cos(x2)-Gr^2*Jm;
 en21=Mb*Rw*L*cos(x2)-Gr^2*Jm;
 en22=Mb*L^2+Jb+Gr^2*Jm;

%  en11=Mb*Rw^2+Mw*Rw^2+Jw+Jm;
%  en12=Mb*Rw*L*cos(x2)-Jm;
%  en21=Mb*Rw*L*cos(x2)-Jm;
%  en22=Mb*L^2+Jb+Jm;
%  
 En=[en11 en12;
     en21 en22];
 
 
 fn11= Gr^2*(Kt*Kb)/Rm;
 fn12= -Gr^2*(Kt*Kb)/Rm + Mb*Rw*L*x4*sin(x2);
 fn21= -Gr^2*(Kt*Kb)/Rm;
 fn22= Gr^2*(Kt*Kb)/Rm;
 
%  fn11= (Kt*Kb)/Rm;
%  fn12= (Kt*Kb)/Rm + Mb*Rw*L*x4*sin(x2);
%  fn21= (Kt*Kb)/Rm;
%  fn22= (Kt*Kb)/Rm;
 

 
 
 Fn=[ fn11 fn12;
     fn21 fn22];
 

Gn=[ 0 0;
    0 -Mb*g*L*sin(x2)/x2 ];
 
Hn=[ Gr*Kt/Rm;
  -Gr*Kt/Rm ];
 
X1=[x1;
    x2];

X2=[x3;
    x4];
 
An= [x3;
     x4;
     -inv(En)*Gn*X1-inv(En)*Fn*X2];

Bn=[0;
    0;
     inv(En)*Hn];
 
    xx1(:,i)=x;
    u=k*x;
     %u=0;

dx= An+Bn*u;
 x = x + dx*dt;
    

 
end

t=[0:dt:tf];