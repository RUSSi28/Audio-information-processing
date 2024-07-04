% sampling frequency
fs = 16000;

% time axis
t = 0:1/fs:1; 

% 1kHz sin
f = 1000;
x = sin(2*pi*f*t);

plot(t, x);
w = hamming(1024);
x_cut = x(1:1024);

% power spectrum
periodogram(x_cut, w, 1024, fs);
