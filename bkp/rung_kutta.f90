PROGRAM rung_kutta

  USE solver

  IMPLICIT NONE

  INTEGER :: jt, ji, jj

  INTEGER :: nit = 1000

  REAL(8) :: dh 

  REAL(8) :: vy = 1.0

  REAL(8) :: vx = 0.0, vt = 0.0


  ap = bp / ratio

  vt = ap;
  
  CALL getomega()

  vx =  wn  / ( omega * ap )

  dh =  ( bp - ap ) / REAL(nit, 8  )

  DO ji = 1, nit 

     CALL core_solver(vt, vx, vy, dh)

     PRINT *, vt, vx, vy

  END DO

  PRINT *, "omega is", omega


  OPEN(10, FILE = 'model.txt')

  WRITE(10,*) omega

  WRITE(10,*) vx

  WRITE(10,*) vy

  CLOSE(10)



END PROGRAM rung_kutta







