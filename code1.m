%Bakalis Dimitrios A.M. 3033
%Ptwto Meros / Polymesa

image = imread('cameraman.tif');
figure;
imagesc(image);
title('Image');
colormap(gray);

DCT = dct2(image);
x_axis = size(DCT,1);
y_axis = size(DCT,2);

% F < 10 

new_vector = DCT;
for i = 1 : x_axis
  for j = 1 : y_axis
    if (abs(DCT(i,j)) < 10 )
      new_vector(i,j) = 0;
    end
  end
end

Reverse_DCT = idct2(new_vector);
New_Image = uint8(Reverse_DCT);

figure;
imagesc(New_Image);
title('New Image: F<10');
colormap(gray);

% calculation of PSNR

Sums = sum(sum((New_Image - image).^2)); 
N = x_axis * y_axis ;
MSE = Sums / N ;

PSNR = 10 * log10(256*256/MSE) ; % max pixel value of 8-bits per sample is 255
display([PSNR]);

% calculation of zero values

zero_values=sum(sum(new_vector==0));
display([zero_values]);

% F < 15 

new_vector = DCT;
for i = 1 : x_axis
  for j = 1 : y_axis
    if (abs(DCT(i,j)) < 15)
      new_vector(i,j) = 0;
    end
  end
end

Reverse_DCT = idct2(new_vector);
New_Image = uint8(Reverse_DCT);

figure;
imagesc(New_Image);
title('New Image: F<15');
colormap(gray);

% calculation of PSNR

Sums = sum(sum((New_Image - image).^2)); 
N = x_axis * y_axis ;
MSE = Sums / N ;

PSNR = 10 * log10(256*256/MSE) ; % max pixel value of 8-bits per sample is 255
display([PSNR]);

% calculation of zero values

zero_values=sum(sum(new_vector==0));
display([zero_values]);

% F < 20 

new_vector = DCT ;
for i = 1 : x_axis
  for j = 1 : y_axis
    if (abs(DCT(i,j)) < 20)
      new_vector(i,j) = 0;
    end
  end
end

Reverse_DCT = idct2(new_vector);
New_Image = uint8(Reverse_DCT);

figure;
imagesc(New_Image);
title('New Image: F<20');
colormap(gray);

% calculation of PSNR

Sums = sum(sum((New_Image - image).^2)); 
N = x_axis * y_axis ;
MSE = Sums / N ;

PSNR = 10 * log10(256*256/MSE) ;  % max pixel value of 8-bits per sample is 255
display([PSNR]);

% calculation of zero values

zero_values=sum(sum(new_vector==0));
display([zero_values]);
