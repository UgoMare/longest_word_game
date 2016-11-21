require 'longest_word_game'

class LongestWordController < ApplicationController
  def game
    @grid = LongestWordGame.generate_grid(9)
    @start_time = Time.now
  end

  def score
    session[:games] = [] if session[:games].nil?

    @try = params[:try]
    @grid = params[:grid].split(' ') #Array
    @start_time = params[:start_time].to_time
    @result = LongestWordGame.run_game(@try, @grid, @start_time, Time.now)
    session[:games] << @result
  end
end
