%求图像的直方图
[img,map]=imread('images/lena.bmp');
map(end:255,:)=0;
figure(1);
imhist(img,map);
%axis([0 255 0 3000]); 
title('lena直方图');

h=imhist(img,map);
h1=h(1:10:256);
horz=1:10:256;
figure(2);
bar(horz, h1);
%axis([0 255 0 3000]); 
title('lena直方图条形显示');
