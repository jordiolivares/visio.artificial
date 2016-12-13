function [ output_args ] = visualizeFeatures()
%VISUALIZEFEATURES Visualizes the plot of features of the columns 25 and 41
    forest = getClassFeatures('texturesimages/forest/', 'jpg', @getFeatures);
    buildings = getClassFeatures('texturesimages/buildings/', 'jpg', @getFeatures);
    sunset = getClassFeatures('texturesimages/sunset/', 'jpg', @getFeatures);
    % Just to centralise the formatting of the plot
    markers = {'+r', '*g', 'ob'};
    plot(1:30, forest(:, [25 41]), markers{1},...
         1:30, buildings(:, [25 41]), markers{2}, ...
         1:30, sunset(:, [25 41]), markers{3})
end

