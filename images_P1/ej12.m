function [  ] = ej12( )
%EJ12 Summary of this function goes here
%   Detailed explanation goes here
    car = imread('car_lowContrast.jpg');
    % high brightness
    max_bright = max(car(:));
    car_bright = car + (255 - max_bright);
    imwrite(car_bright, 'car_bright.jpg');
    figure
    subplot(2,1,1)
    imhist(car)
    subplot(2,1,2)
    imhist(car_bright)
    print('subplot_2_high.png', '-dpng');
    close
    % low brightness now
    min_bright = min(car(:));
    car_low = car - min_bright;
    imwrite(car_low, 'car_dark.jpg');
    figure
    subplot(2,1,1)
    imhist(car)
    subplot(2,1,2)
    imhist(car_low)
    print('subplot_2_low.png', '-dpng');
    close
    
    % high contrast
    % we scale the gray colours to a 0 to 1 scale
    car_contrast = double(car_low) ./ 255;
    % Now we scale it upwards so that we have the brightest pixel at 1 of brightness
    car_contrast = car_contrast .* (255.0 / double(max_bright - min_bright));
    figure
    subplot(2,1,1)
    imhist(car)
    subplot(2,1,2)
    imhist(car_contrast)
    imwrite(car_contrast, 'car_contrast.jpg');
    print('subplot_2_contrast.png', '-dpng');
    close
end

