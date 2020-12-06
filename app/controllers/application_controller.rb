
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    #binding.pry
    #if params.empty
    @articles = Article.all
    erb :index
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
    erb :show
  end


end
