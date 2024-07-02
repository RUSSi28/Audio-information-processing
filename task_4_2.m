fid = fopen('s.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);

y_ = y(1:1024);
T = size(y_,1)/16000;
x = 1/16000:1/16000:T;

% plot(x,y);
fs = 16000;

% ハミング窓を作成
w = hamming(1024);

% パワースペクトル密度関数を表示
periodogram(y_, w, 1024, fs);