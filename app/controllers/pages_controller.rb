class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :check_signed_in

  def landing_page
  end

  private
    def check_signed_in
      redirect_to test_path if signed_in?
    end
end
