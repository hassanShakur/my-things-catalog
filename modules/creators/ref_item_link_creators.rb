module RefItemLinkCreators
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

  def create_ref_item_link(ref, item)
    ref_instance = fetch_ref(ref)[0]
    item_instance = fetch_item(item)[0]

    ref_instance.add_item(item_instance)
  end

  def fetch_ref(ref)
    puts "Select the #{ref} from the list below."
    my_refs = display_link_refs(ref)

    choice = fetch_int("#{ref.capitalize} index", my_refs.length + 1)

    my_refs.each_with_index do |my_ref, index|
      my_ref if (index + 1) == choice
    end
  end

  def fetch_item(item)
    puts "Select the #{item} from the list below."
    my_items = display_link_items(item)

    choice = fetch_int("#{item.capitalize} index", my_items.length + 1)

    my_items.each_with_index do |my_item, index|
      my_item if (index + 1) == choice
    end
  end

  def display_link_items(item)
    case item
    when 'book'
      display_books
      @books
    when 'game'
      display_games
      @games
    when 'movie'
      display_movies
      @movies
    when 'music_album'
      display_music_albums
      @music_albums
    else
      []
    end
  end

  def display_link_refs(ref)
    case ref
    when 'author'
      display_authors
      @authors
    when 'genre'
      display_genres
      @genres
    when 'label'
      display_labels
      @labels
    when 'source'
      display_sources
      @sources
    else
      []
    end
  end
end
