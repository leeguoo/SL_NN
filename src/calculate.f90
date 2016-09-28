subroutine backprop()
  use para
  implicit none

  call feedforward()

  nBy = (Ay-T)*(Ay*(1-Ay))
  call unfold(nBy,Ah,ny,nh,nWy)

  nBh = matmul(transpose(nWy),nBy)*(Ah*(1-Ah))
  call unfold(nBh,Ax,nh,nx,nWh)
end subroutine

subroutine unfold(V1, V2, n1, n2, M)
  implicit none
  integer n1, n2, i, j
  real v1(n1), v2(n2), M(n1,n2)
  real M1(n1,n2), M2(n1,n2)

  do i = 1, n2
     M1(:,i) = V1
  end do

  do i = 1, n1
     M2(i,:) = V2  
  end do

  M = M1*M2
end subroutine

subroutine feedforward()
  use para
  implicit none

  Zh = matmul(Wh,Ax)+Bh
  call sigmoid(Ah,Zh,nh)
  
  Zy = matmul(Wy,Ah)+By
  call sigmoid(Ay,Zy,ny)

end subroutine


subroutine sigmoid(A, Z, n)
  implicit none
  integer n
  real A(n), Z(n)
  A = 1.0/(1.0+exp(-Z))
end subroutine

