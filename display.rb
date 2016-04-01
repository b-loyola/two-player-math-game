def standings_msg(msg, colour)
	puts "\n#{colour}Here are the #{msg} standings:#{RESET_COLOUR}"

	@players.each do |player|
		puts "#{BROWN}#{player[:name]} has #{player[:points]} points and #{player[:lives]} lives.#{RESET_COLOUR}"
	end
	puts "\n"
end

def success_msg(player)
	puts "#{GREEN}Correct answer! Player #{player[:name]} gets 1 point.#{RESET_COLOUR}"
end

def fail_msg(player)
	puts "#{RED}Wrong answer! Player #{player[:name]} loses a life!#{RESET_COLOUR}"
	standings_msg("current", MAGENTA)
end

def end_game_msg
	puts "#{WHITE}Game over!#{RESET_COLOUR}"
	standings_msg("final", RED_BG)
end

def display_menu
	puts "#{RESET_COLOUR}------------------------------------#{RESET_COLOUR}"
	puts "#{BROWN}****   Two Player Math Game!    ****#{RESET_COLOUR}"
	puts "#{BROWN}Options:#{RESET_COLOUR}"
	puts "#{BROWN}1) Start a new game#{RESET_COLOUR}"
	puts "#{BROWN}2) Enter player names#{RESET_COLOUR}"
	puts "#{BROWN}3) Show current standings#{RESET_COLOUR}"
	puts "#{BROWN}4) Reset points#{RESET_COLOUR}"
	puts "#{BROWN}5) Reset game (names and points)#{RESET_COLOUR}"	
	puts "#{BROWN}6) Quit#{RESET_COLOUR}"
	puts "#{RESET_COLOUR}------------------------------------#{RESET_COLOUR}"
	print "Option: "
end