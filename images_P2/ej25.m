function [ output_args ] = ej25( input_args )
    video = VideoReader('BigBang.mp4');
    output = VideoWriter('output.mp4', 'MPEG-4');
    open(output)
    while hasFrame(video)
        frame = readFrame(video);
        writeVideo(output, imgaussfilt(frame, 10));
    end
    close(output)
    implay('output.mp4')
end

