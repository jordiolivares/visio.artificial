function [ ] = ej33( )
    %%%%%%%%%%%%% PART 1 %%%%%%%%%%%%%
    
    loro_rgb = double(imread('loro.png'));
    loro = rgb2gray(loro_rgb);
    
    re_loro = reshape(loro, [], 1);
    
    array(:,1) = re_loro;
    array(:,2) = re_loro;
    
    n=4;
    
    [idx, C] = kmeans(array, n);
    
    figure
    subplot(1,4,1)
    hold on
    for i=1:n
        cluster = array(idx==i,:);
        plot(cluster(:,1), cluster(:,2), '.')
        plot(C(i,1), C(i,2), 'o')
    end
    title('k=4')
    %legend('show')
    
    %%%%%%%%%%%%% PART 2 %%%%%%%%%%%%%
    
    [rows, columns] = size(loro);
    
    array2 = zeros(rows*columns, 3);
    
    k=1;
    for row = 1 : rows
      for col = 1 : columns
        array2(k, 1) = row;
        array2(k, 2) = col;
        k = k + 1;
      end
    end
    array2(:, 3) = re_loro;
    
    m=4;
    
    [idx, C] = kmeans(array2, m);
    
    subplot(1,4,2)
    hold on
    for i=1:m
        cluster = array2(idx==i, :);
        plot3(cluster(:,1), cluster(:,2), cluster(:,3), '.')
        plot3(C(i,1), C(i,2), C(i,3), 'o')
    end
    title('k=4')
    %legend('show')    

    %%%%%%%%%%%%% PART 3 %%%%%%%%%%%%%
    
    rgb_matrix(:,1) = reshape(loro_rgb(:,:,1), [], 1);
    rgb_matrix(:,2) = reshape(loro_rgb(:,:,2), [], 1);
    rgb_matrix(:,3) = reshape(loro_rgb(:,:,3), [], 1);
    
    [idx, C] = kmeans(rgb_matrix, 16);
    
    subplot(1,4,3)
    plotPixelDistribution(loro_rgb)
    
    subplot(1,4,4)
    hold on
    for i=1:16
        cluster = rgb_matrix(idx==i, :);
        
        rgb_matrix(idx==i, 1) = C(i, 1);
        rgb_matrix(idx==i, 2) = C(i, 2);
        rgb_matrix(idx==i, 3) = C(i, 3);
        
        plot3(cluster(:,1), cluster(:,2), cluster(:,3), '.')
        plot3(C(i,1), C(i,2), C(i,3), 'o')
    end
    title('k=16')
    
    loro_tmp = loro_rgb;
    loro_tmp(:,:,1) = rgb_matrix(:,1);
    loro_tmp(:,:,2) = rgb_matrix(:,2);
    loro_tmp(:,:,3) = rgb_matrix(:,3);
    
    imshow(loro_tmp)
    
end

