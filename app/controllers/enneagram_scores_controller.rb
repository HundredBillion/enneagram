class EnneagramScoresController < ApplicationController
  before_action :set_enneagram_score, only: [:show, :edit, :update, :destroy]

  # GET /enneagram_scores
  # GET /enneagram_scores.json
  def index
    @enneagram_scores = EnneagramScore.all
  end

  # GET /enneagram_scores/1
  # GET /enneagram_scores/1.json
  def show
  end

  # GET /enneagram_scores/new
  def new
    @enneagram_score = EnneagramScore.new
  end

  # GET /enneagram_scores/1/edit
  def edit
  end

  # POST /enneagram_scores
  # POST /enneagram_scores.json
  def create
    @enneagram_score = EnneagramScore.new(enneagram_score_params)

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

  # PATCH/PUT /enneagram_scores/1
  # PATCH/PUT /enneagram_scores/1.json
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

  # DELETE /enneagram_scores/1
  # DELETE /enneagram_scores/1.json
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
      params.require(:enneagram_score).permit(:enneagram_one_score, :enneagram_two_score, :enneagram_three_score, :enneagram_four_score, :enneagram_five_score, :enneagram_six_score, :enneagram_seven_score, :enneagream_eight_score, :enneagram_nine_score)
    end
end
