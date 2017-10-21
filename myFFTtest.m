clc;
clear;
input_img = imread('16.png');

% fft by matlab
fft_result=fft2(input_img);
[M,N] = size(fft_result);
move_fftresult = circshift(fft_result,[-M/2,-N/2]);
originalM = M;
originalN = N;
fft_spectrum=log(abs(move_fftresult)); % abs得到傅里叶频谱
fft_spectrum = scaling(fft_spectrum);
imwrite(fft_spectrum, '.\FFT_result\matlab_fft_result.png');
figure(2);
subplot(2,2,1);
imshow(fft_spectrum);
title('matlab fft result');
colorbar;

% fft2d by my own function
myfft_result=myFFT2d(input_img,0);
[M,N] = paddingSize(input_img);
move_myfftresult = circshift(myfft_result,[-M/2,-N/2]);
myfft_spectrum=log(abs(move_myfftresult)); % abs得到傅里叶频谱
myfft_spectrum = scaling(myfft_spectrum);
imwrite(fft_spectrum, '.\FFT_result\my_fft_result.png');
subplot(2,2,2);
imshow(myfft_spectrum);
title('my fft result');
colorbar;




% ifft by matlab
ifft_result=ifft2(fft_result);
ifft_result = scaling(ifft_result);
imwrite(ifft_result, '.\FFT_result\matlab_ifft_result.png');
subplot(2,2,3);
imshow(ifft_result);
title('matlab ifft result');
colorbar;


% imyfft by my own function
imyfft_result = myFFT2d(myfft_result,1);
imyfft_result= real(imyfft_result);
imyfft_result = scaling(imyfft_result);
imyfft_result = imyfft_result(1:originalM, 1:originalN);
imwrite(imyfft_result, '.\FFT_result\my_ifft_result.png');
subplot(2,2,4);
imshow(imyfft_result);
title('my ifft result');
colorbar;



