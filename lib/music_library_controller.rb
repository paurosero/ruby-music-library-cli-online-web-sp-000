require 'pry'
class MusicLibraryController
  attr_reader :name

  def initialize(path = "./db/mp3s")
   MusicImporter.new(path).import
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
    Song.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, i| 
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |artist, i| 
      puts "#{i}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |genre, i| 
      puts "#{i}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    if artist = Artist.find_by_name(gets.strip)
      artist.songs.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    if genre = Genre.find_by_name(gets.strip)
      genre.songs.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
 def play_song
   puts "Which song number would you like to play?"
   input = gets.strip.to_i
   song_array = Song.all.sort {|a, b| a.name <=> b.name}
   if (1..Song.all.length).include?(input)
     song = song_array[input+2]
     puts "Playing #{song.name} by #{song.artist.name}"
   end
 
 
    
   
    
    
end