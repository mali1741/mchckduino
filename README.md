mchckdunio
==========

This is an installer for mchck teensyduino support.
Currently only for linux!

You need this software installed:
http://arduino.googlecode.com/files/arduino-1.0.5-linux64.tgz
https://www.pjrc.com/teensy/td_118/teensyduino.64bit

Usually just untar arduino-1.0.5-linux64.tgz wherever you'd like it, rename the dir if you may,
and the run teensyduino.64bit and point it to the arduino directory. Voila, it's now a teensyduino IDE!

You also need the mchck-programmer source, so do run the following in this dir:
git clone https://github.com/mchck/programmer

Alter your ~/.mchckrc as described in the mchck wiki, https://github.com/mchck/mchck/wiki/Getting-Started#per-programmer-instructions 
Unfortunately I have currently been unsuccessful in making the dfu-bootloader work with teensydunio binaries, so we are restricted to SWD for now (gives gdb-support so no so bad really).

Now it's time to install the patch, so do:

make
make install TEENSYDUINOPATH=<your_teensydunio_path>

Open your newly patched Teensyduino, just select McHck in Boards, and your good to go!

Btw this repo also includes code from https://github.com/digistump/avr-dummy for the avrdude wrapper.

