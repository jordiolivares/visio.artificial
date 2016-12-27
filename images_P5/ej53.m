function [ output_args ] = ej53( input_args )
%EJ53 Summary of this function goes here
%   Detailed explanation goes here
    addpath('ViolaJones','ViolaJones/SubFunctions');
    % a)
    [X, Y] = getDataBase([20 20]);
    X = uint8(round(reshape(mean(X), [20 20])));
    imshow(X);
    rectangle('Position', [3 7 14 4], 'facecolor','k');
    rectangle('Position', [3 9 14 2], 'facecolor','w');
    % b)
    figure;
    subplot(2,3,1);
    im = imread('images/landscape.jpg');
    imshow(im);
    subplot(2,3,4);
    showIntegralImage(im);
    subplot(2,3,2);
    im = imread('images/natural.jpg');
    imshow(im);
    subplot(2,3,5);
    showIntegralImage(im);
    subplot(2,3,3);
    im = imread('images/room.jpg');
    imshow(im);
    subplot(2,3,6);
    showIntegralImage(im);
    pause;
    % c)
    close all;
    image = imread('images/testFaces1.jpg');
    showFaces(image);
    pause;
    close all;
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