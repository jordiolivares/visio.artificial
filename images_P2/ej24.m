function [] = ej24()
%EJ24 Summary of this function goes here
%   Detailed explanation goes here
    einstein = imread('einstein.jpg');
    monroe = imread('monroe.jpg');
    imshow(hybrid(monroe, einstein, 6, 10));
end

function [result] = highpass(image, sigma)
    lowpass = imgaussfilt(image, sigma);
    result = image - lowpass;
end

function [image] = hybrid(image1, image2, sigma1, sigma2)
    lowpass = imgaussfilt(image1, sigma1);
    image = lowpass + highpass(image2, sigma2);
end