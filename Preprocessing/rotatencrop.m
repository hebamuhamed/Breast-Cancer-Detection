% load the image
img = imread('D:\College\Fourth Year\Grad Project\Code\dataset\mlor\0cab307846e0ff5ff6f302421c539605.jpg');

% rotate the image by a certain angle
angle = 70; % degrees
rot_img = imrotate(img, angle,'crop');

% crop a part of the image
crop_x = 0; % x-coordinate of the top-left corner of the crop
crop_y = 400; % y-coordinate of the top-left corner of the crop
crop_width = 4000; % width of the crop
crop_height = 4000; % height of the crop
crop_img = imcrop(rot_img, [crop_x, crop_y, crop_width-1, crop_height-1]);
angle = -70; % degrees
rot_img2 = imrotate(crop_img, angle,'crop');
% display the original image, rotated image, and cropped image
figure;
subplot(1,3,1); imshow(img); title('Original Image');
subplot(1,3,2); imshow(rot_img); title('Rotated Image');
subplot(1,3,3); imshow(rot_img2); title('Cropped Image');
%%
close all;
%%
path_directory='D:\College\Fourth Year\Grad Project\Code\dataset\mlor';
original_files=dir([path_directory '/*.jpg']); 
for k=1:length(original_files)
    filename=[path_directory '/' original_files(k).name];
    %fprintf('done %d %s \n',k,filename)
    I=imread(filename);
    % rotate the image by a certain angle
    angle = 70; % degrees
    rot_img = imrotate(I, angle, 'crop');
    % crop a part of the image
    crop_x = 0; % x-coordinate of the top-left corner of the crop
    crop_y = 425; % y-coordinate of the top-left corner of the crop
    crop_width = 4000; % width of the crop
    crop_height = 3000; % height of the crop
    crop_img = imcrop(rot_img, [crop_x, crop_y, crop_width-1, crop_height-1]);
    angle = -70; % degrees
    rot_img2 = imrotate(crop_img, angle, 'crop');
    %newrotateImg = rot_img2;
    %newrotateImg(newrotateImg == 0.007843 ) = 255;
    %figure;
    %subplot(1,5,1); imshow(I); title('Original Image');
    %subplot(1,5,2); imshow(rot_img); title('Rotated Image');
    %subplot(1,5,3); imshow(crop_img); title('Cropped Image');
    %subplot(1,5,4); imshow(rot_img2); title('Original Position');
    imwrite(rot_img2,filename);
    fprintf('done %d %s \n',k,filename)
end
%%
img = imread('D:\College\Fourth Year\Grad Project\Code\classes\og\test\00b2567654cfadcda25f5bcbe44f4974.jpg');
r_value = 0.007843; % red value
g_value = 0.007843; % green value
b_value = 0.007843; % blue value
[r, c] = size(img);
img = cat(3, img, img, zeros(r, c));
mask = bsxfun(@eq, img, [r_value, g_value, b_value]);
mask = all(mask, 3); % Combine the binary masks for each channel
img(mask) = 0;
imwrite(img, 'modified_image.png');