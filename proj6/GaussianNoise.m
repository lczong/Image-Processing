[img,map]=imread('images/lena.bmp');
figure(1);
subplot(2,2,1);
imshow(img);
title('原始图像','Fontsize',24);
img1=imnoise(img,'gaussian',0,0.01);
subplot(2,2,2);
imshow(img1,map);
title('加入Gaussian噪声图像','Fontsize',24);

h1=fspecial('average',[3 3]); % 建立一个3*3模板的高斯滤波器
img2=imfilter(img1,h1,'conv');
subplot(2,2,3);
imshow(img2,map);
title('均值滤波后图像','Fontsize',24);

img3=medfilt2(img1,[3 3]); 
subplot(2,2,4),imshow(img1,map);
title('中值滤波后图像','Fontsize',24);