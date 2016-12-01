function [ texture_feature_vector ] = getLBPFeatures( image )
%GETLBPFEATURES Summary of this function goes here
%   Detailed explanation goes here
    img = rgb2gray(image);
    histograms = vl_lbp(single(img), 8);
    texture_feature_vector = mean(histograms, 3);
end