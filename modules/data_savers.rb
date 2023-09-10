module DataSavers
  def save_data
    books_data = []
    @books.each do |book|
      item_hash = save_unique_attrs(book)
      item_hash = save_common_attrs(book, item_hash)
      books_data << item_hash
    end
    create_file('books.json', books_data.to_json)
  end

  def create_file(file_name, data)
    File.write("data/#{file_name}", data)
  end

  def load_books(path)
    file_path = "data/#{path}"
    return [] unless File.exist?(file_path)

    books = []
    file = File.open(file_path)
    books_data = JSON.parse(file)
    file.close

    books_data.each do |book|
      new_book = load_unique_attrs(book)
      puts new_book.class
      books << new_book
    end

    books
  end

  def save_unique_attrs(item)
    if item.instance_of?(Book)
      { 'publisher' => item.publisher, 'cover_state' => item.cover_state }
    elsif item.instance_of?(Game)
      { 'multiplayer' => item.multiplayer, 'last_played_at' => item.last_played_at }
    elsif item.instance_of?(Movie)
      { 'silent' => item.silent }
    else
      { 'on_spotify' => item.on_spotify }
    end
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

  def save_common_attrs(item, hash)
    hs = {
      'id' => item.id.to_s,
      'class' => item.class,
      'publish_date' => item.publish_date.to_s,
      'author' => item.author&.id,
      'genre' => item.genre&.id,
      'source' => item.source&.id,
      'label' => item.label&.id
    }
    hash.merge(hs)
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
