t = -0.02:10^(-7):0.02;

mt = (1-abs(t/0.01+1)).*(t >= -0.02 & t <= 0) - (1-abs(t/0.01-1)).*(t >= 0 & t <= 0.02);

Ac = 1;
fc = 10^6;
ct = Ac*cos(2*pi*fc*t);

dsbfc = multiplier_mod(Ac+mt, ct);

mt_demod = rect_demod(Ac, dsbfc, 100, t);

figure;
subplot(3, 1, 1);
plot(t, mt);
title("Message signal");
xlabel("time");
ylabel("m(t)");
subplot(3, 1, 2);
plot(t, dsbfc);
title("Modulated signal");
xlabel("time");
ylabel("\phi_{DSB-FC}(t)");
subplot(3, 1, 3);
plot(t, mt_demod);
title("Demodulated signal - scaled by 1/\pi");
xlabel("time");
ylabel("m(t)_{demod}");

figure;
subplot(2, 1, 1);
plot(-length(abs(fft(mt)))/2+1/2:length(abs(fft(mt)))/2-1/2, fftshift(abs(fft(mt))));
title("FFT - Message signal");
xlabel("k");
ylabel("M(k)");
subplot(2, 1, 2);
plot(-length(abs(fft(dsbfc)))/2+1/2:length(abs(fft(dsbfc)))/2-1/2, fftshift(abs(fft(dsbfc))));
title("FFT - Modulated signal");
xlabel("k");
ylabel("\phi_{DSB-FC}(k)");