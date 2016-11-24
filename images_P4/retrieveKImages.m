function [ output_args ] = retrieveKImages( filename, directory )
%RETRIEVEKIMAGES Summary of this function goes here
%   Detailed explanation goes here
    extension = 'jpg';
    files = dir(fullfile(directory, strcat('*.', extension)));
    featuresMatrix = getClassFeatures(directory, extension);
    image = imread(filename);
    neighbors = getKNeighbors(image, featuresMatrix);
    figure
    for i = 1:10
        subplot(2, 5, i)
        imshow(imread(fullfile(directory, files(neighbors(i)).name)));
        if i == 1
            title('Query image');
        else
            title('Retrieved image ordered by similarity');
        end
    end
end

function [neighborsIndex] = getKNeighbors(image, featuresMatrix)
    featureVector = getFeatures(image);
    neighborsIndex = knnsearch(featuresMatrix, featureVector, 'K', 10);
end