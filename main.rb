require "./nasa_mars_controller.rb"
require "./rover.rb"

file_input_name  = ARGV[0] != nil ? ARGV[0] : "INPUT"
file_output_name = ARGV[1] != nil ? ARGV[1] : "OUTPUT"

NASAMarsController.execute_rovers_moves_input(file_input_name, file_output_name)
puts "The output file has generated at #{file_output_name}."