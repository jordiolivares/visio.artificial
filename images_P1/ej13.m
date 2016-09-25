function [ thresholded_image ] = ej13( image, threshold )
%EJ13 Summary of this function goes here
%   Detailed explanation goes here
    thresholded_image = imbinarize(image, double(threshold) / 255.0);

end
