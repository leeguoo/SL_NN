FC=ifort
NET.x: main.f90 calculate.o readinput.o readdata.o mod.o
	$(FC) -o NET.x main.f90 calculate.o readinput.o readdata.o mod.o
calculate.o: calculate.f90 mod.o
	$(FC) -c calculate.f90
readinput.o: readinput.f90
	$(FC) -c readinput.f90
readdata.o: readdata.f90
	$(FC) -c readdata.f90
mod.o: mod.f90
	$(FC) -c mod.f90
clean:
	rm *.mod *.o NET.x
