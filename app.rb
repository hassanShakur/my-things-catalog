require_relative 'classes/label'
require_relative 'classes/item/book'
require_relative 'classes/author'

class App
  def initialize
    @books = []
    @labels = []
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

  def display_books
    print_border
    show_list_title('Books')

    @books.each_with_index do |book, index|
      puts "Book #{index + 1}\n-------------------"
      puts "Author: #{book.author.first_name} #{book.author.last_name}" if book.author
      puts "Genre: #{book.genre.name}" if book.genre
      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
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

  def print_border
    puts '=============================================='
  end

  def show_list_title(title)
    puts "These are all the #{title}s you have:\n\n"
  end

  def save_data; end
end
