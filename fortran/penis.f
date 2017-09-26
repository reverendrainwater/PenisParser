      program penis
!     parses an input file and spits outs some penis
      
      CHARACTER :: buffer ! using a buffer of size 20 because arbitrary
      INTEGER :: number_of_penis ! wordcount
      OPEN (unit = 1, file = "text.txt", action = "read")
 10   READ (1, "(A)", ADVANCE='NO', EOR=10, END=30) buffer
      select case (buffer)
      case (' ')
         write (*,"(A)", advance='NO') "penis "
      case ('\n')
         print *, "penis "
      case ('.')
         write (*,"(A)", advance='NO') "penis. "
      case (',')
         write (*,"(A)", advance='NO') "penis, "
      end select
      goto 10
 30   end program penis
