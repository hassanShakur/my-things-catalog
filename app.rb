require_relative 'classes/label'
require_relative 'classes/item/book'
require_relative 'classes/item/game'
require_relative 'classes/item/music_album'
require_relative 'classes/author'

class App
  def initialize
    @books = []
    @games = []
    @music_albums = []
    @labels = []
    @genres = []
  end

  def run
    puts "Welcome to School library App!\n"
  end

  def show_options
    puts "\n
    1. List all books
    2. List all labels
    3. Add a book
    4. List all music albums
    5. List all genres
    6. Add a music album
    7. List all games
    8. List all authors
    9. Add a game

    "
  end

  def validate_input(input, max_val)
    loop do
      input_is_valid = input.is_a?(Integer) && input.between?(1, max_val)
      break if input_is_valid

      print 'Please enter a valid input: '
      input = gets.chomp.to_i
    end

    input
  end

  def call_activity_for(_choice)
    display_books
  end

  def create_book
    notify_start_creation('book')
    publish_date = fetch_date
    publisher = fetch_string('publisher')
    cover_state = fetch_string('cover state (good/bad)')
    @books << Book.new(publisher, cover_state, publish_date)
    notify_success_creation('book')
  end

  def create_music_album
    notify_start_creation('music album')
    publish_date = fetch_date
    on_spotify = fetch_valid_bool
    @music_albums << MusicAlbum.new(on_spotify, publish_date)
    notify_success_creation('music album')
  end

  def create_game
    notify_start_creation('game')
    publish_date = fetch_date
    multiplayer = fetch_valid_bool
    last_played_at = fetch_date('last played at')
    @games << Game.new(multiplayer, last_played_at, publish_date)
    notify_success_creation('game')
  end

  def display_books
    print_border
    show_list_title('Books')

    @books.each_with_index do |book, index|
      show_item_title('Book', index)
      show_item_attributes(book)
    end

    print_border
  end

  def display_games
    print_border
    show_list_title('Games')

    @games.each_with_index do |game, index|
      show_item_title('Game', index)
      show_item_attributes(game)
    end

    print_border
  end

  def display_music_albums
    print_border
    show_list_title('Music Albums')

    @music_albums.each_with_index do |album, index|
      show_item_title('Album', index)
      show_item_attributes(album)
    end

    print_border
  end

  def display_labels
    print_border
    show_list_title('Label')

    @labels.each_with_index do |label, index|
      puts "#{index + 1}. #{label.title.capitalize}"
    end
    print_border
  end

  def display_genres
    print_border
    show_list_title('Genre')

    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name.capitalize}"
    end
    print_border
  end

  def display_authors
    print_border
    show_list_title('Author')

    @authors.each_with_index do |_author, index|
      puts "#{index + 1}. #{item.author.first_name} #{item.author.last_name}"
    end
    print_border
  end

  def print_border
    puts '=============================================='
  end

  def show_list_title(title)
    puts "These are all the #{title}s you have:\n\n"
  end

  def show_item_title(title, index)
    puts "#{title.capitalize} #{index + 1}\n-------------------"
  end

  def show_item_attributes(item)
    date = item.publish_date

    puts "Author: #{item.author.first_name} #{item.author.last_name}" if item.author
    puts "Genre: #{item.genre.name}" if item.genre
    puts "Source: #{item.source.name}" if item.source
    puts "Label: #{item.label.title}" if item.label
    puts "Publish date: #{date.day}/#{date.month}/#{date.year}"
  end

  def fetch_string(name)
    print "#{name.capitalize}: "
    gets.chomp
  end

  def fetch_date(date_type = 'publish date')
    date = fetch_string("#{date_type}(yy/mm/dd)")
    date.split('/').join(', ')
  end

  def fetch_valid_bool
    map_bool = { 'n' => false, 'y' => true }
    my_bool = nil

    loop do
      my_bool = map_bool[gets.chomp.downcase]
      break unless my_bool.nil?

      print 'Invalid input! [Y/N]: '
    end

    my_bool
  end

  def notify_start_creation(item)
    puts "Creating a #{item.capitalize}..."
  end

  def notify_success_creation(item)
    puts "#{item.capitalize} created successfully!"
  end

  def save_data; end
end
