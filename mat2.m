global k

e11=Mb*Rw^2+Mw*Rw^2+Jw+Gr^2*Jm;
e12=Mb*Rw*L-Gr^2*Jm;
e21=Mb*Rw*L-Gr^2*Jm;
e22=Mb*L^2+Jb+Gr^2*Jm;

% e11=Mb*Rw^2+Mw*Rw^2+Jw+Jm;
% e12=Mb*Rw*L-Jm;
% e21=Mb*Rw*L-Jm;
% e22=Mb*L^2+Jb+Jm;
% 

 E=[e11 e12;
     e21 e22];

 f11= Gr^2*(Kt*Kb)/Rm;
 f12= -Gr^2*(Kt*Kb)/Rm;
 f21= -Gr^2*(Kt*Kb)/Rm;
 f22= Gr^2*(Kt*Kb)/Rm;
 
%  f11= (Kt*Kb)/Rm;
%  f12= -(Kt*Kb)/Rm;
%  f21= -(Kt*Kb)/Rm;
%  f22= (Kt*Kb)/Rm;


F=[ f11 f12;
     f21 f22];

G=[ 0 0
    0 -Mb*g*L ];

H=[ Gr*Kt/Rm;
  -Gr*Kt/Rm ];



A= [ 0 0 1 0;
     0 0 0 1;
     -inv(E)*G -inv(E)*F];

 B =[0;
     0;
     inv(E)*H];

Q=diag([10 1 10 10])
R=1e+2;

k= -lqr(A,B,Q,R)


eig(A+B*k)
