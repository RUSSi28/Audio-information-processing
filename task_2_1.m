fid = fopen('aiueo.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);
T = size(y,1)/16000;
x = 1/16000:1/16000:T;


fade_in = (x./T).*y';
fid = fopen('fade_in.raw', 'w');
fwrite(fid, fade_in, 'int16');
fclose(fid);

fade_out = ((T-x)/T).*y';
fid = fopen('fade_out.raw', 'w');
fwrite(fid, fade_out, 'int16');
fclose(fid);