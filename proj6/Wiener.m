img=imread('images/lena.bmp');
H=fspecial('motion',50,45);
img1=imfilter(img,H,'circular','conv');
figure(1);
imshow(img1);
title('运动模糊后的lena.bmp(角度为45度)');
img2=imnoise(img1,'gaussian',0,0.01);
figure(2)
imshow(img2);
title('加噪并模糊的');
% figure(3);
% noise=imnoise(zeros(size(img)),'gaussian',0,0.01);
% NSR=sum(noise(:).^2)/sum(im2double(img(:)).^2);
% img3=deconvwnr(img2,H,NSR);
% imshow(img3);
% title('维纳滤波的结果');

