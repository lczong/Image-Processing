%图像配准
img_fixed=imread('images/Image A.jpg');
img_moving=imread('images/Image B.jpg');
cpselect(img_moving,img_fixed); %选择控制点

O=ones(1,7);
Q=[fixedPoints';O];
P=[movingPoints';O];
H=Q*P'/(P*P'); %求出转换矩阵
H(3,1)=0;
H(3,2)=0;
H(3,3)=1;
Ht=H';

%tform=fitgeotrans(movingPoints, fixedPoints, 'affine');
tform=affine2d(Ht);
img_moved=imwarp(img_moving,tform); %进行仿射变换

figure
subplot(1,2,1),imshow(img_moved);
title('配准图像');
subplot(1,2,2),imshow(img_fixed);
title('原图');
