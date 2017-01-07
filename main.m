clc
close all
clear all
load left;
load right;
% Find maximum response
   I = im2double(imread('venus/left.ppm'));
 
   T= im2double(imread('venus/right.ppm'));
  % Calculate SSD and NCC between Template and Image
   [I_SSD,I_NCC]=template_matching(T,I);
  % Find maximum correspondence in I_SDD image
   [x,y]=find(I_SSD==max(I_SSD(:)));
     disparityRange =[-6 10] ;
disparityMap = disparity(rgb2gray(I),rgb2gray(T),'BlockSize',...
    15,'DisparityRange',disparityRange);
  % Show result
[maxA,ind] = max(I_NCC(:));
[m,n] = ind2sub(size(I_NCC),ind);
disp('Max Value of NCC is:'); disp(maxA); disp('with indexes: '); disp([m,n]);
[maxA,ind] = max(I_SSD(:));
[m,n] = ind2sub(size(I_SSD),ind);
disp('Max Value of SSD is:'); disp(maxA); disp('with indexes: '); disp([m,n]);
   figure(1)
   subplot(2,2,1)
   imshow(I); 
   title('Left')
   subplot(2,2,2)
   imshow(T);
   title('Right');
   subplot(2,2,3)
   imshow(I_SSD); 
   hold on; 
   plot(y,x,'ro');
   title('SSD Matching');
   colorbar;
   subplot(2,2,4)
   imshow(I_NCC);
   hold on;
   plot(y,x,'ro');
   title('Normalized-CC'); 
   colorbar;
   
   figure(2)
imshow(disparityMap,disparityRange);
title('Disparity Map')
colorbar;
