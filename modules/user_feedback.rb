module UserFeedback
  def notify_start_creation(item)
    puts "Creating a #{item.capitalize}..."
  end

  def notify_success_creation(item)
    puts "#{item.capitalize} created successfully!"
  end
end
