require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash

    get "/songs" do
        @songs = Song.all
        erb :"songs/index"
    end

    get "/songs/new" do
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/new"
    end

    post "/songs" do
        @song = Song.create(params[:song])
        if params[:artist][:name]
            @song.artist = Artist.find_or_create_by(params[:artist])
        end

        if params[:genre][:name]
            @song.genres.build(params[:genre])
        end

        if @song.save
            flash[:message] = "Successfully created song."
            redirect "/songs/#{@song.slug}"
        else
            redirect "/songs/new"
        end
    end

    get "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        erb :"songs/show"
    end

    get "/songs/:slug/edit" do
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        @artists = Artist.all
        @genres = Genre.all
        erb :"songs/edit"
    end

    patch "/songs/:slug" do
        @song = Song.find_by_slug(params[:slug])

        if !params[:song][:genre_ids]
            params[:song][:genre_ids] = []
        end

        @song.update(params[:song])

        if params[:artist][:name]
            @song.artist = Artist.find_or_create_by(params[:artist])
        end

        if params[:genre][:name]
            @song.genres.build(params[:genre])
        end

        if @song.save
            flash[:message] = "Successfully updated song."
            redirect "/songs/#{@song.slug}"
        else
            redirect "/songs/#{@song.slug}/edit"
        end
    end

end