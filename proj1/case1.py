import cv2
import numpy as np
import math as mt

def ngray(img, n):
    tmp = img.copy()
    n_img = np.floor(tmp / mt.pow(2, 8-n)) * mt.pow(2, 8-n)

    return n_img

if __name__ == "__main__":
    # 读入lena图
    lena = cv2.imread("images\lena.bmp", cv2.IMREAD_GRAYSCALE)
    rows, cols = lena.shape

    # 按8-1灰度级展开
    for i in range(8, 0, -1):
        new_img = ngray(lena, i)
        new_img = new_img.astype(np.uint8)
        cv2.imwrite("results\gray\lena" + str(i) + ".bmp", new_img)
        cv2.namedWindow("lena" + str(i))
        cv2.imshow("lena" + str(i), new_img)
        cv2.waitKey(0)
    cv2.destroyAllWindows()

    # 计算均值和方差
    (mean, stddev) = cv2.meanStdDev(lena)
    print(mean[0][0])
    print(stddev[0][0])
    print(pow(stddev, 2))

    # 三种方式zoom
    lena_nearest = cv2.resize(lena, (2048, 2048), interpolation=cv2.INTER_NEAREST)
    lena_linear = cv2.resize(lena, (2048, 2048), interpolation=cv2.INTER_LINEAR)
    lena_cubic = cv2.resize(lena, (2048, 2048), interpolation=cv2.INTER_CUBIC)

    cv2.imwrite("results\zoom\lena_nearest.bmp", lena_nearest)
    cv2.imwrite("results\zoom\lena_linear.bmp", lena_linear)
    cv2.imwrite("results\zoom\lena_cubic.bmp", lena_cubic)

    cv2.imshow("results\zoom\lena_nearest", lena_nearest)
    cv2.imshow("results\zoom\lena_linear", lena_linear)
    cv2.imshow("results\zoom\lena_cubic", lena_cubic)

    cv2.waitKey(0)
    cv2.destroyAllWindows()



