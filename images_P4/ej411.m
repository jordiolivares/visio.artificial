function [  ] = testFiltros()
    % Esta función pretende ilustrar el banco de filtros de la gaussiana
    F=makeLMfilters(); 
    % genera los filtros
    visualizeFilters(F);
end

function [ ] = visualizeFilters(F)
% This function receives a bank of filters and visualize them by pseudocolors
    figure, % visualiza todos los filtros
    for k=1:size(F,3);
        subplot(8,6,k);
        imagesc(F(:,:,k)); colorbar;
    end
end

