/******************************************************************************

            Codigo Entrenamiento de un perceptron para imagenes
    La teoria de funcionamiento es adaptada al perceptron de Rosenblatt
       Autores del Codigo - Github Users: @Natalia-SP y @Mariuki

*******************************************************************************/

#include <iostream>
#include <fstream>
#include <chrono>
#include <random>
#include <vector>
#include <tuple>
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>
#include <fstream>
#include <algorithm>
#include <string>
#include <utility>
#include <stdexcept>
#include <sstream>
#include "csvfile.h"
#include <typeinfo>

#include <ctime>
#include <sys/types.h>
#include <sys/stat.h>
#include <cerrno>
#include <cstring>
#include <winbase.h>


using namespace std;

vector<vector<int>> GetTrainData(){
    ifstream in(R"(D:\Directorio\Imagenes.csv)");

    string line, field;

    vector< vector<int> > array;
    vector<int> v;

    while ( getline(in,line) )
    {
        v.clear();
        stringstream ss(line);

        while (getline(ss,field,','))
        {
            v.push_back(stoi(field));
        }

        array.push_back(v);
    }
//    cout << array[1].size() << "\t" << array.size() << endl;

    return array;
}

vector<int> GetTrainTarget(){
    ifstream in(R"(D:\Directorio\Target.csv)");

    string line, field;

    vector<int> array;

    while ( getline(in,line) )
    {
        array.push_back(stoi(line));
    }
//    cout << array[1].size() << "\t" << array.size() << endl;
//    for (auto& row : array) {
//            std::cout << row << "  ";
//
//    }
    return array;
}

vector<int> GetImageTest(){
    ifstream in(R"(D:\Directorio\ImgRead.csv)");

    string line, field;

    vector<int> array;

    while ( getline(in,line) )
    {
        array.push_back(stoi(line));
    }
//    cout << array[1].size() << "\t" << array.size() << endl;
//    for (auto& row : array) {
//        std::cout << row << "  ";
//
//    }
    return array;
}

vector<float> GetPesos(){
    ifstream in(R"(D:\Directorio\Pesos.csv)");

    string line, field;

    vector<float> array;

    while ( getline(in,line) )
    {
        array.push_back(stof(line));
    }
//    cout << array[1].size() << "\t" << array.size() << endl;
//    for (auto& row : array) {
//        std::cout << row << "  ";
//
//    }
    return array;
}

std::vector<float>  PerceptronTrain() {
    srand(time(NULL));

        // Ejercicio Frutas //
//    int input[6][6] = {{-1, 1, 1, 1, 1, 1},
//                       {1,-1, 1, 1, 1, 1},
//                       {-1,-1,-1, 1, 1, 1},
//                       {1, 1,-1,-1, 1, 1},
//                       {-1, 1,-1, 1, 1, 1},
//                       {1,-1, 1, 1, 1, 1}};
//    std::vector<int> target = {1,1,-1,-1,-1,1};
//    float intervalos[] = {-0.98,- 0.87,-0.65,-0.75,0.45,0.95,-0.32,-0.28,-0.11,-0.06,0.023,0.23,0.23,0.46,0.67,0.78, 0.75,0.82,0.98};

//    std::vector<float> pesos = {intervalos[rand() % 18],intervalos[rand() % 18],intervalos[rand() % 18],intervalos[rand() % 18],intervalos[rand() % 18],intervalos[rand() % 18]};

    // Compuertas //
//    int input[4][2] = {{0, 0},
//                       {0, 1},
//                       {1, 0},
//                       {1, 1}};
//    std::vector<int> target = {1, 1, 1, 0};

    // Nuestros Datos//

    vector<vector<int>> input = GetTrainData();
    vector<int> target = GetTrainTarget();
    std::vector<float> pesos;

    for (int i=0; i < input[0].size(); i++)
        pesos.push_back(0);

    float lr = .3;
    float bias = 1;//intervalos[rand() % 18];

    //

    //// Operaciones ////
    int NumMuestras = input[0].size();
    int NumEntradas = input.size();

    cout << NumMuestras << "\t" << NumEntradas << endl;

    int corr = 0;
    std::vector<int> vecsalida = {0, 0, 0, 0};
    int error;
    int salida;
    float neurona;
    int n = 1;
    int k = 1;
    int cont = 0;
    /*cout << pesos[0] << "\t" << pesos[1] << "\t" << pesos[2] << "\t" << pesos[3] <<
         "\t" << pesos[4] << "\t" << pesos[5]  << endl;*/
    cout << "n" << "\t" << "W1" << "\t" << "W2" << "\t" << "b" <<
         "\t" << "error" << "\t" << "salida" << "\t" << "vecs[i]" << "\t"
         << "target[i]" << endl;
    while (corr == 0) {
        // n++;
        k++;
        for (int i = 0; i < NumMuestras;) {
            neurona = 0.0;
            for (int j = 0; j < NumEntradas;j++) {
                int input_ij = input[i][j];
                neurona += input[i][j] * pesos[j];
            }
            neurona += bias; //Original = signo -
            salida = neurona < 0 ? 0 : 1; //Original = neurona <= 0 ? 0 : 1;
            if (salida == target[i]) {
                error = 0;
                /* cout << n << "\t" << pesos[0] << "\t" << pesos[1] << "\t" << bias <<
                      "\t" << error << "\t" << salida << "\t" << vecsalida[i] << "\t"
                      << target[i] << endl;*/
                vecsalida[i] = salida;
                i++;
            } else {
                error = target[i] - salida;
                for (int j = 0; j < NumEntradas;j++) {
                    pesos[j] = pesos[j] + /*lr * */ error * input[i][j]; //Original = lleva lr
                }
                bias = bias + /*(-lr) */ error;  //Original = lleva lr
                cout << n << "\t" << pesos[0] << "\t" << pesos[1] << "\t" << pesos[2] /*<< "\t"
                << pesos[3] << "\t" << pesos[4] << "\t" << pesos[5] */ << "\t" << bias <<
                     "\t" << error << "\t" << salida << "\t" << vecsalida[i] << "\t"
                     << target[i] << endl;
                vecsalida.clear();
                n++;
                if(n > 2000) {
                    cout << "[!] Demasiadas epocas realizadas!\n") << endl;
                    cout << "[!] Intente nuevamente con otros pesos.\n" << endl;
                    exit(1);
                }
            }

        }
        for (int i = 0; i < NumMuestras; i++) {
            neurona = 0.0;
            for (int j = 0; j < NumEntradas;j++) {
                neurona = neurona + input[i][j] * pesos[j];
            }
            neurona = neurona + bias; //Original = signo -
            salida = neurona < 0 ? 0 : 1; //Original = neurona <= 0 ? 0 : 1;
            if (salida == target[i]) {
                cont++;
//                cout <<  "verificar" << salida << "\t" << target[i]  << endl;
            } else { cont = 0; }
            if (cont == NumMuestras) {
                corr = 1;
            }
        }

    }
    for (auto i = 0; i < NumMuestras; i++) {
        neurona = 0.0;
        for (int j = 0; j < NumEntradas;j++) {
            neurona = neurona + input[i][j] * pesos[j];
        }
        neurona = neurona + bias;  //Original = signo -
        salida = neurona < 0 ? 0 : 1;  //Original = neurona <= 0 ? 0 : 1;
        cout << "Verificacion:\t" << salida << "\t" << target[i] << endl;
    }
    cout << "Pesos finales:\t" << pesos[0] << "\t" << pesos[1] << "\t" << bias << endl;
//    for (auto& p : pesos) {
//        std::cout << p << "  ";
//
//    }

    vector<float> pfinales = pesos;
    pfinales.push_back(bias);
    try
    {
        csvfile csv("Pesos.csv"); // throws exceptions!
        for(int i = 0; i< pfinales.size(); i++)
            csv << pfinales[i] << endrow;
    }
    catch (const std::exception &ex)
    {
        std::cout << "Exception was thrown: " << ex.what() << std::endl;
    }
    return pfinales;
}

void PerceptronTest(/*std::vector<float> pesosrec*/){
    vector<float> pesosrec = GetPesos();
    vector<float> pesos;
    float neuron = 0.0;
    cout << "Pesosrec:\t" << pesosrec.size() << endl;
    for (int i = 0; i< pesosrec.size()-1; i++){
        pesos.push_back(pesosrec[i]);
    }

    cout << "Pesos size:\t" << pesos.size() << endl;
    int bias = pesosrec[pesosrec.size()];
    vector<int> image = GetImageTest();
    int j = 0;
    while( j < 1228800 ) {
        j++;
        neuron += image[j] * pesos[j];

    }
    neuron += bias;
    cout << "Neurona:\t" << neuron << endl;
    int salida = neuron < 0 ? 0 : 1;
    string sal  = salida == 0 ? "Coche" : "Persona";
    cout << "Resultado:\t" << sal << endl;
    ofstream myfile;
    myfile.open ("D:/Documentos/Respuesta.txt");
    myfile << salida;
    myfile.close();
//    cout << "Pesos test finales:\t" << pesosrec[0] << "\t" << pesosrec[1] << "\t" << pesosrec[2] << endl;
}

int main(int argc, char **argv)
{

    for(int i =0; i<3; i++) {
//int control = 0;
//while(control == 0){
        struct stat fileInfo;

        if (stat(
                "D:/Directorio/ImgRead.csv",
                &fileInfo) != 0) {
            std::cerr << "Error: " << strerror(errno) << '\n';
            return (EXIT_FAILURE);
        }
        char* a = ctime(&fileInfo.st_mtime);
        cout << "Resultados para imagen #" << i+1 << "\n" << endl;
        PerceptronTest();
        cout << "\n " << "-----------Consulta Finalzada -------------"  << "\n \n \n" << endl;
        char* b = ctime(&fileInfo.st_mtime);
        std::string stra(a);
        std::string strb(b);
        int g = 0;
        while(stra== strb){
            g++;
            Sleep(25000);
            struct stat fileInfo;
            if (stat(
                    "D:/Directorio/ImgRead.csv",
                    &fileInfo) != 0) {
                std::cerr << "Error: " << strerror(errno) << '\n';
                return (EXIT_FAILURE);
            }
//             std::cout << strb << '\n' << std::flush;

            b = ctime(&fileInfo.st_mtime);
            std::string strc(b);
            strb = strc;
        }

//     cout << a << endl;

    }

    return 0;
}
