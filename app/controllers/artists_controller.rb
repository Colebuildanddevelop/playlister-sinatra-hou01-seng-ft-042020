class ArtistsController < ApplicationController
    set :views, 'app/views/artists'

    get '/artists' do
        @artists = Artist.all
        erb :index
    end

    get '/artists/new' do  
        @genres = Genre.all     
        @songs = Song.all 
        erb :new
    end

    # post '/artists' do
    #   @artist = Artist.new(name: params[:name])  
    #   if params[:artist][:name] == ""   
    #     @artist.song = Song.find(params[:song][:id])
    #   else
    #     @artist.song = Song.create(name: params[:song][:name])
    #   end
    #   params[:genre][:id].each do |genre_id|
    #     @artist.genres << Genre.find(genre_id)
    #   end
    #   @artist.save
      
    #   redirect "/artists/#{@artist.slug}"
    # end

    get '/artists/:slug' do
      @artist = current_artist  
      erb :show 
    end

    # get '/artists/:slug/edit' do
    #   @artist = current_artist
    #   @genres = Genre.all
    #   erb :edit
    # end

    # patch '/artists/:slug' do
    #   @artist = current_artist
    #   @artist.update(name: params[:artist][:name])
    #   @artist.song = Song.create(name: params[:song][:name])
    #   @artist.genres = []
    #   params[:genre][:id].each do |genre_id|
    #     @artist.genres << Genre.find(genre_id)
    #   end
    #   @artist.save
    #   redirect "/artists/#{@artist.slug}"
    # end


    def current_artist
        Artist.find_by_slug(params[:slug])
    end

end
