clc;clear;close all;
ts=0.0000001;    %²ÉÑù¼ä¸ô
sweep=100000/0.1;
c=10e1;


oSite = {[-0.13 0], [0.13 0]};
td = 0:0.1:pi+0.3;
x={};y={};value={};
for k=0:1:20
%     t_start=0+0.3*k;
%     t_end=0.2+0.3*k;
    t_start=0;
    t_end=0.2;
    delay1=0.001+0.001*k;
    delay2=0.0014+0.001*k;

    
    sim('singleAntenna.mdl')
    
    Ts=ScopeData.time;
    Ds=[];ff={};V={};r_simulink={};
    i=1;
    Ds=ScopeData.signals(i+1).values;
    [ff{i},V{i}]=muxTrackMove(Ts,Ds);
    r_simulink{i}=(ff{i}./sweep).*c;
%     V{i} = V{i} / max(V{i});
   
   

    i=1;
    deleteSites = find(V{i}<mean(V{i}));
    r_simulink{i}(deleteSites) = [];
    V{i}(deleteSites) = [];
    x{i+2*k} = r_simulink{i}' * cos(td) + oSite{i}(1);
    y{i+2*k} = r_simulink{i}' * sin(td) + oSite{i}(2);
    value{i+2*k} = V{i} * ones(1,length(td));
%     x{i}=x{i}(:);y{i}=y{i}(:);value{i}=value{i}(:);
    x{i+2*k}=x{i+2*k}(:);y{i+2*k}=y{i+2*k}(:);value{i+2*k}=value{i+2*k}(:);
end
    
pointNumber=500;
minx=0.5;maxx=-0.5;miny=2;maxy=0;
% minx=inf;maxx=-inf;miny=inf;maxy=-inf;
% for j=1:length(x)
%     minx=min(minx,min(x{j}));
%     maxx=max(maxx,max(x{j}));
%     miny=min(miny,min(y{j}));
%     maxy=max(maxy,max(y{j}));
% end
%     minx=min(min(x{1}),min(x{2}));maxx=max(max(x{1}),max(x{2}));
%     miny=min(min(y{1}),min(y{2}));maxy=max(max(x{1}),max(x{2}));
[X,Y]=meshgrid(linspace(minx,maxx,pointNumber),linspace(miny,maxy,pointNumber));
Zp={};
for i = 1:length(x)/2
    Z=zeros(size(X));
    j=0;
    Z=Z+griddata(x{i*2+j-1},y{i*2+j-1},value{i*2+j-1},X,Y,'nearest');
    n=(i-1)*2+(j+1)
    %     Z(find(Z<max(max(Z))-0.5))=0;
    Zp{i} = Z;   
end
%     Zp=Z;
%     % Zp(find(Zp<mean(mean(Zp))))=0;
%     Zp(find(Zp<max(max(Zp))-0.3))=0;
Z_p=Zp;
Z=zeros(size(X));
figure
hold on
colorbar
for i = 1:length(Z_p);
%     Z_p{i}(find(Z_p{i}<max(max(Z_p{i}))-0.2))=0;
%     Z = Z+Z_p{i};
%     mesh(X,Y,Z)
    mesh(X,Y,Z_p{i})
    axis([-0.5 0.5 0 2])
    pause(1)
end
% figure
% hold on
grid on
% mesh(X,Y,Z)
% axis([-2 2 0 5])
% colorbar
hold off