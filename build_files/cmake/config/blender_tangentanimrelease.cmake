# Turn everything ON that's expected for an official release builds.
#
# Example usage:
#   cmake -C../blender/build_files/cmake/config/blender_release.cmake  ../blender
#

set(WITH_ALEMBIC             ON  CACHE BOOL "" FORCE)
set(WITH_ASSERT_ABORT        OFF CACHE BOOL "" FORCE)
set(WITH_BUILDINFO           ON  CACHE BOOL "" FORCE)
set(WITH_BULLET              ON  CACHE BOOL "" FORCE)
set(WITH_CODEC_AVI           ON  CACHE BOOL "" FORCE)
set(WITH_CODEC_FFMPEG        ON  CACHE BOOL "" FORCE)
set(WITH_CODEC_SNDFILE       ON  CACHE BOOL "" FORCE)
set(WITH_CYCLES              ON  CACHE BOOL "" FORCE)
set(WITH_CYCLES_OSL          ON  CACHE BOOL "" FORCE)
set(WITH_CYCLES_EMBREE       ON  CACHE BOOL "" FORCE)
set(WITH_DRACO               ON  CACHE BOOL "" FORCE)
set(WITH_FFTW3               ON  CACHE BOOL "" FORCE)
set(WITH_LIBMV               ON  CACHE BOOL "" FORCE)
set(WITH_LIBMV_SCHUR_SPECIALIZATIONS ON CACHE BOOL "" FORCE)
set(WITH_COMPOSITOR          ON  CACHE BOOL "" FORCE)
set(WITH_FREESTYLE           ON  CACHE BOOL "" FORCE)
set(WITH_GHOST_XDND          ON  CACHE BOOL "" FORCE)
set(WITH_IK_SOLVER           ON  CACHE BOOL "" FORCE)
set(WITH_IK_ITASC            ON  CACHE BOOL "" FORCE)
set(WITH_IMAGE_CINEON        ON  CACHE BOOL "" FORCE)
set(WITH_IMAGE_DDS           ON  CACHE BOOL "" FORCE)
set(WITH_IMAGE_HDR           ON  CACHE BOOL "" FORCE)
set(WITH_IMAGE_OPENEXR       ON  CACHE BOOL "" FORCE)
set(WITH_IMAGE_OPENJPEG      ON  CACHE BOOL "" FORCE)
set(WITH_IMAGE_TIFF          ON  CACHE BOOL "" FORCE)
set(WITH_INPUT_NDOF          ON  CACHE BOOL "" FORCE)
set(WITH_INTERNATIONAL       ON  CACHE BOOL "" FORCE)
set(WITH_JACK                ON  CACHE BOOL "" FORCE)
set(WITH_LZMA                ON  CACHE BOOL "" FORCE)
set(WITH_LZO                 ON  CACHE BOOL "" FORCE)
set(WITH_MOD_FLUID           ON  CACHE BOOL "" FORCE)
set(WITH_MOD_REMESH          ON  CACHE BOOL "" FORCE)
set(WITH_MOD_SMOKE           ON  CACHE BOOL "" FORCE)
set(WITH_MOD_OCEANSIM        ON  CACHE BOOL "" FORCE)
set(WITH_AUDASPACE           ON  CACHE BOOL "" FORCE)
set(WITH_OPENAL              ON  CACHE BOOL "" FORCE)
set(WITH_OPENCOLLADA         ON  CACHE BOOL "" FORCE)
set(WITH_OPENCOLORIO         ON  CACHE BOOL "" FORCE)
set(WITH_OPENIMAGEDENOISE    OFF CACHE BOOL "" FORCE)
set(WITH_OPENMP              ON  CACHE BOOL "" FORCE)
set(WITH_OPENSUBDIV          ON  CACHE BOOL "" FORCE)
set(WITH_OPENVDB             ON  CACHE BOOL "" FORCE)
set(WITH_OPENVDB_BLOSC       ON  CACHE BOOL "" FORCE)
set(WITH_PYTHON_INSTALL      ON  CACHE BOOL "" FORCE)
set(WITH_RAYOPTIMIZATION     ON  CACHE BOOL "" FORCE)
set(WITH_SDL                 ON  CACHE BOOL "" FORCE)
set(WITH_X11_XINPUT          ON  CACHE BOOL "" FORCE)
set(WITH_X11_XF86VMODE       ON  CACHE BOOL "" FORCE)

set(WITH_MEM_JEMALLOC          ON  CACHE BOOL "" FORCE)
set(WITH_CYCLES_CUDA_BINARIES  ON  CACHE BOOL "" FORCE)
set(WITH_CYCLES_CUBIN_COMPILER OFF CACHE BOOL "" FORCE)
set(CYCLES_CUDA_BINARIES_ARCH sm_30;sm_35;sm_37;sm_50;sm_52;sm_60;sm_61;sm_70;sm_75 CACHE STRING "" FORCE)

# platform dependent options
if(UNIX AND NOT APPLE)
  set(WITH_JACK                ON  CACHE BOOL "" FORCE)
  set(WITH_DOC_MANPAGE         ON  CACHE BOOL "" FORCE)
elseif(WIN32)
  set(WITH_JACK                OFF CACHE BOOL "" FORCE)
elseif(APPLE)
  set(WITH_JACK                ON  CACHE BOOL "" FORCE)

#   include("${CMAKE_CURRENT_SOURCE_DIR}/../platform/platform_apple_xcode.cmake")
endif()


if ($ENV{JETBRAINS_IDE})
  # The following code is to allow indexing of symbols, and code completion, from headers in CLion.
  # TODO: Support Linux. Only do it on Windows for now... will refactor later.
  if(WIN32)
    macro(SUBDIRLIST result curdir)
      file(GLOB children RELATIVE ${curdir} ${curdir}/*)
      set(dirlist "")
      foreach(child ${children})
        if(IS_DIRECTORY ${curdir}/${child}/include)
          MESSAGE(STATUS "Including ${curdir}/${child}/include")
          LIST(APPEND dirlist ${child})
        endif()
      endforeach()
      set(${result} ${dirlist})
    endmacro()

    set(LIB_ROOT_DIR "../../../../lib/win64_vc14")
    SUBDIRLIST(LIB_SUBDIRS_LIST ${LIB_ROOT_DIR} )
    INCLUDE_DIRECTORIES(LIB_SUBDIRS_LIST)
  endif(WIN32)
endif($ENV{JETBRAINS_IDE})