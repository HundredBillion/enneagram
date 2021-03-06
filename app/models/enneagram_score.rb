class EnneagramScore < ApplicationRecord
  belongs_to :user

  ## This method is faulty because it does not select for current user. But it's in the model, so I don't have access
  ## the current user. I'm keeping this method as reference
  def self.enneagram_score(enneagram_number)
    @responses = Response.where(question_id:(Question.where(enneagram_number_id:(enneagram_number)))  )
    @responses.map{|r| r.answer}.sum
  end

  def self.enneagram_max_score(enneagram_number)
    @max_value = 
              (Question.where(enneagram_number_id:enneagram_number, number_multiplier:1).count)*100 +
              (Question.where(enneagram_number_id:enneagram_number, number_multiplier:2).count)*200
  end

  def self.top_enneagram_score
    @top_score = @enneagram_scores.zip(@enneagram_divisor).map{|x,y| ((x/y.to_f)*100).floor(2) }
    @top_score.each_index.sort_by{|i| -array[i]}[0] + 1
  end
end
