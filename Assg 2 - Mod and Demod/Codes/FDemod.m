function y = FDemod(ct, kf, t, fc, fs)
    y_diff = zeros(1, length(ct));
    y_diff(1) = ct(1)/t(1);
    for k = 2:length(ct)
        y_diff(k) = (ct(k) - ct(k-1))/(t(k) - t(k-1));
    end
    y = envelope(y_diff/(2*pi*kf));
    y = y - mean(y);
end