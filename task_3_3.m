fs = 16000;

fid = fopen('aiueo.raw', 'r');
y = fread(fid, 'int16');
y_ = y(1:512);
fclose(fid);

specgram(y, 512, fs);
