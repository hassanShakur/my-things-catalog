module ItemPresenters
  def display_books
    display_logic_for(Book)
  end

  def display_games
    display_logic_for(Game)
    # print_border
    # show_list_title('Games')

    # @games.each_with_index do |game, index|
    #   show_item_title('Game', index)
    #   show_item_attributes(game)
    # end

    # print_border
  end

  def display_movies
    display_logic_for(Movie)
  end

  def display_music_albums
    display_logic_for(MusicAlbum)
  end

  def display_logic_for(item_class)
    print_border
    show_list_title(item_class)
    item_app_list = fetch_app_list_for(item_class)

    item_app_list.each_with_index do |item, index|
      show_item_title(item_class.class.to_s, index)
      show_item_attributes(item)
    end

    print_border
  end

  def fetch_app_list_for(item)
    case item.class
    when 'Book'
      @books
    when 'Movie'
      @movies
    when 'Game'
      @games
    when 'MusicAlbum'
      @music_albums
    else
      []
    end
  end

  def show_item_attributes(item)
    date = item.publish_date

    puts "Author: #{item.author.first_name} #{item.author.last_name}" if item.author
    puts "Genre: #{item.genre.name}" if item.genre
    puts "Source: #{item.source.name}" if item.source
    puts "Label: #{item.label.title}" if item.label
    puts "Publish date: #{date.day}/#{date.month}/#{date.year}"
  end

  def show_unique_attributes(item)
    case item.class
    when 'Book'
      puts "Publisher: #{item.publisher}"
      puts "Cover state: #{item.cover_state}"
    when 'Game'
      puts "Multiplayer: #{item.multiplayer}"
      puts "Last played at: #{item.last_played_at}"
    when 'Movie'
      puts "Silent: #{item.silent}"
    when 'MusicAlbum'
      puts "On spotify: #{item.on_spotify}"
    else
      puts ''
    end
  end
end
