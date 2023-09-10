module ItemDataLoaders
  def load_items
    @books = load_item_data('books.json')
    @games = load_item_data('games.json')
    @movies = load_item_data('movies.json')
    @music_albums = load_item_data('music_albums.json')
  end

  def load_item_data(path)
    file_path = "data/#{path}"
    return [] unless File.exist?(file_path)

    item_data = []
    hash_data = load_file(file_path)

    hash_data.each do |item|
      new_item = load_unique_item_attrs(item)
      new_item = load_common_attrs(new_item, item)
      item_data << new_item
    end

    item_data
  end

  def load_file(path)
    file = File.open(path)
    data = JSON.parse(file.read)
    file.close
    data
  end

  def load_unique_item_attrs(item)
    id = item['id']
    publish_date = item['publish_date']

    case item['class']
    when 'Book'
      publisher = item['publisher']
      cover_state = item['cover_state']
      Book.new(publisher, cover_state, publish_date, id: id)
    when 'Game'
      multiplayer = item['multiplayer']
      last_played_at = item['last_played_at']
      Game.new(multiplayer, last_played_at, publish_date, id: id)
    when 'Movie'
      silent = item['silent']
      Movie.new(silent, publish_date, id: id)
    when 'MusicAlbum'
      on_spotify = item['on_spotify']
      MusicAlbum.new(on_spotify, publish_date, id: id)
    else
      puts "Invalid class. Got #{item['class']} in items!"
    end
  end

  def load_common_attrs(item, data)
    item.author = @authors.find { |author| data['author'] = author.id }
    item.genre = @genres.find { |genre| data['genre'] = genre.id }
    item.source = @sources.find { |source| data['source'] = source.id }
    item.label = @labels.find { |label| data['label'] = label.id }
    item.publish_date = Time.new(data['publish_date'])
    item
  end
end
