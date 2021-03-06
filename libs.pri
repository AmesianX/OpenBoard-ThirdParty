
linux-g++ {
    SUB_LIB = "linux"
}

linux-g++-32 {
    SUB_LIB = "linux"
}
linux-g++-64 {
    SUB_LIB = "linux"
}

macx {
    SUB_LIB = "macx"
}

win32 {
    CONFIG( debug, debug|release ) {
        SUB_LIB = "win32/debug"
    } else {
        SUB_LIB = "win32/release"
    }
}

FREETYPE_DIR = "$PWD/freetype/freetype-2.6.1"

LIBS        += "-L$$PWD/freetype/lib/$$SUB_LIB" "-lfreetype"
# no INCLUDEPATH, freetype is not used directly

QUAZIP_DIR   = "$$PWD/quazip"
LIBS        += "-L$$QUAZIP_DIR/lib/$$SUB_LIB" "-lquazip"
INCLUDEPATH += "$$PWD/zlib/1.2.8/include"

LIBS        += "-L$$PWD/xpdf/lib/$$SUB_LIB" "-lxpdf"
XPDF_DIR     = "$$PWD/xpdf/xpdf-3.04"
INCLUDEPATH += "$$XPDF_DIR"
INCLUDEPATH += "$$XPDF_DIR/goo"
INCLUDEPATH += "$$XPDF_DIR/splash"


linux-g++ {
    LIBS        += -lpaper
}
linux-g++-32 {
    LIBS        += -lpaper
}
linux-g++-64 {
    LIBS        += -lpaper
}

win32 {
    INCLUDEPATH += "$$PWD/openssl/openssl-1.1.0-win32/include"
    QMAKE_LIBDIR += "$$PWD/openssl/openssl-1.1.0-win32/lib"

    LIBS += -llibssl
    LIBS += -llibcrypto
    LIBS += -lWmvcore
    LIBS += -lWinmm
	
	# need those link if we want to change default printer and print usind shell command
    LIBS        += "-L$$PWD/microsoft/lib" "-lWinspool"
    LIBS        += "-L$$PWD/microsoft/lib" "-lshell32"
}

macx {
    LIBS         += "-framework QuartzCore"
    LIBS         += "-framework AudioToolbox"
    LIBS         += "-framework CoreAudio"
    LIBS         += "-framework ApplicationServices"
    LIBS         += "-framework Cocoa"
            
    LIBS         += "-lcrypto"
}


