clc;
clear;

input_img = imread('16.png');


j=fft2(input_img);
[M,N] = size(j);
move_j = circshift(j,[-M/2,-N/2]);
I=log(abs(move_j)); % abs得到傅里叶频谱
figure(2);
subplot(1,2,1);
I = scaling(I);
imshow(I);
colorbar;

j2=dft2d(input_img,0);
move_j2 = circshift(j2,[-M/2,-N/2]);
I2=log(abs(move_j2)); % abs得到傅里叶频谱
subplot(1,2,2);
imshow(scaling(I2));
colorbar;



n=ifft2(j);
figure(3);
subplot(1,2,1);
imshow(scaling(n));
colorbar;



n2 = dft2d(j2,1);
figure(3);
subplot(1,2,2);
n2= real(n2);
imshow(scaling(n2));
colorbar;




