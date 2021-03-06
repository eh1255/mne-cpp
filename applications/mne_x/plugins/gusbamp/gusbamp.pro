#--------------------------------------------------------------------------------------------------------------
#
# @file     GUSBAmp.pro
# @author   Lorenz Esch <lorenz.esch@tu-ilmenau.de>;
#           Christoph Dinh <chdinh@nmr.mgh.harvard.edu>;
#           Matti Hamalainen <msh@nmr.mgh.harvard.edu>
# @version  1.0
# @date     September, 2013
#
# @section  LICENSE
#
# Copyright (C) 2013, Lorenz Esch, Christoph Dinh and Matti Hamalainen. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that
# the following conditions are met:
#     * Redistributions of source code must retain the above copyright notice, this list of conditions and the
#       following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and
#       the following disclaimer in the documentation and/or other materials provided with the distribution.
#     * Neither the name of MNE-CPP authors nor the names of its contributors may be used
#       to endorse or promote products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
#
# @brief    This project file generates the makefile for the GUSBAmp plug-in.
#
#--------------------------------------------------------------------------------------------------------------

include(../../../../mne-cpp.pri)

TEMPLATE = lib

CONFIG += plugin

DEFINES += GUSBAMP_LIBRARY

#contains(QMAKE_HOST.arch, x86_64) { #Compiling MNE-X FOR a 64bit system
#    exists(C:/Windows/System32/GUSBAmpSDK.dll) {
#        DEFINES += TAKE_GUSBAmpSDK_DLL
#    }
#}
#else {
#    exists(C:/Windows/SysWOW64/GUSBAmpSDK32bit.dll) { #Compiling MNE-X FOR a 32bit system ON a 64bit system
#        DEFINES += TAKE_GUSBAmpSDK_32_DLL
#    }
#    else {
#        exists(C:/Windows/System32/GUSBAmpSDK.dll) { #Compiling MNE-X FOR a 32bit system ON a 32bit system
#            DEFINES += TAKE_GUSBAmpSDK_DLL
#        }
#        else {
#            message(GUSBAmp.pro warning: GUSBAmp Driver DLL not found!)
#        }
#    }
#}

QT += core widgets svg

TARGET = gusbamp
CONFIG(debug, debug|release) {
    TARGET = $$join(TARGET,,,d)
}

LIBS += -L$${MNE_LIBRARY_DIR}
CONFIG(debug, debug|release) {
    LIBS += -lMNE$${MNE_LIB_VERSION}Genericsd \
            -lMNE$${MNE_LIB_VERSION}Utilsd \
            -lMNE$${MNE_LIB_VERSION}Fiffd \
            -lMNE$${MNE_LIB_VERSION}Dispd \
            -lxMeasd \
            -lxDispd \
            -lmne_xd
}
else {
    LIBS += -lMNE$${MNE_LIB_VERSION}Generics \
            -lMNE$${MNE_LIB_VERSION}Utils \
            -lMNE$${MNE_LIB_VERSION}Fiff \
            -lMNE$${MNE_LIB_VERSION}Disp \
            -lxMeas \
            -lxDisp \
            -lmne_x
}

DESTDIR = $${MNE_BINARY_DIR}/mne_x_plugins

SOURCES += \
        gusbamp.cpp \
        gusbampproducer.cpp \
        gusbampdriver.cpp \
        FormFiles/gusbampsetupwidget.cpp \
        FormFiles/gusbampaboutwidget.cpp

HEADERS += \
        gusbamp.h\
        gusbamp_global.h \
        gusbampproducer.h \
        gusbampdriver.h \
        FormFiles/gusbampsetupwidget.h \
        FormFiles/gusbampaboutwidget.h

FORMS += \
        FormFiles/gusbampsetupwidget.ui \
        FormFiles/gusbampabout.ui

INCLUDEPATH += $${EIGEN_INCLUDE_DIR}
INCLUDEPATH += $${MNE_INCLUDE_DIR}
INCLUDEPATH += $${MNE_X_INCLUDE_DIR}

OTHER_FILES += gusbamp.json

# Put generated form headers into the origin --> cause other src is pointing at them
UI_DIR = $${PWD}

unix: QMAKE_CXXFLAGS += -isystem $$EIGEN_INCLUDE_DIR

# suppress visibility warnings
unix: QMAKE_CXXFLAGS += -Wno-attributes

RESOURCES += \
    gusbamp.qrc
