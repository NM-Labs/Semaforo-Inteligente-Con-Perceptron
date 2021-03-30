clear a; clc; clear all; close all;


load netnewexp3carac.mat


url = 'http://XXX.XXX.X.XX:XXXW/shot.jpg'; %url obtenido de IP Webcam app
ss  = imread(url);
size_img = [960,1280];


formatSpec = '%d\n';
formatSpec2 = '%d %d';

for j=1:10
    fprintf('\n \n Analizando imagen #%d \n',j);
    ss  = imread(url);
    image(ss);

    fprintf('Imagen Leída \n')
    testimg_r = imresize(ss,[size_img]);
    vec_carac = FeatureExtraction1imageonly(testimg_r, 1)
    fprintf('Simulacion Datos de Validacion')
    simul = sim(netnewexp3carac, vec_carac')
    
    % Actuar sobre arduino
    if simul == 0
        fprintf('Estoy viendo un coche \n')

    else
        fprintf('Estoy viendo una persona \n')

    end       
    pause(2);
end

