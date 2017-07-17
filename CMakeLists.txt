cmake_minimum_required(VERSION 2.8)
list(APPEND CMAKE_MODULE_PATH ${GOPRO_TOOLS_DIR}/cmake)
include("${GOPRO_TOOLS_DIR}/cmake/gopro.cmake")

gopro_begin_lib(cjson)
include_directories(.)
gopro_public_header_dir(.)
gopro_dir(. GROUP src)
gopro_files(
    cJSON.c
)
gopro_dir(. GROUP include)
gopro_files(
    cJSON.h
)
gopro_end_lib()

