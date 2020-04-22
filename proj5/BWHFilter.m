function [alpha] = BWHFilter(img,D0,n_b)
%  butterworth高通滤波器
%  n_b和D0是butterworth滤波器的参数
f=double(img); 
F=fft2(f);     % 傅里叶变换   
F=fftshift(F); % 移动中心   
[P,Q]=size(F); % 大小是PxQ

for u=1:P
    for v=1:Q
        D(u,v)=sqrt((u-fix(P/2))^2+(v-fix(Q/2))^2);
        H(u,v)=1/(1+(D0/D(u,v))^(2*n_b)); 
        G(u,v)=H(u,v)*F(u,v);
    end
end
g=ifftshift(G);      
g=ifft2(g);       % 傅里叶逆变换
g=uint8(real(g)); % 取实部并取整

% 滤波前后图像
figure;
subplot(1,2,1);imshow(img);
title('原始图像','Fontsize',17);
subplot(1,2,2);imshow(g);
title('butterworth滤波图像','Fontsize',17); 

%绘制频谱图
figure;
subplot(1,3,1);
imshow(abs(255.*F./max(max(F))));
title('原始图像的傅里叶谱','Fontsize',17);
subplot(1,3,2);
imshow(abs(H));
title(['滤波器的傅里叶谱（D0=',num2str(D0),')'],'Fontsize',17);
subplot(1,3,3);
imshow(abs(255.*G./max(max(G))));
title('滤波后图像的傅里叶谱','Fontsize',17);

%计算功率谱比
P_F=0;  % 原始图像
P_G=0;  % 滤波后图像
for u=1:P
    for v=1:Q
        P_Gi=(abs(G(u,v)))^2;  
        P_G=P_G+P_Gi;
        P_Fi=(abs(F(u,v)))^2;  
        P_F=P_F+P_Fi;
    end
end
alpha=P_G/P_F;
end

