function y = FMod(mt, kf, fs, fc, Ac, t)
    mt_int = cumsum(mt)/fs;
    y = Ac*cos(2*pi*fc*t + 2*pi*kf*mt_int);
end