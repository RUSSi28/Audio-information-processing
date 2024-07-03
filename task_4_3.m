fid = fopen('low.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);

T = size(y,1)/16000;
x = 1/16000:1/16000:T;

fs = 16000;

% ハミング窓を作成
w = hamming(1024);
y_cut = y(15001:16024);

% パワースペクトル密度関数を表示
periodogram(y_cut, w, 1024, fs);

% plot(x,y);