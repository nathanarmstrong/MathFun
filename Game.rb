class Game

  attr_reader :player1_name
  attr_reader :player2_name

  def initialize( name1, name2)
    @player1_name = name1
    @player2_name = name2
    @current_turn = 1
    @game_on = 1
  end

  def run_game
    @player1 = Player.new
    @player2 = Player.new

    p "Time to test your addition skills"
    p "First to lose all 3 points, will lose"
    

    while not MathGame.is_game_over? do
      question = Question.new(@current_turn)
      question.ask_for_nums(MathGame.who_is_asking)
      response = question.prompt_for_answer(MathGame.who_is_answering)
      correct = question.check_answer?(response)
      if not (correct)
        MathGame.lose_game
      end
      MathGame.switch_turns
      MathGame.display_scores
      if MathGame.is_game_over?
        p "GAME OVER. #{who_is_asking} lost the game"
        p "#{who_is_asking} is a failure to his families name"
      end
    end
  end

  def who_is_asking
    (@current_turn == 1) ? @player1_name : @player2_name
  end

  def who_is_answering
    (@current_turn == 1) ? @player2_name : @player1_name
  end

  def lose_game
    losing_player = (@current_turn == 1) ? @player2 : @player1
    losing_player.lose_a_point
  end

  def switch_turns
    @current_turn = (@current_turn == 1) ? 0 : 1
  end

  def display_scores
    player1_score = @player1.get_score
    player2_score = @player2.get_score
    p "Points: #{@player1_name} =>  #{player1_score}/3     Points: #{@player2_name} =>  #{player2_score}/3"

  end

  def is_game_over?
    player1_score = @player1.get_score
    player2_score = @player2.get_score
    ((player1_score <= 0 )|| (player2_score <= 0)) ? @game_on = 0 : @game_on = 1
    @game_on == 0
  end

end