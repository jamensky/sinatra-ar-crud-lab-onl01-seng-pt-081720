
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
    end
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    binding.pry

    @article = Article.find_by(id: params[:id])
    @article.content = params[:content].save
    @article.title = params[:title].save
  end

end
