#
# Class NASAMarsController provides the NASA methods for managing the rovers at Mars
#

require "./input_features.rb"
require "./rover.rb"

class NASAMarsController

	# Read an input file, and write rovers final position to output file.
	def self.execute_rovers_moves_input file_input_name, file_output_name
	
		file_input = File.new(file_input_name, "r")

		File.open(file_output_name, "w") do |file_output|
		
			plateau_limit_x = 0
			plateau_limit_y = 0
			rover = nil

			counter = 0
			while (line = file_input.gets)

			    if counter == 0

					# Plateau limits
					line_array = line.strip.split(' ')

					plateau_limit_x = line_array[0]
					plateau_limit_y = line_array[1]

					# Rover init
					rover = Rover.new(plateau_limit_x, plateau_limit_y)

			    elsif counter % 2 != 0
			    	
			    	# Rover position
			    	line_array = line.strip.split(' ')

			    	rover.set_x(line_array[0])
			    	rover.set_y(line_array[1])
			    	rover.set_facing(line_array[2])

			    else

			    	# Rover moves
			    	line.strip.split('').each do |command|
			    		rover.left if command == InputFeatures.LEFT
			    		rover.right if command == InputFeatures.RIGHT
			    		rover.move if command == InputFeatures.MOVE
			    	end

			    	file_output.puts(rover.actual_state_string)

			    end

			    counter += 1
			end

			file_input.close

		end

	end

end