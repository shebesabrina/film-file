class FilmFile < Sinatra::Base

  get ['/films', '/film/'] do
    @films = Film.all
    erb :"films/index"
  end

  get '/film/:id' do
    @films = Film.find(params['id'])
    erb :'films/show'
  end
end
