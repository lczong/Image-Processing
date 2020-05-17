function LapFilter(img)
%   Laplacian算子滤波器
f=double(img); 
F=fft2(f);     % 傅里叶变换   
F=fftshift(F); % 移动中心   
[P,Q]=size(F); % 大小是PxQ

for u=1:P
    for v=1:Q
        D(u,v)=sqrt((u-fix(P/2))^2+(v-fix(Q/2))^2);
        H(u,v)=-4*pi^2*D(u,v)^2; 
        FF(u,v)=H(u,v)*F(u,v);
    end
end
% 归一化
ff=ifftshift(FF);
ff=ifft2(ff);
ff=real(ff);
f_max=max(max(real(f)));
for u=1:P
    for v=1:Q
        g(u,v)=f(u,v)/f_max+ff(u,v);
    end
end
k=255/max(max(real(g)));
g=uint8(real(g*k)); % 取实部并取整
G=fft2(g);        
G=fftshift(G); 

% 滤波前后图像
figure;
subplot(1,2,1);imshow(img);
title('原始图像','Fontsize',17);
subplot(1,2,2);imshow(g);
title('拉普拉斯算子滤波图像','Fontsize',17); 

%绘制频谱图
figure;
subplot(1,2,1);
imshow(abs(255.*F./max(max(F))));
title('原始图像的傅里叶谱','Fontsize',17);
subplot(1,2,2);
imshow(abs(255.*G./max(max(G))));
title('滤波后图像的傅里叶谱','Fontsize',17);

end