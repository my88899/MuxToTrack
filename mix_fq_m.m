clc;clear;close all;
ts=0.000001;    %²ÉÑù¼ä¸ô



delay_1=0.012;
delay_2=0.037;

t_start=0;
t_end=1;
mt=[0.01 0.021];

sim('mix_fq_01.mdl')

delay=max(delay_1,delay_2);
lenB=floor(delay/ts)+2;
Ts=ScopeData.time;%(lenB:end);
Ds_1=ScopeData.signals(3).values;%(lenB:end);
[F1,X_k1]=mux_s1(Ts,Ds_1);
figure
plot(F1,X_k1)
axis([-100 500 -1 14])
xlabel('f/Hz');ylabel('A')

t_start=0;
t_end=1;
mt=[0.019 0.03];
sim('mix_fq_01.mdl')

delay=max(delay_1,delay_2);
lenB=floor(delay/ts)+2;
Ts=ScopeData.time;%(lenB:end);
Ds_1=ScopeData.signals(3).values;%(lenB:end);
[F2,X_k2]=mux_s1(Ts,Ds_1);
figure
plot(F2,X_k2)
xlabel('f/Hz');ylabel('A')
axis([-100 500 -1 14])

figure
L=max(length(F1),length(F2));
F=F2(1:L);
X_k=abs(X_k2(1:L)-X_k1(1:L));
plot(F,X_k)
xlabel('f/Hz');ylabel('A')
axis([-100 1200 -1 14])




% mux_s1(Ts,Ds_2);
