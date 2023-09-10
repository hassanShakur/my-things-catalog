module RefItemLinkCreators
  def create_ref_item_link(ref, item)
    ref_instance = fetch_ref(ref)
    item_instance = fetch_item(item)

    return unless ref_instance && item_instance

    ref_instance.add_item(item_instance)
    notify_success_creation("Link between #{ref} and #{item}")
  end

  def fetch_ref(ref)
    puts "\nSelect the #{ref} from the list below."
    my_refs = display_link_refs(ref)
    return puts "You haven't created any #{ref}s!" if my_refs.empty?

    choice = fetch_int("#{ref.capitalize} index", my_refs.length + 1)

    my_refs[choice - 1]
  end

  def fetch_item(item)
    puts "\nSelect the #{item} from the list below."
    my_items = display_link_items(item)
    return puts "You haven't created any #{item}s!" if my_items.empty?

    choice = fetch_int("#{item.capitalize} index", my_items.length + 1)

    my_items[choice - 1]
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
