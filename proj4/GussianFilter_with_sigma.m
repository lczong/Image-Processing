% sigma=1.5的生成高斯滤波器
[img,map]=imread('images/test2.tif','tif');  
m=3;n=3;
sigma1=1.5;sigma2=1.5;
theta=0;  
r=[cos(theta),-sin(theta);sin(theta),cos(theta)]; 
for i=1:n     
    for j=1:m       
        tt=r*[j-(m+1)/2,i-(n+1)/2]'; 
        w(i,j)=exp(-tt(1)^2/(2*sigma1^2))/(sigma1*sqrt(2*pi))*exp(-tt(2)^2/(2 *sigma2^2))/(sigma2*sqrt(2*pi));           
    end
end
w=w/sqrt(sum(sum(w.*w)));
img1=conv2(double(img),double(w),'same'); 
figure(1);imshow(img);
title('test2原始图像','Fontsize',17); 
colormap(gray);
figure(2);imshow(img1,map);
title('test2高斯滤波图像(模板3x3,sigma=1.5)','Fontsize',17); 
colormap(gray);
