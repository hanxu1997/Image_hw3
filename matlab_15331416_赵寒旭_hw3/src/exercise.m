clc;
clear;


filter = [0 1 0; 1 0 1; 0 1 0];
filter = 0.25*filter;
filter = fftshift(fft2(filter));


filter = abs(filter);
levels = 0:0.01:1; 
surf(filter), hold on, 
shading interp;
contour3(filter,levels,'k');
set(gca,'clim',[min(levels) max(levels)]);
colormap(jet(numel(levels)-1));
colorbar;


