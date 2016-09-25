function [ output_args ] = ej14( input_args )
%EJ14 Summary of this function goes here
%   Detailed explanation goes here
    % We extract the figures by asking for those pixels that have the same
    % pixel value
    circles = imread('circles.bmp');
    circles = rgb2gray(circles);
    im1 = (circles == 0);
    im2 = (circles == 127);
    im3 = (circles == 195);
    % b)
    figure
    subplot(1, 3, 1)
    imshow(im1)
    subplot(1, 3, 2)
    imshow(im2)
    subplot(1, 3, 3)
    imshow(im3)
    % Now we merge the images
    background = ones(777, 934,'uint8') .* 255;
    ans1 = (background - (uint8(im1) .* 255)) + (uint8(im1) .* 0);
    ans2 = (background - (uint8(im2) .* 255)) + (uint8(im2) .* 127);
    ans3 = (background - (uint8(im3) .* 255)) + (uint8(im3) .* 195);
    figure
    subplot(1, 3, 1)
    imshow(ans1)
    subplot(1, 3, 2)
    imshow(ans2)
    subplot(1, 3, 3)
    imshow(ans3)
end

