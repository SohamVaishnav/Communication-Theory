function y = PMod(mt, Ac, fc, fs, kp, t)
    y = Ac*cos(2*pi*fc*t + kp*mt);
end