module para
  implicit none
  integer               ::      nx, nh, ny
  real                  ::      eta, epoch

  integer               ::      ntrain, ntest
  real,allocatable      ::      train(:,:), test(:,:)

  real,allocatable      ::      T(:)

  real,allocatable      ::      Ax(:), Ah(:), Ay(:)
  real,allocatable      ::      Zh(:), Zy(:)
  real,allocatable      ::      Bh(:), By(:), Wh(:,:), Wy(:,:)
  real,allocatable      ::      nBh(:), nBy(:), nWh(:,:), nWy(:,:)
  real,allocatable      ::      nBht(:), nByt(:), nWht(:,:), nWyt(:,:)

  character(20)         ::      trainfile, testfile
end module
