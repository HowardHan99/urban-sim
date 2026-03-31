# Install script for directory: /home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/external/tinyxml2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

<<<<<<< HEAD
if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xtinyxml2_developmentx" OR NOT CMAKE_INSTALL_COMPONENT)
=======
if(CMAKE_INSTALL_COMPONENT STREQUAL "tinyxml2_development" OR NOT CMAKE_INSTALL_COMPONENT)
>>>>>>> 303a790e1d818b0612b839ac12453186e7512c7c
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/libtinyxml2.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xtinyxml2_developmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2/tinyxml2-static-targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2/tinyxml2-static-targets.cmake"
<<<<<<< HEAD
         "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/CMakeFiles/Export/lib/cmake/tinyxml2/tinyxml2-static-targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2/tinyxml2-static-targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2/tinyxml2-static-targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
=======
         "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/CMakeFiles/Export/a801c02ec1fcb42ccc21a747b2503e91/tinyxml2-static-targets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2/tinyxml2-static-targets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2/tinyxml2-static-targets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
>>>>>>> 303a790e1d818b0612b839ac12453186e7512c7c
      endif()
    endif()
  endif()
<<<<<<< HEAD
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2" TYPE FILE FILES "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/CMakeFiles/Export/lib/cmake/tinyxml2/tinyxml2-static-targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2" TYPE FILE FILES "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/CMakeFiles/Export/lib/cmake/tinyxml2/tinyxml2-static-targets-release.cmake")
=======
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2" TYPE FILE FILES "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/CMakeFiles/Export/a801c02ec1fcb42ccc21a747b2503e91/tinyxml2-static-targets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^()$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2" TYPE FILE FILES "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/CMakeFiles/Export/a801c02ec1fcb42ccc21a747b2503e91/tinyxml2-static-targets-noconfig.cmake")
>>>>>>> 303a790e1d818b0612b839ac12453186e7512c7c
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xtinyxml2_developmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/tinyxml2" TYPE FILE FILES
    "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/external/tinyxml2/cmake/tinyxml2-config.cmake"
    "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/tinyxml2-config-version.cmake"
    )
endif()

<<<<<<< HEAD
if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xtinyxml2_developmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/external/tinyxml2/tinyxml2.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xtinyxml2_developmentx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/tinyxml2.pc")
endif()

=======
if(CMAKE_INSTALL_COMPONENT STREQUAL "tinyxml2_development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/external/tinyxml2/tinyxml2.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "tinyxml2_development" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/tinyxml2.pc")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/howardhan/urban-sim/meta_source/metaurban/metaurban/orca_algo/build/external/tinyxml2/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
>>>>>>> 303a790e1d818b0612b839ac12453186e7512c7c
