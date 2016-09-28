!Read training and testing data from files

subroutine readdata()
  use para
  implicit none

  !TRAINING DATA
  print*,"Reading training data from ", trainfile

  call system("wc -l "//trim(trainfile)//" > 00000tmp00000")
  open(unit=31,file="00000tmp00000",status="old")
  read(31,*) ntrain
  close(31)
  call system("rm 00000tmp00000")

  print*,"Number of training instances: ", ntrain

  allocate(train(nx+ny,ntrain))

  open(unit=12,file=trainfile)
  read(12,*) train
  close(12)

  print*,"Training data have been successfuly read"
  print*,""

  !TESTING DATA

  print*,"Reading testing data from ", testfile

  call system("wc -l "//trim(testfile)//" > 00000tmp00000")
  open(unit=31,file="00000tmp00000",status="old")
  read(31,*) ntest
  close(31)
  call system("rm 00000tmp00000")

  print*,"Number of testing instances: ", ntest

  allocate(test(nx,ntest))
                
  open(unit=12,file=testfile)
  read(12,*) test
  close(12) 
 
  print*,"Testing data have been successfully read"
  print*,""  
end subroutine
