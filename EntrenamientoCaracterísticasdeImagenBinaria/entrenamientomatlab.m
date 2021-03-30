clc; close all; clear all;
size_img = [960, 1280];
%% Binarizacion Carros Entrenamiento
cars= dir('Imgexp/Train/Cars/*.jpg');
for k=1:length(cars)
    car= imread(string(cars(k).folder) + '\' + string(cars(k).name));
    car = imresize(car,[size_img]);
    car_bin = FeatureExtraction1imageonly(car, 1);
%     car_flatten = car_bin(:)';
    entradas(k,:) = car_bin; %car_flatten;
    target(k) = 0;
    if mod(k,10) == 0
    fprintf(['\nTrain Car Image ', num2str(k), ' analized']);
    end
end
%  squeezed = reshape(c(1,:,:,:),[z(2:end)]);
%% Binarizacion Humanos Entrenamiento
humans= dir('Imgexp/Train/Humans/*.jpg');
for j=1:length(humans)
    human= imread(string(humans(j).folder) + '\' + string(humans(j).name));
    human = imresize(human,[size_img]);
    human_bin = FeatureExtraction1imageonly(human, 1);
%     human_r = imresize(human_bin,[size(car_bin)]);
%     human_flatten = human_bin(:)';%human_r
    entradas(k+j,:) =  human_bin; %human_flatten;
    target(k+j) = 1;
    if mod(j,10) == 0
    fprintf(['\nTrain Human Image ', num2str(j), ' analized']);
    end
end

%%
inp = [];
for i=1:length(car_bin)
    inp(1,i) = 0;
    inp(2,i) = 1;
end
%%
netnewexp3carac=newp(inp',1);
%%
% net=perceptron;
netnewexp3carac.trainParam.epochs=100000;
netnewexp3carac=train(netnewexp3carac,entradas',target);
fprintf('Simulacion Datos de Entranamiento')
simul = sim(netnewexp3carac, entradas')

%% Binarizacion Carros Validacion
valsc=dir('Imgexp/Val/Cars/*.jpg');
for k=1:length(valsc)
    valimgc = imread(string(valsc(k).folder) + '\' + string(valsc(k).name));
    valimg_rc = imresize(valimgc,[size_img]);
    valimg_binc = FeatureExtraction1imageonly(valimg_rc, 1);
%     valimg_flattenc = valimg_binc(:)';
    entradasv(k,:) = valimg_binc; %valimg_flattenc;
    if mod(k,10) == 0
    fprintf(['\n Val Car Image ', num2str(k), ' analized']);
    end
end

%% Binarizacion Humanos Validacion
valsh=dir('Imgexp/Val/Humans/*.jpg');
for j=1:length(valsh)
    valimgh = imread(string(valsh(j).folder) + '\' + string(valsh(j).name));
    valimg_rh = imresize(valimgh,[size_img]);
    valimg_binh = FeatureExtraction1imageonly(valimg_rh, 1);
%     valimg_flattenh = valimg_binh(:)';
    entradasv(k+j,:) = valimg_binh; %valimg_flattenh;
    if mod(j,10) == 0
    fprintf(['\n Val Human Image ', num2str(j), ' analized']);
    end
end

%% Probar con datos de simuación

fprintf('Simulacion Datos de Validacion')
simul = sim(netnewexp3carac, entradasv')

%% Guardar modelo 

save netnewexp3carac