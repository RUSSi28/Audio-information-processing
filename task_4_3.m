fid = fopen('high.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);

T = size(y,1)/16000;
x = 1/16000:1/16000:T;

plot(x,y);