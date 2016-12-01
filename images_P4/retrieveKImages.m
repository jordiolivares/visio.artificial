function [ output_args ] = retrieveKImages( filename, directory, featureFunction)
%RETRIEVEKIMAGES Summary of this function goes here
%   Detailed explanation goes here
    extension = 'jpg';
    files = dir(fullfile(directory, strcat('*.', extension)));
    featuresMatrix = getClassFeatures(directory, extension, featureFunction);
    image = imread(filename);
    featureVector = featureFunction(image);
    neighbors = knnsearch(featuresMatrix, featureVector, 'K', 10);
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