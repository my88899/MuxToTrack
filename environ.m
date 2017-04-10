% function environ(point)
clc;clear;close all;
global ts sweep point c p delay_1 delay_2 delay_3 delay  ScopeData
ts=0.000001;    %采样间隔
sweep=10000/0.1;
c=10e1;
t_start=1;
t_end=2;
o_site={[0 -1 0],[0 1 0],[0 0 1]};
% if nargin<1
%     point = (rand(1,3)+0.4)*0.5
% else
%     point
% end
% point=[0.2,0.2,0.4]
point = (rand(1,3)+0.4)*0.5

p={[0 -1 0],[0 1 0],[0 0 1]};

r_real=creat_rMatrix(o_site,point)

delay=r_real/c;
delay_1=delay(1);
delay_2=delay(2);
delay_3=delay(3);
delay=max([delay_1,delay_2,delay_3]);

sim('mix_fq_01.mdl')

% save t_start t_end delay_1 delay_2 delay_3 delay ScopeData sweep;
[point_simulink,r_simulink,eror]=mix_fq_m
disp('误差公式：|(point_simulink-point)/point*100%|');
disp('误差');
disp(eror);
disp('平均误差：');
disp(mean(eror));
