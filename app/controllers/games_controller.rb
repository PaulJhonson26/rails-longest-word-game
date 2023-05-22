require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
  end

  def score
    answer = params[:answer].upcase
    letters = params[:letters].gsub(" ", "").chars()
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    api = JSON.parse(URI.open(url).read)
    @exists = api["found"]
    @uses_letters = true
    answer.chars.each do |letter|
      if letters.include?(letter)
        letters.delete_at(letters.index(letter))
      else
        @uses_letters = false
      end
    end
  end
end
