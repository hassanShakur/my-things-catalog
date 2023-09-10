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
end
