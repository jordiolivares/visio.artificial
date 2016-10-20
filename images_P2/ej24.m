function [] = ej24()
%EJ24 Summary of this function goes here
%   Detailed explanation goes here
    einstein = imread('einstein.jpg');
    monroe = imread('monroe.jpg');
    h_monroe = hybrid(monroe, einstein, 6, 10);
    background = zeros(size(h_monroe), 'uint8');
    figure
    subplot(3,3,1)
    imshow(einstein);
    subplot(3,3,2)
    imshow(monroe);
    subplot(3,3,3)
    imshow(h_monroe);
    subplot(3,3,4)
    imshow(paste(background, imresize(h_monroe, 0.8)));
    subplot(3,3,5)
    imshow(paste(background, imresize(h_monroe, 0.7)));
    subplot(3,3,6)
    imshow(paste(background, imresize(h_monroe, 0.6)));
    subplot(3,3,7)
    imshow(paste(background, imresize(h_monroe, 0.5)));
    subplot(3,3,8)
    imshow(paste(background, imresize(h_monroe, 0.4)));
    subplot(3,3,9)
    imshow(paste(background, imresize(h_monroe, 0.3)));
end

function [result] = highpass(image, sigma)
    lowpass = imgaussfilt(image, sigma);
    result = image - lowpass;
end

function [image] = paste(background, foreground)
    image = background;
    sizes = size(foreground);
    image(1:sizes(1), 1:sizes(2)) = foreground;
end

function [image] = hybrid(image1, image2, sigma1, sigma2)
    lowpass = imgaussfilt(image1, sigma1);
    image = lowpass + highpass(image2, sigma2);
end