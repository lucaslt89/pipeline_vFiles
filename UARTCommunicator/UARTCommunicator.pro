#-------------------------------------------------
#
# Project created by QtCreator 2013-04-25T19:57:51
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = UARTCommunicator
TEMPLATE = app


SOURCES += main.cpp\
        communicatorviewcontroller.cpp

HEADERS  += communicatorviewcontroller.h

FORMS    += communicatorviewcontroller.ui

include("qextserialport.pri")
