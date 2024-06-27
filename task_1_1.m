fid = fopen('aiueo.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);

x = 1/16000:1/16000:size(y,1)/16000;
plot(x,y);
xlabel('time(second)');
ylabel('frequency(Hz)');