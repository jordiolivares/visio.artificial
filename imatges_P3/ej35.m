function [ output_args ] = ej35( input_args )
%EJ35 Summary of this function goes here
%   Detailed explanation goes here
    % a)
    showMatches('starbucks.jpg', 'starbucks6.jpg');
    pause
    
    % b)
    showMatches('starbucks.jpg', 'starbucks2.png');
    pause
    showMatches('starbucks.jpg', 'starbucks4.jpg');
    pause
    showMatches('starbucks.jpg', 'starbucks5.png');
    pause
    showMatches('starbucks.jpg', 'starbucksCup.jpg');
end

