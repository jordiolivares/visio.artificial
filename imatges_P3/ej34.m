% Install the VLFeat toolbox
srcPath=cd('toolbox');
vl_setup;
cd(srcPath);
close all;



%% a) Get SIFT descriptors from image
% Load sample image and convert to single grayscale
img = imread('starbuck.jpg');
img = single(rgb2gray(img));

% Run SIFT over the image
[f,d] = vl_sift(img) ;


%% b) Compare descriptors (Rotation)

% Run SIFT over the image with rotation
img90 = imrotate(img,90);
[f90,d90] = vl_sift(img90);

% Show results
figure();
subplot(1,2,1);
imshow(img,[]);
hold on ;
h1 = vl_plotframe(f) ; set(h1,'color','k','linewidth',3) ;
h2 = vl_plotframe(f) ; set(h2,'color','y','linewidth',2) ;
hold off;
subplot(1,2,2);
imshow(img90,[]);
hold on ;
h190 = vl_plotframe(f90) ; set(h190,'color','k','linewidth',3) ;
h290 = vl_plotframe(f90) ; set(h290,'color','y','linewidth',2) ;
hold off;


%% c) Compare descriptors (Scale)

% Run SIFT over the image with scale
img2 = imresize(img,0.5);
[fs2,ds2] = vl_sift(img2);
img4 = imresize(img,0.25);
[fs4,ds4] = vl_sift(img4);

% Show results
figure();
subplot(1,3,1);
imshow(img,[]);
hold on ;
h1 = vl_plotframe(f) ; set(h1,'color','k','linewidth',3) ;
h2 = vl_plotframe(f) ; set(h2,'color','y','linewidth',2) ;
hold off;
subplot(1,3,2);
imshow(img2,[]);
hold on ;
h1s2 = vl_plotframe(fs2) ; set(h1s2,'color','k','linewidth',3) ;
h2s2 = vl_plotframe(fs2) ; set(h2s2,'color','y','linewidth',2) ;
hold off;
subplot(1,3,3);
imshow(img4,[]);
hold on ;
h1s4 = vl_plotframe(fs4) ; set(h1s4,'color','k','linewidth',3) ;
h2s4 = vl_plotframe(fs4) ; set(h2s4,'color','y','linewidth',2) ;
hold off;

%% d) Descriptor values

% Create a test image
testim=single(zeros(100,100));
testim(50:52,50:90)=255;
testim(50:90,50:52)=255;

% Show descriptor with no orientation
f_edge1=[50;70;2;0];
f_edge2=[70;50;2;0];
[f1,d1] = vl_sift(testim,'frames',f_edge1);
[f2,d2] = vl_sift(testim,'frames',f_edge2);
figure();
subplot(2,2,1);
imshow(testim);
hold on;
h3 = vl_plotsiftdescriptor(d1,f1) ;  set(h3,'color','k','linewidth',3) ;
h4 = vl_plotsiftdescriptor(d1,f1) ;  set(h4,'color','g','linewidth',2) ;
h1 = vl_plotframe(f1) ; set(h1,'color','k','linewidth',4) ;
h2 = vl_plotframe(f1) ; set(h2,'color','y','linewidth',2) ;
hold off;
subplot(2,2,2);
imshow(testim);
hold on;
h3 = vl_plotsiftdescriptor(d2,f2) ;  set(h3,'color','k','linewidth',3) ;
h4 = vl_plotsiftdescriptor(d2,f2) ;  set(h4,'color','g','linewidth',2) ;
h1 = vl_plotframe(f2) ; set(h1,'color','k','linewidth',4) ;
h2 = vl_plotframe(f2) ; set(h2,'color','y','linewidth',2) ;
hold off;
subplot(2,2,3);bar(d1);
subplot(2,2,4);bar(d2);
% Show descriptor with no orientation
f_edge1=[50;70;2;0];
f_edge2=[70;50;2;0];
[f1,d1] = vl_sift(testim,'frames',f_edge1,'orientations');
[f2,d2] = vl_sift(testim,'frames',f_edge2,'orientations');
figure();
subplot(2,2,1);
imshow(testim);
hold on;
h3 = vl_plotsiftdescriptor(d1,f1) ;  set(h3,'color','k','linewidth',3) ;
h4 = vl_plotsiftdescriptor(d1,f1) ;  set(h4,'color','g','linewidth',2) ;
h1 = vl_plotframe(f1) ; set(h1,'color','k','linewidth',4) ;
h2 = vl_plotframe(f1) ; set(h2,'color','y','linewidth',2) ;
hold off;
subplot(2,2,2);
imshow(testim);
hold on;
h3 = vl_plotsiftdescriptor(d2,f2) ;  set(h3,'color','k','linewidth',3) ;
h4 = vl_plotsiftdescriptor(d2,f2) ;  set(h4,'color','g','linewidth',2) ;
h1 = vl_plotframe(f2) ; set(h1,'color','k','linewidth',4) ;
h2 = vl_plotframe(f2) ; set(h2,'color','y','linewidth',2) ;
hold off;
subplot(2,2,3);bar(d1);
subplot(2,2,4);bar(d2);