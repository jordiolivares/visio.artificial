function [ ] = ej32( )

    %%%%%%%%%%%%% (a) %%%%%%%%%%%%%

    cloud1 = gaussRandom([1,2], 0.1, 100);
    cloud2 = gaussRandom([2,2], 0.1, 100);
    cloud3 = gaussRandom([2,1], 0.1, 100);
    
    figure
    subplot(2,3,2)
    plot(cloud1(:,1), cloud1(:,2), '.', cloud2(:,1), cloud2(:,2), '.', cloud3(:,1), cloud3(:,2), '.')
    title('Original')

    %%%%%%%%%%%%% (b) %%%%%%%%%%%%%

    allPoints = [cloud1; cloud2; cloud3];
    
    %%% k=2 %%%

    [idx , C] = kmeans([cloud1 ; cloud2 ; cloud3], 2);

    subplot(2,3,4)
    plotClusters(2, idx, C, allPoints)
    title('k=2')
    legend('show')
    
    %%% k=3 %%%

    [idx , C] = kmeans([cloud1 ; cloud2 ; cloud3], 3);    
    
    subplot(2,3,5)
    plotClusters(3, idx, C, allPoints)
    title('k=3')
    legend('show')
    
    %%% k=4 %%%

    [idx , C] = kmeans([cloud1 ; cloud2 ; cloud3], 4);    
    
    subplot(2,3,6)
    plotClusters(4, idx, C, allPoints)
    title('k=4')
    legend('show')
end

function [] = plotClusters(k, idx, C, allPoints)
    hold on
    for i=1:k
        cluster = allPoints(idx==i, :);
        plot(cluster(:,1), cluster(:,2), '.')
        plot(C(i,1), C(i,2), 'o')
    end
end