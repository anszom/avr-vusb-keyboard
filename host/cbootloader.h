/*
  cbootloader.cpp - part of flashtool for AVRUSBBoot, an USB bootloader for Atmel AVR controllers

  Thomas Fischl <tfischl@gmx.de>

  Creation Date..: 2006-03-18
  Last change....: 2006-06-25
*/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

#include "usb.h"
#include "cpage.h"

class CBootloader {
 public:
  CBootloader();
  ~CBootloader();
  unsigned int getPagesize();
  void writePage(CPage* page);
  void startApplication();

 protected:
  usb_dev_handle *usbhandle;
};

