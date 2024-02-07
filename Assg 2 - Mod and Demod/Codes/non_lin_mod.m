function s_nlm = non_lin_mod(mt, ct)
    M = @(f) (0.02*((sinc(f*0.01)).^2).*sin(2*pi*f)).^2;

    x1 = mt + ct;
    x2 = -mt + ct;

    y1 = x1.^2;
    y2 = x2.^2;

    y3 = y1 - y2;
    Y3 = fft(y3, length(y3));

    %bandpass at +-100 indices from the fc indice 
    Y3(200001:360001-100) = 0;
    Y3(360101:end) = 0;
    Y3(1:-159999-100+200000) = 0;
    Y3(-159999+100+200000:200001) = 0;

    %figure;
    %plot(-length(abs(Y3))/2+1/2:length(abs(Y3))/2-1/2, abs(Y3));
    
    s_nlm = ifft(Y3);
end