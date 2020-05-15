require 'pry'
class SongsController < ApplicationController
    set :views, 'app/views/songs'

    get '/songs' do
        @songs = Song.all
        erb :index

    end

    get '/songs/new' do  
        @genres = Genre.all     
        @artists = Artist.all 
        erb :new
    end

    post '/songs' do
      @song = Song.new(name: params[:name])  
      if params[:artist][:name] == "" 
        @song.artist = Artist.find(params[:artist][:id])
      else
        @song.artist = Artist.create(name: params[:artist][:name])
      end
      params[:genre][:id].each do |genre_id|
        @song.genres << Genre.find(genre_id)
      end
      @song.save
      
      redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
      @song = current_song  
      erb :show 
    end

    get '/songs/:slug/edit' do
      @song = current_song
      @genres = Genre.all
      erb :edit
    end

    patch '/songs/:slug' do
      @song = current_song
      @song.update(name: params[:song][:name])
      @song.artist = Artist.create(name: params[:artist][:name])
      @song.genres = []
      params[:genre][:id].each do |genre_id|
        @song.genres << Genre.find(genre_id)
      end
      @song.save
      redirect "/songs/#{@song.slug}"
    end


    def current_song
        Song.find_by_slug(params[:slug])
    end
 
end