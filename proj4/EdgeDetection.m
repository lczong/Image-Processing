% ±ßÔµ¼ì²â
[img,map]=imread('images/test3_corrupt.pgm','pgm');

img1=edge(img,'sobel'); %SobelËã×Ó±ßÔµ¼ì²â
img2=edge(img,'log');   %À­ÆÕÀ­Ë¹Ëã×Ó±ßÔµ¼ì²â
img3=edge(img,'canny'); %CannyËã·¨±ßÔµ¼ì²â

figure(1);
subplot(1,2,1),imshow(img,map);
title('test3Ô­Ê¼Í¼Ïñ','Fontsize',36);
subplot(1,2,2),imshow(img1);
title('test3 Sobel','Fontsize',36);

figure(2);
subplot(1,2,1),imshow(img,map);
title('test3Ô­Ê¼Í¼Ïñ','Fontsize',36);
subplot(1,2,2),imshow(img2);
title('test3 Laplace','Fontsize',36);

figure(3);
subplot(1,2,1),imshow(img,map);
title('test3Ô­Ê¼Í¼Ïñ','Fontsize',36);
subplot(1,2,2),imshow(img3);
title('test3 Canny','Fontsize',36);

