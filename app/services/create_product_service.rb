class CreateProductService
  def call
    ['Electronics', 'Office Supplies', 'Toys', 'Clothing', 'Groceries'].each do |name|
      Category.create!(name: name)
    end

    categories = Category.all
    words = File.readlines("/usr/share/dict/words")
    lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

    30.times do
      Product.create!(name: words.sample.titleize,
                      category: categories.sample,
                      description: lorem,
                      active: [true, false].sample,
                      price: [4.99, 9.99, 14.99, 19.99, 29.99].sample)
    end
  end
end
