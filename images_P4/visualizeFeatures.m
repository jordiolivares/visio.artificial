function [ output_args ] = visualizeFeatures()
%VISUALIZEFEATURES Summary of this function goes here
%   Detailed explanation goes here
    forest = getClassFeatures('texturesimages/forest/', 'jpg', @getFeatures);
    buildings = getClassFeatures('texturesimages/buildings/', 'jpg', @getFeatures);
    sunset = getClassFeatures('texturesimages/sunset/', 'jpg', @getFeatures);

    plot(1:30, forest(:, [25 41]), 1:30, buildings(:, [25 41]), 1:30, sunset(:, [25 41]))
    
end

