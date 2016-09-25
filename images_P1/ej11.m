function [  ] = ej11( )
% Summary of this function goes here
%   Detailed explanation goes here
    lena = imread('lena.jpg');
    figure
    imshow(lena);
    pause
    [x, y, canales] = size(lena);
    % x,y,canales = 255 255 3
    % Convert it into grayscale
    lena_scale = rgb2gray(lena);
    % calculate the 10% of the size and round it to an int
    borderX = uint8(x * 0.1);
    borderY = uint8(y * 0.1);
    % Left and right borders
    framed = [zeros(y, borderX) lena_scale zeros(y, borderX)];
    % Up and down borders
    framed = [zeros(borderY, size(framed, 2)) ; ...
        framed ; ...
        zeros(borderY, size(framed, 2))];
    imshow(framed)
    imwrite(framed, 'lena_frame.jpg');
end

