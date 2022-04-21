%
% hw031.m
%
% problem 1: perform histogram equalization on each image
%
%
fid=fopen('johnny.bin','r'); j=fread(fid,[256,256],'uchar'); F=j'; scale=
4.0; F = imresize(F,scale,'bicubic');
%
fig = 1;
figure(fig)
imshow(F,colormap(gray(256)))
title('Original Image')
%
fig = fig+1;
hJ = imhist(j,256);
figure(fig)
bar([0:255],hJ)
title('Original Histogram of Johnny')
%
E=fft2(j);
F2 = fftshift(E);
F2=log(1+abs(F2));
fig = fig+1;
figure(fig)
imshow(F2,[])
title('Equalized Image')
%
fig = fig+1;
hJ = histeq(j,256);
figure(fig)
bar([0:255],hJ)
title('Equalized Histogram of Johnny')
%% Reorder the figures from 1 on top down to the last figure on bottom%
set(0,'Children',sort(double(get(0,'Children'))));

%
% hw032.m
%
% problem 2: implement a binary morphological opening and closing on each image
%
%
%fid=fopen('cameraB.bin','r'); in=fread(fid,[256,256],'uchar'); F=in';
cp=256;scale = 4.0; F = imresize(F,scale,'bicubic');struct =
strel('disk',5);
%fid=fopen('carB.bin','r'); in=fread(fid,[256,256],'uchar'); F=in';
cp=256;scale = 4.0; F = imresize(F,scale,'bicubic');struct =
strel('disk',3);
%fid=fopen('loisB-1.bin','r'); in=fread(fid,[256,256],'uchar'); F=in';
cp=256;scale = 4.0; F = imresize(F,scale,'bicubic');struct =
strel('disk',3);
%fid=fopen('actontownB.bin','r'); in=fread(fid,[256,256],'uchar');
F=in'; cp=256;scale = 4.0; F = imresize(F,scale,'bicubic');struct =
strel('disk',5);
%
%
fig = 1; figure(fig)
imshow(F,colormap(gray(cp)))
title('Original Image')
%
fig = fig+1;
figure(fig)
OPEN=imopen(F,struct);
imshow(OPEN)
title('Open Result Image')
%
fig = fig+1;
figure(fig)
CLOSE=imclose(F,struct);
imshow(CLOSE)
title('Close Result Image')
%% Reorder the figures from 1 on top down to the last figure on bottom%
set(0,'Children',sort(double(get(0,'Children'))));
