function [ featuresMatrix ] = getClassFeatures( directory, extension )
%GETCLASSFEATURES Summary of this function goes here
%   Detailed explanation goes here
    files = dir(fullfile(directory, strcat('*.', extension)));
    featuresMatrix = zeros(size(files, 1), 51);
    for i = 1:size(files, 1)
        im = imread(fullfile(directory, files(i).name));
        featuresMatrix(i, :) = getFeatures(im);
    end
end

