function [ outClass, X, Y, selFeatures, error, predErr ] = haarFeatureDemo(numFeatures,X,Y,Yprev)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    outSize=[30,30];
    
    close all;    
    % Get dataset
    if ~exist('numFeatures','var'),
        numFeatures=3;
    end
        
    % Create a new database if it is not provided
    if ~exist('X','var') || ~exist('Y','var'),
        [X,Y] = getDataBase(outSize,15);   
    else
        % Remove previously rejected images
        X2=X;
        Y2=Y;
        X=X(Yprev==1,:);
        Y=Y(Yprev==1);
    end
    
    % Get the average face as model
    model=uint8(round(reshape(mean(X(Y==1,:),1),outSize)));
    
    % Ask as many features as we want
    selFeatures=[];
    predictions=[];
    error=[];
    predErr=[];
    cascErr=[];
    for f=1:numFeatures,
        % Ask feature values           
        [rectPos,rectNeg,rectPosS,rectNegS]=selectFeature(model,outSize);
        
        % Get feature values for all images in the dataset
        fval=getRectVal(rectPosS,rectNegS,X,outSize);
        
        % Get threshold value to build a weak classifier
        [thr,polarity,pred,err]=getThreshold(fval,Y);
        
        % Store the feature in the list of features
        selFeatures=[selFeatures;rectPos rectNeg];
        predictions=[predictions pred];
         
        % Get the accumulate predictions
        accPred=sum(predictions,2);
        
        % Get the final prediction
        outClass=sign(accPred);
                
        % Store historical
        error=[error err];
        predErr=[predErr sum(outClass~=Y)/length(Y)];
        
        %Show the features
        subplot(2,3,[1 4]);
        showFeatures(model,selFeatures);
        
        % Show the values using the sum of rectangle pixels
        subplot(2,3,2);
        showFeatureVals(fval,Y,thr,polarity);title(sprintf('Feature Values. Polarity=%d',polarity));
        legend('Face','No-face');
        
        % Show the accumulated values
        subplot(2,3,3);
        stem(accPred);title('Accumulated Values');
                
        % Show the values using the sum of rectangle pixels
        subplot(2,3,5);
        stem(outClass);title(['Final prediction. Error=' sprintf('%3.1f%%',round(err*100))]);
        
        % Show error comparison between feature and ensemble
        subplot(2,3,6);
        if exist('Yprev','var'),
            Ycascade=Y2;
            Ycascade(Yprev==1)=outClass;
            cascErr=[cascErr sum(Ycascade~=Y2)/length(Y2)];
            errMat=[error;predErr;cascErr];
            bar(errMat');title('Error values feature vs ensemble vs cascade');
            legend('F. Error', 'Ens. Error' , 'Cascade Error');
        else            
            errMat=[error;predErr;cascErr];
            bar(errMat');title('Error values feature vs ensemble');
            legend('F. Error', 'Ens. Error');
        end
    end
    
    % Recover initial data
    if exist('X2','var'),
        X=X2;
        Y=Y2;
        Yprev(Yprev==1)=outClass;
        outClass=Yprev;
    end
end

function [rectPos,rectNeg,rectPosS,rectNegS]=selectFeature(model,outSize)
    h=figure();
    imshow(model);title('Select feature points');        
    [x,y]=ginput(2);
    close(h);
    mSize=size(model);
    
    % Get the feature
    rectPos=round([x(1) y(1) x(2)-x(1)+1 y(2)-y(1)+1]);
    rectNeg=round([x(2)+1 y(1) rectPos(3) rectPos(4)]);
    
    % Correct the feature
    if rectNeg(2)+rectNeg(4)-1>mSize(1),
        overLength=(rectNeg(2)+rectNeg(4)-1)-mSize(1);
        rectPos(2)=rectPos(2)+overLength-1;
        rectPos(4)=rectPos(4)-overLength;
        rectNeg(4)=rectNeg(4)-overLength;
    end
    if rectNeg(1)+rectNeg(3)-1>mSize(2),
        overLength=(rectNeg(1)+rectNeg(3)-1)-mSize(2);
        rectPos(1)=rectPos(1)+overLength-1;
        rectPos(3)=rectPos(3)-overLength;
        rectNeg(3)=rectNeg(3)-overLength;
    end
    

    % Reescale the feature
    s=outSize./mSize;    
    x=x*s(2);
    y=y*s(1);
    rectPosS=round([x(1) y(1) x(2)-x(1)+1 y(2)-y(1)+1]);
    rectNegS=round([x(2)+1 y(1) rectPosS(3) rectPosS(4)]);        
    
    % Correct the feature
    if rectNegS(2)+rectNegS(4)-1>outSize(1),
        overLength=(rectNegS(2)+rectNegS(4)-1)-outSize(1);
        rectPosS(2)=rectPosS(2)+overLength-1;
        rectPosS(4)=rectPosS(4)-overLength;
        rectNegS(4)=rectNegS(4)-overLength;
    end
    if rectNegS(1)+rectNegS(3)-1>outSize(2),
        overLength=(rectNegS(1)+rectNegS(3)-1)-outSize(2);
        rectPosS(1)=rectPosS(1)+overLength-1;
        rectPosS(3)=rectPosS(3)-overLength;
        rectNegS(3)=rectNegS(3)-overLength;
    end
end

function showFeatures(model,selFeatures)
    %Show the model        
    imshow(model);title('Selected features');
    hold on;
    for i=1:size(selFeatures,1),
        rectPos=selFeatures(i,1:4);
        rectNeg=selFeatures(i,5:8);
        % Show feature
        rectangle('position',rectPos,'facecolor','w');
        rectangle('position',rectNeg,'facecolor','k');
    end
end

function f=getRectVal(rectPos,rectNeg,X,outSize) 
    f=zeros(size(X,1),1);
    for i=1:size(X,1),
        % Get the image
        image=reshape(X(i,:),outSize);
        
        % Select the rectangle regions
        r1=image(rectPos(2):rectPos(2)+rectPos(4)-1,rectPos(1):rectPos(1)+rectPos(3)-1);
        r2=image(rectNeg(2):rectNeg(2)+rectNeg(4)-1,rectNeg(1):rectNeg(1)+rectNeg(3)-1);
    
        % Evaluate the difference between region values
        f(i)=sum(reshape(r1,1,[]))-sum(reshape(r2,1,[]));
    end
end

function showFeatureVals(f,Y,thr,polarity) 
    plot(1:length(find(Y==1)),f(find(Y==1)),'g*', 1:length(find(Y==-1)), f(find(Y==-1)), 'r+'); hold on;
    plot([0,length(Y)],[thr,thr],'k--','linewidth',2);
    hold off;
end

function [thr,polarity,prediction,err]=getThreshold(s,Y)
    % Get feature values for positive and negative samples
    posVals=s(Y==1);
    negVals=s(Y==-1);
    
    % Check threshold value for polarity 1
    minVal=min(posVals);
    maxVal=max(negVals(negVals<minVal));
    if isempty(maxVal),
        maxVal=minVal;
    end
    thr1=(minVal+maxVal)/2;
    prediction1=(s>=thr1)*2-1;
    err1=sum(Y~=prediction1)/length(Y);
    
    % Check threshold value for polarity -1
    maxVal=max(posVals);
    minVal=min(negVals(negVals>maxVal));
    if isempty(minVal),
        minVal=maxVal;
    end
    thr2=(minVal+maxVal)/2;
    prediction2=(s<thr2)*2-1;
    err2=sum(Y~=prediction2)/length(Y);
    if err1<err2,
        thr=thr1;
        polarity=1;
        prediction=prediction1;
        err=err1;
    else
        thr=thr2;
        polarity=-1;
        prediction=prediction2;
        err=err2;
    end
end