# takes player (Hash) and returns string with the question
def generate_question(player)
	@num1 = rand(20)
	@num2 = rand(20)
	@operation = OPERATIONS[rand(0..2)]
	"#{player[:name]}: What does #{@num1} #{@operation} #{@num2} equal?"
end

# takes in player (Hash), prints prompt and returns input as Fixnum
def prompt_player_for_answer(player)
	print "#{player[:name]}: "
	gets.chomp.to_i
end

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

def ask_name(player_id)
	print "Enter Player #{player_id}'s name: "
end

def set_names
	@players.each do |player|
		ask_name(player[:id])
		player[:name] = gets.chomp
	end
end

def reset_points
	@players.each do |player|
		player[:points] = 0
	end
	"Points reset!"
end

def reset_lives
	@players.each do |player|
		player[:lives] = LIVES
	end
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