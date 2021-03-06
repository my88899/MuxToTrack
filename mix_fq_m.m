% clc;clear;close all;

function [point_simulink,r_simulink,eror]=mix_fq_m%(point)
% clc;clear;close all;
% global t_start t_end delay_1 delay_2 delay_3;
% if nargin<1
%     point = (rand(1,3)+0.4)*0.5
% else
%     point
% end
% ts=0.000001;    %�������
% sweep=10000/0.1;
% c=10e1;
% p={[0 -1 0],[0 1 0],[0 0 1]};
% % point=[0.2,0.2,0.4]
% % point = (rand(1,3)+0.4)*0.5
% r_real=creat_rMatrix({[0 -1 0],[0 1 0],[0 0 1]},point)
% delay=r_real/c;

% delay_1=delay(1);
% delay_2=delay(2);
% delay_3=delay(3);
% 
% t_start=1;
% t_end=2;
% save t_start t_end delay_1 delay_2 delay_3;
% sim('mix_fq_01.mdl')

global point delay ts ScopeData sweep c p;
lenB=floor(delay/ts)+2;
Ts=ScopeData.time;%(lenB:end);
Ds=[];ff=[];
for i=2:4
    Ds=ScopeData.signals(i).values;%(lenB:end);
    ff=[ff,mux_s1(Ts,Ds)];
end
r_simulink=(ff/sweep)*c;


color={'r','b','g'};
mark_color={'.k','.k','.k'};%{'.y','.r','.b'};

figure
hold on
grid on
xlabel('x');ylabel('y');zlabel('z');
n_line=20;
theta=linspace(0,pi,n_line);
phi=linspace(-pi/2,pi/2,n_line);
[tt,pp]=meshgrid(theta,phi);
for i=1:3
    [x,y,z] = sph2cart(pp,pi/2-tt,r_simulink(i));
%     [x,y,z]=sphere(30);
%     X=x*r_s(i)+p{i}(1);
%     Y=y*r_s(i)+p{i}(2);
%     Z=z*r_s(i)+p{i}(3);
    X=x+p{i}(1);
    Y=y+p{i}(2);
    Z=z+p{i}(3);
%     w=find(X<0);
%     Z(w)=0;
%     Y(w)=0;
%     X(w)=0;
%     mesh(X,Y,Z,'FaceColor',color{i});
    surf(X,Y,Z,'FaceColor',color{i},'EdgeColor','c','LineWidth',0.1);
    plot3(p{i}(1),p{i}(2),p{i}(3),mark_color{i},'MarkerSize',20);
    alpha(0.6);
end
ot=roll_cross(p,r_simulink);
X=vpa(ot.X,10);
Y=vpa(ot.Y,10);
Z=vpa(ot.Z,10);
point_simulink=[X,Y,Z];
r_simulink;

plot3(ot.X,ot.Y,ot.Z,'.k','MarkerSize',50);
view([1 0 0])
hold off

eror=abs((point_simulink-point)./point.*100);

