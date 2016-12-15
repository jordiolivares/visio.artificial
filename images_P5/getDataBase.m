function [X,Y] = getDataBase(outSize,numNeg)
    faceSet={'jdbenm.jpg','klclar.jpg','rmpugh.jpg','sbains.jpg','spletc.jpg','vstros.jpg'};
    bgSet={'landscape.jpg','room.jpg','natural.jpg'};
    
    X=[];
    Y=[];
    
    %Check input parameters
    if ~exist('numNeg','var'),
        numNeg=0;
    end
    
    % Add the faces
    for fimg=faceSet,
        % Create de sample and label
        img=imread(['images/' char(fimg)]);
        img=rgb2gray(img);
        img=imresize(img,outSize);
        x=reshape(img,1,[]);
        y=1;
        
        % Add to dataset
        X=[X;x];
        Y=[Y;y];
    end
    
    % Add background samples
    for i=1:numNeg,
        % Select one of the background images
        idx=round(rand()*(length(bgSet)-1))+1;
        img=imread(['images/' bgSet{idx}]);
        img=rgb2gray(img);
        
        % Select a random region from the image
        s=rand()*4 + 0.1;
        s=min(s,min(size(img)./outSize));
        ssize=max(round(outSize*s),outSize);
        px=max(1,round(rand()*(size(img,1)-ssize(1)-1))+1);
        py=max(1,round(rand()*(size(img,2)-ssize(2)-1))+1);
       
        % Cut the region from the image
        r=img(px:px+ssize(1)-1,py:py+ssize(2)-1);
        
        % Create the sample and label
        x=imresize(r,outSize);
        x=reshape(x,1,[]);
        y=-1;
        
        % Add to dataset
        X=[X;x];
        Y=[Y;y];
    end
end

