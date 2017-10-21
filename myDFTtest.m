clc;
clear;
input_img = imread('16.png');

% fft by matlab
fft_result=fft2(input_img);
[M,N] = size(fft_result);
move_fftresult = circshift(fft_result,[-M/2,-N/2]);
fft_spectrum=log(abs(move_fftresult)); % abs得到傅里叶频谱
fft_spectrum = scaling(fft_spectrum);
imwrite(fft_spectrum, '.\DFT_result\matlab_fft_spectrum.png');
figure(2);
subplot(2,2,1);
imshow(fft_spectrum);
title('matlab fft result');
colorbar;

% dft2d by my own function
dft_result=dft2d(input_img,0);
move_dftresult = circshift(dft_result,[-M/2,-N/2]);
dft_spectrum=log(abs(move_dftresult)); % abs得到傅里叶频谱
dft_spectrum = scaling(dft_spectrum);
imwrite(dft_spectrum, '.\DFT_result\my_dft_spectrum.png');
subplot(2,2,2);
imshow(dft_spectrum);
title('my dft result');
colorbar;


% ifft by matlab
ifft_result=ifft2(fft_result);
ifft_result = scaling(ifft_result);
imwrite(ifft_result, '.\DFT_result\matlab_ifft_result.png');
subplot(2,2,3);
imshow(ifft_result);
title('matlab ifft result');
colorbar;


% idft by my own function
idft_result = dft2d(dft_result,1);
idft_result= real(idft_result);
idft_result = scaling(idft_result);
imwrite(idft_result, '.\DFT_result\my_idft_result.png');
subplot(2,2,4);
imshow(idft_result);
title('my idft result');
colorbar;




