require_relative 'commands'
require_relative 'grid'

input = get_an_input

# input = [[5,3,0,0,7,0,0,0,0,6,0,0,1,9,5,0,0,0,0,9,8,0,0,0,0,6,0,8,0,0,0,6,0,0,0,3,4,0,0,8,0,3,0,0,1,7,0,0,0,2,0,0,0,6,0,6,0,0,0,0,2,8,0,0,0,0,4,1,9,0,0,5,0,0,0,0,8,0,0,7,9]]

grid = Grid.new(input)

puts "Grid imported:"
grid.to_s

puts "Ready to solve?"
gets

grid.solve

puts "All solutions found."