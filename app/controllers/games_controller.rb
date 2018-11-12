require 'open-uri'
require 'json'

class GamesController < ApplicationController
  $array = ('a'..'z').to_a
  def new
    # @array = ("a".."z").to_a
    @array = $array
  end

  def score
    word = params[:word]
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read.to_s)
    final_word = word.split(//)
    if json['found'] == false
      @message = 'Not a word in the dictionary'
    else
      final_word.each do |x|
        if final_word.count(x) == $array.count(x)
        @message = 'Valid word'
        @count = json['length']
        else
        @message = 'Invalid'
        end
      end
    end
  end
end
