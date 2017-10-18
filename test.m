clc;
clear;

input_img = imread('16.png');
% m––n¡–
[m,n]=size(input_img);
first_row = input_img(1,:);
figure(1);
row_1_fft = fft(first_row);
myrow1_dft = dft1d(first_row);
subplot(4,1,1);
I1=log(abs(row_1_fft));
imshow(I1);
subplot(4,1,2);
I2=log(abs(myrow1_dft));
imshow(I2);


x = 1:1:384;
subplot(4,1,3);
plot(x,row_1_fft,'b');
subplot(4,1,4);
plot(x,myrow1_dft,'r');



