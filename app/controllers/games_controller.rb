require 'open-uri'


class GamesController < ApplicationController
  def new
    @letters = Array('A'..'Z').sample(10)
    # render plain:  @letters
  end

  def score
    @letters = JSON.parse(params[:grid])
    @user_input = params[:name].upcase
    url = "https://wagon-dictionary.herokuapp.com/#{@user_input}"
    response = JSON.parse(open(url).read)
    # @letter = @letters.find { |letter| params[:id] == letter["id"] }
    if !response["found"]
      @result = "The word is not included in the wagon-dictionary"
    elsif word_in_grid?(@letters, @user_input) == false
      @result = "The word is not in the grid"
    else
      @result = "You won!"
    end
  end

  def word_in_grid?(letters, word)
    word = word.split("")
    word.each do |letter|
      return false if word.count(letter) > letters.count(letter)
    end
    true
  end
end

