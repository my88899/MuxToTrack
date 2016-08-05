clc;clear;close all;
ts=0.000001;    %²ÉÑù¼ä¸ô
sweep=10000/0.1;
c=10e1;

delay_1=0.014;
delay_2=0.014;
delay_3=0.017;

t_start=1;
t_end=2;

sim('mix_fq_01.mdl')

delay=max([delay_1,delay_2,delay_3]);
lenB=floor(delay/ts)+2;
Ts=ScopeData.time;%(lenB:end);
Ds=[];ff=[];
for i=2:4
    Ds=ScopeData.signals(i).values;%(lenB:end);
    ff=[ff,mux_s1(Ts,Ds)];
end
r_s=(ff/sweep)*c;

p={[0 -1 0],[0 1 0],[0 0 1]};
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
    [x,y,z] = sph2cart(pp,pi/2-tt,r_s(i));
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
ot=roll_cross(p,r_s);
plot3(ot.X,ot.Y,ot.Z,'.k','MarkerSize',50);
view([1 0 0])
hold off
