cmake_minimum_required(VERSION 3.27)

find_program(ARM_C arm-none-eabi-gcc REQUIRED)
find_program(ARM_CXX arm-none-eabi-g++ REQUIRED)
find_program(ARM_OBJDUMP arm-none-eabi-objdump REQUIRED)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_C_COMPILER_ID GNU)
set(CMAKE_C_COMPILER_FORCED True)
set(CMAKE_C_COMPILER ${ARM_C})
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)

set(CMAKE_CXX_COMPILER_ID GNU)
set(CMAKE_CXX_COMPILER_FORCED True)
set(CMAKE_CXX_COMPILER ${ARM_CXX})
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

project(Example1)

enable_language(C ASM)

add_subdirectory(src)
