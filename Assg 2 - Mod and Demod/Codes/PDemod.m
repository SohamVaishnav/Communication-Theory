function y = PDemod(ct, kp, t, fc, fs)
    y_int = zeros(1, length(ct));
    y_int(1) = ct(1)/t(1);
    for k = 2:length(ct)
        y_int(k) = (ct(k) - ct(k-1))/(t(k) - t(k-1));
    end
    y = envelope(y_int);
    y = y - mean(y);
    y = cumsum(y).*(1/fs);
end