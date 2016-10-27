function [ output_args ] = ej31( input_args )
%EJ31 Summary of this function goes here
%   Detailed explanation goes here
    output_args = extractBackground(input_args);
end

function [backgroundFrames] = extractBackground(filename)
    keyFrames = segmentVideo(filename, 250000);
    video = VideoReader(filename);
    backgroundFrames = zeros(video.Height, video.Width, 3, size(keyFrames, 1));
    for i = 1:size(keyFrames)
        if i == size(keyFrames)
            numFrames = video.NumberOfFrames - keyFrames(i);
        else
            numFrames = keyFrames(i+1) - keyFrames(i);
        end
        tmp = zeros(video.Height, video.Width, 3, numFrames);
        for j = 1:numFrames
            tmp(:,:,:, j) = readFrame(video);
        end
        backgroundFrames(:,:,:,i) = median(tmp, 4);
    end
end

function [keyFrames] = segmentVideo(filename, threshold)
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