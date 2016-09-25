function [ output_args ] = ej18( input_args )
%EJ18 Summary of this function goes here
%   Detailed explanation goes here
    coat = imread('coat.png');
    model = imread('model.png');
    coat_gray = rgb2gray(coat);
    coat_fg = (coat_gray ~= 0);
    mega_coat(:,:,1:3) = coat_fg;
    
    coat_bg = ~coat_fg;

    model(mega_coat) = coat(mega_coat);

    imwrite(model, 'model_coat.jpg');
end

