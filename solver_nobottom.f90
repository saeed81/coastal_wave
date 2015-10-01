MODULE solver 

  IMPLICIT NONE

  PRIVATE

  REAL(8), PUBLIC, PARAMETER :: alpha = 1.210_8

  REAL(8), PUBLIC, PARAMETER ::  bp    = 1.6287640_8

  REAL(8), PUBLIC             :: ap    = 0.16280_8

  REAL(8), PUBLIC, PARAMETER :: ratio = 4.0

  REAL(8), PUBLIC            :: omega = 0.0, ssigma = 0.816_8

  REAL(8), PUBLIC, PARAMETER :: wn    = 1.0

  REAL(8), PUBLIC            :: vc 

  REAL(8), PUBLIC            :: zvc = 0.0


  PUBLIC :: core_solver, getomega


CONTAINS

  SUBROUTINE getomega() 

    IMPLICIT NONE

    CHARACTER(len=40) :: clomega

    CALL getarg(1,clomega)

    READ(clomega,'(f14.7)')  omega

  END SUBROUTINE getomega


  SUBROUTINE rhs( pdt, pdx, pdy, pfrhs, pgrhs )

    IMPLICIT NONE

    REAL(8), INTENT(IN )  :: pdx, pdt, pdy

    REAL(8), INTENT(OUT)  :: pfrhs, pgrhs

    REAL(8)               :: zca, zcb, zcc, zcd

    REAL(8)               :: zphi, zpsi

    
    zcc = bp**(-alpha)

    zphi = (ssigma * omega * omega ) / 6.0

    zpsi = (zcc*zcc*alpha) / (1.0-omega*omega)   



    zca = 1.0 - zphi * zcc * pdt**(alpha) 


    zcb = (1.0 + alpha) / pdt - zphi * zcc * pdt**(alpha) * (2.0 + 5.0 * alpha) / pdt   

    zcd = (1.0-omega*omega ) / (zcc * pdt**(alpha) ) + ( wn * wn + alpha*wn / omega - zphi * zcc * pdt**(alpha) * &
         &  (2.0 * alpha * alpha + 5.0 * alpha * wn / omega + 2.0 * wn * wn ) ) / (pdt*pdt)    
           
    
    OPEN(11,FILE="coef.txt", position="append")

    WRITE(11,*) zca, zcb, zcd, omega 

    CLOSE(11)

    OPEN(12,FILE="dcoef.txt", position="append")

    WRITE(12,*) zca / zca, zcb / zca, zcd / zca, omega 

    CLOSE(12)






    pfrhs = -zcb / zca * ( pdx / pdt ) + zcd / zca * pdy 


    pgrhs = pdx

  END SUBROUTINE rhs


  SUBROUTINE core_solver(pdt, pdx, pdy, pdh )

    IMPLICIT NONE

    REAL(8) :: zk1, zk2, zk3, zk4 
    REAL(8) :: zl1, zl2, zl3, zl4 
    REAL(8) :: zl, zk
    REAL(8), INTENT(INOUT )   :: pdx, pdt, pdy
    REAL(8), INTENT(IN    )   :: pdh
    
    REAL(8) :: pdxn , pdtn, pdyn
    REAL(8) :: pfrhs, pgrhs

    CALL rhs( pdt, pdx, pdy, pfrhs, pgrhs )

    zk1  = pfrhs
    zl1  = pgrhs

    CALL rhs( pdt + pdh / 2.0, pdx + pdh * zk1 / 2.0, pdy + pdh * zl1 / 2.0, pfrhs, pgrhs )

    zk2  = pfrhs
    zl2  = pgrhs

    CALL rhs( pdt + pdh / 2.0, pdx + pdh * zk2 / 2.0, pdy + pdh * zl2 / 2.0, pfrhs, pgrhs )

    zk3  = pfrhs
    zl3  = pgrhs

    CALL rhs( pdt + pdh , pdx + pdh * zk3 , pdy + pdh * zl3 , pfrhs, pgrhs )

    zk4  = pfrhs
    zl4  = pgrhs  

    zk   = ( zk1 + 2.0 * zk2  + 2.0 * zk3 + zk4 ) / 6.0
    zl   = ( zl1 + 2.0 * zl2  + 2.0 * zl3 + zl4 ) / 6.0

    pdxn = pdx + pdh * zk
    pdyn = pdy + pdh * zl
    pdtn = pdt + pdh 

    pdx  = pdxn
    pdy  = pdyn
    pdt  = pdtn

  END SUBROUTINE core_solver








END MODULE solver

