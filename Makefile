all: ep.exe

test1: ep.exe sample1.ram
	ep.exe sample1.ram 

test4: ep.exe
	ep img/initEPSW.mem

ep.exe: EP1.c
	gcc EP1.c driverEP1.c -o ep.exe
