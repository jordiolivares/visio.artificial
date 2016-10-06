function [] = ej21()
%EJ21 Summary of this function goes here
%   Detailed explanation goes here
    close all;
    im = imread('face.png');
    imGray = rgb2gray(im);
    resizedIm = imresize(imGray, 2);
    mask_hor = [1 1 1 1 1];
    mask_hor = mask_hor / sum(mask_hor);
    
    smoothedGray1D_hor = imfilter(imGray, mask_hor);
    for i = 1:300
        smoothedGray1D_hor = imfilter(smoothedGray1D_hor, mask_hor);
    end
    
    mask_ver = [1; 1; 1; 1; 1;];
    mask_ver = mask_ver / sum(mask_ver);
    smoothedGray1D_ver = imfilter(imGray, mask_ver);
    for i = 1:30
        smoothedGray1D_ver = imfilter(smoothedGray1D_ver, mask_ver);
    end
    
    figure, subplot(3,4,2),imshow(im, []), title('Original image'),...
    subplot(3,4,5),imshow(imGray),  title('Gray image'),...
    subplot(3,4,6),imshow(resizedIm),title('Resized image'),...
    subplot(3,4,7),imshow(uint8(smoothedGray1D_hor)),title('Smoothed image'),...
    subplot(3,4,9),imhist(imGray), title('Histogram of Original im.'), ...
    subplot(3,4,10),imhist(resizedIm),title('Histogram of resized im.'),...
    subplot(3,4,11),imhist(uint8(smoothedGray1D_hor)),title ('Histogram of smoothed image');
    
    inverseGaussian = 1 ./ fspecial('gaussian', 1);
    figure
    imshow(imfilter(imGray, inverseGaussian));
    
    
end
