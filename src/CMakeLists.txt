
add_executable(Ejemplo1 entry.S)
add_library(lmain main.c)
add_library(lclock clock_config.c)
add_library(lsyscall syscalls.c)

include_directories(C:/Develop/stm32projects/drivers/CMSIS/include)
include_directories(C:/Develop/stm32projects/drivers/include)
include_directories(${CMAKE_SOURCE_DIR}/include)

add_definitions("-DSTM32F103xB")
target_link_libraries(Ejemplo1 lmain lclock lsyscall)

set_target_properties(
    Ejemplo1
    PROPERTIES
    OUTPUT_NAME Ejemplo1.elf
)

add_custom_command(
    TARGET Ejemplo1
    POST_BUILD
    COMMAND
    ${ARM_OBJDUMP} -hd Ejemplo1.elf > Ejemplo1.lst.map
)

target_compile_options(Ejemplo1 PRIVATE -mthumb)
target_compile_options(Ejemplo1 PRIVATE -mcpu=cortex-m3)
target_compile_options(Ejemplo1 PRIVATE -Wall -Werror -Wextra -g0 -pedantic)
target_compile_options(Ejemplo1 PRIVATE -W)
target_compile_options(Ejemplo1 PRIVATE -ggdb3)
target_compile_options(Ejemplo1 PRIVATE --specs=nano.specs)

target_link_options(Ejemplo1 PRIVATE -mcpu=cortex-m3)
target_link_options(Ejemplo1 PRIVATE --specs=nosys.specs -mthumb -Wl,-Map=test.map -Wl,--gc-sections -static -Wl,--start-group -lc -lm -Wl,--end-group)
target_link_options(Ejemplo1 PRIVATE LINKER:--script=${CMAKE_SOURCE_DIR}/src/linker.ld)
