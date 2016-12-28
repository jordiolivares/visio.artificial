
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
% GAMMA is the matrix of all face images used in the training

K = 3; %What is k? Look below
% K is the number of neighbors we want to obtain

PSI_VA = PSI; %What is PSI_VA?
% PSI_VA is the average face of GAMMA

files = dir(fullfile('./test_data','*.bmp'));

face = imread(['./test_data/',files(1).name,'']); 
R = size(face,1);
C = size(face,2);

M = size(U,2); % number of eigenvectors that have an eigenvalue > 0 (reference faces)
N = size(U,1); % number of dimensions of the eigenfaces space

mkdir('./solutions_recognition');

for f = 1:length(files)
    
    face = imread(['./test_data/',files(f).name,'']);    
    face = face(:);

    PHI_VA = double(face) - PSI_VA;% #to-do: calculate the difference between the face and the mean of all faces

    % What are OMEGA_VA?
    % It's the projection of the face into the reduced dimension space
    OMEGA_VA = PHI_VA'*U;

    [IDX D] = knnsearch(W_TRAIN, OMEGA_VA, 'k', K);% #to-do: find the k most similar elements (help knnsearch)
    
    h1 = figure(1);
    subplot(2,3,2);
    imshow(reshape(uint8(face),[R C])); colormap gray;
    title('Test image')
    
    % #to-do: show the first 3 closest faces
    for i = 1:3
        subplot(2,3,3+i);
        imshow(reshape(uint8(GAMMA(:, IDX(i))),[R C])); 
        title(['Similar face ', num2str(i)]);
    end
    
    % save results
    saveas(h1,['./solutions_recognition/recognition_',files(f).name(1:end-4),'.png'],'png');
    
    % What is PHI_f?
    % It's the result of applying the projection of the reduced space back
    % into the normal space
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
    
    [IDX D] = knnsearch(A', PHI_f', 'k', K);% #to-do: find the k most similar elements (help knnsearch)
    
    h3 = figure(3);
    subplot(2,3,2);
    imshow(reshape(uint8(face),[R C])); colormap gray;
    title('Test image')
    
    % #to-do: show the first 3 closest faces
    for i = 1:3
        subplot(2,3,3+i);
        imshow(reshape(uint8(GAMMA(:, IDX(i))),[R C])); 
        title(['Similar face ', num2str(i)]);
    end
    pause;
    
    % save results
    saveas(h1,['./solutions_recognition/recognition_',files(f).name(1:end-4),'.png'],'png');
    pause
    
end
