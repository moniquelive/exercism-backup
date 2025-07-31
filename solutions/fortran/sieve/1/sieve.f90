module sieve
  implicit none
  public :: primes

contains
  function primes(limit) result(array)
    integer, intent(in) :: limit
    integer, allocatable :: array(:)
    logical, allocatable :: is_prime(:)
    integer :: i, j, count

    if (limit < 2) then
      allocate(array(0))
      return
    end if

    allocate(is_prime(2:limit))
    is_prime = .true.

    do i = 2, int(sqrt(real(limit)))
      if (is_prime(i)) then
        do j = i*i, limit, i
          is_prime(j) = .false.
        end do
      end if
    end do

    count = 0
    do i = 2, limit
      if (is_prime(i)) then
        count = count + 1
      end if
    end do

    allocate(array(count))

    count = 0
    do i = 2, limit
      if (is_prime(i)) then
        count = count + 1
        array(count) = i
      end if
    end do
  end function primes
end module sieve