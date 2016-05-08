---
layout: post
title: arms and legs aplenty
---

## Choosing serial protocols and connectors

Picking the electrical serial protocols for each interface was relatively easy compared to the connectors.  In most cases, there really isn't a choice, ubiquitous asynchronous serial communication being the exception.  But choosing each connector style and pin-out was more difficult than anticipated. The details of each interface protocol and connector selection are discussed in the following sections.

## Asynchronous Serial

The old standby, asynchronous serial communication, is still widely used in embedded systems.  Some true RS-232 signal-level interfaces are still to be found, but they are encountered less frequently.  Although they still do exist, so I've chosen not to ignore them entirely.  Much more common in today's embedded systems is a TTL-level serial connection. And even these aren't available from a modern computer without an adaptor module, typically connected via USB.  The Serial Squid provides all three asynchronous serial protocols, RS-232, TTL-logic levels, and a USB virtual serial port.

### Who talks and who listens?

When it comes to these asynchronous connections, we also have to worry about the direction of the signals.  We can't have the transmit and receive getting crossed, for example.  In RS-232 speak, each end of the communications path is identified as either DTE or DCE:

DTE, Data Terminal Equipment 
: This has traditionally been a computer or terminal.

DCE, Data Communications Equipment
: This has traditionally been a modem.  In more modern times, the serial connector on your embedded system, if it even has one, will be wired as DCE so that connection to a host computer will be straight through (1:1).

This isn't an issue over the USB virtual serial port, as this is all handled by the USB interface firmware stack and application.  For true RS-232 interfaces, the connectors and pin-outs are strictly defined by industry standards and conventions.  One has to choose DCE or DTE for each connector. (note 1)  The same applies to TTL-serial interfaces, except that the connector type and pin-out aren't universally specified and vary widely from device to device.

On the Serial Squid, four of the ports include asynchronous serial interfaces.  The main console, of COM0, is wired as DCE.  It is envisioned that this port will be used to program the LPC1769 and/or communicate with a host computer.  The remaining serial ports are wired as DTE, appropriate for connecting to other embedded systems under development or test.  The following table summarizes the asynchronous serial com ports, their wiring, electrical protocol, and their connectors.

|------+-----------+------------|
| PORT | DIRECTION | PROTOCOL   |
|------|-----------|------------|
| COM0 | DCE       | USB        |
|      |           | RS-232     |
|      |           | TTL-logic  |
|------+-----------+------------|
| COM1 | DTE       | RS-232     |
|      |           | RS-422/485 |
|      |           | TTL-logic  |
|------+-----------+------------|
| COM2 | DTE       | RS-232     |
|      |           | TTL-logic  |
|------+-----------+------------|
| COM3 | DTE       | TTL-logic  |
|------+-----------+------------|
| COM9 | TTL-logic  |









![Serial Squid, Bottom View](/images/serial-squid-bot-view-20160507.png) 

## What's under the hood?

  The main microprocessor powering the Serial Squid is from the popular NXP
LPC17xx Cortex M3 family. Specifically, the LPC1769, which is identical to the
very common LPC1768, but for the addition of an Ethernet interface. The wide
range of build-in peripherals in this family provide all the serial interfaces,
needing only minimal external support circuitry.  A wide variety of sample code
and drivers for this microprocessor are available from NXP and from the large
Cortex M3 developer community. <br />

  In addition, a small Microchip PIC is a support microcontroller to handle a few
auxiliary tasks.  It does a few miscellaneous I/O functions, primarily because
I've exhausted the available pins on the LPC1969.  It also provides
non-volatile EEPROM storage, and manages the configuration of the various I/O
ports (more on this later).  The PIC I've selected is a modern version of the
very popular and long-running PIC16F628A: the PIC16F1847.  This new PIC is
pin-compatible with the 628A, and provides a number of new functions which make
it very attractive: low cost, familiarity, and powerful features. <br />

## What serial protocols?

As for the serial I/O ports themselves, most common serial formats are supported.  These ports are distributed among the squid's legs, and grouped into logical com ports such as COM0, COM1, etc.  

* RS-232 
* RS-422/485
* TTL serial 
* I2C
* SPI 
* CAN 
* USB, 
* Ethernet 
* PS/2
* PIC ICSP
* AVR 
* JTAG

In fact, if you bounce this list of interfaces against the list of serial peripheral blocks provided by NXP, with one exception, every interface is made available to the user, along with some additional ones made possible by bit banging.  The one exception is the I2S serial sound interface.  This is an interface I've never encountered in my experience, although I'm open to suggestions to include it if enough users think it is important. (note 2)

## How does the user control it?

The user interface is simple but adequate for the envisioned applications.  A 5-direction joystick is provided for menu navigation, along with two separate general purpose push buttons.  Information is presented to the user via the 4x20 character LCD display module, a magnetic buzzer, and assorted indicator LED's around the circuit board.  

## How is it powered?

The Serial Squid is powered from a standard +5VDC micro-B USB power adaptor.  The intention is to take advantage of existing equipment the user may already have, or can easily purchase.  There is no need to reinvent the wheel.  If needed, smartphone external battery packs can be used for field operations (note 1).  

## How is it programmed?

The Serial Squid's LPC1769 can be programmed in several ways.  The primary method is over a standard ARM 20-pin JTAG port or over the COM0 serial port.  USB or Ethernet port programming is also possible if suitable bootloader firmware is installed.  The PIC is programmed over a standard 6-pin ICSP connector.  Two miniature right angle push buttons are provided for boot control.  The RESET button performs a hardware reset of both micro-controllers.  A second ISP-MODE button will put the LPC1769 into ISP mode on boot-up, and is also used to select which of the three COM0 connectors to use for ISP: the USB virtual serial port, the RS-232 DE9, or the TTL-serial pin connector.

## Anything else?

A removable SD card is provided for the storage of data and scripts.  A small EEPROM store is provided for configuration and application data.  A real-time clock crystal and backup battery provides a clock and calendar. 

## How is it designed?

As much as possible, I'm designing the Serial Squid to be an open project, designed using open tools.  The circuit board should be easy to assemble and repair by hobbyists (no BGA packages, for example).  Standard circuits from reference designs or proven projects are used, and much thought has gone into selecting connector styles and pinouts.  The design has been done using free and/or open source tools:

* KiCAD for schematic and PCB layout
* Draftsight for 2D drawings
* OpenSCAD for 3D drawings
* Libreoffice Calc for spreadsheets (BOM, pinouts, etc.)
* Libreoffice Draw for diagrams (block diagram, etc.)
* GNU compiler tool chain 
* PIC compiler and tool chain is TBD

I'm also striving for platform independence on this project.  So far, I'm able to use all the above tools on Windows, Linux and Mac OS.  

| ITEM | WID | HGT | WID | HGT | 
|:---:|:---:|:---:|:---:|:---:| 
| Note 4 + case | 84 | 157 | 3.31 | 6.18 |
| Mac & Cheese | 92 | 185 | 3.6 | 7.3  |
| US "note" (half A) | 140 | 216 | 5.5 | 8.5 |
| ISO B5  | 176 | 250 | 6.93 | 9.84  |
| mySquid | 220 | 240 | 8.66 | 9.45 |
| US "gov letter"  | 203 | 267 | 8.0 | 10.5 |
| US "letter" (A) | 216 | 279 | 8.5 | 11.0 |
| ISO A4  | 210 | 297 | 8.27 | 11.7 |
| Folded Men's T-shirt  | 241 | 330  | 9.5 | 13.0  |
|==========
|| mm | mm | in | in |


