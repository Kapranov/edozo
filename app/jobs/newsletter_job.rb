class NewsletterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "I am busy mailing newsletter"
    sleep 10
  end
end
