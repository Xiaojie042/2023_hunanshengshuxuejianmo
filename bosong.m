
% 读取含噪声频谱数据（请将路径和文件名替换为实际文件路径和名称）
noisy_spectrum = dlmread('./附件1.csv');

% 构建复数频谱矩阵，虚部初始化为零
spectrum_complex = complex(noisy_spectrum, zeros(size(noisy_spectrum)));

% 进行泊松去噪处理
alpha = 0.01; % 参数可以根据需要调整
denoised_spectrum = max(0, spectrum_complex - alpha); % 去噪操作

% 执行逆傅里叶变换以获得去噪后的图像
denoised_image = real(ifft2(ifftshift(denoised_spectrum)));

% 去掉零填充部分，得到恢复的图像
recovered_image = denoised_image(129:384, 129:384);

% 显示去噪后的图像
imshow(recovered_image, []);

% 添加标题
title('Recovered Image (Poisson Denoising)');

