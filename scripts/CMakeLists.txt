# -------------------------------------------------------
# A fake target with scripts to access them easily in IDE
# -------------------------------------------------------

set (TARGET_NAME scritps)

set (source_files
    docker/ubuntu/bash.ps1
    docker/ubuntu/build.ps1
    docker/ubuntu/dockerfile
    docker/ubuntu/create.image.ps1
    docker/ubuntu/project.ps1
    docker/delete.all.ps1
    docker/list.images.ps1
    ubuntu/build.sh
    windows/build.bat
    windows/create.bat
    windows/project.bat
    windows/visual_studio.bat
    )

add_custom_target(${TARGET_NAME} SOURCES ${source_files})

tuneup_target(${TARGET_NAME})
