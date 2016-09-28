program main
  use para
  implicit none
  integer i, j

  print*,"==================================="
  print*,"Single Hidden Layer Neural Network"
  print*,"==================================="
  print*,"Reading Parameters from INPUT..."
  call readinput()
  call readdata()

  call random_number(Wh)
  call random_number(Wy)

  Wh = (Wh-0.5)*0.1
  Bh = 0.0
  Wy = (Wy-0.5)*0.1
  By = 0.0

  print*,"-----------"
  print*,"Training"
  print*,"-----------"
  do i = 1, EPOCH
     call progress(10*int(float(i)/EPOCH))
     nWht  = 0.0 
     nBht  = 0.0
     nWyt  = 0.0
     nByt  = 0.0
     do j = 1, ntrain
        Ax = train(:nx,j)
        T = train(nx+1:,j)
        call backprop()
        nWht = nWht+nWh
        nBht = nBht+nBh
        nWyt = nWyt+nWy
        nByt = nByt+nBy
     end do
     Wh = Wh-eta/ntrain*nWht
     Bh = Bh-eta/ntrain*nBht
     Wy = Wy-eta/ntrain*nWyt
     By = By-eta/ntrain*nByt
  end do
  print*,""

  print*,"-----------"
  print*,"Testing"
  print*,"-----------"
  print*,"Results are stored in result.dat"
  open(unit=41,file="result.dat")  
  do i = 1, ntest
     Ax = test(:,i)
     call feedforward()
     write(41,*) Ay
  end do

  print*,""
  print*,"Done"
end program


subroutine progress(j)
  implicit none
  integer(kind=4)::j,k
  character(len=17)::bar="???% |          |"
  write(unit=bar(1:3),fmt="(i3)") 10*j
  do k=1, j
    bar(6+k:6+k)="*"
  enddo
  ! print the progress bar.
  write(unit=6,fmt="(a1,a17)",advance="no") char(13), bar
  if (j/=10) then
    flush(unit=6)
  else
    write(unit=6,fmt=*)
  endif
  return
end subroutine progress

