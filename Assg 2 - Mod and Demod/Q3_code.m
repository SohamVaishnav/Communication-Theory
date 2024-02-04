t = -0.02:10^(-7):0.02;

mt = (1-abs(t/0.01+1)).*(t >= -0.02 & t <= 0) - (1-abs(t/0.01-1)).*(t >= 0 & t <= 0.02);

Ac = 1;
fc = 10^6;
kp = 1; kf = 1;

PMt = Ac*cos(2*pi*fc*t + kp*mt);

FMt = Ac*cos(2*pi*fc*t + kf*cumsum(mt));

mt_PM = zeros(1, length(PMt));
mt_PM(1) = PMt(1);
for k = 2:length(PMt)
    mt_PM(k) = PMt(k) - PMt(k-1);
end

mt_PM = envelope(mt_PM - 2*pi*fc*t, 1);

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
plot(-length(abs(fft(mt)))/2+1/2:length(abs(fft(mt)))/2-1/2, abs(fft(mt)));
title("FFT - Message signal");
xlabel("k");
ylabel("M(k)");
subplot(3, 1, 2);
plot(-length(abs(fft(PMt)))/2+1/2:length(abs(fft(PMt)))/2-1/2, abs(fft(PMt)));
title("FFT - Phase Modulated signal");
xlabel("k");
ylabel("\phi_{PM}(k)");
subplot(3, 1, 3);
plot(-length(abs(fft(FMt)))/2+1/2:length(abs(fft(FMt)))/2-1/2, abs(fft(FMt)));
title("FFT - Frequency Modulated signal");
xlabel("k");
ylabel("\phi_{FM}(k)");