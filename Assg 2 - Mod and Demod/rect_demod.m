function y = rect_demod(A, dsbfc, bwmt, t)
    for k = 1:length(dsbfc)
        if (dsbfc(k) < 0) 
            dsbfc(k) = 0;
        end
    end

    figure;
    plot(t, dsbfc);
    title("Rectified \phi_{DSB-FC}(t)");
    xlabel("time");
    ylabel("Rectified values");

    fs = 0.04*10^(7);
    lpf = lowpass(dsbfc, bwmt, fs);

    figure;
    plot(t, lpf);
    title("After passing through LPF");
    xlabel("time");
    ylabel("Filtered Signal");

    y = lpf - A/pi;
end