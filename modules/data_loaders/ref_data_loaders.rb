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
      new_item = load_unique_attrs(item)
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

  def load_unique_attrs(item)
    id = item['id']

    case item['class']
    when 'Genre'
      name = item['name']
      Genre.new(name, id: id)
    when 'Source'
      name = item['name']
      Source.new(name, id: id)
    when 'Author'
      first_name = item['first_name']
      last_name = item['last_name']
      Author.new(first_name, last_name, id: id)
    else
      title = item['title']
      color = item['color']
      Label.new(title, color, id: id)
    end
  end
end
