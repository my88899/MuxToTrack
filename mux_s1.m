function mux_sl(Ts,Ds)
ts=0.000001;    %�������
Fs=1/ts;        %����Ƶ�ʣ�1000000Hz=1MHz
T=3;

N=length(Ts);

X_k=abs(fft(Ds,length(Ds)));

figure
% plot(X_k(1:N));
% title('FFTģֵ')


X_k=X_k/(N/2);
X_k(1)=X_k(1)/2;
F=([1:N]-1)*Fs/N;
plot(F(1:floor(N/2)),X_k(1:floor(N/2)));
axis([1000 7000 -1 12])