module UserFeedback
  def notify_start_creation(item)
    puts "\nCreating a #{item.capitalize}..."
  end

  def notify_success_creation(item)
    puts "\n#{item.capitalize} created successfully!"
  end

  def no_item_created(title)
    puts "You don't have any #{title}s created!"
    print_border
  end
end
