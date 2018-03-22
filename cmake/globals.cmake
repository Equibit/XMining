# -----------------------------------------------------------------
# Configuration file with project global variables
# -----------------------------------------------------------------

# turn on folders usage in IDEs
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_BINARY_DIR}/build")
set (CMAKE_INSTALL_PREFIX "${PROJECT_BINARY_DIR}/install")
set (THIRDPARTY_DIRECTORY "${PROJECT_SOURCE_DIR}/../thirdparty-x32")

if (MSVC)

    set (CMAKE_DEBUG_POSTFIX "")

    set (disabled_warnings
        "/wd4244"   # warning C4244: conversion from '__int64' to 'unsigned int', possible loss of data
        "/wd4267"   # warning C4244: conversion from 'size_t'  to 'uint16_t',     possible loss of data
        "/wd4018"   # warning C4018: '<=': signed/unsigned mismatch
        "/wd4996"   # warning C4996: The POSIX name for this item is deprecated. Instead, use the ISO C and C++ conformant name: _strdup. See online help for details.
        "/wd4028"   # warning C4028: formal parameter 1 different from declaration
        "/wd4098"   # warning C4098: 'devstatus': 'void' function returning a value
        "/wd4013"   # warning C4013: 'xxxxx' undefined; assuming extern returning int
        )

    string (REPLACE ";" " " disabled_warnings "${disabled_warnings}")

    set (compiler_flags "/MP /bigobj")

    if (STRICT_COMPILER)

        set (compiler_flags "${compiler_flags} /WX /W4")

    endif()

    set (definitions
        "
        -D_CRT_SECURE_NO_WARNINGS
        -D_SCL_SECURE_NO_WARNINGS
        -D_WINSOCK_DEPRECATED_NO_WARNINGS
        "
        )

    set (CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   ${compiler_flags} ${definitions} ${disabled_warnings}")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${compiler_flags} ${definitions} ${disabled_warnings}")

    #set (CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /O2 /Ob2 /Oi /Ot /Oy /GL /Z7")
    #set (CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} /NODEFAULTLIB:libcmt.lib")
    #set (CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /LTCG /OPT:REF /DEBUG /NODEFAULTLIB:libcmt.lib")
    #set (CMAKE_STATIC_LINKER_FLAGS_RELEASE "${CMAKE_STATIC_LINKER_FLAGS_RELEASE} /LTCG")

else()

    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -Wall -Wextra -Wconversion -Werror")
    set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -D_DEBUG")

endif()
