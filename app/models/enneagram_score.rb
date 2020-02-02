class EnneagramScore < ApplicationRecord
  belongs_to :user

  def self.enneagram_score(enneagram_number)
    @responses = Response.where(question_id:(Question.where(enneagram_number_id:(enneagram_number)))  )
    # @responses.each do |response|
    #   array = []
    #   array << response.answer
    #   @score = array.sum
    # end 
    # return @score  
    @responses.map{|r| r.answer}.sum
  end

  def self.enneagram_max_score(enneagram_number)
    @max_value = (Question.where(enneagram_number_id:(enneagram_number)).count)*100
  end

  def self.top_enneagram_score
    @top_score = @enneagram_scores.zip(@enneagram_divisor).map{|x,y| ((x/y.to_f)*100).floor(2) }
    @top_score.each_index.sort_by{|i| -array[i]}[0] + 1
  end
end
