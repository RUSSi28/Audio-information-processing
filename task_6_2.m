% サンプリング周波数
Fs = 16000; % 例: 44.1 kHz

% ノイズの長さ（秒）
duration = 5; % 例: 5秒

% サンプル数
N = Fs * duration;


% 異なる周波数のパルス列を生成して音声を合成
frequency = 200;


% パルスの周期
pulse_period = round(Fs / frequency);

% パルス列の生成
pulse_train = zeros(1, N);
pulse_train(1:pulse_period:end) = 1;
a = lpc(pulse_train(1:1024), 15);

% 振幅の調整
% pulse_train = pulse_train * 0.5; % 振幅を0.5に調整

% 全極フィルタを適用して音声を合成
synthesized_voice = filter(1, a, pulse_train);

sound(synthesized_voice, Fs);