module RefDataSavers
  def store_items
    save_ref_data(@genres, 'genres')
    save_ref_data(@labels, 'labels')
    save_ref_data(@sources, 'sources')
    save_ref_data(@authors, 'authors')
  end

  def save_ref_data(item_list, file_name)
    data_arr = []
    item_list.each do |item|
      unique_attrs_hash = save_unique_ref_attrs(item)
      common_attrs_hash = save_common_ref_attrs(item)
      ref_items_list = save_ref_item_list(item)
      item_hash = {}.merge(unique_attrs_hash, common_attrs_hash, ref_items_list)
      data_arr << item_hash
    end
    create_file("#{file_name}.json", data_arr.to_json) unless data_arr.empty?
  end

  def create_file(file_name, data)
    File.write("data/#{file_name}", data)
  end

  def save_unique_ref_attrs(item)
    if item.instance_of?(Genre) || item.instance_of?(Source)
      { 'name' => item.name }
    elsif item.instance_of?(Label)
      { 'title' => item.title, 'color' => item.color }
    elsif item.instance_of?(Author)
      { 'first_name' => item.first_name, 'last_name' => item.last_name }
    else
      {}
    end
  end

  def save_common_ref_attrs(item)
    {
      'id' => item.id.to_s,
      'class' => item.class
    }
  end

  def save_ref_item_list(ref_item)
    items_arr = []
    ref_item.items.each { |item| items_arr << item&.id }
    { 'items' => items_arr }
  end
end
