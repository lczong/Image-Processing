% 中值滤波
[img,map]=imread('images/test1.pgm','pgm');

subplot(2,2,1),imshow(img,map);
title('test1原始图像','Fontsize',24);

img1=medfilt2(img,[3 3]); 
subplot(2,2,2),imshow(img1,map);
title('test1中值滤波平滑(模板3x3)','Fontsize',24);

img2=medfilt2(img,[5 5]); 
subplot(2,2,3),imshow(img2,map);
title('test1中值滤波平滑(模板5x5)','Fontsize',24);

img3=medfilt2(img,[7 7]); 
subplot(2,2,4),imshow(img3,map);
title('test1中值滤波平滑(模板7x7)','Fontsize',24);

