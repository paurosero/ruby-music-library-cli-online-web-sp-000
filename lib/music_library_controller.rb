require 'pry'
class MusicLibraryController
  attr_reader :name

  def initialize(path = "./db/mp3s")
   MusicImporter.new(path).import
   #binding.pry
  end
  
  def call
   puts "Welcome to your music library!"
   puts "To list all of your songs, enter 'list songs'."
   puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
   puts "To list all of the songs by a particular artist, enter 'list artist'."
   puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
   puts "What would you like to do?"
   4.times { gets.strip}
  end
  
  def list_songs
    song_array = Song.all.sort {|a,b| a.name <=> b.name}
    song_array.each.with_index(1) do |song, i| 
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    artist_array = Artist.all.sort {|a,b| a.name <=> b.name}
    artist_array.each.with_index(1) do |artist, i| 
      puts "#{i}. #{artist.name}"
    end
  end
  
  def list_genres
    genre_array = Genre.all.sort {|a,b| a.name <=> b.name}
    genre_array.each.with_index(1) do |genre, i| 
      puts "#{i}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    song
    
    #puts "Please enter the name of an artist:"
    #gets.strip
    #song_name = Song.all.sort {|a,b| a.name <=> b.name}
    #song_name.each.with_index(1) do |song, i|
      #puts "#{i}. #{song.artist.name} - #{song.genre.name}"
    #end
  end
  

  
  def list_songs_by_genre
    
  end
  
 # def
    
  #end
  
end