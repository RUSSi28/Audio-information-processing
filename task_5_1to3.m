fid = fopen('o2.raw', 'r');
y = fread(fid, 'int16');
fclose(fid);

y_cut = y(10001:11024);

a = lpc(y_cut, 15);


% インパルス信号の生成
impulse_length = 100; % インパルス応答の長さ
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
% disp(h);
% stem(h, 'filled');
freqz(h, 1, 500, 'half', 1);
% periodogram(h, [], [], 1);