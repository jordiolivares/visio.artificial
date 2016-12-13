function [ output_args ] = retrieveKImages( filename, directory, featureFunction)
%RETRIEVEKIMAGES Summary of this function goes here
%   Detailed explanation goes here
    extension = 'jpg';
    folders = dir(fullfile(directory));
    files = [];
    featuresMatrix = [];
    for i = 1:size(folders, 1)
        % Ignore the '.' and '..' paths
        if strcmp(folders(i).name, '.') || strcmp(folders(i).name, '..')
            continue
        end
        featuresMatrix = [featuresMatrix; ...
            getClassFeatures(fullfile(directory, folders(i).name), ...
            extension, featureFunction)];
        filesHere = struct2table(...
            dir(fullfile(directory, folders(i).name, strcat('*.', extension))));
        filesHere = fullfile(directory, folders(i).name, filesHere.name);
        files = [files; ...
            filesHere];
    end
    image = imread(filename);
    featureVector = featureFunction(image);
    neighbors = knnsearch(featuresMatrix, featureVector, 'K', 10);
    figure
    for i = 1:10
        subplot(2, 5, i)
        imshow(imread(files{neighbors(i)}));
        if i == 1
            title('Query image');
        else
            title('Retrieved image ordered by similarity');
        end
    end
end