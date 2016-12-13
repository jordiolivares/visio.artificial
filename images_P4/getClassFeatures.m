function [ featuresMatrix ] = getClassFeatures( directory, extension, featureFunction )
%GETCLASSFEATURES Creates the features matrix of all the images in a
%directory
    files = dir(fullfile(directory, strcat('*.', extension)));
    im = imread(fullfile(directory, files(1).name));
    tmp = featureFunction(im);
    % preallocate memory for the matrix and add the first processed image
    featuresMatrix = zeros(size(files, 1), size(tmp, 2));
    featuresMatrix(1, :) = tmp;
    % do the rest of images
    for i = 2:size(files, 1)
        im = imread(fullfile(directory, files(i).name));
        featuresMatrix(i, :) = featureFunction(im);
    end
end

