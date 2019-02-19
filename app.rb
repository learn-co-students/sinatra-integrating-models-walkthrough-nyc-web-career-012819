require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    ta = TextAnalyzer.new(params[:user_text])
    @analyzed_text = ta.text
    @num_words = ta.count_of_words
    @vowels = ta.count_of_vowels
    @consonants = ta.count_of_consonants
    @most_common_letter = ta.most_used_letter.keys.first
    @most_common_letter_frequency = ta.most_used_letter.values.first

    erb :results
  end
end
