%% Red-Blue or White-Gold ???

clear all;
dress = imread('C:\Users\Jasmine\Desktop\DivisiveDress1.png');

%% Negative Image
% Checking if the negative of the image provides the white-gold illusion.
neg = 255-dress;
figure(1)
subplot(1,2,1), imshow(dress), axis on,title('Original Image')
subplot(1,2,2), imshow(neg), axis on,title('Negative Image')
% Result: The negative image does not capture the white-gold illusion. 

%% RGB Channel
% Filtering image into red, green and blue channels to analyze results
redChannel = dress(:,:,1);
greenChannel = dress(:,:,2);
blueChannel = dress(:,:,3);

figure(2)
subplot(1,4,1), imshow(dress), axis on,title('Original Image')
subplot(1,4,2), imshow(redChannel), axis on,title('Red Channel')
subplot(1,4,3), imshow(greenChannel), axis on,title('Green Channel')
subplot(1,4,4), imshow(blueChannel), axis on,title('Blue Channel')
% Result: The red, green, and blue channels washes out the image to provide a
% grayscale effect.

%% Scaling RGB
% Since Yellow = Green + Red. Perhaps using a scale to manipulate the
% ranges of the three channels would be effective. Since the white-gold
% effect seems to have a yellow hue, maybe on decreasing the range of blue
% to a narrow range one would be able to replicate the effect.
dressadjust = imadjust(dress,[0.1 0.0 0.7; 0.65 0.85 1.0], []);

figure(3)
subplot(1,2,1), imshow(dress), axis on,title('Original Image')
subplot(1,2,2), imshow(dressadjust), axis on,title('Modified RGB Ranges')
% Result: The Gold-white illusion maybe a product of excess artificial light falling 
% on the dress at the time the image was taken. The excess artificial light could
% be a result of reflection from an adjacent mirror.


%% Recreating the white-gold effect
% This is an attempt to create-the white-gold illusion by blending the
% original image with the adjusted image ontained in Figure 3.
figure(4)
imshowpair(dress,dressadjust, 'blend'), title('Recreating the White-Gold illusion')
