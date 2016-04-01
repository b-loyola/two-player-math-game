MAX = 20
LIVES = 3
# OPERATIONS = [:+, :*, :-]

# takes player id and returns string with the question
def generate_question(player_id)
	@num1 = rand(20)
	@num2 = rand(20)
	# @operation = OPERATIONS
	"Player #{player_id}: What does #{@num1} plus #{@num2} equal?"
end

# takes in player id, prints prompt and returns input as Fixnum
def prompt_player_for_answer(player_id)
	print "Player #{player_id}:"
	gets.chomp.to_i
end

def standings_msg(msg)
	puts "\e[7m"
	puts "Here are the #{msg} standings:"
	print "\e[0m\e[33m"
	puts "Player 1 has #{@players[0][:points]} points and #{@players[0][:lives]} lives."
	puts "Player 2 has #{@players[1][:points]} points and #{@players[1][:lives]} lives."
	puts "\e[0m"
end

def success_msg(player_id)
	puts "\e[32mCorrect answer! Player #{player_id} gets 1 point.\e[0m"
end

def fail_msg(player_id)
	puts "\e[31mWrong answer! Player #{player_id} loses a life!\e[0m"
	standings_msg("current")
end

def reset
	@players = [
		{ 
			id: 1,
			lives: LIVES,
			points: 0
		},
		{
			id: 2,
			lives: LIVES,
			points: 0
		}
	]
end

def run_game
	while @players[0][:lives] > 0 && @players[1][:lives] > 0
		@players.each do |player|
			puts generate_question(player[:id])
			answer = prompt_player_for_answer(player[:id])
			if answer == @num1 + @num2
				@players[player[:id] - 1][:points] += 1
				success_msg(player[:id])
			else
				@players[player[:id] - 1][:lives] -= 1
				fail_msg(player[:id])
			end
		end
	end
end

def end_game_msg
	puts "Game over!"
	standings_msg("final")
end

def display_menu
	puts "\e[37m------------------------------------\e[0m"
	puts "\e[33mWelcome to the two player math game!\e[0m"
	puts "\e[33mOptions:\e[0m"
	puts "\e[33m1) Start a new game\e[0m"
	puts "\e[33m2) Quit\e[0m"
	puts "\e[37m------------------------------------\e[0m"
	print "Option: "
end

loop do
	reset
	display_menu
	input = gets.chomp
		case input
		when "1"
			run_game
			end_game_msg
		when "2"
			break
		else
			puts "\e[41mInvalid choice!\e[0m"
		end
	
end