%图像局部增强
[I,map]=imread('images/elain.bmp');
map(end:255,:)=0;
img=ind2gray(I,map);

[rows,cols]=size(img);
k0=0.5;k1=0.01;k2=0.3;
E=3;
marksize=7;
ex=floor(marksize/2);
imgex=padarray(img,[ex ex],'replicate','both');
quant=rows*cols; % 图像大小
me=mean2(img); %图像均值
stdd=std2(img); %图像标准差
for i=1:rows
    for j=i:cols
        Loc=imgex(i:i+2*ex, j:j+2*ex); %局部区域
        LocMe(i,j)=mean2(Loc);         %局部均值
        LocStdd(i,j)=std2(Loc);        %局部标准差
    end
end
en1=(LocMe<=k0*me); %均值小的部分
en2=(LocStdd>=k1*stdd)&(LocStdd<=k2*stdd); %标准差
en=uint8(en1&en2); %合并
nen=uint8((int8(en)-1)*(-1));
imgc=img.*(E*en); %图像改变部分
imgnc=img.*nen;   %图像不变部分
imgen=imgc+imgnc;
subplot(1,3,1),imshow(img,map);title('源图像','Fontsize',24);
subplot(1,3,2),imshow(imgc);title('增强部分图像','Fontsize',24);
subplot(1,3,3),imshow(imgen);title('增强后图像','Fontsize',24);
