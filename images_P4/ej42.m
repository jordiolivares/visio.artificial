function [ output_args ] = ej42( input_args )
%EJ42 Summary of this function goes here
%   Detailed explanation goes here
    retrieveKImages('texturesimages/forest/forest_14.jpg', 'texturesimages/', @getLBPFeatures)
    retrieveKImages('texturesimages/forest/forest_25.jpg', 'texturesimages/', @getLBPFeatures)
    retrieveKImages('texturesimages/buildings/buildings_15.jpg', 'texturesimages/', @getLBPFeatures)
end

