clc;clear;
[img,map]=imread('images/lena.bmp');
img=double(img); 
F=fftshift(fft2(img)); % 原图的傅里叶谱F
[M,N]=size(F); 
figure(1);
subplot(1,2,1);imshow(img,map);title('原始图像','Fontsize',24) ;
% (b)模糊lena图像：45度方向，T=1；
u=1:M;v=1:N; 
[u,v]=meshgrid(u,v); % 生成网格空间
a=0.05;b=0.05;T=1; % 给出a,b,T的值
s=(u-M/2-1).*a+(v-N/2-1).*b+eps; 
H=T.*sin(pi.*s).*exp(-1i.*pi.*s)./(pi.*s); % 求出退化函数H
G=H'.*F; % 求出退化后图像的功率谱G
g=abs(ifft2(G)); % 求出退化后图像
subplot(1,2,2);imshow(g,map);title('模糊退化图像','Fontsize',24);
% (c)在模糊的lena图像中增加高斯噪声，均值=0 ，方差=10 pixels 以产生模糊图像
noise=10*imnoise(zeros(M,N),'gaussian',0,10); % 生成高斯噪声 
figure(2);
subplot(1,2,1);imshow(noise,[]);title('高斯白噪声','Fontsize',24) ;
g=g+noise; 
subplot(1,2,2);imshow(g,map);title('模糊退化+高斯噪声图像','Fontsize',24);
% (d)分别利用方程 Eq. (5.8-6)和(5.9-4)，恢复图像
% 维纳滤波恢复
Sn=fftshift(fft2(noise)); % 噪声的功率谱
K=Sn.*conj(Sn)./(F.*conj(F)); % 计算K值=噪声功率谱/未退化函数功率谱  
W=(H.*conj(H))'.*G./(H.*(H.*conj(H)+K'))'; % 利用公式5.8-6进行维纳滤波,计算出恢复图像功率谱W
wiener=abs(ifft2(W)); 
figure(3);
subplot(1,2,1);imshow(wiener,map);title('维纳滤波恢复图像','Fontsize',24);
% 约束最小二乘方滤波
p=[0,-1,0;-1,4,-1;0,-1,0]; % p矩阵
P=psf2otf(p,[M,N]); % 傅里叶变换到MxN大小
gama=0.00001;
Y=conj(H).*G./(H.*conj(H)+gama*P.*conj(P)); 
subplot(1,2,2);imshow(abs(ifft2(Y)),map);title('约束最小二乘方滤波恢复图像','Fontsize',24);