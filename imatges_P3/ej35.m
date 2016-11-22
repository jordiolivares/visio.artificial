function [ output_args ] = ej35( input_args )
%EJ35 Summary of this function goes here
%   Detailed explanation goes here
    % a)
    showMatches('starbucks.jpg', 'starbucks6.jpg');
    pause
    % b)
    % Take elements out if you want to do the experiment for fewer elements
    imatges = {'starbucks.jpg', 'starbucks2.png', 'starbucks4.jpg',...
        'starbucks5.png', 'starbucks6.jpg', 'starbucksCup.jpg'};
    % Or just uncomment this and comment the line above
    %imatges = {'starbucks.jpg', 'starbucks2.png', 'starbucks4.jpg'};
    sorted = sortBySimilarity(imatges);
    close all;
    for comb = sorted
        showMatches(comb{1}, comb{2});
        disp('Prem Enter per a la següent imatge:');
        pause
    end
    % d)
    im = imread('starbucks.jpg');
    im45 = imrotate(imresize(im, 0.5), 45);
    im97 = imrotate(imresize(im, 1.4), 97);
    im140 = imrotate(imresize(im, 0.7), 140);
    im200 = imrotate(imresize(im, 0.2), 200);
    imwrite(im45, 'starbucks45.png');
    imwrite(im97, 'starbucks97.png');
    imwrite(im140, 'starbucks140.png');
    imwrite(im200, 'starbucks200.png');
    
    showMatches('starbucks45.png', 'starbucks6.jpg');
    pause
    showMatches('starbucks97.png', 'starbucks6.jpg');
    pause
    showMatches('starbucks140.png', 'starbucks6.jpg');
    pause
    showMatches('starbucks200.png', 'starbucks6.jpg');
    
    
end

function [output] = sortBySimilarity(list)
    combinations = combnk(list, 2);
    combinations = [combinations; fliplr(combinations)]';
    combinations(3,:) = num2cell(zeros(size(combinations, 2),1));
    for i = 1:size(combinations, 2)
        [~, score] = showMatches(combinations{1, i}, combinations{2, i});
        close;
        combinations{3, i} = sum(score);
    end
    combinations = sortrows(combinations', [1 3])';
    output = combinations;
end