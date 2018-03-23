# -----------------------------------------------------
# A main CMake configuration file for the whole project
# -----------------------------------------------------

cmake_minimum_required (VERSION 3.3)

set (CMAKE_CONFIGURATION_TYPES Debug Release CACHE STRING "Configurations" FORCE)
set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")

get_filename_component(CMAKE_MODULE_NAME "${CMAKE_CURRENT_BINARY_DIR}" NAME)

project ("${CMAKE_MODULE_NAME}")

include (cmake/globals)
include (cmake/macros)

add_subdirectory (scripts)
add_subdirectory (cmake)

set (TARGET_NAME root_folder)

set (source_files
    .gitattributes
    .gitignore
    .gitmodules
    .travis.deps
    .travis.script
    .travis.yml
    70-bfgminer.rules.in
    api-example.c
    api-example.php
    api-example.py
    api-example.rb
    arg-nonnull.h
    AUTHORS
    autogen.sh
    avalonhost-raminst
    c++defs.h
    ChangeLog
    configure.ac
    COPYING
    example.conf
    gen-version.sh
    HACKING
    LICENSE
    linux-usb-bfgminer
    make-release
    Makefile.am
    miner.php
    NEWS
    README
    README.ASIC
    README.CPU
    README.Debian
    README.FPGA
    README.GPU
    README.OpenWrt
    README.RPC
    README.scrypt
    setup-vfio
    start-bfgminer.sh
    test-bfgminer.sh
    todo_ztex.txt
    usbtest.py
    warn-on-use.h
    windows-build.txt
    )

add_custom_target(${TARGET_NAME} SOURCES ${source_files})


#
# The targets below were constructed from Makefile.am
#

set (bfgminer_SOURCES
    miner.c
    miner.h compat.h
    deviceapi.c deviceapi.h
    util.c util.h logging.h
    sha2.c sha2.h api.c
    version.c #version.h
    logging.c

    # if HAVE_WINDOWS
        winhacks.h
    # end

    #if USE_UDEVRULES
        #dist_udevrules_DATA = 70-bfgminer.rules
    #endif

    # if NEED_BFG_DRIVER_PROXY
        #driver-proxy.c driver-proxy.h
    # endif

    #if USE_LIBMICROHTTPD
        #httpsrv.c httpsrv.h driver-getwork.c
    #endif

    #if USE_LIBEVENT
        #driver-stratum.c
    #endif

    # if USE_OPENCL
        driver-opencl.h driver-opencl.c
        ocl.c ocl.h findnonce.c findnonce.h
        adl.c adl.h adl_functions.h
    #endif

    #if USE_KECCAK
        #malgo/keccak.c

        #if USE_OPENCL
            #dist_kernels_DATA += $(top_srcdir)/opencl/keccak.cl
        #endif
    #endif

    #if USE_SHA256D
        malgo/sha256d.c

        #if USE_OPENCL
            #dist_kernels_DATA += \
            #    $(top_srcdir)/opencl/diablo.cl  \
            #    $(top_srcdir)/opencl/diakgcn.cl  \
            #    $(top_srcdir)/opencl/phatk.cl  \
            #    $(top_srcdir)/opencl/poclbm.cl
        #endif

        #if USE_CPUMINING
            #sha256_generic.c sha256_via.c
            #sha256_cryptopp.c sha256_sse2_amd64.c
            #sha256_sse4_amd64.c
            #sha256_altivec_4way.c

            #if HAVE_SSE2
                #bfgminer_LDADD  += libsse2cpuminer.a
                #noinst_LIBRARIES = libsse2cpuminer.a
                #libsse2cpuminer_a_SOURCES = sha256_4way.c
                #libsse2cpuminer_a_CFLAGS = $(bfgminer_CPPFLAGS) $(SSE2_CFLAGS)
            #endif

            #if HAS_YASM
                #AM_CFLAGS	= -DHAS_YASM

                #if HAVE_x86_64
                    #SUBDIRS += x86_64
                    #x86_64/libx8664.a:
                    #$(MAKE) -C x86_64 $*
                    #bfgminer_LDADD	+= x86_64/libx8664.a
                #else # HAVE_x86_64
                    #SUBDIRS += x86_32
                    #x86_32/libx8632.a:
                    #$(MAKE) -C x86_32 $*
                    #bfgminer_LDADD	+= x86_32/libx8632.a

                    #if HAVE_SSE2
                        #libsse2cpuminer_a_SOURCES +=  sha256_sse2_i386.c
                    #endif
                #endif # HAVE_x86_64
            #endif # HAS_YASM

        #endif # USE_CPUMINING

    #endif # USE_SHA256D

    #if USE_SCRYPT
        #malgo/scrypt.c malgo/scrypt.h

        #if USE_OPENCL
            #dist_kernels_DATA += \
            #$(top_srcdir)/opencl/psw.cl  \
            #$(top_srcdir)/opencl/scrypt.cl  \
            #$(top_srcdir)/opencl/zuikkis.cl
        #endif
    #endif

    #if USE_CPUMINING
        #dist_doc_DATA += README.CPU
        #driver-cpu.h driver-cpu.c
    #endif

    #if NEED_BFG_LOWL_VCOM
        #lowl-vcom.c lowl-vcom.h
        #if HAVE_WINDOWS
        #else
            #iospeeds.h iospeeds_posix.h
        #endif
    #endif

    #if HAVE_LIBUSB
        #lowl-usb.c lowl-usb.h
    #endif

    #if NEED_BFG_BINLOADER
        #binloader.c binloader.h
    #endif

    #if NEED_BFG_LOWLEVEL
        #lowlevel.c lowlevel.h
    #endif

    #if NEED_DYNCLOCK
        #dynclock.c dynclock.h
    #endif

    #if NEED_BFG_WORK2D
        #work2d.c work2d.h
    #endif

    #if HAS_FPGA
        #dist_doc_DATA += README.FPGA
    #endif

    #if HAS_ASIC
        #dist_doc_DATA += README.ASIC
    #endif

    #if USE_ALCHEMIST
        #driver-alchemist.c
    #endif

    #if USE_BITFORCE
        #driver-bitforce.c
    #endif

    #if USE_BITMAIN
        #driver-bitmain.c driver-bitmain.h
    #endif

    #if USE_BIGPIC
        #driver-bigpic.c driver-bigpic.h
    #endif

    #if USE_DRILLBIT
        #driver-drillbit.c
    #endif

    #if USE_TWINFURY
        #driver-twinfury.c driver-twinfury.h
    #endif

    #if USE_ICARUS
        #driver-icarus.c driver-icarus.h
        #driver-cairnsmore.c
        #driver-erupter.c
        #driver-antminer.c
    #endif

    #if USE_GC3355
        #gc3355.c gc3355.h
    #endif

    #if USE_GRIDSEED
        #driver-gridseed.c
    #endif

    #if USE_DUALMINER
        #driver-dualminer.c
    #endif

    #if USE_ZEUSMINER
        #driver-zeusminer.c
    #endif

    #if USE_AVALON
        #driver-avalon.c driver-avalon.h
    #endif

    #if USE_AVALONMM
        #driver-avalonmm.c
    #endif

    #if USE_KNC
        #driver-knc.c
    #endif

    #if USE_KNCASIC
        #driver-kncasic.c
    #endif

    #if USE_KLONDIKE
        #driver-klondike.c driver-klondike.h driver-hashbusteravalon.c
    #endif

    #if USE_MODMINER
        #driver-modminer.c
    #endif

    #if USE_TITAN
        #driver-titan.c titan-asic.c titan-asic.h
    #endif

    #if NEED_KNC_ASIC
        #knc-asic/knc-asic.c knc-asic/knc-spimux.c knc-asic/knc-transport-spimux.c #knc-asic/include/knc-asic.h knc-asic/include/knc-transport.h
    #endif

    #if USE_X6500
        #driver-x6500.c jtag.c jtag.h
    #endif

    #if USE_ZTEX
        #driver-ztex.c libztex.c libztex.h
    #endif

    #if USE_BIFURY
        #driver-bifury.c
    #endif

    #if USE_BITFURY
        #driver-bitfury.c driver-bitfury.h libbitfury.c libbitfury.h

        #if USE_BFSB
            #driver-bfsb.c
        #endif

        #if USE_BFX
            #driver-bfx.c
        #endif

        #if USE_METABANK
            #driver-metabank.c tm_i2c.h tm_i2c.c
        #endif

        #if USE_LITTLEFURY
            #driver-littlefury.c
        #endif

        #if USE_NANOFURY
            #driver-nanofury.c mcp2210.c mcp2210.h
        #endif

        #if USE_HASHBUSTER
            #driver-hashbuster.c
        #endif

        #if USE_HASHBUSTERUSB
            #driver-hashbusterusb.c
        #endif
    #endif

    #if USE_COINTERRA
        #driver-cointerra.c driver-cointerra.h
    #endif

    #if USE_HASHFAST
        #driver-hashfast.c
    #endif

    #if USE_JINGTIAN
        #driver-aan.c driver-aan.h
        #driver-jingtian.c
    #endif

    #if USE_MINERGATE
        #driver-minergate.c
    #endif

    #if USE_MINION
        #driver-minion.c
    #endif

    #if USE_ROCKMINER
        #driver-rockminer.c
    #endif

    #if NEED_BFG_LOWL_FTDI
        #lowl-ftdi.c lowl-ftdi.h
    #endif

    #if NEED_BFG_LOWL_HID
        #lowl-hid.c lowl-hid.h
        #bfgminer_CPPFLAGS += $(hidapi_CFLAGS)
    #endif

    #if NEED_BFG_LOWL_MSWIN
        lowl-mswin.c lowl-mswin.h
    #endif

    #if NEED_BFG_LOWL_PCI
       # lowl-pci.c lowl-pci.h

        #if USE_VFIO
            #sbin_SCRIPTS += setup-vfio
        #endif
    #endif

    #if NEED_BFG_LOWL_SPI
        #lowl-spi.h lowl-spi.c
    #endif

    #bin_PROGRAMS += bfgminer-rpc
    #bfgminer_rpc_SOURCES = api-example.c
    #bfgminer_rpc_LDADD = @WS2_LIBS@

    )

set (blkmaker_SOURCES
    libblkmaker/base58.c
    libblkmaker/blkmaker.c
    libblkmaker/blkmaker.h
    libblkmaker/blkmaker_jansson.c
    libblkmaker/blkmaker_jansson.h
    libblkmaker/blktemplate.c
    libblkmaker/blktemplate.h
    libblkmaker/hex.c
    libblkmaker/private.h
    )

set (libbase58_SOURCES
    libbase58/base58.c
    #libbase58/clitool.c
    libbase58/libbase58.h
    )

set (libccan_SOURCES
    ccan-upstream/ccan/build_assert/build_assert.h
    ccan-upstream/ccan/cast/cast.h
    ccan-upstream/ccan/compiler/compiler.h
    ccan-upstream/ccan/opt/helpers.c
    ccan-upstream/ccan/opt/opt.c
    ccan-upstream/ccan/opt/opt.h
    ccan-upstream/ccan/opt/parse.c
    ccan-upstream/ccan/opt/private.h
    ccan-upstream/ccan/opt/usage.c
    ccan-upstream/ccan/typesafe_cb/typesafe_cb.h
    )

include_directories(
    ${CMAKE_SOURCE_DIR}/ccan-upstream
    ${CMAKE_SOURCE_DIR}/libblkmaker
    ${CMAKE_SOURCE_DIR}/libbase58
    ${CMAKE_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/cmake/windows/
    ${CMAKE_CURRENT_BINARY_DIR}
    )

set (TARGET_NAME blkmaker)
add_library (${TARGET_NAME} STATIC ${blkmaker_SOURCES})
install (TARGETS ${TARGET_NAME} ARCHIVE DESTINATION lib)
tuneup_target(${TARGET_NAME})

set (TARGET_NAME libbase58)
add_library (${TARGET_NAME} STATIC ${libbase58_SOURCES})
install (TARGETS ${TARGET_NAME} ARCHIVE DESTINATION lib)
tuneup_target(${TARGET_NAME})

set (TARGET_NAME libccan)
add_library (${TARGET_NAME} STATIC ${libccan_SOURCES})
install (TARGETS ${TARGET_NAME} ARCHIVE DESTINATION lib)
tuneup_target(${TARGET_NAME})

set (TARGET_NAME bfgminer)
add_executable (${TARGET_NAME} ${bfgminer_SOURCES})
install (TARGETS ${TARGET_NAME} RUNTIME DESTINATION bin)
tuneup_target(${TARGET_NAME})

target_link_libraries (${TARGET_NAME}
    setupapi.lib
    winmm.lib
    ws2_32.lib
    blkmaker
    libbase58
    libccan
    )
