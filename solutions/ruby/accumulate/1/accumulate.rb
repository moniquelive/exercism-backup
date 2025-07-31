class Array
  def accumulate
    # map(&block).to_a
    retval = []
    each { |e| retval << yield(e) }
    retval
  end
end