% サンプリング周波数
fs = 16000;

% 信号の時間軸を定義
t = 0:1/fs:1; % 1秒間の時間軸を作成

% 1kHzの正弦波を生成
f = 1000;
x = sin(2*pi*f*t);
plot(t, x);

% ハミング窓を作成
w = hamming(1024);

% 入力信号を長さ1024に切り出す
x_cut = x(1:1024);

% パワースペクトルを表示
% periodogram(x_cut, w, 1024, fs);