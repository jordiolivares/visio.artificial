function plotPixelDistribution(image, sampling)
% PLOTPIXELDISTRIBUTION Plot the RGB pixel distribution in the input image
%   Show the pixel distribution in a given image.
%
%   plotPixelDistribution(image): Show the distribution of the RGB values
%                                 for all the pixels of the image.
%
%   plotPixelDistribution(image,sampling): Show the distribution of the RGB values
%                                          for a percentage of the pixels
%                                          of the image.
%
%   image=imread('test.png');
%   plotPixelDistribution(image);
%

    % Check the input image
    if size(image,3)~=3,
        error('An RGB image is required');
    end
    
    % Convert input image to double
    image=double(image);
    
    % Get the image channels
    imgR = image(:,:,1); 
    imgG = image(:,:,2);
    imgB = image(:,:,3);
    
    % Perform a sampling on the pixels
    if exist('sampling','var'),
        % Create a uniform sampling mapping
        step=round(1.0/sampling);
        sample = zeros(size(image,1),size(image,2)); 
        sample(1:step:end,1:step:end) = 1;
        
        % Select sampled points for each channel
        sR = imgR(sample==1); 
        sG = imgG(sample==1);
        sB = imgB(sample==1); 
        
        % Create distortion matrices to randomize uniform distribution
        rR = randn( numel(sR),1 )/step; 
        rG = randn( numel(sG),1 )/step;
        rB = randn( numel(sB),1 )/step;
        
        % Show the pixel distribution
        scatter3( sR(:)-rR, sG(:)-rG, sB(:)-rB, 3, [ sR(:), sG(:), sB(:) ]/255 ); 
    else
        scatter3( imgR(:), imgG(:), imgB(:), 3, [ imgR(:), imgG(:), imgB(:) ]/255 );  
    end
   
    % Set plot properties
    title('Pixel Distribution')
    xlim([0,255]),ylim([0,255]),zlim([0,255]);
    axis square;
end

