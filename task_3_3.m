fs = 16000;

fid = fopen('aiueo.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);

specgram(y, 512, fs);
