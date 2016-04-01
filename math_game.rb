require './engine'
require './helpers'
require './constants'
require './display'

initialize_players

loop do
	display_menu
	input = gets.chomp
	case input
	when "1"
		run_game
		end_game_msg
		reset_lives
	when "2"
		set_names
	when "3"
		standings_msg("current", GREEN)
	when "4"
		puts reset_points
	when "5"
		initialize_players
	when "6"
		break
	else
		puts "#{RED_BG}Invalid choice!#{RESET_COLOUR}"
	end
end