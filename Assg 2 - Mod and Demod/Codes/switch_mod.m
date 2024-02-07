function s_sm = switch_mod(mt, ct)
    s_sm = zeros(1, length(ct));
    for k = 1:length(ct)
        if (ct(k) > 0) 
            s_sm(k) = mt(k);
        else 
            s_sm(k) = -mt(k);
        end
    end
    Y3 = fft(s_sm, length(s_sm));

    %bandpass at +-100 indices from the fc indice 
    Y3(200001:360001-100) = 0;
    Y3(360101:end) = 0;
    Y3(1:-159999-100+200000) = 0;
    Y3(-159999+100+200000:200001) = 0;

    %figure;
    %plot(-length(abs(Y3))/2+1/2:length(abs(Y3))/2-1/2, abs(Y3));
    
    s_sm = ifft(Y3); 
end