close all
clear all
clc

%% pinos

A = 0.120*0.070;
D = 13;
S_T = 28;
S_L = 17;
S_D = sqrt(S_L^2 + (S_T/2)^2);
A_conv = 0.05636; %calcular ainda

%% 1º ensaio

V1 = 0.84495;
T_in1 = 26;
T_out1 = (34 + 33 +31)/3;
T_s1 = 52;
T_f1 = (T_in1 + T_out1)/2 + 273.15;

if 2*(S_D - D)>= (S_T - D)
    V_max1 = S_T*V1/(S_T - D)
end

ro1 =  1.1614 + ((T_f1-300)/(350-300)*(0.9950-1.1614));
cp1 = 1007 + ((T_f1-300)/(350-300)*(1009-1007));
niu1 = (184.6 + ((T_f1-300)/(350-300)*(208.2-184.6)))*10^-7;
v1 = (15.89 + ((T_f1-300)/(350-300)*(20.92-15.89)))*10^-6;
k1 = (26.3 + ((T_f1-300)/(350-300)*(30-26.3)))*10^-3;
alpha1 = (22.5 + ((T_f1-300)/(350-300)*(29.9-22.5)))*10^-6;
Pr1 = 0.707 + ((T_f1-300)/(350-300)*(0.700-0.707));
Prs1 = 0.707 + ((T_s1+275.15-300)/(350-300)*(0.700-0.707));

Re_max1 = V_max1*D*10^-3/v1;
if S_T/S_L<2
    C1 = 0.35*(S_T/S_L)^(1/5);
    m = 0.60;
end

Nu1 = 0.92*C1*(Re_max1^m)*Pr1^0.36*(Pr1/Prs1)^0.25;

h_teorico1 = Nu1*k1/D*10^3

m1 = ro1 * A * V1;
q1 = m1*cp1*(T_out1-T_in1);
DeltaT1 = ((T_s1 - T_in1) - (T_s1 - T_out1))/log((T_s1 - T_in1)/(T_s1 - T_out1));

h_exp1 = q1/(A_conv*DeltaT1)


%% 2º ensaio

T_in2 = 26;
T_out2 = (32 + 31 + 29)/3;
V2 = 1.757;


T_f2 = (T_in2 + T_out2)/2 + 273.15;

if 2*(S_D - D)>= (S_T - D)
    V_max2 = S_T*V2/(S_T - D);
end

ro2 =  1.1614 + ((T_f2-300)/(350-300)*(0.9950-1.1614));
cp2 = 1.007 + ((T_f2-300)/(350-300)*(1.009-1.007));
niu2 = (184.6 + ((T_f2-300)/(350-300)*(208.2-184.6)))*10^7;
v2 = (15.89 + ((T_f2-300)/(350-300)*(20.92-15.89)))*10^6;
k2 = (26.3 + ((T_f2-300)/(350-300)*(30-26.3)))*10^3;
alpha2 = (22.5 + ((T_f2-300)/(350-300)*(29.9-22.5)))*10^6;
Pr2 = 0.707 + ((T_f2-300)/(350-300)*(0.700-0.707));
