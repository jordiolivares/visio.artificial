function [ ] = ej33( )
%EJ3 Summary of this function goes here
%   Detailed explanation goes here
    loro = rgb2gray(imread('loro.png'));
    
    k = 1;
    [rows, columns] = size(loro);
    array = zeros(rows*columns, 2);
    for col = 1 : columns
      for row = 1 : rows
        array(k, 1) = row;
        array(k, 2) = col;
        array(k, 3) = loro(row, col);
        array(k, 4) = loro(row, col);
        k = k + 1;
      end
    end
    
    n=30;
    
    [idx, C] = kmeans(array, n);
    
    subplot(1,1,1)
    hold on
    for i=1:n
        cluster = array(idx==i,:);
        plot(cluster(:,1), cluster(:,2), '.')
        plot(C(i,1), C(i,2), 'o')
    end
    title('k=2')
    %legend('show')

end

