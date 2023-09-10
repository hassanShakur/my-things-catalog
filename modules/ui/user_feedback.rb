module UserFeedback
  def notify_start_creation(item)
    puts "\nCreating a #{item.capitalize}..."
  end

  def notify_success_creation(item)
    puts "\n#{item.capitalize} created successfully!"
  end
end
