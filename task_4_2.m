fid = fopen('z.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);

y_ = y(15001:16024);
T = size(y_,1)/16000;
x = 1/16000:1/16000:T;

% plot(x,y);
fs = 16000;

% ハミング窓を作成
w = hamming(1024);

% パワースペクトル密度関数を表示
% periodogram(y_, w, 1024, fs);
plot(y);