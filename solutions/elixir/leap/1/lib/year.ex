defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    divBy400 = rem(year, 400) == 0
    divBy4 = rem(year, 4) == 0
    divBy100 = rem(year, 100) == 0

    divBy400 or (divBy4 and not divBy100)
  end
end
