img=imread('images/lena.bmp');
figure(1);
subplot(2,2,1);
imshow(img);
title('原始图像','fontsize',15);
img2=imnoise(img,'salt & pepper',0.1);
subplot(2,2,2);
imshow(img2);
title('加入椒盐噪声图像','fontsize',15);

h1=fspecial('gaussian',[3 3],1);%建立一个3*3模板的高斯滤波器
img2=imfilter(img1,h1,'conv');
subplot(2,2,3);
imshow(img2,map);
title('Gaussian滤波后图像','Fontsize',24);

img3=medfilt2(img1,[5 5]); 
subplot(2,2,4),imshow(img1,map);
title('中值滤波后图像','Fontsize',24);