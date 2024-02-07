Ts = 1/(5*10^(7));
t = -0.03:Ts:0.03;
mt = (1-abs(t/0.01+1)).*(t >= -0.02 & t <= 0) - (1-abs(t/0.01-1)).*(t >= 0 & t <= 0.02);

%syms t;
%mt = tent(t/0.01+1) - tent(t/0.01-1);
%disp(mt);

%figure;
%fplot(mt);
%xlim([-0.03 0.03])

Ac = 1;
fc = 10^(6);
kp = pi/4; kf = 1;

%mt_int = int(mt, t,  -inf, t);
%disp(mt_int);

%PMt =  cos(2*pi*fc*t + kp*(mt));
%PMt = diff(PMt, t);

%PMt = double(subs(PMt, t));

FMt = FMod(mt, kf, 1/Ts, fc, Ac, t);
PMt = PMod(mt, Ac, fc, 1/Ts, kp, t);

PDt = PDemod(PMt, kp, t, fc, 1/Ts);
FDt = FDemod(FMt, kf, t, fc, 1/Ts);
%subs(PMt, t, time);
%PMt = fmmod(mt, fc, 10*fc, 1/(2*pi));

figure;
subplot(3, 1, 1);
plot(t, mt);
title("Message Signal");
xlabel("time");
ylabel("Amplitude");
subplot(3, 1, 2);
plot(t, PDt);
title("Phase Demodulated Signal");
xlabel("time");
ylabel("Amplitude");
subplot(3, 1, 3);
plot(t, FDt);
title("Frequency Demodulated Signal");
xlabel("time");
ylabel("Amplitude");

figure;
subplot(3, 1, 1);
plot(t, mt);
title("Message Signal");
xlabel("time");
ylabel("m(t)");
subplot(3, 1, 2);
plot(t, PMt);
title("Phase modulated signal");
xlabel("time");
ylabel("\phi_{PM}(t)");
subplot(3, 1, 3);
plot(t, FMt);
title("Frequency modulated signal");
xlabel("time");
ylabel("\phi_{FM}(t)");

figure;
subplot(3, 1, 1);
plot(-length(abs(fft(mt)))/2+1/2:length(abs(fft(mt)))/2-1/2, fftshift(abs(fft(mt))));
%xlim([-20 20]);
title("FFT - Message signal");
xlabel("k");
ylabel("M(k)");
subplot(3, 1, 2);
plot(-length(abs(fft(PMt)))/2+1/2:length(abs(fft(PMt)))/2-1/2, fftshift(abs(fft(PMt))));
%xlim([-80000 80000]);
title("FFT - Phase Modulated signal");
xlabel("k");
ylabel("\phi_{PM}(k)");
subplot(3, 1, 3);
plot(-length(abs(fft(FMt)))/2+1/2:length(abs(fft(FMt)))/2-1/2, fftshift(abs(fft(FMt))));
%xlim([-75000 75000]);
title("FFT - Frequency Modulated signal");
xlabel("k");
ylabel("\phi_{FM}(k)");