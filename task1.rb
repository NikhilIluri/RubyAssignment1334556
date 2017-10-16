def nbr_of_laps(x, y)
  multiple = x.lcm(y)
  x = multiple/x
  y = multiple/y
  result = [x, y]
end
p nbr_of_laps(3,5)