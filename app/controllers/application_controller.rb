
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.new(params[:title], params[:content])
    binding.pry
    redirect '/articles/'
  end

end
