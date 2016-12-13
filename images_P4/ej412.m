function [ output_args ] = ej412( filename )
%EJ412 Summary of this function goes here
%   Detailed explanation goes here
    F = makeLMfilters();
    image = imread(filename);
    greyImage = double(rgb2gray(image));
    for i = 1:size(F, 3)
        convoluted = conv2(greyImage, F(:,:,i), 'same');
        subplot(8, 6, i);
        imagesc(convoluted);
    end

end

