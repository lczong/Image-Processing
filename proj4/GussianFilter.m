% 高斯滤波
[img,map]=imread('images/test2.tif','tif');

subplot(2,2,1);
imshow(img,map);
title('test2原始图像','Fontsize',24);

h1=fspecial('gaussian',[3 3],1);%建立一个3*3模板的高斯滤波器
img1=imfilter(img,h1,'conv');
subplot(2,2,2);
imshow(img1,map);
title('test2高斯滤波平滑(模板3x3)','Fontsize',24);

h2=fspecial('gaussian',[5 5],1);%建立一个5*5模板的高斯滤波器
img2=imfilter(img,h2,'conv');
subplot(2,2,3);
imshow(img2,map);
title('test2高斯滤波平滑(模板5x5)','Fontsize',24);

h3=fspecial('gaussian',[7 7],1);%建立一个7*7模板的高斯滤波器
img3=imfilter(img,h3,'conv');
subplot(2,2,4);
imshow(img2,map);
title('test1高斯滤波平滑(模板7x7)','Fontsize',24);