return {
  anniversary = function(any_date)
    return os.date("%x", any_date + 1e9)
  end
}
