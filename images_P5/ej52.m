function [ output_args ] = ej52( input_args )
%EJ52 Summary of this function goes here
%   Detailed explanation goes here
    error = [];
    [outClass, X, Y] = haarFeatureDemo(2);
    error = [error sum(Y~=outClass)/length(Y)];
    for i=1:2
        outClass = haarFeatureDemo(2, X, Y, outClass);
        error = [error sum(Y~=outClass)/length(Y)];
    end
    plot(error);
end

