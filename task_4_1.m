fid = fopen('o2.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);

y_cut = y(10001:11024);

fs = 16000;

% ハミング窓を作成
w = hamming(1024);

% パワースペクトル密度関数を表示
periodogram(y_cut, w, 1024, fs);
disp(length(y));
