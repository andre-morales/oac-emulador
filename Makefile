all: release

release: ep.exe

debug: epd.exe

CFLAGS =-std=c99 -Wall
# Torna esses warnings em erros
CFLAGS +=-Werror=return-type -Werror=incompatible-pointer-types
# Desativa esse warning
CFLAGS +=-Wno-unused-variable

test: ep.exe
	ep sample.mem

test1: ep.exe
	ep tests/overflowEesr-testado.mem

test2: ep.exe
	ep tests/overflowEesr.mem

test3: ep.exe
	ep tests/movRegAcc.mem

test4: ep.exe
	ep tests/initEPSW.mem

random: ep.exe
	ep tests/random.mem

ep.exe: EP1.c
	gcc EP1.c driverEP1.c $(CFLAGS) -o ep.exe

epd.exe: EP1.c
	gcc EP1.c driverEP1.c $(CFLAGS) -o epd.exe -g

clean:
	del *.exe
