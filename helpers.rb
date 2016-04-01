# takes player (Hash) and returns string with the question
def generate_question(player)
	@num1 = rand(20)
	@num2 = rand(20)
	operation_id = rand(0..2)
	@operation_name = OPERATION_NAMES[operation_id]
	@operation = OPERATIONS[operation_id]
	"#{player[:name]}: What does #{@num1} #{@operation_name} #{@num2} equal?"
end

# takes in player (Hash), prints prompt and returns input as Fixnum
def prompt_player_for_answer(player)
	print "#{player[:name]}: "
	gets.chomp.to_i
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