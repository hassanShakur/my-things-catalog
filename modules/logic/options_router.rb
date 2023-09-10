module OptionsRouter
  def show_extra_options(choice)
    case choice
    when 1, 3
      show_ref_options(choice)
    when 2, 4
      show_item_options(choice)
    when 5
      show_ref_item_links
    else
      puts 'Invalid choice!'
    end
  end

  def show_ref_options(choice)
    case choice
    when 1
      show_list_ref_options
      choice = validate_input(gets.chomp.to_i, 5)
      return if choice == 5

      list_refs(choice)
    when 3
      show_create_ref_options
      choice = validate_input(gets.chomp.to_i, 5)
      return if choice == 5

      create_ref(choice)
    else
      puts 'Invalid choice!'
    end
  end

  def show_item_options(choice)
    case choice
    when 2
      show_list_item_options
      choice = validate_input(gets.chomp.to_i, 5)
      return if choice == 5

      list_items(choice)
    when 4
      show_create_item_options
      choice = validate_input(gets.chomp.to_i, 5)
      return if choice == 5

      create_item(choice)
    else
      puts 'Invalid choice!'
    end
  end

  def show_ref_item_links
    show_ref_item_link_options
    choice = validate_input(gets.chomp.to_i, 5)
    return if choice == 5

    list_item_links(choice)
  end
end
