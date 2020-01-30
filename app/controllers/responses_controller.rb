class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end


  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @questions = Question.all.order(:created_at)
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    responses_saved = true
    params[:response].each do |response_param|
      response = Response.new(response_param.permit(:user_id, :question_id, :answer))
      
      unless response.save
        responses_saved = false
        break
      end
    end

    
    
    respond_to do |format|
      if responses_saved
        format.html { redirect_to enneagram_scores_path, notice: 'Response was successfully created. Here are your results' }
        format.json { render :show, status: :created, location: @response }
        
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_all
    Response.delete_all
    flash[:notice] = "You have removed all results!"
    redirect_to responses_path
  end

  private
   
    def set_response
      @response = Response.find(params[:id])
    end

    def response_params
      params.require(:response).permit(:user_id, :question_id, :answer).merge(user: current_user)
    end

end
