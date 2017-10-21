clc;
clear;
input_img = imread('16.png');

% fft by matlab
fft_result=fft2(input_img);
[M,N] = size(fft_result);
move_fftresult = circshift(fft_result,[-M/2,-N/2]);
fft_spectrum=log(abs(move_fftresult)); % abs得到傅里叶频谱
figure(2);
subplot(1,2,1);
fft_spectrum = scaling(fft_spectrum);
imwrite(fft_spectrum, '.\fourier_result\matlab_fft_spectrum.png');
imshow(fft_spectrum);
colorbar;

% dft2d by my own function
dft_result=dft2d(input_img,0);
move_dftresult = circshift(dft_result,[-M/2,-N/2]);
dft_spectrum=log(abs(move_dftresult)); % abs得到傅里叶频谱
subplot(1,2,2);
dft_spectrum = scaling(dft_spectrum);
imwrite(dft_spectrum, '.\fourier_result\my_dft_spectrum.png');
imshow(dft_spectrum);
colorbar;


% ifft by matlab
ifft_result=ifft2(fft_result);
figure(3);
subplot(1,2,1);
ifft_result = scaling(ifft_result);
imwrite(ifft_result, '.\fourier_result\matlab_ifft_result.png');
imshow(ifft_result);
colorbar;


% idft by my own function
idft_result = dft2d(dft_result,1);
figure(3);
subplot(1,2,2);
idft_result= real(idft_result);
idft_result = scaling(idft_result);
imwrite(idft_result, '.\fourier_result\my_idft_result.png');
imshow(idft_result);
colorbar;




