cmake_minimum_required(VERSION 3.17)
project(neurona)

set(CMAKE_CXX_STANDARD 20)

add_executable(neurona main.cpp)

find_package(Matlab)

include_directories("C:/Program Files/MATLAB/R2020a/extern/include")

include_directories("D:/GitHub/libserial-master/src/libserial")

include_directories("D:/GitHub/libserial-master/src")

include_directories("D:/GitHub/libserial-master")

