---
layout: post
title: extra stuff yet to be used
---

### Who talks and who listens?

When it comes to these asynchronous connections, we also have to worry about the direction of the signals.  We can't have the transmit and receive getting crossed, for example.  In RS-232 speak, each end of the communications path is identified as either DTE or DCE:

DTE, Data Terminal Equipment 
: This has traditionally been a computer or terminal.

DCE, Data Communications Equipment
: This has traditionally been a modem.  In more modern times, the serial connector on your embedded system, if it even has one, will be wired as DCE so that connection to a host computer will be straight through (1:1).

This isn't an issue over the USB virtual serial port, as this is all handled by the USB interface firmware stack and application.  For true RS-232 interfaces, the connectors and pin-outs are strictly defined by industry standards and conventions.  One has to choose DCE or DTE for each connector. (note 1)  The same applies to TTL-serial interfaces, except that the connector type and pin-out aren't universally specified and vary widely from device to device.


### Asynchronous Serial, COM0, COM1, COM2, COM3

The old standby, asynchronous serial communication, is still widely used in embedded systems.  The Serial Squid provides four serial ports.  The main console, COM0, is wired as DCE and can be used to program the LPC1769 and/or communicate with a host computer.  The remaining serial ports are wired as DTE appropriate for connecting to other embedded systems under development or test.  

Three physical formats are variously provided for the asynchronous interfaces.  A USB visual serial port is included on COM0 via the popular FTDI FT-232R chip.  Standard RS-232 levels are provided on-board via a 10-pin box header, and a DE9 connector via a simple adaptor cable.  TTL logic-level signals are available on single-row pin headers.

## Synchronous Serial, COM3

The synchronous serial interfaces, SPI and I2C, are available at COM3.  They are combined together in the UEXT 10-pin shrouded header, and also made available separately on a 2x3 shrouded header and a 1x6 pin header.

### Programming

In-system programming of external targets is provided by four connectors.  A 

## CAN

### USB

### Ethernet

### PS/2

### Programming



<table>
<tr>
  <td style="text-align:center" colspan="3"><h4>Asynchronous Serial</h4></td>
</tr>
<tr> 
  <td style="text-align:left"><b>Port</b></td> 
  <td style="text-align:center"><b>Direction</b></td> 
  <td style="text-align:left"><b>Protocol</b></td> 
</tr>
<tr> 
  <td style="text-align:left" rowspan="3">COM0</td> 
  <td style="text-align:center" rowspan="3">DCE</td> 
  <td style="text-align:left">USB</td> 
</tr>
<tr> 
  <td style="text-align:left">RS-232</td> 
</tr>
<tr> 
  <td style="text-align:left">TTL logic</td> 
</tr>
<tr> 
  <td style="text-align:left" rowspan="3">COM1</td> 
  <td style="text-align:center" rowspan="3">DTE</td> 
  <td style="text-align:left">RS-232</td> 
</tr>
<tr> 
  <td style="text-align:left">RS-422/485</td> 
</tr>
<tr> 
  <td style="text-align:left">TTL logic</td> 
</tr>
<tr> 
  <td style="text-align:left" rowspan="2">COM2</td> 
  <td style="text-align:center" rowspan="2">DTE</td> 
  <td style="text-align:left">RS-232</td> 
</tr>
<tr> 
  <td style="text-align:left">TTL logic</td> 
</tr>
<tr> 
  <td style="text-align:left" rowspan="2">COM3</td> 
  <td style="text-align:center" rowspan="2">DTE</td> 
  <td style="text-align:left">TTL logic</td> 
</tr>
</table>
