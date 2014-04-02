ifeq ($(shell uname), Linux)
	EXE_SUFFIX =
	OSFLAG = -D LINUX
else ifeq ($(shell uname), Darwin)
	EXE_SUFFIX =
	OSFLAG = -D MAC_OS
else
	EXE_SUFFIX = .exe
	OSFLAG = -D WIN -static-libstdc++ -static-libgcc
endif
ifndef TEENSYDUINOPATH
	TEENSYDUINOPATH=~/arduino-1.0.5
endif

CC=	g++
PROGRAM= mchck_wrapper$(EXE_SUFFIX)
SOURCE= avrdude-dummy.cpp
all: $(PROGRAM)

$(PROGRAM): $(SOURCE)
	$(CC) $(OSFLAG) $(SOURCE) -o $(PROGRAM)

install: $(PROGRAM)
	cp $(PROGRAM) ${TEENSYDUINOPATH}/hardware/tools/mchck_wrapper
	cp mchck_upload ${TEENSYDUINOPATH}/hardware/tools/mchck_upload
	cp mchck_post_compile ${TEENSYDUINOPATH}/hardware/tools/mchck_post_compile
	cp -vr programmer ${TEENSYDUINOPATH}/hardware/tools/programmer
	ln -s ${TEENSYDUINOPATH}/hardware/teensy/cores/teensy3 ${TEENSYDUINOPATH}/hardware/teensy/cores/mchck
	patch -d ${TEENSYDUINOPATH}/hardware/teensy/cores/mchck < mchckduino.patch
	cat mchck.board >> ${TEENSYDUINOPATH}/hardware/teensy/boards.txt

clean:
	rm -f $(PROGRAM)
