% 图像分割
[I,map]=imread('images/elain.bmp');
map(end:255,:)=0;
img=ind2gray(I,map);

level=graythresh(img); %确定灰度阈值
imgbi=imbinarize(img,level);

figure(1);
subplot(1,2,1);imshow(img,map);
title('源图像','Fontsize',24);
subplot(1,2,2);imshow(imgbi);
title('分割图像','Fontsize',24);
