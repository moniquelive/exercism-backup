module binary_search
  implicit none

contains

  recursive function find_binary(array, val, low, high) result(idx)
    integer, dimension(:), intent(in) :: array
    integer, intent(in) :: val, low, high
    integer :: idx
    integer :: mid

    if (low > high) then
      idx = -1  ! Value not found
    else
      mid = (low + high) / 2
      if (array(mid) < val) then
        idx = find_binary(array, val, mid + 1, high)
      else if (array(mid) > val) then
        idx = find_binary(array, val, low, mid - 1)
      else
        idx = mid
      end if
    end if
  end function find_binary

  function find(array, val) result(idx)
    integer, dimension(:), intent(in) :: array
    integer, intent(in) :: val
    integer :: idx

    idx = find_binary(array, val, 1, size(array))
  end function find

end module binary_search