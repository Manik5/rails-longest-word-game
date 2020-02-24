class GamesController < ApplicationController
  def new
    @letters = Array('A'..'Z').sample(10)
    # render plain:  @letters
  end

  def score
    # @letters = params[:grid]
    # @user_input = params[:name]
    url = https://wagon-dictionary.herokuapp.com/:word
    @letters = JSON.parse
  end
end
