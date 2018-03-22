# -------------------------------------------------------------
# A fake target with CMake modules to access them easily in IDE
# -------------------------------------------------------------

set (TARGET_NAME CMake)

set (source_files
    globals.cmake
    macros.cmake
    )

add_custom_target(${TARGET_NAME} SOURCES ${source_files})

tuneup_target(${TARGET_NAME})
