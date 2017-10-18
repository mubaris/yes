! "yes" in fortran 90
! compiled using the GNU gfortran compiler, version 6.3
! if given string to repeat, max length is 32

program yes
    IMPLICIT none
    CHARACTER (len=32) :: arg
    CALL get_command_argument(1, arg)
    IF (LEN_TRIM(arg) == 0) arg="y"
    identifier: DO WHILE (0.LE.1) 
      PRINT*, arg
    END DO identifier
end program yes
