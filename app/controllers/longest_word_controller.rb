require 'longest_word_game' # to be able to access to Longest word game methods

class LongestWordController < ApplicationController
  def game
    @grid = generate_grid(9)
    @start_time = Time.now
  end

  def score
    session[:games] = [] if session[:games].nil?

    @try = params[:try]
    @grid = params[:grid].split(' ') #convert to Array
    @start_time = params[:start_time].to_time #convert to Time
    @result = run_game(@try, @grid, @start_time, Time.now)
    session[:games] << @result
  end
end
