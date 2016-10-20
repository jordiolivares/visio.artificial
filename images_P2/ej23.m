function [] = ej23()
    logo = rgb2gray(imread('logo.png'));
    contours = imcontour(logo);
    contour_sobel = edge(logo, 'Sobel');
    contour_prewitt = edge(logo, 'Prewitt');
    contour_canny = edge(logo, 'Canny');
end

