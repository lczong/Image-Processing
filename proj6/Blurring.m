I=imread('images/lena.bmp');
figure(1);
imshow(I);
title('原始图像');
f=double(I);     
F=fft2(f);      
F=fftshift(F);   
[M,N]=size(F);
a=10;b=10;T=1;
for u=1:M
    for v=1:N     
        H(u,v)=(T/(pi*(u*a/M+v*b/N)))*sin(pi*(u*a/M+v*b/N))*exp(-sqrt(-1)*pi*(u*a/M+v*b/N));
%        H(u,v)=(T/(pi*(u*a+v*b)))*sin(pi*(u*a+v*b))*exp(-1j*pi*(u*a+v*b));
        G(u,v)=H(u,v)*F(u,v);
    end
end
G=ifftshift(G);
g=ifft2(G);
% g=256.*g./max(max(g));
g=uint8(abs(g));
figure(2);
imshow(g);
figure(3);
imshow(H);
title('运动模糊化lena.bmp');
