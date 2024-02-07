function mt_sdm = switch_demod(s_sm, ct, bwmt)
    mt_sdm = zeros(1, length(s_sm));
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