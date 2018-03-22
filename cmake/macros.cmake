# -----------------------------------------------------------------
# Convenience macros
# -----------------------------------------------------------------

macro(add_to_target TARGET_NAME source_files)

    foreach(file IN ITEMS ${source_files})

        set_property (TARGET ${TARGET_NAME} APPEND PROPERTY SOURCES "${CMAKE_CURRENT_LIST_DIR}/${file}")

    endforeach()

    set_property (TARGET ${TARGET_NAME} APPEND PROPERTY SOURCES "${CMAKE_CURRENT_LIST_FILE}")

endmacro()


macro(tuneup_target TARGET_NAME)

    if (MSVC)

        get_target_property (target_sources ${TARGET_NAME} SOURCES)

        # put all files into a corresponding group filter
        foreach(file IN ITEMS ${target_sources})

            get_filename_component (file "${file}" REALPATH)
            get_filename_component (path "${file}" DIRECTORY)
            file (RELATIVE_PATH filter "${CMAKE_CURRENT_LIST_DIR}" "${path}")
            string (REPLACE "/" "\\" filter "${filter}")
            set (filter "source\\${filter}")
            source_group ("${filter}" FILES "${file}")

        endforeach()

        # turn on pre-compiled headers in Visual Studio
        # set_target_properties (${TARGET_NAME} PROPERTIES COMPILE_FLAGS "/Yustdafx.h")
        # set_source_files_properties (stdafx.cpp PROPERTIES COMPILE_FLAGS "/Ycstdafx.h")

    endif()


endmacro()
