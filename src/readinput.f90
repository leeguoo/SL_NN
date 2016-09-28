!Read parameters from the file "INPUT"
subroutine readinput()
  use para
  implicit none

!======================================
!READ FILE
!--------------------------------------
  open(unit=11,file="INPUT",status="old")

  read(11,*) nx
  read(11,*) nh
  read(11,*) ny
  read(11,*) epoch
  read(11,*) eta
  read(11,*) trainfile
  read(11,*) testfile

  close(11)
!======================================

!======================================
!PRINT PARAMETERS
!--------------------------------------
  print*,"----------"
  print*,"Parameters:"
  print*,"----------"
  print*,"Size of input layer: ", nx
  print*,"Size of hidden layer: ", nh
  print*,"Size of output layer: ", ny
  print*,"Number of Epochs: ", epoch
  print*,"Learning rate (Eta): ", eta
  print*,"Path of training data: ", trainfile
  print*,"Path of testing data: ", testfile
  print*,""
!======================================

!======================================
!SETUP VECTORS
!--------------------------------------

!INPUT LAYER
!--------------------------------------
  allocate(Ax(nx))

!HIDEN LAYER
!--------------------------------------
  allocate(Ah(nh))
  allocate(Zh(nh))

  allocate(Bh(nh))
  allocate(Wh(nh,nx))

  allocate(nBh(nh))
  allocate(nWh(nh,nx))

  allocate(nBht(nh))
  allocate(nWht(nh,nx))

!OUTPUT LAYER
!--------------------------------------
  allocate(Ay(ny))
  allocate(Zy(ny))

  allocate(By(ny))
  allocate(Wy(ny,nh))

  allocate(nBy(ny))
  allocate(nWy(ny,nh))

  allocate(nByt(ny))
  allocate(nWyt(ny,nh))

  allocate(T(ny))
!======================================
end subroutine
