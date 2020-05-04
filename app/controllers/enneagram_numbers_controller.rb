class EnneagramNumbersController < ApplicationController
  before_action :set_enneagram_number, only: [:show, :edit, :update, :destroy]

  # GET /enneagram_numbers
  # GET /enneagram_numbers.json
  def index
    @enneagram_numbers = EnneagramNumber.all
  end

  # GET /enneagram_numbers/1
  # GET /enneagram_numbers/1.json
  def show
  end

  # GET /enneagram_numbers/new
  def new
    @enneagram_number = EnneagramNumber.new
  end

  # GET /enneagram_numbers/1/edit
  def edit
  end

  # POST /enneagram_numbers
  # POST /enneagram_numbers.json
  def create
    @enneagram_number = EnneagramNumber.new(enneagram_number_params)

    respond_to do |format|
      if @enneagram_number.save
        format.html { redirect_to @enneagram_number, notice: 'Enneagram number was successfully created.' }
        format.json { render :show, status: :created, location: @enneagram_number }
      else
        format.html { render :new }
        format.json { render json: @enneagram_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enneagram_numbers/1
  # PATCH/PUT /enneagram_numbers/1.json
  def update
    respond_to do |format|
      if @enneagram_number.update(enneagram_number_params)
        format.html { redirect_to @enneagram_number, notice: 'Enneagram number was successfully updated.' }
        format.json { render :show, status: :ok, location: @enneagram_number }
      else
        format.html { render :edit }
        format.json { render json: @enneagram_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enneagram_numbers/1
  # DELETE /enneagram_numbers/1.json
  def destroy
    @enneagram_number.destroy
    respond_to do |format|
      format.html { redirect_to enneagram_numbers_url, notice: 'Enneagram number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enneagram_number
      @enneagram_number = EnneagramNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enneagram_number_params
      params.require(:enneagram_number).permit(:enneagram_number,:description,:core_belief,:core_need,:core_pattern)
    end
end
