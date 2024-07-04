% サンプリング周波数
fs = 16000;

% 信号の時間軸を定義
t = 0:1/fs:1; % 1秒間の時間軸を作成

% sin 
f = 1000;
f_ = 5000;
x = sin(2*pi*f*t);
x_= sin(2*pi*f_*t);
y = x + x_;
plot(t, y);
w= hamming(1024);

% 入力信号を長さ1024に切り出す
x_cut = y(1:1024);

% パワースペクトルを表示
periodogram(x_cut, w, 1024, fs);
