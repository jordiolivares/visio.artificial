
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Eigenfaces: TEST CODE
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Based on the formulation of the eigenfaces method presented in [1]
% 
% Use the Yale database
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; close all; clear;

load EIGENFACES_TRAIN_DATA;

GAMMA = GAMMA(:, idx); %What is GAMMA?

K = 3; %What is k? Look below

PSI_VA = PSI; %What is PSI_VA?

files = dir(fullfile('./test_data','*.bmp'));

face = imread(['./test_data/',files(1).name,'']); 
R = size(face,1);
C = size(face,2);

M = size(U,2); % number of ? examples (reference faces)
N = size(U,1); % number of ? of the eigenfaces space

for f = 1:length(files)
    
    face = imread(['./test_data/',files(f).name,'']);    
    face = face(:);

    PHI_VA = % #to-do: calculate the difference between the face and the mean of all faces

    % What are OMEGA_VA?
    OMEGA_VA = PHI_VA'*U;

    [IDX D] = % #to-do: find the k most similar elements (help knnsearch)
    
    h1 = figure(1);
    subplot(2,3,2);
    imshow(reshape(uint8(face),[R C])); colormap gray;
    title('Test image')
    
    % #to-do: show the first 3 closest faces
    
    % save results
    saveas(h1,['./solutions_recognition/recognition_',files(f).name(1:end-4),'.png'],'png');
    
    % What is PHI_f?
    PHI_f = zeros(N,1);
    h2 = figure(2);
    subplot(1,2,1);
    imshow(reshape(uint8(face),[R C])); colormap gray;
    title('Test image')
    
    for i = 1:M
        PHI_f = PHI_f + OMEGA_VA(i)*U(:,i);
        figure(2), subplot(1,2,2), imshow (reshape(PHI_f, R, C) + reshape(PSI, R, C), []);
        drawnow;
    end
    
    [IDX D] = % #to-do: find the k most similar elements (help knnsearch)
    
    h3 = figure(3);
    subplot(2,3,2);
    imshow(reshape(uint8(face),[R C])); colormap gray;
    title('Test image')
    
    % #to-do: show the first 3 closest faces
    
    pause;
    
    % save results
    saveas(h1,['./solutions_recognition/recognition_',files(f).name(1:end-4),'.png'],'png');
    pause
    
end
