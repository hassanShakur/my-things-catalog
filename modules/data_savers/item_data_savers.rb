module ItemDataSavers
  def store_refs
    save_item_data(@books, 'books')
    save_item_data(@games, 'games')
    save_item_data(@movies, 'movies')
    save_item_data(@music_albums, 'music_albums')
  end

  def save_item_data(item_list, file_name)
    data_arr = []
    item_list.each do |item|
      item_hash = save_unique_attrs(item)
      item_hash = save_common_attrs(item, item_hash)
      data_arr << item_hash
    end
    create_file("#{file_name}.json", data_arr.to_json) unless data_arr.empty?
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
