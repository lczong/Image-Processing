%直方图均衡化
[img,map]=imread('images/lena.bmp');
map(end:255,:)=0;
img_eq=histeq(img,256);
figure(1);
subplot(1,2,1);imshow(img,map);
title('原图像');
subplot(1,2,2);imshow(img_eq,map);
title('直方图均衡化后图像');

figure(2);
subplot(1,2,1);imhist(img,map);
title('原图像直方图');
subplot(1,2,2);imhist(img_eq,map);
title('直方图均衡化后图像直方图');
