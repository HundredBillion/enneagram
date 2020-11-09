class EnneagramScoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_enneagram_score, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @enneagram_scores =[]
    (1..9).each do |number|
      @enneagram_scores <<
          (Response.where(user_id:current_user, question_id:(Question.where(enneagram_number_id:number)))).map{|r| r.answer * r.question.number_multiplier}.sum
    end
    
    @enneagram_number_divisor =[]
    (1..9).each do |number|
      @enneagram_number_divisor << EnneagramScore.where(user_id:(Response.where(user_id:current_user))).enneagram_max_score(number)
    end
    
    @enneagram_percentages = @enneagram_scores.zip(@enneagram_number_divisor).map{|x,y| ((x/y.to_f)*100).floor(2) }
    
    my_type = @enneagram_percentages.each_index.sort_by{|i| -@enneagram_percentages[i]}[0] + 1
    @my_number = EnneagramNumber.where(id:my_type).first

    # @description = EnneagramNumber.where(id:@my_type).first.description
    # @core_need = EnneagramNumber.where(id:@my_type).first.core_need
    # @core_belief = EnneagramNumber.where(id:@my_type).first.core_belief
    # @core_pattern = EnneagramNumber.where(id:@my_type).first.core_pattern

    @sorted_enneagram_numbers = (@enneagram_percentages.each_index.sort_by{|x| -@enneagram_percentages[x]}).map{|x| x+1}
    @sorted_enneagram_percentages = (@enneagram_percentages.sort_by{|x| -x}).map{|x| x.round}

  end


  def new
    @enneagram_score = EnneagramScore.new
  end

  def create
    @enneagram_score = EnneagramScore.new(enneagram_score_params)
    @enneagram_score.user_id = current_user
    respond_to do |format|
      if @enneagram_score.save
        format.html { redirect_to @enneagram_score, notice: 'Enneagram score was successfully created.' }
        format.json { render :show, status: :created, location: @enneagram_score }
      else
        format.html { render :new }
        format.json { render json: @enneagram_score.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @enneagram_score.update(enneagram_score_params)
        format.html { redirect_to @enneagram_score, notice: 'Enneagram score was successfully updated.' }
        format.json { render :show, status: :ok, location: @enneagram_score }
      else
        format.html { render :edit }
        format.json { render json: @enneagram_score.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @enneagram_score.destroy
    respond_to do |format|
      format.html { redirect_to enneagram_scores_url, notice: 'Enneagram score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enneagram_score
      @enneagram_score = EnneagramScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enneagram_score_params
      params.require(:enneagram_score).permit(:user_id, :enneagram_one_score, :enneagram_two_score, :enneagram_three_score, :enneagram_four_score, :enneagram_five_score, :enneagram_six_score, :enneagram_seven_score, :enneagram_eight_score, :enneagram_nine_score)
    end
end
