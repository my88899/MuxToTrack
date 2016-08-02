clc;clear;close all;
ts=0.000001;    %²ÉÑù¼ä¸ô
sweep=10000/0.1;
c=3e1;

delay_1=0.042;
delay_2=0.037;
delay_3=0.057;

sim('mix_fq_01.mdl')

delay=max([delay_1,delay_2,delay_3]);
lenB=floor(delay/ts)+2;
Ts=ScopeData.time(lenB:end);
Ds=[];ff=[];
for i=2:4
    Ds=ScopeData.signals(i).values(lenB:end);
    ff=[ff,mux_s1(Ts,Ds)];
end
r_s=(ff/sweep)*c;

p={[0 -0.7 0],[0 0.7 0],[0 0 -0.7]};
color={'r','b','y'};

figure
hold on
grid on
xlabel('x');ylabel('y');zlabel('z');
for i=1:3
    [x,y,z]=sphere(30);
    X=x*r_s(i)+p{i}(1);
    Y=y*r_s(i)+p{i}(2);
    Z=z*r_s(i)+p{i}(3);
    w=find(X<0);
    Z(w)=0;
    Y(w)=0;
    X(w)=0;
    mesh(X,Y,Z,'FaceColor',color{i})
end
hold off
