module RefDataLoaders
  def load_refs
    @genres = load_ref_data('genres.json')
    @labels = load_ref_data('labels.json')
    @sources = load_ref_data('sources.json')
    @authors = load_ref_data('authors.json')
  end

  def load_ref_data(path)
    file_path = "data/#{path}"
    return [] unless File.exist?(file_path)

    item_data = []
    hash_data = load_file(file_path)

    hash_data.each do |item|
      new_item = load_unique_ref_attrs(item)
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

  def load_unique_ref_attrs(item)
    id = item['id']

    case item['class']
    when 'Genre'
      @genres_items_hash << { 'id' => id, 'items' => item['items'] }
      Genre.new(item['name'], id: id)
    when 'Source'
      @sources_items_hash << { 'id' => id, 'items' => item['items'] }
      Source.new(item['name'], id: id)
    when 'Author'
      @authors_items_hash << { 'id' => id, 'items' => item['items'] }
      first_name = item['first_name']
      last_name = item['last_name']
      Author.new(first_name, last_name, id: id)
    when 'Label'
      @labels_items_hash << { 'id' => id, 'items' => item['items'] }
      title = item['title']
      color = item['color']
      Label.new(title, color, id: id)
    else
      puts "Invalid class. Got #{item['class']} in refs!"
    end
  end

  def load_refs_items_list
    load_ref_items_list(@genres, @genres_items_hash)
    load_ref_items_list(@labels, @labels_items_hash)
    load_ref_items_list(@sources, @sources_items_hash)
    load_ref_items_list(@authors, @authors_items_hash)
  end

  def load_ref_items_list(refs_arr, items_hash)
    all_item_instances = [].concat(@books, @games, @genres, @labels)

    items_hash.each do |item_hash|
      ref_instance = refs_arr.find { |ref| ref.id == item_hash['id'] }

      items_instance_arr = []
      item_hash.each do |item_id|
        item_instance = all_item_instances.find { |instance| instance.id == item_id }
        items_instance_arr << item_instance
      end

      ref_instance.items = items_instance_arr
    end
  end
end
