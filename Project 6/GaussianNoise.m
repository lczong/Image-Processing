% 第一题
clc;clear;
img=imread('images/lena.bmp');
figure(1);
subplot(2,2,1);
imshow(img);
title('原始图像','Fontsize',24);
img1=imnoise(img,'gaussian',0,0.05);
subplot(2,2,2);imshow(img1);
title('加入Gaussian噪声图像','Fontsize',24);

h1=fspecial('average',[5 5]); % 建立一个5*5模板的均值滤波器
img2=imfilter(img1,h1,'conv');
subplot(2,2,3);imshow(img2);
title('均值滤波后图像','Fontsize',24);

img3=medfilt2(img1,[5 5]); % 5*5模板的中值滤波
subplot(2,2,4);imshow(img3);
title('中值滤波后图像','Fontsize',24);