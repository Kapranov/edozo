class CreatePostService
  def call
    random_date = DateTime.now - (rand * 21)

    Post.create!(id: 2, title: Faker::Commerce.product_name, body: Faker::Commerce.department, published_at: Time.now - 2.hours)
    Post.create!(id: 3, title: Faker::Commerce.product_name, body: Faker::Commerce.department, published_at: nil)
    Post.create!(id: 4, title: Faker::Commerce.product_name, body: Faker::Commerce.department, published_at: Time.now - 1.hours)
    Post.create!(id: 5, title: Faker::Commerce.product_name, body: Faker::Commerce.department, published_at: Time.now - 5.hours)
    Post.create!(id: 6, title: Faker::Commerce.product_name, body: Faker::Commerce.department, published_at: Time.now - 4.hours)
    Post.create!(id: 7, title: Faker::Commerce.product_name, body: Faker::Commerce.department, published_at: nil)
    Post.create!(id: 8, title: Faker::Commerce.product_name, body: Faker::Commerce.department, published_at: Time.now - 3.hours)
    Post.create!(id: 9, title: Faker::Commerce.product_name, body: Faker::Commerce.department, published_at: nil)
  end
end
