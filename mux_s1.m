function mux_sl(delay,Ts,Ds)
ts=0.000001;    %�������
Fs=1/ts;        %����Ƶ�ʣ�1000000Hz=1MHz
T=3;

N=length(Ts);

X_k=abs(fft(Ds,length(Ds)));

% plot(X_k(1:N));
% title('FFTģֵ')
figure

X_k=X_k/(N/2);
X_k(1)=X_k(1)/2;
F=([1:N]-1)*Fs/N;
% f=linspace(0,Fs,length(Ds));
plot(F(1:N/2),X_k(1:N/2));