clc;
clear;
input_img = imread('16.png');
figure(2);
subplot(2,2,1)
imshow(input_img);
title('inputImg');

% 3*3均值滤波
filter1(1:3,1:3) = 1;
output_img1 = filter2d_freq( input_img, filter1);
figure(2);
subplot(2,2,2);
output_img1 = scaling(output_img1);
imwrite(output_img1, '.\filter_result\3x3_average_filter.png');
imshow(output_img1);
title('3*3 average filter');

% 7*7均值滤波
filter2(1:7,1:7) = 1;
output_img2 = filter2d_freq( input_img, filter2);
figure(2);
subplot(2,2,3);
output_img2 = scaling(output_img2);
imwrite(output_img2, '.\filter_result\7x7_average_filter.png');
imshow(output_img2);
title('7*7 average filter');

% 11*11均值滤波
filter3(1:11,1:11) = 1;
output_img3 = filter2d_freq( input_img, filter3);
figure(2);
subplot(2,2,4);
output_img3 = scaling(output_img3);
imwrite(output_img3, '.\filter_result\11x11_average_filter.png');
imshow(output_img3);
title('11*11 average filter');


%拉普拉斯滤波器
filter4 = [0 -1 0; -1 4 -1;0 -1 0];
output_img4 = filter2d_freq( input_img, filter4);
figure(3);
% 输出原图像
subplot(1,3,1);
imshow(input_img);
title('inputImg');
% Laplacian滤波器滤波结果
subplot(1,3,2);
imshow(uint8(output_img4));
title('Laplacian Result');
imwrite(scaling(uint8(output_img4)), '.\filter_result\Laplacian_filter.png');
% 锐化原图像
output_img4 = uint8(output_img4) + input_img;
subplot(1,3,3);
output_img4 = scaling(output_img4);
imwrite(output_img4, '.\filter_result\Laplacian_Sharpen.png');
imshow(output_img4);
title('laplacian Sharpen');

