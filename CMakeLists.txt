cmake_minimum_required(VERSION 2.8)
list(APPEND CMAKE_MODULE_PATH ${GOPRO_TOOLS_DIR}/cmake)
include("${GOPRO_TOOLS_DIR}/cmake/gopro.cmake")

gopro_begin_lib(cjson GROUP 3rdparty)
gopro_public_include_dirs(.)
gopro_files(DIR . GROUP src
    cJSON.c
)
gopro_public_files(DIR . INSTALL_DIR include
    cJSON.h
)
gopro_end_lib()

