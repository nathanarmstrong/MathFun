class Question

  def initialize(asking_player)
    @num_a = 0
    @num_b = 0
    @num_c = 0
    @answer = nil
    @response = nil
    @asking_player_number = asking_player
  end

  def  ask_for_nums(current_player)
    #set state questions
    p '---------------new question -----------------------'
    p "#{current_player}, please give me a number"
    p '=>'
    @num_a = $stdin.gets.chomp
    p "#{current_player}, please give me another number"
    p '=>'
    @num_b = $stdin.gets.chomp
    p "#{current_player}, please give me a third number"
    p '=>'
    @num_c = $stdin.gets.chomp
    @answer = @num_a.to_i + @num_b.to_i * @num_c.to_i
  end

  def prompt_for_answer(answering_name)
    p "#{answering_name}, What do you thing #{@num_a} plus #{@num_b} times #{@num_c} equels"
    p '=>'
    @response = $stdin.gets.chomp
  end

  def check_answer?(response)
    (response.to_i == @answer) ? (puts "Correct") : (puts "Maybe next time...Remember BEDMAS!!")
    response.to_i == @answer
  end

end