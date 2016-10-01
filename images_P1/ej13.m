function [ output ] = ej13()
    car = imread('car_gray.jpg');
    car_130 = auxiliar(car, 130);

    figure
    subplot(2,1,1)
    imshow(car)
    subplot(2,1,2)
    imshow(car_130)
    print('subplot_3_binarize.png', '-dpng');
    close
end

function [ thresholded_image ] = auxiliar( image, threshold )
    % Use the built-in function to binarize the image
    thresholded_image = imbinarize(image, double(threshold) / 255.0);

end
