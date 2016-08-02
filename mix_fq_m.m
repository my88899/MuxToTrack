clc;clear;close all;
ts=0.000001;    %²ÉÑù¼ä¸ô

delay_1=0.12;
delay_2=0.37;

sim('mix_fq_01.mdl')

delay=max(delay_1,delay_2);
lenB=floor(delay/ts)+2;
Ts=ScopeData.time(lenB:end);
Ds_1=ScopeData.signals(3).values(lenB:end);
% Ds_2=ScopeData.signals(4).values(lenB:end);
mux_s1(Ts,Ds_1);
% mux_s1(Ts,Ds_2);
