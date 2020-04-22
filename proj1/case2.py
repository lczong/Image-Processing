import cv2
import numpy as np
from math import *

if __name__ == "__main__":
    # 读入两幅图片
    lena = cv2.imread("images/lena.bmp", cv2.IMREAD_GRAYSCALE)
    elain = cv2.imread("images/elain1.bmp", cv2.IMREAD_GRAYSCALE)
    rows, cols = lena.shape

    # shear
    m_shear = np.array([[1, 1.5, 0], [0, 1, 0]])  # 设定位1.5的变换矩阵
    # 进行shear操作
    lena_s1 = cv2.warpAffine(lena, m_shear, (int(2.5 * rows), cols), cv2.INTER_NEAREST)
    lena_s2 = cv2.warpAffine(lena, m_shear, (int(2.5 * rows), cols), cv2.INTER_LINEAR)
    lena_s3 = cv2.warpAffine(lena, m_shear, (int(2.5 * rows), cols), cv2.INTER_CUBIC)

    elain_s1 = cv2.warpAffine(elain, m_shear, (int(2.5 * rows), cols), cv2.INTER_NEAREST)
    elain_s2 = cv2.warpAffine(elain, m_shear, (int(2.5 * rows), cols), cv2.INTER_LINEAR)
    elain_s3 = cv2.warpAffine(elain, m_shear, (int(2.5 * rows), cols), cv2.INTER_CUBIC)

    # lena进行zoom
    lena_s_n = cv2.resize(lena_s1, (2048, 2048), interpolation=cv2.INTER_NEAREST)
    lena_s_l = cv2.resize(lena_s2, (2048, 2048), interpolation=cv2.INTER_LINEAR)
    lena_s_c = cv2.resize(lena_s3, (2048, 2048), interpolation=cv2.INTER_CUBIC)
    # elain进行zoom
    elain_s_n = cv2.resize(elain_s1, (2048, 2048), interpolation=cv2.INTER_NEAREST)
    elain_s_l = cv2.resize(elain_s2, (2048, 2048), interpolation=cv2.INTER_LINEAR)
    elain_s_c = cv2.resize(elain_s3, (2048, 2048), interpolation=cv2.INTER_CUBIC)

    # 保存
    cv2.imwrite("results/shear/lena_s_n.bmp", lena_s_n)
    cv2.imwrite("results/shear/lena_s_l.bmp", lena_s_l)
    cv2.imwrite("results/shear/lena_s_c.bmp", lena_s_c)

    cv2.imwrite("results/shear/elain_s_n.bmp", elain_s_n)
    cv2.imwrite("results/shear/elain_s_l.bmp", elain_s_l)
    cv2.imwrite("results/shear/elain_s_c.bmp", elain_s_c)

    # 旋转
    degree = 30  # 设定度数
    # 旋转后的尺寸
    rowsNew = int(cols * fabs(sin(radians(degree))) + rows * fabs(cos(radians(degree))))
    colsNew = int(rows * fabs(sin(radians(degree))) + cols * fabs(cos(radians(degree))))
    # 旋转矩阵
    m_rotation = cv2.getRotationMatrix2D((cols / 2, rows / 2), degree, 1)
    m_rotation[0, 2] += (colsNew - cols) / 2
    m_rotation[1, 2] += (rowsNew - rows) / 2
    # 按大小进行旋转
    lena_r = cv2.warpAffine(lena, m_rotation, (colsNew, rowsNew))
    elain_r = cv2.warpAffine(elain, m_rotation, (colsNew, rowsNew))
    # lena进行zoom
    lena_r_n = cv2.resize(lena_r, (2048, 2048), interpolation=cv2.INTER_NEAREST)
    lena_r_l = cv2.resize(lena_r, (2048, 2048), interpolation=cv2.INTER_LINEAR)
    lena_r_c = cv2.resize(lena_r, (2048, 2048), interpolation=cv2.INTER_CUBIC)
    # elain进行zoom
    elain_r_n = cv2.resize(elain_r, (2048, 2048), interpolation=cv2.INTER_NEAREST)
    elain_r_l = cv2.resize(elain_r, (2048, 2048), interpolation=cv2.INTER_LINEAR)
    elain_r_c = cv2.resize(elain_r, (2048, 2048), interpolation=cv2.INTER_CUBIC)

    # 保存
    cv2.imwrite("results/rotate/lena_r_n.bmp", lena_r_n)
    cv2.imwrite("results/rotate/lena_r_l.bmp", lena_r_l)
    cv2.imwrite("results/rotate/lena_r_c.bmp", lena_r_c)

    cv2.imwrite("results/rotate/elain_r_n.bmp", elain_r_n)
    cv2.imwrite("results/rotate/elain_r_l.bmp", elain_r_l)
    cv2.imwrite("results/rotate/elain_r_c.bmp", elain_r_c)

    cv2.imshow("lena_s1", lena_s1)
    cv2.imshow("lena_s2", lena_s2)
    cv2.imshow("lena_s3", lena_s3)
    cv2.imshow("elain_s1", elain_s1)
    cv2.imshow("elain_s2", elain_s2)
    cv2.imshow("elain_s3", elain_s3)
    cv2.imshow("lena_r", lena_r)
    cv2.imshow("elain_r", elain_r)
    cv2.waitKey(0)
    cv2.destroyAllWindows()




