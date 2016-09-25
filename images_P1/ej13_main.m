car = imread('car_gray.jpg');
car_130 = ej13(car, 130);

figure
subplot(2,1,1)
imshow(car)
subplot(2,1,2)
imshow(car_130)