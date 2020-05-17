%直方图匹配增强
[i1,map]=imread('images/woman2.bmp');
map(end:255,:)=0;
img=ind2gray(i1,map)
[i2,map_m]=imread('woman.bmp');
map_m(end:255,:)=0;
img_m=ind2gray(i2,map_m);

J=imhist(img_m);
Iout=histeq(img,J);
figure(1);
subplot(1,3,1),imshow(img,map);title('源图像','Fontsize',24);
subplot(1,3,2),imshow(img_m);title('匹配图像','Fontsize',24);
subplot(1,3,3),imshow(Iout);title('匹配之后图像','Fontsize',24);
figure(2);
subplot(3,1,1),imhist(img,64);title('源图像直方图','Fontsize',18);
subplot(3,1,2),imhist(img_m,64);title('匹配图像图像直方图','Fontsize',18);
subplot(3,1,3),imhist(Iout,64);title('匹配之后图像直方图','Fontsize',18);