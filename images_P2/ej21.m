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
    for i = 1:30 % B)
        smoothedGray1D_hor = imfilter(smoothedGray1D_hor, mask_hor);
    end
    
    mask_ver = [1; 1; 1; 1; 1;];
    mask_ver = mask_ver / sum(mask_ver);
    smoothedGray1D_ver = imfilter(imGray, mask_ver);
    for i = 1:30
        smoothedGray1D_ver = imfilter(smoothedGray1D_ver, mask_ver);
    end
    
    figure, subplot(3,3,2),imshow(im, []), title('Original image'),...
    subplot(3,3,4),imshow(imGray),  title('Gray image'),...
    subplot(3,3,5),imshow(resizedIm),title('Resized image'),...
    subplot(3,3,6),imshow(uint8(smoothedGray1D_hor)),title('Smoothed image'),...
    subplot(3,3,7),imhist(imGray), title('Histogram of Original im.'), ...
    subplot(3,3,8),imhist(resizedIm),title('Histogram of resized im.'),...
    subplot(3,3,9),imhist(uint8(smoothedGray1D_hor)),title ('Histogram of smoothed image');
    
    % C)
    figure
    subplot(2,1,1)
    imshow(smoothedGray1D_hor)
    subplot(2,1,2)
    imshow(smoothedGray1D_ver)
    
    % D) begin
    im = imread('corals.jpg');
    imGray = rgb2gray(im);
    resizedIm = imresize(imGray, 2);
    
    smoothedGray1D_hor = imfilter(imGray, mask_hor);
    for i = 1:30 % B)
        smoothedGray1D_hor = imfilter(smoothedGray1D_hor, mask_hor);
    end
    
    smoothedGray1D_ver = imfilter(imGray, mask_ver);
    for i = 1:30
        smoothedGray1D_ver = imfilter(smoothedGray1D_ver, mask_ver);
    end
    
    figure, subplot(3,3,2),imshow(im, []), title('Original image'),...
    subplot(3,3,4),imshow(imGray),  title('Gray image'),...
    subplot(3,3,5),imshow(resizedIm),title('Resized image'),...
    subplot(3,3,6),imshow(uint8(smoothedGray1D_hor)),title('Smoothed image'),...
    subplot(3,3,7),imhist(imGray), title('Histogram of Original im.'), ...
    subplot(3,3,8),imhist(resizedIm),title('Histogram of resized im.'),...
    subplot(3,3,9),imhist(uint8(smoothedGray1D_hor)),title ('Histogram of smoothed image');
    
    % C)
    figure
    subplot(2,1,1)
    imshow(smoothedGray1D_hor)
    subplot(2,1,2)
    imshow(smoothedGray1D_ver)
    
    % D) end
    
    im = imread('face.png');
    imGray = rgb2gray(im);
    resizedIm = imresize(imGray, 2);
    
    % E)
    our_mask_a = ones(10); % 10x10
    our_mask_a = our_mask_a ./ sum(sum(our_mask_a));
    our_mask_b = ones(5);
    our_mask_b = our_mask_b ./ sum(sum(our_mask_b));
    
    figure
    subplot(1,2,1)
    imshow(imfilter(imGray, our_mask_a))
    title ('10x10');
    subplot(1,2,2)
    imshow(imfilter(imGray, our_mask_b))
    title('5x5');
    
    mask_a = [1 1 1 1 1; 1 1 1 1 1];
    mask_b = ones(5);
    
    figure
    subplot(1,2,1)
    imshow(imfilter(imGray, mask_a))
    title('Sin normalizar');
    subplot(1,2,2)
    mask_a = mask_a ./ sum(sum(mask_a));
    imshow(imfilter(imGray, mask_a))
    title('Normalizado');


    
    figure
    subplot(1,2,1)
    imshow(imfilter(imGray, mask_b))
    title('Sin normalizar');
    subplot(1,2,2)
    mask_b = mask_b ./ sum(sum(mask_b));
    imshow(imfilter(imGray, mask_b))
    title('Normalizado');

    
end

