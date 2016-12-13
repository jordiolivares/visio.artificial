function [ output_args ] = retrieveKImages( filename, directory, featureFunction)
%RETRIEVEKIMAGES Retrieves the 10 most similar images to the one given
%using a given feature function
    extension = 'jpg';
    folders = dir(fullfile(directory));
    files = [];
    featuresMatrix = [];
    % We now go through all the subfolders of the dataset (directory) to
    % build the image database
    for i = 1:size(folders, 1)
        % Ignore the '.' and '..' paths to avoid infinite recursion and
        % errors
        if strcmp(folders(i).name, '.') || strcmp(folders(i).name, '..')
            continue
        end
        featuresMatrix = [featuresMatrix; ...
            getClassFeatures(fullfile(directory, folders(i).name), ...
            extension, featureFunction)];
        % Very hacky way of keeping the images' filepaths in memory
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