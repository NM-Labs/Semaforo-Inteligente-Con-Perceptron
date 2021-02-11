<<<<<<< HEAD
clear a; clc; clear all; close all;
a=arduino();
Carro='D6';
SCarro = 'D7';
Humano='D4';
SHumano = 'D5';

url = 'http://XXX.XXX.X.XX:XXXW/shot.jpg'; %url obtenido de IP Webcam app
ss  = imread(url);
fh = image(ss);
size_img = [960,1280];


formatSpec = '%d\n';
formatSpec2 = '%d %d';

for j=1:3
    fprintf('\n \n Analizando imagen #%d \n',j);
    ss  = imread(url);
%     set(fh,'CData',ss);
%     drawnow;
    fprintf('Imagen Leída \n')
    testimg_r = imresize(ss,[size_img]);
    testimg_bin = BinarizeImg(testimg_r, 1);
    testimg_flatten = testimg_bin(:)';
    fileTarget = fopen('D:/Directorio/ImgRead.csv','wt');
    img_size = size(testimg_flatten);
    imgT = testimg_flatten';
    fprintf('Binarizada y Vectorizada \n')
    for i= 1:img_size(2)
        if i < img_size(2)
            fprintf(fileTarget, formatSpec, imgT(i)); 
        else
            fprintf(fileTarget, '%d', imgT(i));
        end
    end
    fprintf('CSV Escrito \n')
    fclose(fileTarget);
    % Leer el archivo de respuesta
    txt = dir('D:/Directorio/Respuesta.txt');    
    date1 = txt.date;
    date2 = date1;
    while date1 == date2
        txt2 = dir('D:/Directorio/Respuesta.txt');
        date2 = txt2.date;
    end
    fileID = fopen('D:/Directorio/Respuesta.txt','r');
    formatSpecResp = '%d';
    fprintf('Respuesta Leída \n')
    Resp = fscanf(fileID,formatSpecResp);
    fclose(fileID);
    % Actuar sobre arduino
    if Resp == 0
        fprintf('Estoy viendo un coche \n')
        writeDigitalPin(a,SCarro,0)
        writeDigitalPin(a,SHumano,1)
        writeDigitalPin(a,Carro,1)
        writeDigitalPin(a,Humano,0)
    else
        fprintf('Estoy viendo una persona \n')
        writeDigitalPin(a,SCarro,1)
        writeDigitalPin(a,SHumano,0)
        writeDigitalPin(a,Carro,0)
        writeDigitalPin(a,Humano,1)
    end
    % En espera de un nuevo dato
    
          
    pause(2);
end
fileTarget = fopen('D:/Directorio/ImgRead.csv','wt');
fprintf(fileTarget, "%s", "Fin");
fclose(fileTarget);
fprintf('Fin')
writeDigitalPin(a,SCarro,0)
writeDigitalPin(a,SHumano,0)
writeDigitalPin(a,Carro,0)
writeDigitalPin(a,Humano,0)
=======
clear a; clc; clear all; close all;
a=arduino();
Carro='D6';
SCarro = 'D7';
Humano='D4';
SHumano = 'D5';

url = 'http://XXX.XXX.X.XX:XXXW/shot.jpg'; %url obtenido de IP Webcam app
ss  = imread(url);
fh = image(ss);
size_img = [960,1280];


formatSpec = '%d\n';
formatSpec2 = '%d %d';

for j=1:3
    fprintf('\n \n Analizando imagen #%d \n',j);
    ss  = imread(url);
%     set(fh,'CData',ss);
%     drawnow;
    fprintf('Imagen Leída \n')
    testimg_r = imresize(ss,[size_img]);
    testimg_bin = BinarizeImg(testimg_r, 1);
    testimg_flatten = testimg_bin(:)';
    fileTarget = fopen('D:/Directorio/ImgRead.csv','wt');
    img_size = size(testimg_flatten);
    imgT = testimg_flatten';
    fprintf('Binarizada y Vectorizada \n')
    for i= 1:img_size(2)
        if i < img_size(2)
            fprintf(fileTarget, formatSpec, imgT(i)); 
        else
            fprintf(fileTarget, '%d', imgT(i));
        end
    end
    fprintf('CSV Escrito \n')
    fclose(fileTarget);
    % Leer el archivo de respuesta
    txt = dir('D:/Directorio/Respuesta.txt');    
    date1 = txt.date;
    date2 = date1;
    while date1 == date2
        txt2 = dir('D:/Directorio/Respuesta.txt');
        date2 = txt2.date;
    end
    fileID = fopen('D:/Directorio/Respuesta.txt','r');
    formatSpecResp = '%d';
    fprintf('Respuesta Leída \n')
    Resp = fscanf(fileID,formatSpecResp);
    fclose(fileID);
    % Actuar sobre arduino
    if Resp == 0
        fprintf('Estoy viendo un coche \n')
        writeDigitalPin(a,SCarro,0)
        writeDigitalPin(a,SHumano,1)
        writeDigitalPin(a,Carro,1)
        writeDigitalPin(a,Humano,0)
    else
        fprintf('Estoy viendo una persona \n')
        writeDigitalPin(a,SCarro,1)
        writeDigitalPin(a,SHumano,0)
        writeDigitalPin(a,Carro,0)
        writeDigitalPin(a,Humano,1)
    end
    % En espera de un nuevo dato
    
          
    pause(2);
end
fileTarget = fopen('D:/Directorio/ImgRead.csv','wt');
fprintf(fileTarget, "%s", "Fin");
fclose(fileTarget);
fprintf('Fin')
writeDigitalPin(a,SCarro,0)
writeDigitalPin(a,SHumano,0)
writeDigitalPin(a,Carro,0)
writeDigitalPin(a,Humano,0)
>>>>>>> 7f11f32fec43029344f015af184b8ee4afd6a198
