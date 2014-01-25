# -----------------------------------------
# makefile V0.2 2014-01-12 Thomas Hoeser
# do not use space at the beginning of a line – use tab only !
# -----------------------------------------

CC=gcc
# CFLAGS =I. -I/usr/local/include -Wall -ansi -O0
CFLAGS=-I. -lwiringPi -largtable2

LDFLAGS = -L/usr/lib
LDLIBS = -largtable2

PROJ=flash
RELEASEDIR=.
RASP-IP=192.168.178.61

all: prepare $(PROJ)
		 @echo "------------------------ Fertig"
 
debug: prepare flash_ debug
 
# w/o : no echo of the command
prepare:
				@echo "Ich fang jetzt an!"
 
# w/o error message : - at the beginning
clean:
			-rm -f $(PROJ) $(PROJ).o
 
release:
				@echo “copy file $(PROJ) via ftp to raspberry $(RASP-IP)”
 
$(PROJ): $(PROJ).c
				 $(CC) $(CFLAGS) -o $(PROJ) $(PROJ).c
 
flash_debug: flash.c
						 gcc gcc –DMYDEBUG flash.c …..
 
help:
		@echo
		@echo "Aufruf   : make target"
		@echo
		@echo "Targets  : help    - Zeigt diesen Text an."
		@echo "           all     - Erstellt das Ziel $(PROJ)"
		@echo "           release - Kopiert $(PROJ) nach $(RELEASEDIR)"
		@echo "           clean   - Löscht die Ergebnisdateien (*.o, usw.)."
		@echo
		@echo "Beispiele: make all"
		@echo "           make clean"
		@echo

