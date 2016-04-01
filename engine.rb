def initialize_players
	@players = [
		{ 
			name: "Player 1",
			id: 1,
			lives: LIVES,
			points: 0
		},
		{
			name: "Player 2",
			id: 2,
			lives: LIVES,
			points: 0
		}
	]
end

def run_game
	while @players[0][:lives] > 0 && @players[1][:lives] > 0
		@players.each do |player|
			puts generate_question(player)
			answer = prompt_player_for_answer(player)
			if answer == @num1.send(@operation, @num2)
				@players[player[:id] - 1][:points] += 1
				success_msg(player)
			else
				@players[player[:id] - 1][:lives] -= 1
				fail_msg(player)
			end
		end
	end
end