module UIBeautifiers
  def print_border
    puts "\n=============================================="
  end

  def show_list_title(title)
    puts "These are all the #{title}s you have:\n\n"
  end

  def show_item_title(title, index)
    puts "#{title.capitalize} #{index + 1}\n-------------------"
  end
end
