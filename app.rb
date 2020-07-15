require_relative 'models/text_analyzer.rb'
require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    #shortened version of below
    # puts params[:test]
    # binding.pry
    @user_text = TextAnalyzer.new(params[:user_text])
 #    text_from_user = params[:user_text]
 # @analyzed_text = TextAnalyzer.new(text_from_user)

    erb :results
  end
end
