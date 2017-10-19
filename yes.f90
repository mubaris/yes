! "yes" in fortran 90
! compiled using the GNU gfortran compiler, version 6.3
! if given string to repeat, max length is 32

PROGRAM yes

    ! ignore ancient fortran variable name rules
    IMPLICIT none

    ! local variables
    CHARACTER (len=32) :: arg
    LOGICAL :: t
    t=.true.

    ! check if non-standard input given
    CALL get_command_argument(1, arg)
    IF (LEN_TRIM(arg) == 0) arg="y"

    ! print until interrupted
    l: DO WHILE (t) 
      PRINT*, arg
    END DO l

END PROGRAM yes
