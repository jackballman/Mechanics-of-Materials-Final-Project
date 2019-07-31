%Defining everything that is given
Wd = 48;
P = 15;
a = 3;
b = 2;
L = 4;

% Making the distributed load a single point load
Wt = Wd*a;

%Summing the forces in the Y direction: A+B
supports = Wt + P;

%Summing the moments about A and solving for B
B = -((a/2)*(-Wt) + (b)*(-P))/4;

%Solving for A
A = supports-B;

%% PART 1
%Solving the shear forces for the graph
V1 = A;
V2 = V1-(48)*(2);
V3 = V2-P;
V4 = V3-48;
V5 = V4;
V6 = V5+B;
Vmax = V1

%Solving the bending moments for the graph
M1 = b*V2 + b*0.5*(V1-V2);
M2 = M1 + ((a-b)*V3 + 0.5*(a-b)*(V4-V3));
M3 = M2 + (L-a)*(V5);
Mmax = M1

%Setting the axes for the graphs
xv = [0,b,b,a,L,L];
v = [V1,V2,V3,V4,V5,V6];

xm = [0,b,a,L];
m = [0,M1,M2,M3];

%Graphing the shear and bending moments
subplot(2,2,1);plot(xv,v);xlabel('Length (ft)');ylabel('Shear (lb)');title('Part 1 Shear force diagram')
subplot(2,2,2);plot(xm,m);xlabel('Length (ft)');ylabel('Bending moment (lb*in)');title('Part 1 Bending moment diagram')

%% PART 2
T = 2; %in ksi
tau = (1000)*(12^2)*T; %in lb/ft^2
O = 4; %in ksi
sigma = (1000)*(12^2)*O; %in lb/ft^2

%Governing equation for shear stress
%tau = (3*Vmax)/(2*Area)
Area = (3*Vmax)/(2*tau); %in ft^2
%sigma = (6*Mmax)/(Area*h)
h = (6*Mmax)/(sigma*Area); %in ft
b = Area/h;
bh = [b,h] % [b,h] both in ft

%% Part 3
Length = L;
Area = (1.06)*(1/144); %in square ft;
V = Length*Area %in cubic ft

%% Part 4
% Centering the loads and making the beam symetrical & solving for the
% supports
A4 = 79.5;
B4 = A4;

% Setting the shear values for the diagram
v1 = A4;
v2 = v1;
v3 = v2 - (1.5*Wd);
v4 = v3 - P;
v5 = v4 - (1.5*Wd);
v6 = v5;
v7 = v6 + B4;
Vmax2 = v1;
v4p = [v1,v2,v3,v4,v5,v6,v7];
xv4 = [0,0.5,2,2,3.5,4,4];

%Setting the moment values for the diagram
m1 = (0.5*79.5);
m2 = m1+(1.5*7.5)+(0.5*1.5*(79.5-7.5));
m3 = m2 - (0.5*79.5);
m4 = m3 - ((1.5*7.5)+(0.5*1.5*(79.5-7.5)));
m4p = [0,m1,m2,m3,m4];
xm4 = [0,0.5,2,3.5,4];

%Graphing the shear and bending moments
subplot(2,2,3);plot(xv4,v4p);xlabel('Length (ft)');ylabel('Shear (lb)');title('Part 4 Shear force diagram')
subplot(2,2,4);plot(xm4,m4p);xlabel('Length (ft)');ylabel('Bending moment (lb*in)');title('Part 4 Bending moment diagram')

%Minimizing the volume by minimizing the area, using the allowable shear
A = (3*Vmax2)/(2*tau)