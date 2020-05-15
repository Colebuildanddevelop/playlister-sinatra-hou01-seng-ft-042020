class GenresController < ApplicationController
    set :views, 'app/views/genres'

    get '/genres' do
        @genres = Genre.all
        erb :index
    end

    # get '/songs/new' do  
    #     @genres = Genre.all     
    #     @artists = Artist.all 
    #     erb :new
    # end

    # post '/songs' do
    #   @song = Song.new(name: params[:name])  
    #   if params[:artist][:name] == "" 
    #     @song.artist = Artist.find(params[:artist][:id])
    #   else
    #     @song.artist = Artist.create(name: params[:artist][:name])
    #   end
    #   params[:genre][:id].each do |genre_id|
    #     @song.genres << Genre.find(genre_id)
    #   end
    #   @song.save
      
    #   redirect "/songs/#{@song.slug}"
    # end
    def current_genre
        Genre.find_by_slug(params[:slug])
    end

    get '/genres/:slug' do
      @genre = current_genre  
      erb :show 
    end

    # get '/songs/:slug/edit' do
    #   @song = current_song
    #   @genres = Genre.all
    #   erb :edit
    # end

    # patch '/songs/:slug' do
    #   @song = current_song
    #   @song.update(name: params[:song][:name])
    #   @song.artist = Artist.create(name: params[:artist][:name])
    #   @song.genres = []
    #   params[:genre][:id].each do |genre_id|
    #     @song.genres << Genre.find(genre_id)
    #   end
    #   @song.save
    #   redirect "/songs/#{@song.slug}"
    # end




end