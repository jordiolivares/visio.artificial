function [ output_args ] = ej32( input_args )
%EJ32 Summary of this function goes here
%   Detailed explanation goes here

    cloud1 = gaussRandom([1,2], 0.1, 100);
    cloud2 = gaussRandom([2,2], 0.1, 100);
    cloud3 = gaussRandom([2,1], 0.1, 100);
    
    figure
    subplot(2,3,2)
    title('Original')
    plot(cloud1(:,1), cloud1(:,2), '.', cloud2(:,1), cloud2(:,2), '.', cloud3(:,1), cloud3(:,2), '.')
       
    [idx , C] = kmeans([cloud1 ; cloud2 ; cloud3], 2);

    allPoints = [cloud1; cloud2; cloud3];
    m_allPoints = num2cell(allPoints);
    
    cluster1 = m_allPoints(find(idx==1));
    
    cluster2 = m_allPoints(find(idx==2));
    subplot(2,3,3)
    title('k=2')
    plot(cluster1(:,1), cluster1(:,2), '.', cluster2(:,1), cluster2(:,2), '.')
    
    %{
    [idx , C] = kmeans([cloud1 ; cloud2 ; cloud3], 2)
    cluster1 = [cloud1(idx==1) ; cloud2(idx==1) ; cloud3(idx==1)];
    cluster2 = [cloud1(idx==2) ; cloud2(idx==2) ; cloud3(idx==2)];   
    cluster3 = [cloud1(idx==3) ; cloud2(idx==3) ; cloud3(idx==3)];
    
    [idx , C] = kmeans([cloud1 ; cloud2 ; cloud3], 2)
    cluster1 = [cloud1(idx==1) ; cloud2(idx==1) ; cloud3(idx==1)];
    cluster2 = [cloud1(idx==2) ; cloud2(idx==2) ; cloud3(idx==2)];   
    cluster3 = [cloud1(idx==3) ; cloud2(idx==3) ; cloud3(idx==3)];
    
    plot(cloud1(:,1), cloud1(:,2), '.', cloud2(:,1), cloud2(:,2), '.', cloud3(:,1), cloud3(:,2), '.')
    
    cluster1 = 
    %}

end

