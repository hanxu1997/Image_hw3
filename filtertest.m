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
imshow(scaling(output_img1));
title('3*3 average filter');

% 7*7均值滤波
filter2(1:7,1:7) = 1;
output_img2 = filter2d_freq( input_img, filter2);
figure(2);
subplot(2,2,3)
imshow(scaling(output_img2));
title('7*7 average filter');

% 11*11均值滤波
filter3(1:11,1:11) = 1;
output_img3 = filter2d_freq( input_img, filter3);
figure(2);
subplot(2,2,4)
imshow(scaling(output_img3));
title('11*11 average filter');


%拉普拉斯滤波器
filter4 = [0 -1 0; -1 4 -1;0 -1 0];
output_img4 = filter2d_freq( input_img, filter4);

output_img4 = uint8(output_img4) + input_img;
figure(3);
subplot(1,2,1);
imshow(input_img);
subplot(1,2,2);
imshow(scaling(output_img4));
title('laplacian filter by filter2d');

