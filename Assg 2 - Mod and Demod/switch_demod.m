function mt_sdm = switch_demod(t, s_sm, Ac, fc, bwmt, freq_shift, phase_shift)
    mt_sdm = zeros(1, length(s_sm));
    ct = Ac*cos(2*pi*(fc-freq_shift)*t + phase_shift);
    for k = 1:length(s_sm)
        if (ct(k) > 0)
            mt_sdm(k) = s_sm(k);
        else 
            mt_sdm(k) = -s_sm(k);
        end
    end
    fs = 0.04*10^(7);
    mt_sdm = lowpass(mt_sdm, bwmt, fs);
end