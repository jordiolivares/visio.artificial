function [ featuresMatrix ] = getClassFeatures( directory, extension, featureFunction )
%GETCLASSFEATURES Summary of this function goes here
%   Detailed explanation goes here
    files = dir(fullfile(directory, strcat('*.', extension)));
    im = imread(fullfile(directory, files(1).name));
    tmp = featureFunction(im);
    featuresMatrix = zeros(size(files, 1), size(tmp, 2));
    featuresMatrix(1, :) = tmp;
    for i = 2:size(files, 1)
        im = imread(fullfile(directory, files(i).name));
        featuresMatrix(i, :) = featureFunction(im);
    end
end

