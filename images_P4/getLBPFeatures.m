function [ texture_feature_vector ] = getLBPFeatures( filename )
%GETLBPFEATURES Summary of this function goes here
%   Detailed explanation goes here
    original_image = imread(filename);
    image = rgb2gray(original_image);
    histograms = vl_lbp(single(image), 8);
    texture_feature_vector = mean(histograms, 3);
end