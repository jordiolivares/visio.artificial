function [ output_args ] = ej22( input_args )
    close all;
    mean_filt = fspecial('average', 3);
    image = imread('corals.jpg');
    result_gaussian = image;
    result_mean = image;
    for i = 1 : 100
        result_gaussian = imgaussfilt(result_gaussian, 0.4);
        result_mean = imfilter(result_mean, mean_filt);
    end
    
    imshow(result_gaussian)
    figure
    imshow(result_mean)
    
    % b
    image = imread('face.png');
    alt_result = imgaussfilt(image, 10);
    figure
    imshow(alt_result)
    figure
    imshow(image - alt_result);
    

end

