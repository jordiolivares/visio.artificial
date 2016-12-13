function [ featuresVector ] = getFeatures( image )
%GETFEATURES Summary of this function goes here
%   Detailed explanation goes here
    F = makeLMfilters();
    greyImage = rgb2gray(image);
    featuresVector = zeros(1, size(F, 3));
    for i = 1:size(F, 3)
        featuresVector(i) = calculateFeature(F(:,:,i), greyImage);
    end
    
end

function [meanConvolution] = calculateFeature(convolution, image)
    convoluted = conv2(double(image), convolution, 'same');
    meanConvolution = mean(convoluted(:));
end