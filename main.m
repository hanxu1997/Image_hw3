clc;
clear;

input_img = imread('16.png');


input_img = centralized(input_img);
j=fft2(input_img);
I=log(abs(j)); % abs得到傅里叶频谱
figure(2);
subplot(1,2,1);
imshow(I,[]);
colorbar;

j2=dft2d(input_img,0);
I2=log(abs(j2)); % abs得到傅里叶频谱
subplot(1,2,2);
imshow(I2,[]);
colorbar;


n=ifft2(j);
figure(3);
subplot(1,2,1);
imshow(n,[]);
colorbar;

n2 = dft2d(j2,1);
figure(3);
subplot(1,2,2);
 n2= real(n2);
imshow(n2,[]);
colorbar;




