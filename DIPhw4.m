%
% hw041.m
%
% problem 1: Compute the circular convolution of the average and square and compute the centered log-magnitude spectrum
%
clear; clc; close all;
%
fid=fopen('lena-1.bin','r'); in=fread(fid,[256,256],'uchar'); F=in';
cp=256;scale = 4.0; F = imresize(F,scale,'bicubic');struct =
strel('square',7);
%
%
fig = 1; figure(fig)
imshow(F,colormap(gray(cp)))
title('Original Image')
%
fig = fig+1;
figure(fig)
lev = 3;
wname = 'sym4';
dwtmode('zpd','nodisp')
[c,s] = wavedec2(F,lev,wname);
a = wrcoef2('a',c,s,wname,lev);
%nbcol = size(map,1);
image(wcodemat(a))
title('Filtered Image')
%
%
fig = fig+1;
figure(fig)
fftOriginal = fft2(double(F));
shiftedFFT = fftshift(fftOriginal);
shiftedFFTMagnitude = abs(shiftedFFT);
imshow(log(abs(shiftedFFTMagnitude)),[]);
title('Log-Magntude Spectrum Image')
%% Reorder the figures from 1 on top down to the last figure on bottom%
set(0,'Children',sort(double(get(0,'Children'))));
%
  
%
% hw042.m
%
% problem 2: apply the median, morph. open, and morph. close to "camera9.bin"
%
clear; clc; close all;
%
%fid=fopen('camera9.bin','r'); in=fread(fid,[256,256],'uchar'); F=in';
cp=256;scale = 4.0; F = imresize(F,scale,'bicubic');struct =
strel('square',3);
fid=fopen('camera99.bin','r'); in=fread(fid,[256,256],'uchar'); F=in';
cp=256;scale = 4.0; F = imresize(F,scale,'bicubic');struct =
strel('square',3);
%
%
fig = 1; figure(fig)
imshow(F,colormap(gray(cp)))
title('Original Image')
%
fig = fig+1;
figure(fig)
GMF=medfilt2(F,[3 3]);
imshow(GMF,colormap(gray(cp)))
title('Grayscale Median Filter Result Image')
%
fig = fig+1;
figure(fig)
OPEN=imopen(F,struct);
imshow(OPEN,colormap(gray(cp)))
title('Open Result Image')
%
fig = fig+1;
figure(fig)
CLOSE=imclose(F,struct);
imshow(CLOSE,colormap(gray(cp)))
title('Close Result Image')
%% Reorder the figures from 1 on top down to the last figure on bottom%
set(0,'Children',sort(double(get(0,'Children'))));
%
