function s_sm = switch_mod(mt, ct)
    s_sm = zeros(1, length(ct));
    for k = 1:length(ct)
        if (ct(k) > 0) 
            s_sm(k) = mt(k);
        else 
            s_sm(k) = -mt(k);
        end
    end
end