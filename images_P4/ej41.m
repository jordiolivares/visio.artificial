function [ output_args ] = ej41( input_args )
%EJ41 Summary of this function goes here
%   Detailed explanation goes here
    retrieveKImages('texturesimages/forest/forest_14.jpg', 'texturesimages/', @getFeatures)
    retrieveKImages('texturesimages/forest/forest_25.jpg', 'texturesimages/', @getFeatures)
    retrieveKImages('texturesimages/buildings/buildings_15.jpg', 'texturesimages/', @getFeatures)
end



