class Question 

  attr_accessor :num_1, :num_2, :question, :answer

  def initialize
    @num_1 = rand(1-20)
    @num_2 = rand(1-20)
    @question = @num_1 + @num_2
    @answer = @question
  end
end