function [ matches, scores ] = showMatches( model, scene )
%SHOWMATCHES Show matching points between the model and the scene
%   Use SIFT to extract keypoints and their descriptors and search matching
%   points between both images.

    % Load the images
    modelImg=imread(model);
    sceneImg=imread(scene);

    % Extract the features
    [fm,dm] = vl_sift(im2single(rgb2gray(modelImg))) ;
    [fs,ds] = vl_sift(im2single(rgb2gray(sceneImg))) ;

    % Match descriptors
    [matches, scores] = vl_ubcmatch(dm,ds) ;

    % Order the matches by score, from most similar to less.
    [~, perm] = sort(scores, 'descend') ;
    matches = matches(:, perm) ;
    scores  = scores(perm) ;

    % Plot the results
    outImg=uint8(zeros(max(size(modelImg,1),size(sceneImg,1)),size(modelImg,2)+size(sceneImg,2),3));
    outImg(1:size(modelImg,1),1:size(modelImg,2),:)=modelImg;
    outImg(1:size(sceneImg,1),size(modelImg,2)+1:end,:)=sceneImg;
    imshow(outImg);
    
    xa = fm(1,matches(1,:)) ;
    xb = fs(1,matches(2,:)) + size(modelImg,2) ;
    ya = fm(2,matches(1,:)) ;
    yb = fs(2,matches(2,:)) ;

    hold on ;
    h = line([xa ; xb], [ya ; yb]) ;
    set(h,'linewidth', 1, 'color', 'b') ;

    vl_plotframe(fm(:,matches(1,:))) ;
    fs(1,:) = fs(1,:) + size(modelImg,2) ;
    vl_plotframe(fs(:,matches(2,:))) ;

    hold off;

end

