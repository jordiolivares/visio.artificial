function [ ] = ej32( )
%EJ32 Summary of this function goes here
%   Detailed explanation goes here

    cloud1 = gaussRandom([1,2], 0.1, 100);
    cloud2 = gaussRandom([2,2], 0.1, 100);
    cloud3 = gaussRandom([2,1], 0.1, 100);
    
    figure
    subplot(2,3,2)
    plot(cloud1(:,1), cloud1(:,2), '.', cloud2(:,1), cloud2(:,2), '.', cloud3(:,1), cloud3(:,2), '.')
    title('Original')
    
    allPoints = [cloud1; cloud2; cloud3];
    
    [idx , C] = kmeans([cloud1 ; cloud2 ; cloud3], 2);    
    
    subplot(2,3,4)
    hold on
    for i=1:2
        cluster = allPoints(idx==i,:);
        plot(cluster(:,1), cluster(:,2), '.')
        plot(C(i,1), C(i,2), 'o')
    end
    title('k=2')
    %legend('show')
    
    [idx , C] = kmeans([cloud1 ; cloud2 ; cloud3], 3);    
    
    subplot(2,3,5)
    hold on
    for i=1:3
        cluster = allPoints(idx==i,:);
        plot(cluster(:,1), cluster(:,2), '.')
        plot(C(i,1), C(i,2), 'o')
    end
    title('k=3')
    %legend('show')
    
    [idx , C] = kmeans([cloud1 ; cloud2 ; cloud3], 4);    
    
    subplot(2,3,6)
    hold on
    for i=1:4
        cluster = allPoints(idx==i,:);
        plot(cluster(:,1), cluster(:,2), '.')
        plot(C(i,1), C(i,2), 'o')
    end
    title('k=4')
    %legend('show')
end

