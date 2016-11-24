function [ featuresVector ] = getFeatures( image )
%GETFEATURES Summary of this function goes here
%   Detailed explanation goes here
    F = makeLMfilters();
    greyImage = rgb2gray(image);
    featuresVector = zeros(1, size(F, 3) + 3);
    for i = 1:size(F, 3)
        featuresVector(i) = calculateFeature(F(:,:,i), greyImage);
    end
    R = image(:,:,1);
    G = image(:,:,2);
    B = image(:,:,3);
    featuresVector(end-2) = mean(R(:));
    featuresVector(end-1) = mean(G(:));
    featuresVector(end) = mean(B(:));
end

function [meanConvolution] = calculateFeature(convolution, image)
    numPixels = numel(image);
    meanConvolution = sum(sum(imfilter(image, convolution))) / numPixels;
end