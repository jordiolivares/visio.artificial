function [ output_args ] = ej53( input_args )
%EJ53 Summary of this function goes here
%   Detailed explanation goes here
    addpath('ViolaJones','ViolaJones/SubFunctions');
    % a)
    [X, Y] = getDataBase([20 20]);
    X = uint8(round(reshape(mean(X), [20 20])));
    % b)
    showIntegralImage(imread('images/landscape.jpg'));
    showIntegralImage(imread('images/natural.jpg'));
    showIntegralImage(imread('images/room.jpg'));
    % c)
    close all;
    image = imread('images/testFaces1.jpg');
    showFaces(image);
    image = imread('images/testFaces2.jpg');
    showFaces(image);
    
end

function showIntegralImage(image)
    defaultoptions.Resize = false;   
    intImageStruct = GetIntegralImages(image,defaultoptions);
    imagesc(intImageStruct.ii);colormap(jet);
end

function showFaces(image)
    options.Rescale = false;
    faces = ObjectDetection(image, 'ViolaJones/HaarCascades/haarcascade_frontalface_alt.mat', options);
    imshow(image);
    for i = 1:size(faces, 1)
        rectangle('Position', faces(i,:), 'EdgeColor', 'b');
    end
end