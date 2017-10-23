clc;
clear;
input_img = imread('16.png');
filter = [ 0 -1 0; -1 4 -1; 0 -1 0];
[M,N]=size(input_img);
[A,B] = size(filter);
P = M+A-1;
Q = N+B-1;
%生成一个滤波器函数H(u,v)，大小为P*Q，中心在（P/2，Q/2)处
padding_h = zeros(P,Q);
padding_h(1:A,1:B) = filter;
padding_h = centralized(padding_h);

H = fft2(padding_h);
% abs(H);
% imshow(abs(H));

H2 = dft2d(padding_h,0);
% abs(H2);
% imshow(abs(H2));

if H == H2
    figure(1);
    imshow(abs(H2),[]);
else
    figure(3);
    imshow((abs(H2-H)),[]);
end

figure(2);
subplot(1,2,1);
abs(H);
imshow(log(abs(H)),[]);
subplot(1,2,2);
abs(H2);
imshow(log(abs(H2)),[]);


