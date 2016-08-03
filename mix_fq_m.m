clc;clear;close all;
ts=0.000001;    %²ÉÑù¼ä¸ô

t_start=1;
t_end=2;

delay_1=0.012;
delay_2=0.037;
delay_3=0.057;

sim('mix_fq_01.mdl')

delay=max([delay_1,delay_2,delay_3]);
lenB=floor(delay/ts)+2;
Ts=ScopeData.time(lenB:end);
for i=1:3
    Ds=ScopeData.signals(i+1).values(lenB:end);
% Ds_1=ScopeData.signals(4).values(lenB:end);
% Ds_2=ScopeData.signals(4).values(lenB:end);
    mux_s1(Ts,Ds);
end
