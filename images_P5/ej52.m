function [ output_args ] = ej52( input_args )
%EJ52 Summary of this function goes here
%   Detailed explanation goes here
    % a)
    error = [];
    [outClass, X, Y] = haarFeatureDemo(3);
    error = [error sum(Y~=outClass)/length(Y)];
    for i=1:2
        outClass = haarFeatureDemo(2, X, Y, outClass);
        error = [error sum(Y~=outClass)/length(Y)];
    end
    plot(error);
    % b)
    % 3 features
    error = [];
    [outClass, X, Y] = haarFeatureDemo(3);
    error = [error sum(Y~=outClass)/length(Y)];
    % Cascade with 1 feature per level
    plot(error);
    error = [];
    [outClass, X, Y] = haarFeatureDemo(1);
    error = [error sum(Y~=outClass)/length(Y)];
    for i=1:2
        outClass = haarFeatureDemo(1, X, Y, outClass);
        error = [error sum(Y~=outClass)/length(Y)];
    end
    plot(error);
end

