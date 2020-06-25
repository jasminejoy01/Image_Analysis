% Cover image
cover=imread('einstein.tif');
cover = cover(:,:,1);
[row,col]=size(cover);

% Hidden image
hidden= imread('photo.png');
hidden = hidden(:,:,1);
hidden = imresize(hidden, size(cover));
hidden = floor(double(hidden) / 16);

% Stegnography image
steggroup = zeros(size(cover)); %opening a matrix of size of cover
for i = 1 : numel(cover)
steggroup(i) = bitand(16+32+64+128, cover(i)); % keep bits 5,6,7 and 8
steggroup(i) = bitor(steggroup(i), hidden(i)); % adds bits 1,2,3 and 4
end
subplot (1,3,1), imshow(cover, []), title('Cover Image')
subplot (1,3,2), imshow(steggroup, []), title('Steganography Image')
clear hidden;
clear cover;
clear row;
clear col;

%Extracting hidden image
extract = zeros(size(steggroup));
for i = 1 : numel(steggroup)
extract(i) = bitand(1+2+4+8, steggroup(i)); % keeps four bits
end
clear steggroup;
clear i;
subplot (1,3,3)
imshow(extract, [])
title('Hidden Image')