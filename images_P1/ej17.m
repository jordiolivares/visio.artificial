function [ output_args ] = ej17( input_args )
%EJ17 Summary of this function goes here
%   Detailed explanation goes here
    logo = imread('logo.png');
    R = (logo(:,:,1) == 6);
    G = (logo(:,:,2) == 118);
    B = (logo(:,:,3) == 85);
    
    RGB = uint8(R & G & B);
    
    logo(:,:,1) = (logo(:,:,1) - (logo(:,:,1) .* RGB)) + RGB .* 255;
    logo(:,:,2) = (logo(:,:,2) - (logo(:,:,2) .* RGB)) + RGB .* 0;
    logo(:,:,3) = (logo(:,:,3) - (logo(:,:,3) .* RGB)) + RGB .* 0;

    imwrite(logo, 'starbucks.jpg');
    imshow(logo)

end