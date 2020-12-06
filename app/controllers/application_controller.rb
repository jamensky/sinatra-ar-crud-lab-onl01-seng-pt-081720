
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do

    if params.empty?
      @articles = Article.all
      erb :index
    else
      redirect to "/articles/:id=#{params.values[0].to_i}"
      #binding.pry
    end
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    binding.pry
    erb :show
  end


end
