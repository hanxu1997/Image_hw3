clc;
clear;
filter = [0 1 0; 1 0 1; 0 1 0];
filter = filter/4;
H = fft2(filter);

input_img = imread('16.png');
output_img = filter2d_freq(input_img,filter);
format short

H