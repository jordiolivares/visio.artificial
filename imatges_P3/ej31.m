function [] = ej31()
%EJ31 Summary of this function goes here
%   Detailed explanation goes here
    frames = extractBackground('Barcelona.mp4');
    video = VideoReader('Barcelona.mp4');
    sampleFrame = read(video, 1757);
    background = frames(:,:,:,12);
    
    figure
    subplot(1,2,1)
    imshow(background);
    title('Background');
    subplot(1,2,2)
    imshow(sampleFrame);
    title('Image');
    
    figure
    subplot(1,1,1)
    imshow(sampleFrame - background);
    title('Moving parts')
    
end

function [backgroundFrames] = extractBackground(filename)
% Extracts the background of a video in each scene using the median
    keyFrames = segmentVideo(filename, 250000);
    video = VideoReader(filename);
    videoFrames = video.NumberOfFrames;
    video = VideoReader(filename);
    backgroundFrames = zeros(video.Height, video.Width, 3, size(keyFrames, 1), 'uint8');
    for i = 1:size(keyFrames, 1)
        if i == size(keyFrames, 1)
            numFrames = videoFrames - keyFrames(i);
        else
            numFrames = keyFrames(i+1) - keyFrames(i);
        end
        tmp = zeros(video.Height, video.Width, 3, numFrames, 'uint8');
        for j = 1:numFrames
            tmp(:,:,:, j) = readFrame(video);
        end
        % Median of all frames at that pixel coordinate
        backgroundFrames(:,:,:,i) = median(tmp, 4);
    end
end

function [keyFrames] = segmentVideo(filename, threshold)
% Segments the video using 'threshold' as a way to detect change of scene
    video = VideoReader(filename);
    keyFrames = 1;
    previous_frame = readFrame(video);
    current_frame = readFrame(video);
    frame_count = 2;
    while hasFrame(video)
        if frameDiff(current_frame, previous_frame) > threshold
            keyFrames = [keyFrames ; frame_count];
        end
        previous_frame = current_frame;
        current_frame = readFrame(video);
        frame_count = frame_count + 1;
    end
end

function [difference] = frameDiff(frame1, frame2)
% Calculates the difference between images using the image histogram of
% each RGB channel
    [tmp1, ~] = imhist(frame1(:,:,1));
    [tmp2, ~] = imhist(frame2(:,:,1));
    diffR = sum(abs(tmp1 - tmp2));
    [tmp1, ~] = imhist(frame1(:,:,2));
    [tmp2, ~] = imhist(frame2(:,:,2));
    diffG = sum(abs(tmp1 - tmp2));
    [tmp1, ~] = imhist(frame1(:,:,3));
    [tmp2, ~] = imhist(frame2(:,:,3));
    diffB = sum(abs(tmp1 - tmp2));
    difference = diffR + diffG + diffB;
end