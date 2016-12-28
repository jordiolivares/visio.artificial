clc; close all; clear;

facesDir = 'training_data';
faces = dir(fullfile(facesDir,'*.bmp')); %What is the variable faces containing?
% It contains all the faces to be used in the process of training.

face = imread(['./training_data/',faces(1).name,'']);
R = size(face,1);
C = size(face,2);
GAMMA = double(zeros(R.*C, length(faces)));
M=length(faces);

% #to-do: fulfill the matrix GAMMA: each row corresponds to an image of the training data
for i=1:M
    im = imread(['./training_data/',faces(i).name,'']);
    GAMMA(:, i) = im(:);
end

PSI = mean(GAMMA, 2);% #to-do: calculate the mean face of the training data
imshow(uint8(round(reshape(PSI, [R C]))));% #to-do: visualize PSI
A = GAMMA - repmat(PSI, 1, M);% #to-do: calculate the matrix A by subtracting the mean face from each feature vector (help repmat)

% What is the trick of the method here?
% Instead of calculating the eignevectors of A * A', we instead will
% calculate the eigenvectors of A' * A
S_trick = A'*A;

[V, D] = eig(S_trick);% #to-do: calculate the eigenvector and the eigenvalue of the trick matrix (help eig)
% Which is the dimension of V? Compare to the dimension of the original images. 
% V is 83x83, meaning it defines an 83-dimensional space, while the images
% lie in an 77760-dimensional space.
U = zeros(size(A));% #to-do: initialize eigenfaces taking into account the dimensionality reduction

% What is the following step here representing?
for l = 1:M % #to-do: specifiy the limit of the loop
    ul = double(zeros(size(A,1),1));
    for k = 1:M % #to-do: specifiy the limit of the loop   
        ul = ul + V(l,k)*A(:,k); 
    end
    U(:,l) = ul; 
end
    
dd = diag(D);% #to-do: extract the eigen values of the matrix D (help diag)
[dd idx] = sort(dd, 'descend');% #to-do: sort them in descendent order

% What are we doing here? Why? Document the code in the following rows.
% We want to preserve the eigenvectors with an eigenvalue > 0 since those
% are the vectors that will give us information that is useful to us.
dd = dd(dd>0); % We preserve the eigenvectors that have a positive value
idx2 = idx(dd>0); % We keep the descending order of the positive values
U = U(:,idx2); % We only save the vectors from above

numberOfEigenFaces = length(dd);% #to-do: calculate the number of eigenfaces

% Can we say that the following 4 eigenfaces images are the most
% representative eigenfaces? If so, why?
% Yes. The following are the most representative eigenfaces because they
% are the ones with the most prominent eigenvalues.
figure();
subplot(2,2,1), imshow(reshape(U(:,1), R, C), []), title('Eigenface 1');
subplot(2,2,2), imshow(reshape(U(:,2), R, C), []), title('Eigenface 2');
subplot(2,2,3), imshow(reshape(U(:,3), R, C), []), title('Eigenface 3');
subplot(2,2,4), imshow(reshape(U(:,4), R, C), []), title('Eigenface 4');

% Define the steps here. What is W_TRAIN?
A = A(:, idx); % We sort the columns (eigenvectors) in descending order in accordance to how we sorted the eigenvalues
W_TRAIN = A' * U; % W_TRAIN is a matrix containing the projection of all faces into eigenface space

% Visualize the images of 5 different persons with 5 colors corresponding to each person in the space of the first 3 most important
% eigenfaces space.
figure;
colours = ['b' 'g' 'r' 'm' 'k' ];
for i=1:5
    plot3(W_TRAIN(i, 1), W_TRAIN(i, 2), W_TRAIN(i, 3), colours(i), 'Marker', 'h', 'MarkerSize', 10);
    hold on;
end
hold off;
save('EIGENFACES_TRAIN_DATA', 'GAMMA', 'PSI', 'idx', 'U', 'W_TRAIN', 'A');
