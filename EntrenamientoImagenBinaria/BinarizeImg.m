function C = BinarizeImg(C, imgreduced)

if imgreduced >= 1
    C_25 = C;
else
    F25 = 0.25;
    C_25 = imresize(C,F25);
    C_25 = C_25;
end


F = makecform('srgb2cmyk');     
T = applycform(C_25,F);

M =  T(:,:,2);

Lcont = ContrastFunctions;
Lcont.Value = M;
M = Cubica(Lcont);

Ot = graythresh(M)*256;

IOT = M;
i = IOT <= Ot;
j = IOT > Ot;
IOT(i) = 0;
IOT(j) = 256;

    
Ori = IOT;
BW = logical(IOT);
s = regionprops(BW,'Centroid', 'Area', 'SubarrayIdx');
c = regionprops(BW,'Circularity');
centroids = cat(1,s.Centroid);


for k = 1 : length(c)
  Ar = s(k).Area;
  %BB = s(k).BoundingBox;
s(k).isGreater = Ar < 380; 
for i = find(s(k).isGreater).'
    BW(s(k).SubarrayIdx{i,1},s(k).SubarrayIdx{i,2}) = false; 
end
      %rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)],'FaceColor','black','EdgeColor','black','LineWidth',2 )
end


C = BW;