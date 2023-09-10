module DataLoaders
  def load_books(path)
    file_path = "data/#{path}"
    return [] unless File.exist?(file_path)

    books = []
    books_data = load_file(file_path)

    books_data.each do |book|
      new_book = load_unique_attrs(book)
      books << new_book
    end

    books
  end

  def load_file(path)
    file = File.open(path)
    data = JSON.parse(file.read)
    file.close
    data
  end

  def load_unique_attrs(item)
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
    else
      on_spotify = item['on_spotify']
      MusicAlbum.new(on_spotify, publish_date, id: id)
    end
  end

  def load_common_attrs(item, data)
    item.author = data['author']
    item.genre = data['genre']
    item.source = data['source']
    item.label = data['label']
    item.publish_date = Time.new(data['publish_date'])
    item
  end
end
