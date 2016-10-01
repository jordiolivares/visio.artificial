function [ output_args ] = ej18( input_args )
%EJ18 Summary of this function goes here
%   Detailed explanation goes here
    coat = imread('coat.png');
    size(coat)
    model = imread('model.png');
    size(model)
    coat_gray = rgb2gray(coat);
    coat_fg = (coat_gray ~= 0); % Get all the elements different than 0
    mega_coat = repmat(coat_fg, 1, 1, 3);
    
    % Invert the foreground matrix to obtain the background
    coat_bg = ~coat_fg;

    model(mega_coat) = coat(mega_coat);

    imwrite(model, 'model_coat.jpg');
end

