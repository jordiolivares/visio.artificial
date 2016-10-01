function [ output_args ] = ej15( file )
%EJ15 Summary of this function goes here
%   Detailed explanation goes here
    img = imread(file);
    imR = img(:,:,1);
    imG = img(:,:,2);
    imB = img(:,:,3);
    
    figure
    subplot(2,3,2)
    imshow(img);
    subplot(2,3,4)
    imshow(imR);
    subplot(2,3,5);
    imshow(imG);
    subplot(2,3,6);
    imshow(imB);
    print('subplot_5.png', '-dpng');
    close
    
    img(:,:,2) = imR;
    img(:,:,1) = imG;
    imshow(img)
    imwrite(img, 'ej15_cambiados.png');
    img(:,:,1) = imR;
    img(:,:,2) = 0;
    imwrite(img, 'ej15_zero.png');
end

