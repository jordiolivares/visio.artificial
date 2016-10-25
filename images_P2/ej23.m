function [] = ej23()
    close all
    logo = rgb2gray(imread('logo.png'));
    contour_sobel = edge(logo, 'Sobel', 0.2);
    contour_prewitt = edge(logo, 'Prewitt', 0.2);
    contour_canny = edge(logo, 'Canny', 0.1);
    contour_laplacian = edge(logo, 'log', 0.01);
    figure
    imshow(contour_sobel);
    title('Sobel (thresh = 0.2)')
    figure
    imshow(contour_prewitt);
    title('Prewitt (thresh = 0.2)')
    figure
    imshow(contour_canny);
    title('Canny (thresh = 0.1)')
    figure
    imshow(contour_laplacian);
    title('Laplaciano (thresh = 0.01)')
    
    %c)
    logo = rgb2gray(imread('corals.jpg'));
    logo = imfilter(logo, fspecial('average'));
    contour_sobel = edge(logo, 'Sobel', 0.05);
    contour_prewitt = edge(logo, 'Prewitt', 0.05);
    contour_canny = edge(logo, 'Canny', 0.15);
    contour_laplacian = edge(logo, 'log', 0.01);
    figure
    imshow(contour_sobel);
    title('Sobel (thresh = 0.05)')
    figure
    imshow(contour_prewitt);
    title('Prewitt (thresh = 0.05)')
    figure
    imshow(contour_canny);
    title('Canny (thresh = 0.15)')
    figure
    imshow(contour_laplacian);
    title('Laplaciano (thresh = 0.01)')
    
end

