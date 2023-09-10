module ItemPresenters
  def display_books
    print_border
    return no_item_created('book') if @books.empty?

    show_list_title('Book')

    @books.each_with_index do |book, index|
      show_item_title('Book', index)
      show_item_attributes(book)
    end

    print_border
  end

  def display_games
    print_border
    return no_item_created('game') if @games.empty?

    show_list_title('Game')

    @games.each_with_index do |game, index|
      show_item_title('Game', index)
      show_item_attributes(game)
    end

    print_border
  end

  def display_movies
    print_border
    return no_item_created('movie') if @movies.empty?

    show_list_title('Movie')

    @movies.each_with_index do |movie, index|
      show_item_title('Movie', index)
      show_item_attributes(movie)
    end

    print_border
  end

  def display_music_albums
    print_border
    return no_item_created('music_album') if @music_albums.empty?

    show_list_title('Music album')

    @music_albums.each_with_index do |music_album, index|
      show_item_title('Music album', index)
      show_item_attributes(music_album)
    end

    print_border
  end

  def show_item_attributes(item)
    date = item.publish_date
    show_unique_attributes(item)

    puts "Author: #{item.author.first_name} #{item.author.last_name}" if item.author
    puts "Genre: #{item.genre.name}" if item.genre
    puts "Source: #{item.source.name}" if item.source
    puts "Label: #{item.label.title}" if item.label
    puts "Publish date: #{date.day}/#{date.month}/#{date.year}\n\n"
  end

  def show_unique_attributes(item)
    if item.instance_of?(Book)
      puts "Publisher: #{item.publisher}"
      puts "Cover state: #{item.cover_state}"
    elsif item.instance_of?(Game)
      puts "Multiplayer: #{item.multiplayer}"
      puts "Last played at: #{item.last_played_at}"
    elsif item.instance_of?(Movie)
      puts "Silent: #{item.silent}"
    else
      puts "On spotify: #{item.on_spotify}"
    end
  end
end
