function FeatureVector = FeatureExtraction1imageonly(img,imgreduced)% FeatureVector = FeatureExtraction1imageonly(img, direction,imgreduced,kind)

% Obtener el vector de carateriticas individual de una imagen. 
% La funciión recibe una imagen la reduce a un cuarto de tamaño,
% la segmenta, la binariza y extrae las características.

img = img;
imgC = img;
if imgreduced >= 1
    imgb = BinarizeImg(img, imgreduced); %Binarize image 
    imgC = imgC; % (imgC) a un cuarto de tamaño.
else
    imgb = BinarizeImg(img, imgreduced); %Binarize image 
    imgC = imresize(imgC,0.25); % (imgC) a un cuarto de tamaño.
end

BW = logical(imgb);  % img se convierte en BW
s = regionprops(BW,'all'); % se obtienen las propiedades de los objetos en BW

[Max_A, Index] = max(cat(1,s.Area));
%% La función regionprops por default te da la información por objeto en la imagen. 

Area = s(Index).Area; % Se obtiene el area.
X_length =  s(Index).BoundingBox(3);
Y_length =  s(Index).BoundingBox(4);



FeatureUnion = [Area, X_length, Y_length];
% FeatureUnion = [X_length, Y_length];

FeatureVector = FeatureUnion; 