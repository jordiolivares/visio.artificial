function [ ] = ej33( )
    %%%%%%%%%%%%% PART 1 %%%%%%%%%%%%%
    
    loro_rgb = imread('loro.png');
    loro = rgb2gray(loro_rgb);
    re_loro = reshape(im2double(loro), [], 1);
    
    array(:,1) = re_loro;
    array(:,2) = re_loro;
    
    [rows, columns] = size(loro);
    
    n=5;
    [idx, C] = kmeans(array, n);
    
    figure
    subplot(1,2,1)
    
    for i=1:n
        array(idx==i, 1) = mean(array(idx==i, 1));
    end
    imshow(reshape(array(:,1), [rows, columns]));
    title('k=10')
    
    %%%%%%%%%%%%% PART 2 %%%%%%%%%%%%%
    array2 = zeros(rows*columns, 3);
    
    k=1;
    for row = 1 : rows
      for col = 1 : columns
        array2(k, 1) = double(row);
        array2(k, 2) = double(col);
        k = k + 1;
      end
    end
    array2(:, 3) = re_loro;
    
    [idx, C] = kmeans(array2, n);
    
    subplot(1,2,2)
    for i=1:n
        array2(idx==i, 3) = C(i,3);
    end
    imshow(reshape(array2(:, 3), [rows, columns]));
    title('k=10')

    %%%%%%%%%%%%% PART 3 %%%%%%%%%%%%%
    
    figure
    subplot(2,2,1)
    imshow(loro_rgb)

    subplot(2,2,2)
    plotPixelDistribution(loro_rgb)
    
    rgb_matrix(:,1) = reshape(double(loro_rgb(:,:,1)), [], 1);
    rgb_matrix(:,2) = reshape(double(loro_rgb(:,:,2)), [], 1);
    rgb_matrix(:,3) = reshape(double(loro_rgb(:,:,3)), [], 1);
    
    [idx, C] = kmeans(rgb_matrix, 16);
    
    for i=1:16
        rgb_matrix(idx==i, 1) = C(i, 1);
        rgb_matrix(idx==i, 2) = C(i, 2);
        rgb_matrix(idx==i, 3) = C(i, 3);
    end
    title('k=16')
    
    loro_tmp = loro_rgb;
    loro_tmp(:,:,1) = reshape(rgb_matrix(:,1), [rows, columns]);
    loro_tmp(:,:,2) = reshape(rgb_matrix(:,2), [rows, columns]);
    loro_tmp(:,:,3) = reshape(rgb_matrix(:,3), [rows, columns]);
    
    subplot(2,2,3)
    imshow(loro_tmp)

    subplot(2,2,4)
    plotPixelDistribution(loro_tmp)
end

