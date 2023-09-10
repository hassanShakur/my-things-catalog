module AppLogic
  def list_items(choice)
    case choice
    when 1 then display_books
    when 2 then display_games
    when 3 then display_movies
    when 4 then display_music_albums
    else
      puts 'Invalid choice!'
    end
  end

  def create_item(choice)
    case choice
    when 1 then create_book
    when 2 then create_game
    when 3 then create_movie
    when 4 then create_music_album
    else
      puts 'Invalid choice!'
    end
  end

  def list_refs(choice)
    case choice
    when 1 then display_authors
    when 2 then display_genres
    when 3 then display_labels
    when 4 then display_sources
    else
      puts 'Invalid choice!'
    end
  end

  def create_ref(choice)
    case choice
    when 1 then create_author
    when 2 then create_genre
    when 3 then create_label
    when 4 then create_source
    else
      puts 'Invalid choice!'
    end
  end

  def list_item_links(choice)
    case choice
    when 1 then create_item_link('book')
    when 2 then create_item_link('game')
    when 3 then create_item_link('movie')
    when 4 then create_item_link('music_album')
    else
      puts 'Invalid choice!'
    end
  end

  def create_item_link(item)
    display_item_links(item)
    choice = validate_input(gets.chomp.to_i, 5)
    return if choice == 5

    case choice
    when 1 then create_ref_item_link('author', item)
    when 2 then create_ref_item_link('source', item)
    when 3 then create_ref_item_link('genre', item)
    when 4 then create_ref_item_link('label', item)
    else
      puts 'Invalid choice!'
    end
  end
end
