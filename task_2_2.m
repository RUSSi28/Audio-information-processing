fid = fopen('aiueo.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);
T = size(y,1)/16000;
x = 1/16000:1/16000:T;

Fs = 16000;
delay1 = 0.05*Fs;
delay2 = 0.1*Fs;
echo1 = [zeros(delay1,1); y*0.7; zeros(delay2,1)];
echo2 = [zeros(delay2,1); y*0.3; zeros(delay1,1)];
y_ = [y; zeros(delay1,1); zeros(delay2,1)];
echoed_sound = y_ + echo1 + echo2;

fid = fopen('echo.raw', 'w');
fwrite(fid, echoed_sound, 'int16');
fclose(fid);