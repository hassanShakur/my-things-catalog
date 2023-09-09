module ItemPresenters
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

  def show_item_attributes(item)
    date = item.publish_date

    puts "Author: #{item.author.first_name} #{item.author.last_name}" if item.author
    puts "Genre: #{item.genre.name}" if item.genre
    puts "Source: #{item.source.name}" if item.source
    puts "Label: #{item.label.title}" if item.label
    puts "Publish date: #{date.day}/#{date.month}/#{date.year}"
  end
end
