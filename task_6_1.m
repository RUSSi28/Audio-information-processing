% サンプリング周波数
Fs = 16000; % 例: 44.1 kHz

% ノイズの長さ（秒）
duration = 5; % 例: 5秒

% サンプル数
N = Fs * duration;

% 白色雑音の生成
white_noise = randn(1, N);

cut = white_noise(1:1024);

a = lpc(cut, 15);


% インパルス信号の生成
impulse_length = 1024; % インパルス応答の長さ
impulse = zeros(1, impulse_length);
impulse(1) = 1;

% インパルス応答の初期化
h = zeros(1, impulse_length);

% 全極フィルタのインパルス応答を計算
for n = 1:impulse_length
    % フィルタの出力を計算
    h(n) = impulse(n);
    for k = 2:length(a)
        if n >= k
            h(n) = h(n) - a(k) * h(n - k + 1);
        end
    end
end

% periodogram(h, w, 1024, fs);
sound(h, Fs);
