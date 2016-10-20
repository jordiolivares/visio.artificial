function [ output_args ] = ej22( input_args )
    gaussian = fspecial('gaussian');
    mean_filt = fspecial('average', 3);
    image = imread('face.png');
    result_gaussian = image;
    result_mean = image;
    for i = 1 : 100
        result_gaussian = imfilter(result_gaussian, gaussian);
        result_mean = imfilter(result_mean, mean_filt);
    end
    
    imshow(result_gaussian)
    figure
    imshow(result_mean)
    
    % b
    alt_result = imgaussfilt(image, 4);
    figure
    imshow(alt_result)
    

end

